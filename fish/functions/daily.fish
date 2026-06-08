function daily --wraps='task yesterday rc.defaultwidth=0 | clean_task_report| tail -n+4| head -n-2| xclip -selection clipboard && task yesterday' --description 'alias daily task yesterday rc.defaultwidth=0 | clean_task_report| tail -n+4| head -n-2| xclip -selection clipboard && task yesterday'
    task yesterday rc.defaultwidth=0 | clean_task_report| tail -n+4| head -n-2| xclip -selection clipboard && task yesterday $argv
end
