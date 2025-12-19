if status is-interactive
    if type -q eza
        alias ls='eza --icons --group-directories-first'
        alias ll='eza -lah --icons --git'
        alias la='eza -a --icons'
        alias tree='eza --tree --icons'
    else
        alias ls='ls --color=auto --group-directories-first'
        alias ll='ls -lah'
    end
end

set -g fish_theme "Catppuccin Mocha"

alias conf='cd ~/.config'
alias proj='cd ~/project'
alias cls='clear'

alias tmux="tmux -u"
alias tmuxls="tmux list-sessions"
alias tmuxa="tmux attach || tmux new"
alias tmuxn="tmux new-session -A -s"
alias tmuxk="tmux kill-session -t"

alias ga='git add .'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit -am'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gs='git status -sb'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias glog='git log --graph --color=always --abbrev-commit \
--format=format:"%C(bold magenta)%h%Creset %C(bold red)%d%Creset%n\
    %C(bold cyan)%an%Creset <%ae>%Creset %C(bold blue)(%cr)%Creset%n\
    %C(white)%s%Creset%n" --all'

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
