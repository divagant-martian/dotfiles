function claude
    set gnome_scheme (gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)
    if string match -q '*dark*' $gnome_scheme
        set theme dark-daltonism
    else
        set theme light-daltonism
    end
    command claude --settings "{\"theme\": \"$theme\"}" $argv
end
