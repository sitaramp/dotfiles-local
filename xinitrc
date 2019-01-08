# 
# text console --> startx --> xinit -->  xinitrc
#  setup key binding xmodmap, xkbcomp, xrdc 
#
#called from /etc/X11/Xsession 
#startxfce4
#xfce4-session
#
# Use existing session
#env -u SESSION_MANAGER -u DBUS_SESSION_BUS_ADDRESS xfce4-session

xfce4-session
