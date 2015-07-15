-- Iniitial apps to launch for sparks, my home office thinkpad R61
--

run_once("gnome-keyring-daemon","--start --components=pkcs11,gpg,secrets,ssh")
run_once("xfce4-power-manager")
run_once("dropbox","start")
run_once("volumeicon",nil,"volumeicon")
--run_once("pidgin",nil,"pidgin")
run_once("google-chrome",nil,nil,screen.count())
