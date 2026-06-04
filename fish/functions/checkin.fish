function checkin --wraps='task completed end=today | tail -n+4| head -n-2| wl-copy' --wraps='task completed end=yesterday | tail -n+4| head -n-2| wl-copy' --description 'alias checkin task completed end=yesterday | tail -n+4| head -n-2| wl-copy'
    task completed end=yesterday | tail -n+4| head -n-2| wl-copy $argv
end
