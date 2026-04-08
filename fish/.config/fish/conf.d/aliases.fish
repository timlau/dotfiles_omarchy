# Define aliases (which are functions in fish)
function lg --wraps lazygit --description 'alias lg=lazygit'
    lazygit $argv
end
