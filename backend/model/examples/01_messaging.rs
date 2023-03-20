use bioreactor_model::model::bioreactor::{BioreactorModel};
use bioreactor_model::model::thermal::{ThermalMassModel, ThermalBus};
use flowmbed_peripherals::channels::{DeviceBusConnector, self, ChannelBus};
use flowmbed_peripherals::mqtt::{MqttService, MqttServiceOptions, MqttServiceImpl, MessageSender, MessageReceiver};

fn main() {
  let mqtt_options = MqttServiceOptions {
    host: "mqtts://c0a7164f.ala.us-east-1.emqxsl.com:8883".to_owned(),
    client_id: "rust_paho_1".to_owned(),
    user: "sysmo".to_owned(), 
    password: "sysmopass".to_owned(),
  };
  MqttServiceImpl::with(mqtt_options, |mqtt| {
    let pub1 = mqtt.publisher("bioreactor/thermal/temperature");
    let sub1 = mqtt.subscriber("bioreactor/thermal/temperature");

  
    let mut thermal_mass = ThermalMassModel::new(20.0);

    let mut t: f32 = 0.0; 
    let dt: f32 = 1.0;
    loop {
      pub1.send(thermal_mass.temperature);
      while let Some(msg) = (&sub1 as &dyn MessageReceiver<f32>).next() {
        println!("Received message {msg}");
      }
      println!("No-more messages!");

      thermal_mass.step(t, dt);
      t += dt;
      // deviceBus.send(&thermal_mass);
      println!("t = {t}s");
      std::thread::sleep(std::time::Duration::from_millis((dt*1000.0) as u64));
    }
  });

    

}