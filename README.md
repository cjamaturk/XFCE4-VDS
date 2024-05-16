[Gitpod](https://gitpod.io) kullanarak bir sanal makine açın.

Seçenekleri resimdekiler gibi yapın.

![Gitpod New Workspace](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/gitpodnw.png)

![Gitpod Seçilecek Repo](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/gitpodrepo.png)

![Gitpod Terminal+Large](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/gitpod.png)

Continue dedikten sonra karşımıza şöyle bir terminal açılacak:

![Gitpod Terminal](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/gitpodterminal.png)

Şimdi artık aşağıdaki kodları teker teker yazmaya başlayalım.

```bash
sudo apt update -y
sudo apt upgrade -y
```

```bash
sudo apt install tightvncserver -y
```

```bash
tightvncserver
```

###### Şifre ayarlama

Bu komudu yazdıktan sonra karşımıza bu ekran gelecek:

![TightVNC Şifre Ayarlama](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/tvnc1.png)

Sanal makineye bağlanırken kullanacağınız şifreyi soruyor. ***root*** yazmayın.

İstediğiniz şifreyi yazdıktan sonra gelecek ekranda "**n**" tuşuna basıp devam edin.

![TightVNC Şifre Ayarlama "n"](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/tvnc2.png)


```bash
tightvncserver -kill :1
```

```bash
sudo apt install xfce4 xfce4-goodies -y
```

#### Bu komudu yazdıktan sonra karşınıza dil seçimi çıkacak.İlkine "94" yazdıktan sonra ikincisine "1" yazıp devam ediyoruz.

![XCFE Klavye Dili Ayarlama](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/xcfeklavye.png)

```bash
nano ~/.vnc/xstartup
```

##### Açılan yerdeki herşeyi silip bunu yazın:

```bash
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```

##### "CTRL+X"'e bastan sonra çıkan soruda "Y" tuşuna basın.

```bash
tightvncserver :1 -geometry 1920x1080 -depth 24
```

## Local TCP portu online yapacak herhangi bir servisi kullanarak 5901 portunu TCP üzerinden yayınlayın.Ben Serveo kullanıyorum.

#### Serveo ile portu online yapma:

```bash
ssh -R 1453:localhost:5901 serveo.net
```

##### "1453" yerine 1024-65535 arası bir numara yazın.

![Serveo Port](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/serveo2.png)

"yes" yazıp ilerleyin.

1453 yerine ne yazdıysanız VNC serverinize bağlanırken onu kullanacaksınız.

Ben client olarak RealVNC kullandım.

![VNC Bağlantısı](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/vnclient.png)

"Continue" dedikten sonra belirlediğimiz şifremizi girerek bağlantımızı başarılı bir şekilde gerçekleştiriyoruz.

### Ekran Görüntüleri

![Ekran Görüntüsü 1](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/ss1.png)

![Ekran Görüntüsü 2](https://raw.githubusercontent.com/cjamaturk/XFCE4-VDS/main/ss2.png)

### Bilinen Sorunlar:

-Sistemde kurulu olan program sayısı çok az,terminal de kısıtlı sanırım çok anlamıyorum Linux'tan.Bundan dolayı yapabileceğiniz şeyler kısıtlı.

-Chrome kurdum ama sadece Google açabildim.Başka sitelerde "***ERROR 4***" hatasını verdi.

-Çok fazla test edemediğim için ne kadar açık kaldığını da bilmiyorum.Ama siz Gitpod sekmesini kapatana kadar kapanmaz diye düşünüyorum.

# İnşallah işinize yarar :)
