# shellcheck shell=bash
# always use tmux in terminals

# some exceptions, don't tmux for these
if [ -n "$TMUX" ] ||
       [[ "$(tty)" =~ "/dev/tty[0-9]" ]] ||
       [ "$TERM" = screen-256color ] ||
       [ "$TERM_PROGRAM" = "vscode" ] ||
       [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ] ||
       [ "$NO_TMUX" = "1" ] ||
       [ "$INSIDE_EMACS" = 'vterm' ]
then
    return 1
fi

if tmux list-sessions && (tmux list-sessions | test -n "$0"); then
    session_id=$(date +%Y%m%d%H%M%S)
    tmux new-session -d -t base -s "$session_id"
    tmux select-window -t "$( tmux new-window -P -F '#{window_index}' )"
    tmux attach-session -t "$session_id" \; set-option destroy-unattached
else
    tmux new-session -s base
fi
