My dotfiles
=====


- Install tmux plugin manager: https://github.com/tmux-plugins/tpm

## Remap keyboard
In Ubuntu, I need to map:
- My left `Super` button to `Control`, keep the right `Super` as is
- `CapsLock` to `Control`

* Create new startup app `~/.config/autostart/xmodmap.desktop`

```
[Desktop Entry]
Name=Xmodmap
Comment=xmodmap ~/.Xmodmap
Exec=/home/triet/.xinitrc
Icon=application-default-icon
X-GNOME-Autostart-enabled=true
Type=Application
```

* `.xinitrc` content
```
#!/bin/sh
# Need to sleep a few seconds for the OS to regconize all the keyboards
sleep 10;
setxkbmap -option caps:ctrl_modifier
xmodmap /home/triet/.Xmodmap
```
* Use `setxkbmap` instead of Gnome Tweak because Gnome Tweak will set a new keyboard profile which will revert all the previous mapping
* Allow to execute `.xinitrc`
```
chmod 755 ~/.xinitrc
```

* User `xmodmap` to map the Super key. Add a `.Xmodmap`
```
clear control
add Control = Control_L Control_R
remove mod4 = Super_L
add Control = Super_L
```

