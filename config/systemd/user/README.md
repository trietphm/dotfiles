Xmodmap
---

Remap Left Super to Ctrl.

- Add the service file to `~/.config/systemd/user/xmodmap.service`
- Enabled autoload
```
systemctl --user enable xmodmap.service
```

- Start first time without relogin
```
systemctl --user start xmodmap.service
```

### Why systemd?

- Tried with `.Xmodmap`, `.xinitrc`, `.xmodmaprc` and doesn't work
- Tried adding a Gnome autostart doesn't work
