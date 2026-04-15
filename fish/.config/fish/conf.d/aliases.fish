# Define aliases (which are functions in fish)
function lg --wraps lazygit --description 'alias lg=lazygit'
    lazygit $argv
end

function y --wraps yazi --description 'alias y=yazi'
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function zed --wraps zeditor --description 'alias zed=zeditor'
    zeditor $argv
end

function upd --description 'update dotfiles to/from github '
    set current_dir $(pwd)
    cd $HOME/dotfiles
    # check for optional commit message
    if test (count $argv) -eq 0
        make sync
    else
        COMMIT_MSG=$argv make sync
    end
    cd $current_dir
end

function setup --description 'run tla omarchy setup scripts '
    set current_dir $(pwd)
    cd $HOME/udv/github/omacrhy-setup
    git pull origin --quiet
    ./setup
    cd $current_dir
end
