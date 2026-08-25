function pywhale_pywalfox
    set set_light : '{"action": "theme:mode", "success": true, "data": "light"}'
    set set_dark 9 '{"action": "theme:mode", "success": true, "data": "dark"}'
    set is_dark '"+$(cat $XDG_CACHE_HOME/wal/IS_DARK)" = +1'

    set config ~/.mozilla/native-messaging-hosts/pywalfox.json
    set config_old ~/.mozilla/native-messaging-hosts/pywalfox.old.json
    set script $XDG_CACHE_HOME/wal/pywalfox.sh

    switch "$(cat $config)"
        case "*$script*"
            # Do nothing
        case "*"
            cp -f $config $config_old
    end

    set original (jq -r .path $config_old)
    jq '.path = $script' $config_old --arg script $script >$config

    echo "#!/bin/sh
export XDG_CACHE_HOME=$(string escape $XDG_CACHE_HOME)

cat \$XDG_CACHE_HOME/wal/pywalfox.bin

if [ $is_dark ]; then
    printf '%s\0\0\0%s' $(string escape $set_light | string join ' ')
    printf '%s\0\0\0%s' $(string escape $set_dark | string join ' ')
else
    printf '%s\0\0\0%s' $(string escape $set_dark | string join ' ')
    printf '%s\0\0\0%s' $(string escape $set_light | string join ' ')
fi

exec $(string escape $original) \$argv" >$script

    chmod +x $script
end
