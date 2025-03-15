status is-interactive
or exit

if set -n | string match -eq VSCODE_GIT_
    or test "+$EDITOR" = '+code -rw'
else
    cat ~/.cache/wal/sequences

    if test -e ~/.cache/wal/colors-tty.sh
        chmod +x ~/.cache/wal/colors-tty.sh
        ~/.cache/wal/colors-tty.sh
    end

    source (status dirname)/../functions/pywhale_update.fish
    source (status dirname)/../functions/pywhale_dark_reader.fish

    if not test -f /tmp/pywhale-is-setup
        pywhale_update >/dev/null
        touch /tmp/pywhale-is-setup
    end
end
