# Vagrant aliases
alias va=vagrant
alias vacd='cd $HOME/development/bol.com/puppet_vagrant'
alias vad='/usr/bin/vagrant destroy'
alias vah='/usr/bin/vagrant halt'
alias vap='/usr/bin/vagrant provision'
alias vas='/usr/bin/vagrant status'
alias vassh='/usr/bin/vagrant ssh'
alias vau='/usr/bin/vagrant up'

vahall () {
	for vm in `vas | awk '/running/ {print \$1}'`
	do
		vah $vm
	done
}
