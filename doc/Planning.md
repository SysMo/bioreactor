# Demo Microcontroller v1.0

## Microcontroller

### Temperature
  - temperature sensor
    - PT100
    - MAX31865 R-to-digital converter (SPI)
      - https://github.com/rudihorn/max31865
  - heater
    - mechanical or solid-state relay
  - algorithm
    - trigger with hysteresis

### Stirrer
  - motor control with pwm modulation
    - motor driver (XY-MOS or XY-GMOS)
  - reading tacho using ADS1115
  - P controller
  - pollarity-independent readout:
    - https://electronics.stackexchange.com/questions/217835/understanding-absolute-value-circuit-operation

### MCU Networking
  - connect to wireless
  - mqqt messaging

## Message Broker
  - broker
    - https://cloud-intl.emqx.com/console/deployments/c0a7164f/overview
    - url: mqtts://c0a7164f.ala.us-east-1.emqxsl.com
    - username: sysmo
    - password: sysmopass

  - topics
    - sysmo/esp32/bio1/from
    - sysmo/esp32/bio1/to

## Database
  - requirements:  
    - time series database
    - save all sensor data
    - save parameter settings

  - implementation:
    - InfluxDB using Telegraf

## Front-end
  - requirements
    - connect to mqtt
    - show current values (temperature, heater state, motor speed)
    - modify parameters (target temperature, motor target speed, on/off time)
    - show alerts
    
  - implementation
    - cross-platform development using flutter & dart
    - desktop, web, android
