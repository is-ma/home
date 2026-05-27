# Ignorar cierre de tapa (lid close)

Para transportar la laptop con la tapa cerrada (ej. de una habitación a otra, o en modo clamshell con monitor externo) sin que se suspenda.

## Drop-in de systemd-logind

```bash
sudo mkdir -p /etc/systemd/logind.conf.d
echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchExternalPower=ignore\nHandleLidSwitchDocked=ignore" | sudo tee /etc/systemd/logind.conf.d/lid-close.conf
sudo systemctl reload systemd-logind
```

## Directivas

| Directiva | Valor | Cuándo aplica |
|-----------|-------|---------------|
| `HandleLidSwitch` | `ignore` | En batería, sin monitor externo |
| `HandleLidSwitchExternalPower` | `ignore` | En corriente AC |
| `HandleLidSwitchDocked` | `ignore` | Con dock o múltiples displays |

## Verificar

```bash
sudo systemd-analyze cat-config systemd/logind.conf | grep -A3 'HandleLid'
```

Debe mostrar:

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

## Notas

- Con `ignore`, la pantalla interna **no se apaga automáticamente** al cerrar la tapa. Para apagarla, usa `xset dpms force off` antes de cerrar.
- **No meter en mochila** con la laptop encendida y tapa cerrada — riesgo de sobrecalentamiento.
- El monitor externo funciona normalmente con la tapa cerrada (modo clamshell).
