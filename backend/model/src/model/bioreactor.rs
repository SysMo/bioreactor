use super::thermal::{ThermalMassModel, ThermalBus};
use super::stirrer::{StirrerModel, StirrerBus};
use flowmbed_peripherals::channels::{DeviceBusConnector, IOConnector};
use flowmbed_peripherals::util::QualifiedPath;
use flowmbed_peripherals::mqtt::MqttService;

pub struct BioreactorModel {
  thermal: ThermalMassModel,
  stirrer: StirrerModel,
}

impl BioreactorModel {
  pub fn new() -> Self {
    BioreactorModel { 
      thermal: ThermalMassModel::new(25.0),
      stirrer: StirrerModel::new() 
    }
  }

  pub fn step(&mut self, t_last: f32, dt: f32) {
    self.thermal.step(t_last, dt);
    self.stirrer.step(t_last, dt);
  }
}

pub struct BioreactorBus {
  id: String,
  thermal: ThermalBus,
  stirrer: StirrerBus,
}

impl BioreactorBus {
  pub fn new(id: &str) -> Self {
    BioreactorBus { 
      id: id.to_owned(),
      thermal: ThermalBus::new("thermal"),
      stirrer: StirrerBus::new("stirrer"),
    }
  }
}

impl DeviceBusConnector<BioreactorModel> for BioreactorBus {
  fn sample(&self, device: &BioreactorModel) {
    self.thermal.sample(&device.thermal);
    self.stirrer.sample(&device.stirrer);
  }
  fn handle_actions(&self, device: &mut BioreactorModel) {
    self.thermal.handle_actions(&mut device.thermal);
    self.stirrer.handle_actions(&mut device.stirrer);
    
  }
}

impl IOConnector for BioreactorBus {  
  fn connect_io(&mut self, comm: &mut dyn MqttService, qpath: &QualifiedPath) {
      self.thermal.connect_io(comm, &qpath.append(&self.id));
      self.stirrer.connect_io(comm, &qpath.append(&self.id));
  }
}

