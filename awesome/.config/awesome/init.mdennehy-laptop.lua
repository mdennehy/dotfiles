-- Iniitial apps to launch for mdennehy-laptop, my IBM work laptop
--

run_once("/usr/lib/rtkit/rtkit-daemon")
run_once("pulseaudio","--start")
run_once("dbus-launch","--exit-with-session awesome")
run_once("gnome-keyring-daemon","--start --components=pkcs11,gpg,secrets,ssh")
run_once("goa-daemon")
run_once("xfce4-power-manager")
run_once("volumeicon",nil,"volumeicon")
run_once("xscreensaver","-no-splash")
run_once("sametime-connect")
run_once("firefox",nil,nil,screen.count())
run_once("/opt/ibm/notes/notes",nil,"notes",1)
run_once("/usr/bin/python /home/mdennehy/bin/deblfer.py")
run_once("/opt/ibm/ibmsam/bin/ibmsaml")
