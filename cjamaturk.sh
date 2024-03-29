#!/bin/bash

# Sistem güncellemeleri
sudo apt update -y && sudo apt upgrade -y

# XFCE masaüstü ortamı kurulumu
sudo apt install -y xfce4 xfce4-goodies

# VNC server kurulumu
sudo apt install -y tightvncserver

# VNC server ayarları
echo "root:123456" | sudo tee -a /etc/tightvncserver/passwd
sudo chmod 600 /etc/tightvncserver/passwd

# VNC server'ı otomatik başlatma
sudo systemctl enable tightvncserver@root.service

# Serveo ile VNC server'ı dış ağda kullanılabilir hale getirme
sudo apt install -y serveo

# PC bilgilerini alma
ram=$(free -m | grep "Mem:" | awk '{print $2}')
cpu=$(cat /proc/cpuinfo | grep "model name" | head -1 | awk '{print $4,$5,$6,$7,$8}')

# Ekran bilgisi
echo "Bağlantı Bilgileri:"
echo "IP Adresi: $(curl ifconfig.me)"
echo "Kullanıcı Adı: root"
echo "Şifre: 123456"
echo ""
echo "PC Bilgileri:"
echo "RAM: $ram MB"
echo "İşlemci: $cpu"

# Serveo ile VNC server'ı başlatma
serveo --port 8080 --no-auth /etc/tightvncserver/xstartup

# VNC server'ı arka planda çalıştırma
nohup tightvncserver -geometry 1920x1080 :1 &
