# Ignorar botón de encendido físico

## Default
HandlePowerKey=poweroff  → apaga la PC al presionar

## Cambiar a ignore (yo controlo desde el teclado)
sudo mkdir -p /etc/systemd/logind.conf.d
echo -e "[Login]\nHandlePowerKey=ignore" | sudo tee /etc/systemd/logind.conf.d/power-button.conf
sudo systemctl reload systemd-logind

## Verificar
sudo systemd-analyze cat-config systemd/logind.conf | grep -A1 'HandlePowerKey'
# Debe mostrar: HandlePowerKey=ignore

## Atajos de teclado en i3
- $mod+z        → lock
- $mod+s        → sleep
- $mod+Shift+s  → hibernate
