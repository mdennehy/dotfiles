-- Local configuration for Bob, the netbook
--

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint DarkGreen -tn rxvt  -fn 'xft:Droid Sans Mono:pixelsize=16'" 
ssh_terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint SlateGray -tn rxvt  -fn 'xft:Droid Sans Mono:pixelsize=16' -e ssh -X " 
ssh_terminal_opts_aix = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint SlateGray -tn xterm  -fn 'xft:Droid Sans Mono:pixelsize=16' -e ssh -X " 
