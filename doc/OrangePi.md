## OrangePi I96

### USB-UART converter

black: GND
white: RX
blue: TX

### Useful links

https://jamesachambers.com/orange-pi-i96-getting-started-guide/comment-page-6/

http://www.orangepi.org/orangepiwiki/index.php/Orange_Pi_i96#Step_3:_Start_your_Orange_Pi

### Initial startup

  - Connect USB-UART
  - Start kermit terminal emulator (port )
  - Connect USB power supply


```
(~/) C-Kermit>connect
Connecting to /dev/ttyUSB0, speed 921600
 Escape character: Ctrl-\ (ASCII 28, FS): enabled
Type the escape character followed by C to get back,
or followed by ? to see other options.
...
```

user: orangepi
password: orangepi


sudo orangepi-config

configure WiFi

```
sudo apt purge alsa-utils
sudo apt autoremove
```

```
sudo nano /etc/default/crda
REGDOMAIN=BG
```

Note: OrangePi I96 can only connect to WiFi5

### Update packages

```
sudo apt update
sudo apt upgrade
```

### Create user

```
sudo adduser atanas
sudo usermod -aG sudo atanas
```

### SSH

```
sudo apt-get install openssh-server 
```

Optional:
  - Temporary enable password authentication:
    - PasswordAuthentication yes


Sometimes the original generated keys don't work
check out /var/log/auth.log

In this case, follow https://www.xmodulo.com/sshd-error-could-not-load-host-key.html

