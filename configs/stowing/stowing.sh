#################################################################
#                          CONFIG FILES                         #
#################################################################

# alacritty
mkdir -p ~/.config/alacritty/
stow --override=".*" --restow -t ~/.config/alacritty/ alacritty/

# dunst
mkdir -p ~/.config/dunst/scripts/
stow --override=".*" --restow -t ~/.config/dunst/ dunst/

# espanso
mkdir -p ~/.config/espanso/match/
stow --override=".*" --restow -t ~/.config/espanso/match/ espanso/

# helix
mkdir -p ~/.config/helix/runtime/themes/
stow --override=".*" --restow -t ~/.config/helix/ helix_conf/
stow --override=".*" --restow -t ~/.config/helix/runtime/themes/ helix_themes/

# i3
mkdir -p ~/.config/i3/
stow --override=".*" --restow -t ~/.config/i3/ i3/

# i3status
mkdir -p ~/.config/i3status/
stow --override=".*" --restow -t ~/.config/i3status/ i3status/

# opencode
mkdir -p ~/.config/opencode/
stow --override=".*" --restow -t ~/.config/opencode/ opencode/

# rofi
mkdir -p ~/.config/rofi/
stow --override=".*" --restow -t ~/.config/rofi/ rofi/


#################################################################
#                         CUSTOM SCRIPTS                        #
#################################################################
mkdir -p ~/.local/bin/
stow --override=".*" --restow -t ~/.local/bin/ custom_scripts/
