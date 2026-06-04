function clean_task_report --wraps='sed -E \'s/^([[:space:]]+)(.+)$/- \\2/;t;s/^([^[:space:]]+)[[:space:]]+(.+)$/- (\\1): \\2/\'' --description 'alias clean_task_report sed -E \'s/^([[:space:]]+)(.+)$/- \\2/;t;s/^([^[:space:]]+)[[:space:]]+(.+)$/- (\\1): \\2/\''
    sed -E 's/^([[:space:]]+)(.+)$/- \2/;t;s/^([^[:space:]]+)[[:space:]]+(.+)$/- (\1): \2/' $argv
end
