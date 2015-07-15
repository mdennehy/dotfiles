-- Iniitial apps to launch for Bob, the netbook
--

run_once("gnome-keyring-daemon","--start --components=pkcs11,gpg,secrets,ssh")
run_once("xfce4-power-manager")
run_once("wicd-gtk")
run_once("dropbox","start")
-- run_once("pidgin",nil,"pidgin")
run_once("google-chrome",nil,nil,screen.count())
run_once("/usr/bin/padevchooser")
run_once("/usr/bin/gtk-redshift")
