if [[ $OSTYPE == darwin* ]]; then
  # Script for ensuring only one instance of gpg-agent is running
  # and if there is not one, start an instance of gpg-agent.
  if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
    GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info`
    # SSH_AUTH_SOCK=`cat $HOME/.ssh-auth-sock`
    # SSH_AGENT_PID=`cat $HOME/.ssh-agent-pid`
    # export GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID
    export GPG_AGENT_INFO
  else
    eval `gpg-agent --daemon`
    echo $GPG_AGENT_INFO >$HOME/.gpg-agent-info
    # echo $SSH_AUTH_SOCK > $HOME/.ssh-auth-sock
    # echo $SSH_AGENT_PID > $HOME/.ssh-agent-pid
  fi
  # Imperative that this environment variable always reflects the output
  # of the tty command.
  GPG_TTY=`tty`
  export GPG_TTY
elif [[ $OSTYPE == linux* ]]; then
  # Start the gpg-agent if not already running
  #if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  #  gpg-connect-agent /bye >/dev/null 2>&1
  #fi

  # Set SSH to use gpg-agent
  #unset SSH_AGENT_PID
  #if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  #  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  #fi

  # Set GPG TTY
  GPG_TTY=$(tty)
  export GPG_TTY

  # Refresh gpg-agent tty in case user switches into an X session
  gpg-connect-agent updatestartuptty /bye >/dev/null
fi
