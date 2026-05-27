# SETUP DEBIAN

sudo apt update

## git
sudo apt install -y git

## alacritty
sudo apt install -y alacritty

## bash
if ! grep -q 'is-ma.sh' ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# IS-MA" >> ~/.bashrc
    echo "source ~/is-ma/home/targets/bash/is-ma.sh" >> ~/.bashrc
    echo "" >> ~/.bashrc
fi

## browser
sudo apt install -y firefox-esr

## fonts (~/.local/share/fonts/)
fc-cache -fv
# fc-list | grep -i "Meslo"

## i3
sudo apt install -y x11-xserver-utils  # xrand
sudo apt install -y i3 i3status i3lock rofi xinit
sudo apt install -y libnotify-bin dunst

