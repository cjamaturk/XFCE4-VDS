sudo apt update
sudo apt upgrade
----------------------------------------------------------------------------
sudo apt install tightvncserver
----------------------------------------------------------------------------
tightvncserver
----------------------------------------------------------------------------
tightvncserver -kill :1
----------------------------------------------------------------------------
sudo apt install xfce4 xfce4-goodies
----------------------------------------------------------------------------
nano ~/.vnc/xstartup
----------------------------------------------------------------------------
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
----------------------------------------------------------------------------
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update \
	&& sudo apt install ngrok
----------------------------------------------------------------------------
ngrok config add-authtoken 2QCJfUJI3cO8K8qNPV1DIvrjkya_3KKfB71NryW89H3VWMjvH
----------------------------------------------------------------------------
tightvncserver :1 -geometry 1920x1080 -depth 24
----------------------------------------------------------------------------
ngrok tcp 5901
----------------------------------------------------------------------------
CJamaTURK
