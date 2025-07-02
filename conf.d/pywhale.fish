status is-interactive
or exit

if not test -f /tmp/pywhale-is-setup
    pywhale update >/dev/null
    touch /tmp/pywhale-is-setup
end

set -q XDG_CACHE_HOME
or set -gx XDG_CACHE_HOME $XDG_CACHE_HOME

if test "+$TERM_PROGRAM" != "+vscode"
    if test -f $XDG_CACHE_HOME/wal/sequences
        cat $XDG_CACHE_HOME/wal/sequences
    end

    if test -f $XDG_CACHE_HOME/wal/colors-tty.sh
        chmod +x $XDG_CACHE_HOME/wal/colors-tty.sh
        $XDG_CACHE_HOME/wal/colors-tty.sh
    end

    if test -f $XDG_CACHE_HOME/wal/colors.fish
        source $XDG_CACHE_HOME/wal/colors.fish
    end

    set -eg BAT_THEME
    set -eg PTPYTHON_OPTIONS
else
    set -gx BAT_THEME
    set -gx PTPYTHON_OPTIONS
end
