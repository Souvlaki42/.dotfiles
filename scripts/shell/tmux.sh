#!/usr/bin/zsh

if [ -x "$(command -v tmux)" ] && \
   [ -n "${DISPLAY}" ] && \
   [ -z "${TMUX}" ]; then # && \
   # [ "${TERM_PROGRAM}" != "vscode" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
        case $(tmux showenv TERM 2>/dev/null) in
                *256color) ;&
                TERM=fbterm)
                        TERM=screen-256color ;;
                *)
                        TERM=screen
        esac
fi
