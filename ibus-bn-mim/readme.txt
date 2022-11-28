Using IBus m17n
If on your own system, first install IBus and the m17n module (see below—not needed on lab machines):
Enable IBus as your default input method:
im-config -n ibus
Restart X11 (log out and log back in, or potentially just xfwm4 --replace && xfce4-panel -r &), and you should have a hard-to-see language switcher icon somewhere near the time on your panel.
If you don't seen the icon, try adding the notification area to your panel. Right click on the edge of the panel, click "Add new items", and find "notification area".
If that doesn't work, open a terminal, and run ibus-daemon &.
Right click on that icon and click preferences. Go to the "Input Method" tab and you can add various keyboard layouts. Note that you have to press the "..." button at the bottom to see all the categories supported, and that there are a lot of layouts hidden under the various categories.
You'll have to configure a "next layout" key combination that makes sense for you. Sometimes the key combination isn't completely obvious to set.
NOTE:

If you want to be able to use an  key, then you'll need to go into your session manager preferences (in XFCE, Menu → Settings → Keyboard) and add a layout with AltGr enabled (Layout tab, Add, "English (international, with AltGr deadkeys)"). In Cinnamon and maybe Gnome (e.g., on your own computer—but not on XFCE on the lab computers), you may be able to simply set which key is  (usually right alt) in keyboard settings.
If you need to install IBus on your own system, try this (Debian-derivatives only, like Ubuntu):
sudo apt-get install ibus-m17n
Developing a keyboard layout for IBus m17n
You should be able to copy a file in /usr/share/m17n/ to a different name and modify it to your liking. The layout files have the extension .mim
Put your new .mim file in ~/.m17n.d/
You'll probably need to restart IBus for the new file to become available or for any further modifications to it take effect: right click on the hard-to-see IBus icon and click "restart".
Some tricks
G stands for . See how pa-jhelum layout uses it.
You can store a list of keys typed in a variable and do fancy things with it. See how zh and ko layouts do it.
If you really want compose key, you may need to fiddle some. I have some ideas, so talk to me if this is something you want to pursue.
To set your default keyboard back to the regular input method, you can do the following:
im-config -n xim


https://wikis.swarthmore.edu/ling073/Making_a_keyboard_layout_using_IBus
