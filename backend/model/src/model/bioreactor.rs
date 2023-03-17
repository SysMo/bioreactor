use super::thermal::{ThermalMassModel, ThermalBus};
use super::stirrer::{StirrerModel};
use flowmbed_peripherals::channels::{DeviceBusConnector, ChannelBus};

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
  thermal: ThermalBus  
}

impl BioreactorBus {
  pub fn new(id: &str) -> Self {
    BioreactorBus { 
      id: id.to_owned(),
      thermal: ThermalBus::new("thermal")
    }
  }
}

impl ChannelBus for BioreactorBus {

}



// pub struct BioreactorDeviceConnector {
//   thermal: ThermalDeviceConnector
// }

// impl BioreactorDeviceConnector {
//   pub fn new() -> Self {
//     BioreactorDeviceConnector { 
//       thermal: ThermalDeviceConnector::new()
//     }
//   }
// }

// impl DeviceBusConnector<BioreactorBus> for BioreactorModel {
//   fn connect_forward_channels(&self, bus: BioreactorBus) {
    
//   }

//   fn connect_reverse_channels(&self, bus: BioreactorBus) {

//   }
// }