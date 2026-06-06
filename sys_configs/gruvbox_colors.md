# Paleta Gruvbox Material Dark

> Fuente oficial: https://github.com/sainnhe/gruvbox-material
> Suite de temas para Vim, Helix, Alacritty, kitty, i3, etc.
>
> Nuestra variante: **Dark Hard** (fondo más oscuro)

## Cómo se estructura

Gruvbox Material tiene tres modos (dark, light) y tres variantes (soft, medium, hard).
Nosotros usamos **dark hard** (fondo `#1d2021`).

Los colores se nombran con una convención de **capas**:
- `bg0` → fondo más profundo (terminal, editor)
- `bg1`, `bg2`, `bg3` → superficies cada vez más claras (sidebar, selección, hover)
- `fg0` → texto principal
- `fg1`, `fg2`, `fg3` → textos secundarios
- `grey0`, `grey1`, `grey2` → grises para elementos secundarios

## Paleta completa

### Superficies (backgrounds)

| Nombre | Hex | Uso |
|---|---|---|
| `bg0` (hard) | `#1d2021` | Fondo del terminal y editor |
| `bg1` | `#282828` | Negro ANSI, paneles secundarios |
| `bg2` | `#3c3836` | Selección de texto, hover |
| `bg3` | `#5a524c` | Rangos seleccionados |

### Textos (foregrounds)

| Nombre | Hex | Uso |
|---|---|---|
| `fg0` | `#d4be98` | Texto principal |
| `fg1` | `#ddc7a1` | Blanco ANSI, texto brillante |
| `fg2` | `#c9b99a` | Texto secundario |
| `fg3` | `#c9b99a` | Texto terciario |
| `grey0` | `#7c6f64` | Gris ANSI, comentarios |
| `grey1` | `#928374` | Gris medio |
| `grey2` | `#a89984` | Cursor, gris claro |

### Colores ANSI (16 paleta)

| Color | Hex | Rol |
|---|---|---|
| `red` | `#ea6962` | Errores, peligro, git delete |
| `green` | `#a9b665` | Aciertos, git add, nuestro verde activo |
| `yellow` | `#d8a657` | Advertencias, atención |
| `blue` | `#7daea3` | Información, links |
| `purple` | `#d3869b` | Destacado secundario |
| `aqua` | `#89b482` | Información secundaria |
| `orange` | `#e78a4e` | Acento cálido |

## Extensiones a la paleta

Colores CSS con nombre oficial que incorporamos para necesidades específicas no cubiertas por Gruvbox:

| Nombre CSS | Hex | Dónde lo usamos |
|---|---|---|
| `darkgreen` | `#006400` | Fondo de líneas añadidas en diffs (OpenCode) |
| `maroon` | `#800000` | Fondo de líneas eliminadas en diffs (OpenCode) |

## Herramientas que usan esta paleta

| Herramienta | Archivo de color |
|---|---|
| Alacritty | `targets/alacritty/alacritty.toml` (`[colors]`) |
| Helix | `targets/helix_themes/gruvbox_rich.toml` (hereda de `gruvbox_material_dark_hard`) |
| i3 (workspaces) | `targets/i3/config` (`colors {}`) |
| tmux | `targets/tmux/tmux.conf` |
| i3blocks | `targets/i3blocks/config` |
| LazyGit | `targets/lazygit/config.yml` (`gui.theme`) |

