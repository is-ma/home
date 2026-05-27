# Habilitar hibernación (swap file)

## Requisitos
- swap file >= tamaño de RAM
- kernel params `resume=` y `resume_offset=`

## Crear swap file (24Gi para 23Gi RAM)
sudo swapoff -a
sudo rm /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1M count=24576 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

## Obtener offset del swap file
sudo filefrag -v /swapfile | awk 'NR==4{print $4}' | tr -d ':'

## Obtener UUID de la partición raíz
sudo blkid /dev/nvme0n1p2 | grep -o 'UUID="[^"]*"'

## Agregar params al kernel
sudo vim /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet mem_sleep_default=deep resume=UUID=<tu-uuid> resume_offset=<tu-offset>"

## Actualizar
sudo update-grub
sudo update-initramfs -u
sudo reboot

## Verificar
cat /sys/power/state       # debe incluir "disk"
swapon --show              # debe mostrar /swapfile

## Uso en i3
- $mod+s        → sleep (systemctl suspend)
- $mod+Shift+s  → hibernate (systemctl hibernate)
