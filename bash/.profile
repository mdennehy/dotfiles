export PATH="$HOME/bin:$PATH" # Add ssh-tools to PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#export PATH="$PATH:"/Applications/microchip/xc8/v1.42/bin""

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

function scylla () {
declare -A servers
servers[ore]=aws.ore.bastion1
servers[mtl]=aws.mtl.bastion1
servers[pp1]=aws.preprod1.bastion1
servers[col]=aws.col.bastion1
ssh ${servers[$1]} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
}
