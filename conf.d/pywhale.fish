status is-interactive
or exit

if not test -f /tmp/pywhale-is-setup
    pywhale update >/dev/null
    touch /tmp/pywhale-is-setup
end

set -q XDG_CACHE_HOME
or set -gx XDG_CACHE_HOME $XDG_CACHE_HOME

if test "+$TERM_PROGRAM" != "+vscode"
    cat $XDG_CACHE_HOME/wal/sequences

    if test -e $XDG_CACHE_HOME/wal/colors-tty.sh
        chmod +x $XDG_CACHE_HOME/wal/colors-tty.sh
        $XDG_CACHE_HOME/wal/colors-tty.sh
    end
end
