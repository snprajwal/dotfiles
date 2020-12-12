pi -s wim
pi -s tools
c
rm .config/zsh/history.zsh
q
dotfiles/lf
ls
v lfrc
q
ss
ss -tulw
c
q
v
q
cat > misc/data.txt
q
misc
diff data2.txt data.txt
q
zsh -h
c
man zsh
man zshoptions
q
v .config/lf/lfrc
q
v .config/lf/lfrc
q
c
q
v .config/lf/lfrc
q
pi -s fuse
c
pi -c
c
paru -Sc
c
q
diff .config/lf/lfrc dotfiles/lf/lfrc
c
q
dotfiles
ls
gst
gd
c
ps -e G picom
kill 599
picom &!
c
gcma 10Dec2020
gps
c
pst
gst
q
cfi
q
prm transmission-gtk
c
pi deluge
pi qbittorrent
c
pi fragments
c
q
ps -e G fra
q
pi ktorrent
c
q
prm fragments
c
paru -S tixati
c
paru -Sc
c
p -Qtdq
prm traceroute
c
p -Sc
c
pi qbittorrent
q
cfv
q
man feh
c
q
man feh
q
find /misc -type -f
find /misc -type f
find misc -type f
find misc/\*.jpg -type f
find misc/*.jpg -type f
find misc/*.jpg -type f | shuf
find misc/*.jpg -type f | shuf -n 1
c
cfi
q
cfi
q
cfi
q
cfi
q
cfi
q
resolvectl status
v /etc/resolv.conf
ln -sf /etc/resolv.conf /run/systemd/resolve/resolv.conf
s ln -sf /etc/resolv.conf /run/systemd/resolve/resolv.conf
sv /etc/resolv.conf
s rm /run/systemd/resolve/resolv.conf
s rm /etc/resolv.conf
touch /etc/resolv.conf
s touch /etc/resolv.conf
sv /run/systemd/resolve/resolv.conf
s ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
q
resolvectl status
sys restart systemd-resolved.service
resolvectl status
c
resolvectl status
q
sv /etc/resolv.conf
q
pu
q
src
gcl https://git.suckless.org/dmenu
c
q
find / dmenu
find /bin dmenu
find dmenu /bin
c
find . dmenu
find /usr/bin dmenu
c
which dmenu
find /usr/bin dmenu
rg dmenu /bin
c
i3-dmenu-desktop
lfcd
ls
chmod a+x dmenu_run_history
./dmenu_run_history
s cp dmenu_run_history /usr/bin/dmenu_run
c
q
src/dmenu
ls
cp /usr/bin/dmenu_path ../
..
ls
-
dmenu
c
dmenu/
c
mv ../../misc/dmenu-highlight-4.9.diff .
ls
c
patch < dmenu-highlight-4.9.diff
gst
c
rm dmenu-highlight-4.9.diff
c
ls
rm ../dmenu_path
cp /usr/bin/dmenu_run ../
cp ../dmenu_run ./dmenu_run
c
s make clean install
c
q
which dmenu
c
ls /usr/bin/dmenu
ls /usr/bin/dmenu_he
ls /usr/bin/dmenu_run
c
q
prm dmenu
c
q
ps -e G lf
c
ps -e G lf
htop
ps -e G lf
kill 2062
c
q
ps -e G lf
q
xrandr --output HDMI-1 --primary --auto
xrandr --output HDMI-1 --primary --auto --output eDP-1 off
xrandr --output HDMI-1 --primary --auto --output eDP-1 --off
q
misc/The\ Illusionist
ftp 192.168.1.3 2121
ls
unzip the-illusionist-2006-english-yify-104908.zip
c
rm the-illusionist-2006-english-yify-104908.zip
q
htop
q
ftp 192.168.1.3 2121
bg
fg
q
lfcd
ftp 192.168.1.3 2121
q
xrandr --output eDP-1 --primary --auto 
xrandr --output eDP-1 --primary --auto --output HDMI-1 --off
q
xrandr --output HDMI-1 --primary --auto --output eDP-1 --right-of HDMI-1
q
date
date +%i
date +%I
date +%T
date +%I%M%P
date +%I:%M %P
date +%I:%M\ %P
date +"%I:%M %P"
date "+%I:%M %P"
"date +%I:%M %P"
date "+%I:%M %P"
man date
q
date
q
hostname
hostname -i
c
q
xtitle -s
c
pi xtitle
c
date "+%I:%M %P"
echo date "+%I:%M %P"
echo $(date "+%I:%M %P")
echo "date: $(date "+%I:%M %P")"
q
dotfiles
gst
gd nvim/init.vim
c
q
pi i3blocks
c
md .config/i3blocks
v .config/i3blocks/config
q
prm i3blocks
c
q
t
c
q
t
q
cfi
c
pidof autotiling
ps -e G  aut
kill 12736
c
prm autotiling
c
v dotfiles/arch.txt
paru -Sc
q
pi polybar
paru -S polybar
c
pi -s bumblebee
paru -s bumblebee
c
p -Qe
c
paru -S bumblebee-status
c
q
bumblebee-status -m cpu date memory time pulseaudio
cfi
prm bumblebee-status
c
paru -Sc
c
q
v .config/i3status/config
q
dotfiles
gst
gd
c
gcma 11Dec2020
gps
q
prm dmenu
s rm /usr/local/bin/stest
s rm /usr/local/bin/dmenu*
ls /usr/local/bin/
c
pi dmenu
q
neofetch
c
volctl
c
ps -e G lf
kill 8358
c
q
cfv
q
diff /etc/xdg/picom.conf dotfiles/picom.conf
diff --color /etc/xdg/picom.conf dotfiles/picom.conf
c
q
xrandr --auto
volctl
c
q
cfi
q
xrandr
q
echo $HOME
echo ~
c
cfz
md .local/dotfiles
git init --bare ~/.local/dotfiles
cfa
dot status
q
