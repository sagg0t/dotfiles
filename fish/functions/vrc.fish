function vrc -d "vim (git status -s | awk '/^UU/{print \$2}')"
    vim (git status -s | awk '/^UU/{print $2}')
end
