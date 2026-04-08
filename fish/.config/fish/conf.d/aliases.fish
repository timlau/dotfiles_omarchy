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
