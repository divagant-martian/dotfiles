function checkin --wraps='task completed end=today | tail -n+4| head -n-2| xclip -selection clipboard' --wraps='task completed end=yesterday | tail -n+4| head -n-2| xclip -selection clipboard' --description 'alias checkin task completed end=yesterday | tail -n+4| head -n-2| xclip -selection clipboard'
    task completed end=yesterday | tail -n+4| head -n-2| xclip -selection clipboard $argv
end
