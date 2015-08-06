
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# [[ -s "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"


##
# Your previous /Users/mark.dennehy/.bash_profile file was backed up as /Users/mark.dennehy/.bash_profile.macports-saved_2015-08-03_at_00:03:24
##

# MacPorts Installer addition on 2015-08-03_at_00:03:24: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

