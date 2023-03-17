use flowmbed_peripherals::channels::{MeasurementChannel, SetPointChannel, DeviceBusConnector, ChannelBus};


pub struct ThermalMassModel {
  temperature: f32,
  target_temperature: f32,
  temperature_tolerance: f32,
  heat_capacity: f32,
  heater_power: f32,
  heat_loss_conv: f32,
  ambient_temperature: f32,
  heater_on: bool,
}

impl ThermalMassModel {
  pub fn new(init_temperature: f32) -> Self {
    ThermalMassModel { 
      temperature: init_temperature, 
      target_temperature: 35.0,
      temperature_tolerance: 1.0, 
      heat_capacity: 1000.0, 
      heater_power: 1000.0, 
      heat_loss_conv: 10.0, 
      ambient_temperature: 20.0, 
      heater_on: false 
    }
  }

  pub fn step(&mut self, _t_last: f32, dt: f32) {
    // Compute new state
    if (self.temperature < self.target_temperature - self.temperature_tolerance) && !self.heater_on {
      self.heater_on = true;
      println!("Turning heater on");
    } else if (self.temperature > self.target_temperature + self.temperature_tolerance) && self.heater_on {
      self.heater_on = false;
      println!("Turning heater off");
    }
    
    let q_dot = if self.heater_on {self.heater_power} else {0.0} -
      self.heat_loss_conv * (self.temperature - self.ambient_temperature);
    
    self.temperature += q_dot / self.heat_capacity * dt;
  }
}

pub struct ThermalBus {
  id: String,
  temperature: MeasurementChannel<f32>,
  // temperature: SetPointChannel,
  // heater: MeasurementChannel<bool>,  
}

impl ThermalBus {
  pub fn new(id: &str) -> Self {
    ThermalBus {
      id: id.to_owned(),
      temperature: MeasurementChannel::new("temperature"),
      // temperature: SetPointChannel::new("temperature"),
      // heater: MeasurementChannel::new("heater")
    }
  }
}

impl ChannelBus for ThermalBus {

}

impl DeviceBusConnector<ThermalMassModel> for ThermalBus {
  fn send(&self, device: &ThermalMassModel) {
    self.temperature.stream_channel.valueStream.send(device.temperature).unwrap();
  }
  fn receive(&self, device: &ThermalMassModel) {
    
  }
}


// impl DeviceBusConnector<ThermalMassModel> for ThermalBus {
//   fn connect_forward_channels(&self, device: D) {

//   }

//   fn connect_reverse_channels(&self, device: D) {

//   }
// }