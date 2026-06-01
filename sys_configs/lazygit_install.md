# Lazygit: instalación manual desde GitHub

El paquete `lazygit` de Debian (`0.50.0`) está muy desactualizado.
Instalar el binario estático desde GitHub releases.

## Instalación

```sh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp
sudo install /tmp/lazygit -D -t /usr/local/bin/
# o si no hay sudo: install /tmp/lazygit ~/.local/bin/
rm /tmp/lazygit /tmp/lazygit.tar.gz
```

## Verificar

```sh
lazygit --version
# Debe mostrar: version=0.6x.x, build source=binaryRelease
```

## Notas

- La versión de Debian (`apt install lazygit`) es ~0.50.0 — no tiene el menú de fixup (PR #5233).
- La versión manual desde GitHub se instala en `/usr/local/bin/` o `~/.local/bin/`.
- Si usas `~/.local/bin/`, asegúrate de que esté en el PATH antes que `/usr/bin/`.
