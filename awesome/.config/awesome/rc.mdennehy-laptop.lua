-- Local configuration for main laptop workstation
--

-- This is used later as the default terminal and editor to run.
-- terminal = "x-terminal-emulator"
terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint DarkGreen -tn rxvt  -fn 'xft:DejaVu Sans Mono:size=12'"
ssh_terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint SlateGray -tn rxvt  -fn 'xft:DejaVu Sans Mono:size=12' -e ssh -X " 
ssh_terminal_opts_aix = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 100x24 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint SlateGray -tn xterm  -fn 'xft:DejaVu Sans Mono:size=12'  -e ssh -X " 
wide_terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 132x52 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint DarkGreen -tn rxvt -fn 'xft:DejaVu Sans Mono:size=12' "
-- mutt_terminal_opts = " -bg black -fg WhiteSmoke -cr yellow -bd gray -geometry 132x52 -vb -sl 10000 +sb -st -tr -sh 90 -fade 30 -tint DarkGreen -tn rxvt -fn 'xft:Inconsolata:size=14' -e mutt -y" 
