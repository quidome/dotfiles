# shellcheck shell=bash disable=SC2039
# always use tmux in terminals

# some exceptions, don't tmux for these
if [ -n "$TMUX" ] ||
       [[ "$GIO_LAUNCHED_DESKTOP_FILE" == *"guake.desktop"* ]] ||
       [[ "$(tty)" =~ /dev/tty[0-9] ]] ||
       [[ "$TERM" == screen* ]] ||
       [ "$TERM_PROGRAM" = "vscode" ] ||
       [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ] ||
       [ "$NO_TMUX" = "1" ] ||
       [ "$INSIDE_EMACS" = 'vterm' ]
then
    return 1
fi

animals=(🐈 🦄 🐮 🐖 🐽 🐗 🐪 🦙 🦘 🦒 🦏 🦛 🐹 🦔 🦇 🐨 🦃 🐦 🦆 🦉 🐸 🦜 🦚 🦩 🐙 🐛 🐝 🦠 🐝 🐡 🦖 🐊)

if tmux list-sessions |grep -e '.'; then
  # There is at least one tmux session running. We'll take the oldest, and
  # create a new session in the same group (so all windows are available from
  # all clients)
  current_session_id=$(tmux list-sessions |tail -n 1 |awk -F: '{print $1}')
  new_session_id=${animals[RANDOM % $#animals + 1]}
  tmux new-session -d -t $current_session_id -s $new_session_id
  tmux select-window -t "$( tmux new-window -P -F '#{window_index}' )"
  tmux attach-session -t $new_session_id \; set-option destroy-unattached
else
  tmux new-session -s ${animals[RANDOM % $#animals + 1]}
fi
