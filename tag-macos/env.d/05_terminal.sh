# shellcheck shell=bash disable=SC2039
# always use tmux in terminals

# some exceptions, don't use zellij for these
if [ -n "$ZELLIJ" ] ||
    [[ "$GIO_LAUNCHED_DESKTOP_FILE" == *"guake.desktop"* ]] ||
    [[ "$TERM" == screen* ]] ||
    [[ "$TERM" == "" ]] ||
    [ "$TERM_PROGRAM" = "vscode" ] ||
    [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ] ||
    [ "$NO_TMUX" = "1" ] ||
    [ "$INSIDE_EMACS" = 'vterm' ]
then
    return 1
fi


if [[ $(zellij ls 2>/dev/null |grep ^work$) = "work" ]]; then
    zellij attach 'work'
else
    zellij attach -c 'work'
fi
