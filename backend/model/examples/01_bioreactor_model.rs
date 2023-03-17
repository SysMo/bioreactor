use bioreactor_model::model::bioreactor::{BioreactorModel};
use bioreactor_model::model::thermal::{ThermalMassModel, ThermalBus};
use flowmbed_peripherals::channels::DeviceBusConnector;
use flowmbed_peripherals::mqtt::mqtt_service::Publisher;
use flowmbed_peripherals::mqtt::{MqttService, MqttServiceOptions, MqttServiceImpl};

fn main() {
  // let mut bioreactor = BioreactorModel::new();
  
  // let deviceBus = BioreactorBus::new("bioreactor");
  // let deviceConnector = BioreactorDeviceConnector::new();
  // deviceConnector.connect_forward_channels(deviceBus);
  let mqtt_options = MqttServiceOptions {
    host: "mqtts://c0a7164f.ala.us-east-1.emqxsl.com:8883".to_owned(),
    client_id: "rust_paho_1".to_owned(),
    user: "sysmo".to_owned(), 
    password: "sysmopass".to_owned(),
  };
  MqttServiceImpl::with(mqtt_options, |mqtt| {
    let pub1 = mqtt.publisher("bioreactor/thermal/temperature");
    let sub1 = mqtt.subscriber("bioreactor/thermal/temperature");
    // mqtt_service.publish("bioreactor/thermal/temperature", "35");
  
    let mut thermal_mass = ThermalMassModel::new(20.0);
    let mut deviceBus = ThermalBus::new("thermal");
  
    let mut t: f32 = 0.0; 
    let dt: f32 = 1.0;
    loop {
      pub1.send(35);
      while let Some(msg) = sub1.next::<f64>() {
        println!("Received message {msg}");
      }
  
      deviceBus.receive(&thermal_mass);
      thermal_mass.step(t, dt);
      t += dt;
      deviceBus.send(&thermal_mass);
      println!("t = {t}s");
      std::thread::sleep(std::time::Duration::from_millis((dt*1000.0) as u64));
    }
  });

    

}