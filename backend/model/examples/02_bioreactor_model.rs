use bioreactor_model::model::bioreactor::{BioreactorModel, BioreactorBus};
use flowmbed_peripherals::channels::{DeviceBusConnector, IOConnector};
use flowmbed_peripherals::mqtt::{MqttServiceOptions, MqttServiceImpl};

fn main() {
  simple_logger::init_with_level(log::Level::Info).unwrap();

  let mqtt_options = MqttServiceOptions {
    host: "mqtts://c0a7164f.ala.us-east-1.emqxsl.com:8883".to_owned(),
    client_id: "rust_paho_1".to_owned(),
    user: "sysmo".to_owned(), 
    password: "sysmopass".to_owned(),
  };
  MqttServiceImpl::with(mqtt_options, |mqtt| {
    let mut bioreactor = BioreactorModel::new();
    let mut device_bus = BioreactorBus::new("bioreactor");
    device_bus.connect_io_root(mqtt);    
  
    let mut t: f32 = 0.0; 
    let dt: f32 = 1.0;
    loop {
      device_bus.handle_actions(&mut bioreactor);
      bioreactor.step(t, dt);
      t += dt;
      device_bus.sample(&bioreactor);
      println!("t = {t}s");
      std::thread::sleep(std::time::Duration::from_millis((dt*1000.0) as u64));
    }
  });

    

}