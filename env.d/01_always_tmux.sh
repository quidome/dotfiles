# always use tmux in terminals

# some exceptions, don't tmux for these
if [[
       -n "$TMUX" ||
       "$TERM" == screen-256color ||
       "${KDE_FULL_SESSION}" == "true" ||
       "${TERM_PROGRAM}" == "vscode" ||
       "${TERMINAL_EMULATOR}" == "JetBrains-JediTerm"
   ]]
then
    return 1
fi

if tmux list-sessions && (tmux list-sessions | test -n "$0"); then
    session_id=$(date +%Y%m%d%H%M%S)
    tmux new-session -d -t base -s "$session_id"
    tmux select-window -t "$( tmux new-window -P -F \#{window_index} )"
    tmux attach-session -t "$session_id" \; set-option destroy-unattached
else
    tmux new-session -s base
fi
