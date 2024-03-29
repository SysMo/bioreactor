use flowmbed_peripherals::channels::{MeasurementChannel, SetPointChannel, DeviceBusConnector, IOConnector, SetValueChannel};
use flowmbed_peripherals::util::QualifiedPath;
use flowmbed_peripherals::mqtt::MqttService;
use flowmbed_peripherals::set_value_handler;

pub struct StirrerModel {
  omega: f32,
  omega_target: f32,
  duty_cycle: f32,
  
  k_inertial: f32,
  k_omega: f32,
  k_prop: f32,

  on_time: f32,
  off_time: f32,
  t_last_switch: f32,
  is_on: bool,
}

impl StirrerModel {
  pub fn new() -> Self {
    Self { 
      omega: 0.0, 
      omega_target: 100.0, 
      duty_cycle: 0.0, 
      
      k_inertial: 1e-3, 
      k_omega: 3e3, 
      k_prop: 1e-4, 
      
      on_time: 1.0, 
      off_time: 2.0, 
      t_last_switch: 0.0, 
      is_on: true 
    }
  }

  pub fn step(&mut self, t_last: f32, dt: f32) {
    let t_current = t_last + dt;

    if self.is_on && (t_current - self.t_last_switch > self.on_time * 60.0) && (self.off_time > 0.0) {
      self.is_on = false;
      self.t_last_switch = t_current;
    } else if !self.is_on && (t_current - self.t_last_switch > self.off_time * 60.0) {
      self.is_on = true;
      self.t_last_switch = t_current;
    }

    // Compute new state
    if self.is_on {
      self.duty_cycle += self.k_prop * (self.omega_target - self.omega) * dt;
      if self.duty_cycle < 0.0 {
        self.duty_cycle = 0.0;
      } else if self.duty_cycle > 1.0 {
        self.duty_cycle = 1.0;
      }
    } else {
      self.duty_cycle = 0.0;
    }

    self.omega += 1.0 / self.k_inertial * (self.duty_cycle - self.omega / self.k_omega) * dt;

  }
}

pub struct StirrerBus {
  id: String,
  speed: SetPointChannel,
  duty_cycle: MeasurementChannel<f32>,
  on_time: SetValueChannel<f32> ,
  off_time: SetValueChannel<f32> ,
}

impl StirrerBus {
  pub fn new(id: &str) -> Self {
    Self { 
      id: id.to_owned(), 
      speed: SetPointChannel::new("speed"), 
      duty_cycle: MeasurementChannel::new("duty_cycle"), 
      on_time: SetValueChannel::new("on_time"), 
      off_time: SetValueChannel::new("off_time") 
    }
  }
}

impl DeviceBusConnector<StirrerModel> for StirrerBus {
  fn sample(&self, device: &StirrerModel) {
    self.speed.current.sample(device.omega);
    self.duty_cycle.sample(device.duty_cycle);
  }
  fn handle_actions(&self, device: &mut StirrerModel) {
    set_value_handler!(self, on_time, device, on_time);
    set_value_handler!(self, off_time, device, off_time);
    set_value_handler!(self, speed.target, device, omega_target);
  }
}

impl IOConnector for StirrerBus {  
  fn connect_io(&mut self, comm: &mut dyn MqttService, qpath: &QualifiedPath) {
      self.speed.connect_io(comm, &qpath.append(&self.id));
      self.duty_cycle.connect_io(comm, &qpath.append(&self.id));
      self.on_time.connect_io(comm, &qpath.append(&self.id));
      self.off_time.connect_io(comm, &qpath.append(&self.id));     
  }
}