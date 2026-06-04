function weekly --description 'alias weekly task weekly rc.defaultwidth=0 | clean_task_report | wl-copy && task weekly'
    task weekly rc.defaultwidth=0 | clean_task_report | wl-copy && task weekly $argv
end
