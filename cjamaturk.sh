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

# FRP kurulumu
# 1. https://github.com/fatedier/frp/releases adresinden FRP'nin son sürümünü indirin ve kurun.
# 2. FRP sunucu konfigürasyon dosyasını oluşturun ve düzenleyin (örneğin: `frps.ini`).
# 3. FRP istemci konfigürasyon dosyasını oluşturun ve düzenleyin (örneğin: `frpc.ini`).

# VNC server'ı FRP ile bağlama
# frpc.ini dosyasında:
# - `server_addr` : FRP sunucu IP adresini girin.
# - `server_port` : FRP sunucu portunu girin.
# - `local_port` : VNC server portunu (5901) girin.

# FRP sunucu ve istemcisini başlatın
sudo frps -c frps.ini &
frpc -c frpc.ini &

# PC bilgilerini alma
ram=$(free -m | grep "Mem:" | awk '{print <span class="math-inline">2\}'\)
cpu\=</span>(cat /proc/cpuinfo | grep "
