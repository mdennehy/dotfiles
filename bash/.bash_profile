[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# [[ -s "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

##
# Your previous /Users/mark.dennehy/.bash_profile file was backed up as /Users/mark.dennehy/.bash_profile.macports-saved_2015-08-03_at_00:03:24
##

# MacPorts Installer addition on 2015-08-03_at_00:03:24: adding an appropriate PATH variable for use with MacPorts.
export PATH="/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="$HOME/.exenv/bin:$PATH"

export PATH="/usr/local/opt/openssl/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

eval "$(exenv init -)"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

#export PATH="$PATH:/Applications/microchip/xc8/v1.42/bin"

export AWS_PROFILE=vdc-federation

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

rvm use ruby-2.7.3
rvm gemset use 273

eval "$(pyenv init -)"

pyenv activate wavefront

# MacPorts Installer addition on 2019-09-27_at_15:44:08: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

export BASH_SILENCE_DEPRECATION_WARNING=1
