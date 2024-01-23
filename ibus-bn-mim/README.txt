

#For XKB keyboard layout adding

sudo gedit /usr/share/X11/xkb/rules/evdev.xml
[The Main name should be the xkb layout file name, the variant name should be the xkb_symbols variable name;]]

sudo dpkg-reconfigure xkb-data



