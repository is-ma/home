# SETUP DEBIAN

sudo apt update

## sudo apt install
sudo apt install -y acpi  # battery status for i3blocks
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
sudo apt install -y i3 i3blocks i3lock xinit
sudo apt install -y lazygit
# sudo apt install -y libxss-dev libx11-dev libxext-dev build-essential  # build deps for xautolock (ver sys_configs/xautolock_build.md)
sudo apt install -y plocate
sudo apt install -y ripgrep
sudo apt install -y sysstat  # mpstat for cpu_usage in i3blocks
sudo apt install -y x11-xserver-utils  # xrand (monitors)
sudo apt install -y vim
sudo apt install -y whois

# --- Albert launcher (from official OBS repo) ---
echo "Adding Albert launcher repository..."
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
echo "Installing Albert launcher and dependencies..."
sudo apt install -y albert libqalculate scrot picom

# --- CopyQ clipboard manager ---
echo "Installing CopyQ clipboard manager..."
sudo apt install -y copyq copyq-plugins copyq-doc

## bash
if ! grep -q 'is-ma.sh' ~/.bashrc; then
    echo "" >> ~/.bashrc
    echo "# IS-MA" >> ~/.bashrc
    echo "source ~/is-ma/home/targets/bash/is-ma.sh" >> ~/.bashrc
    echo "" >> ~/.bashrc
fi

## fonts (~/.local/share/fonts/)
fc-cache -fv
# fc-list | egrep -i "MesloLG|UbuntuSansMono"
