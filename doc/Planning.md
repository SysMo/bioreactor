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
  - requirements
    - P(ID) controller
    - output
      - motor control with PWM modulation
      - motor driver (XY-MOS or XY-GMOS)
    - input
      - reading tacho using ADS1115
      - pollarity-independent readout:
        - https://electronics.stackexchange.com/questions/217835/understanding-absolute-value-circuit-operation

### MCU
  - requirements
    - connect to wireless
    - mqqt messaging
  
  - tasks
    - [ ] code for temperature reading
    - [ ] code for temperature control
    - [ ] code for 
    - [ ] wreless router?
  


## Message Broker
  - broker
    - https://cloud-intl.emqx.com/console/deployments/c0a7164f/overview
    - url: mqtts://c0a7164f.ala.us-east-1.emqxsl.com
    - username: sysmo
    - password: sysmopass

  - topics
    - sysmo/esp32/bio1/from
    - sysmo/esp32/bio1/to

  - tasks
    - [ ] Choose server or managed service
    - [ ] Decide on topics

## Database
  - requirements:  
    - time series database
    - save all sensor data
    - save parameter settings

  - implementation:
    - InfluxDB using Telegraf

  - tasks:
    - [ ] Set-up database server

## Front-end
  - requirements
    - connect to mqtt
    - show current values (temperature, heater state, motor speed)
    - modify parameters (target temperature, motor target speed, on/off time)
    - show alerts
    - read-only view(s) and modify view(s)
    
  - implementation
    - cross-platform development using flutter & dart
    - desktop, web, android

  - questiones:
    - how many different views should we have?
    - historical data view 
      - see e.g. https://gitlab.com/rickspencer3/flux-mobile

  - tasks
      - [x] Basic proof of concept
      - [ ] Discuss with Venelin what controls are relevant 
      - [ ] Add a control for on/off time
      - [ ] Add an overview tab
      - [ ] Fix layout for mobile
