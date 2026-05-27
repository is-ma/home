#################################################################
#                          CONFIG FILES                         #
#################################################################

# alacritty
mkdir -p ~/.config/alacritty/
stow -t ~/.config/alacritty/ alacritty/

# dunst
mkdir -p ~/.config/dunst/scripts/
stow -t ~/.config/dunst/ dunst/

# espanso
mkdir -p ~/.config/espanso/match/
stow -t ~/.config/espanso/match/ espanso/

# helix
mkdir -p ~/.config/helix/runtime/themes/
stow -t ~/.config/helix/ helix_conf/
stow -t ~/.config/helix/runtime/themes/ helix_themes/

# i3
mkdir -p ~/.config/i3/
stow -t ~/.config/i3/ i3/

# i3status
mkdir -p ~/.config/i3status/
stow -t ~/.config/i3status/ i3status/

# opencode
mkdir -p ~/.config/opencode/
stow -t ~/.config/opencode/ opencode/

# rofi
mkdir -p ~/.config/rofi/
stow -t ~/.config/rofi/ rofi/


#################################################################
#                         CUSTOM SCRIPTS                        #
#################################################################
mkdir -p ~/.local/bin/
stow -t ~/.local/bin/ custom_scripts/
