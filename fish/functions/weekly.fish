function weekly --description 'alias weekly task weekly rc.defaultwidth=0 | clean_task_report | xclip -selection clipboard && task weekly'
    task weekly rc.defaultwidth=0 | clean_task_report | xclip -selection clipboard && task weekly $argv
end
