function prname --wraps='gh pr view --json number,title --jq "\\"#\\(.number) \\(.title)\\""' --description 'alias prname gh pr view --json number,title --jq "\\"#\\(.number) \\(.title)\\""'
    gh pr view --json number,title --jq "\"#\(.number) \(.title)\"" $argv
end
