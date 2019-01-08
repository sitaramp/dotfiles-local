# Process tree for root session
'''
root      1099  0.0  0.0 364256  6968 ?        SLsl 04:28   0:00 /usr/sbin/lightdm
root      1111  1.5  1.6 834392 137160 tty7    Ssl+ 04:28  13:39  \_ /usr/lib/xorg/Xorg -core :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten
root      1499  0.0  0.0 280112  8000 ?        Sl   04:28   0:00  \_ lightdm --session-child 12 19
spawar   16724  0.0  0.2 404128 22348 ?        Ssl  19:13   0:00      \_ mate-session
spawar   17163  0.0  0.4 1590752 35956 ?       Sl   19:13   0:00          \_ /usr/bin/mate-settings-daemon
spawar   17226  0.0  0.3 727656 29552 ?        Sl   19:13   0:00          \_ mate-panel
'''

Process tree for non-root session
'''
root      2277  0.0  0.0 103656  5204 ?        S    04:33   0:00 /usr/sbin/xrdp-sesman
root      6540  0.0  0.0 103524  3828 ?        S    10:30   0:00  \_ /usr/sbin/xrdp-sesman
spawar    6541  0.0  0.0  13016  3344 ?        S    10:30   0:00      \_ bash /etc/xrdp/startwm.sh
spawar    6577  0.0  0.2 336840 22644 ?        Sl   10:30   0:00      |   \_ xfce4-session
spawar    6596  0.0  0.4 412988 34312 ?        Sl   10:30   0:04      |       \_ xfce4-panel --display :10.0 --sm-client-id 270b298b0-70dc-4193-a414-c
spawar    6646  0.0  0.1 167264 14184 ?        S    10:30   0:00      |       |   \_ /usr/lib/x86_64-linux-gnu/xfce4/panel/wrapper-1.0 /usr/lib/x86_64
spawar    6667  0.0  0.2 177572 18128 ?        S    10:30   0:00      |       |   \_ /usr/lib/x86_64-linux-gnu/xfce4/panel/wrapper-1.0 /usr/lib/x86_64
spawar    7265  0.0  0.9 582944 75016 ?        Sl   10:34   0:03      |       |   \_ xfce4-appfinder --collapsed
spawar    6600  0.0  0.6 577332 52744 ?        Sl   10:30   0:03      |       \_ xfdesktop --display :10.0 --sm-client-id 2a931cd69-493e-4a22-b7d5-90f
spawar   17202  0.0  0.5 455760 46392 ?        Sl   19:13   0:00      |       \_ xfwm4 --display :10.0 --sm-client-id 23aad4e6f-318b-42f0-81bb-ae803fd
spawar    6542  0.5  1.5 531132 124084 ?       Sl   10:30   2:59      \_ /usr/lib/xorg/Xorg :10 -auth .Xauthority -config xrdp/xorg.conf -noreset -nol
spawar    6552  0.0  0.0 125588  3872 ?        Sl   10:30   0:00      \_ /usr/sbin/xrdp-chansrv
'''
