# Battery charge in a healthy range
sudo apt install -y tlp

# veamos si es compatible la computadora
sudo tlp-stat -b

# configuramos 3 variables
sudo vim /etc/tlp.conf

TLP_ENABLE=1
START_CHARGE_THRESH_BAT0=70
STOP_CHARGE_THRESH_BAT0=75

# iniciamos el servicio
sudo tlp start

# comprobamos los cambios
sudo tlp-stat -b
