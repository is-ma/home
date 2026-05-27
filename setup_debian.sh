# SETUP DEBIAN

sudo apt update

## sudo apt install
sudo apt install -y alacritty
sudo apt install -y bat
sudo apt install -y btm
sudo apt install -y build-essential
sudo apt install -y curl
sudo apt install -y dunst libnotify-bin
sudo apt install -y fastfetch
sudo apt install -y firefox-esr
sudo apt install -y fzf
sudo apt install -y git
sudo apt install -y gtypist
sudo apt install -y acpi  # battery status for i3blocks
sudo apt install -y i3 i3blocks i3lock rofi xinit
sudo apt install -y plocate
sudo apt install -y ripgrep
sudo apt install -y x11-xserver-utils  # xrand (monitors)
sudo apt install -y vim
sudo apt install -y whois

## bash
if ! grep -q 'is-ma.sh' ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# IS-MA" >> ~/.bashrc
    echo "source ~/is-ma/home/targets/bash/is-ma.sh" >> ~/.bashrc
    echo "" >> ~/.bashrc
fi

## fonts (~/.local/share/fonts/)
fc-cache -fv
# fc-list | grep -i "Meslo"
