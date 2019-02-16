# my sway setup

Borrowed heavily from <https://github.com/ammgws/dotfiles>

## startup

I start sway from tty6 by adding this on top of my .zshrc file:

```
# autostart sway when on tty1 and not root
if [[ -x /bin/sway ]] && [[ $(tty) = /dev/tty6 ]] && [[ ! $UID = 0 ]]; then
  _JAVA_AWT_WM_NONREPARENTING=1 /bin/sway
  logout
fi
```
When I log in on tty6 I will automatically be dropped into my sway session.

## java issues

I couldn't get Intellij to show itself. By adding this in my startup line I get
the window to show:
```_JAVA_AWT_WM_NONREPARENTING=1```

I still have issues though, the shift-shift navigation window disappears
immediatly after appearing.

## archlinux install / deps

I decided to go with git versions for most of the sway parts. That's where the
pretty well functioning 1.0 beta versions are.

### arch packages
* rofi
* kitty
* python-pywal
* otf-fira-code
* otf-font-awesome

### installed from AUR
* wlroots-git
* sway-git
* waybar-git
* swaylock-blur-git
* swayidle-git
* mako-git

## scripts

I copied some scripts from <https://github.com/ammgws/dotfiles> to ~/.scripts

These scripts are also in this repo under </tag-linux/scripts>
