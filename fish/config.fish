if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR "nvim"
fish_config theme choose "Rosé Pine Moon Auto"

if status is-interactive
    set -g fish_pager_color_background normal
    # set -g fish_pager_color_selected_background normal
end
