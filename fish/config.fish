if status is-interactive
    set -x EDITOR nvim

    set -x VISUAL nvim
    set -a PATH ./scripts
    set -a PATH ./bin

    alias ll="eza -lah --icons --group-directories-first"
    # alias vim="echo \"use nya, bakka ฅ(ΦωΦ)ฅ\""
    # alias vi="echo \"use nya, bakka ฅ(ΦωΦ)ฅ\""
    # alias v="echo \"use nya, bakka ฅ(ΦωΦ)ฅ\""
    alias vim="nvim"
    alias vi="nvim"
    alias v="nvim"
    alias nya="nvim"
    alias nyan="nvim"

    zoxide init fish | source

    alias cd="z"
    # rbenv init - fish | source
    starship init fish | source
end

function fish_greeting
end

set -l env_dir_path ~/.config/fish/env
for env_file in (ls $env_dir_path)
    source $env_dir_path/$env_file
end
