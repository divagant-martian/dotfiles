function taskc --wraps=task
    set modifiers 'mod' 'modify' 'del' 'delete' 'done' 'start' 'stop' 'annotate' 'append' 'denotate' 'duplicate' 'edit'
    set others 'add' 'undo'
    if contains $argv[1] $others; or contains $argv[2] $modifiers;
        task $argv rc._forcecolor=on 2>&1 | tee /tmp/taskcout
        clear; task; cat /tmp/taskcout | grep -v forcecolor
    else
        clear; task $argv
    end
end
