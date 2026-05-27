# Diagnosticando el modo de suspensión
## Modo: s2idle
- la batería se drena rápidamente
- suspensión por software (superficial)
- puede calentarse en mochila

## Modo: deep
- seguro para transportar en mochila
- la batería dura por días (sólo alimenta RAM)

# Prueba
cat /sys/power/mem_sleep

# Simular modo deep para testear hardware:
- echo deep | sudo tee /sys/power/mem_sleep
- cierra tapa, espera 1 min, abre y comprueba

# Cambio permanente (vía GRUB):
- sudo vim /etc/default/grub
- busca GRUB_CMDLINE_LINUX_DEFAULT
- Añade `mem_sleep_default=deep` dentro de las comillas
- Ej. "quiet mem_sleep_default=deep"

# Actualiza el GRUB:
sudo update-grub
sudo reboot

