#################################################################
#                          CONFIG FILES                         #
#################################################################

# alacritty
mkdir -p ~/.config/alacritty/
stow -t ~/.config/alacritty/ alacritty/

# espanso
mkdir -p ~/.config/espanso/match/
stow -t ~/.config/espanso/match/ espanso/

# # helix
mkdir -p ~/.config/helix/runtime/themes/
stow -t ~/.config/helix/ helix_conf/
stow -t ~/.config/helix/runtime/themes/ helix_themes/

# opencode
mkdir -p ~/.config/opencode/
stow -t ~/.config/opencode/ opencode/

# dunst
mkdir -p ~/.config/dunst/scripts/
stow -t ~/.config/dunst/ dunst/

#################################################################
#                         CUSTOM SCRIPTS                        #
#################################################################
mkdir -p ~/.local/bin/
stow -t ~/.local/bin/ custom_scripts/
