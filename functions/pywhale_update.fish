function pywhale_update
    set start (date +%s.%N)
    set -l --path pywalpath (mktemp -d) $PATH
    echo "#!$(which true)" >"$pywalpath[1]/pywalfox"
    chmod +x "$pywalpath[1]/pywalfox"
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal_update\e'[m': Stubbed pywalfox for pywal16. (math (date +%s.%N) - $start)s

    set -l t (math (date +%H) x 100 + (date +%M))

    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywhale_update\e'[m': Dark theme

    set start (date +%s.%N)
    PATH=$pywalpath wal -i $pywhale_image $pywhale_options
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal\e'[m': Updated. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    pywalfox update
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywalfox\e'[m': Updated. (math (date +%s.%N) - $start)s

    if test -z "$pywhale_force"
        and test "$t" -ge 530 -a "$t" -le 1730
        or test "+$pywhale_force" = +light

        set start (date +%s.%N)
        pywalfox light
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywalfox\e'[m': Set to light theme. (math (date +%s.%N) - $start)s

        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywhale_update\e'[m': Light theme

        set start (date +%s.%N)
        PATH=$pywalpath wal -i $pywhale_image $pywhale_options -l
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal\e'[m': Updated. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        set -eg BAT_THEME
        set -Ux BAT_THEME 'Monokai Extended Light'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'bat\e'[m': Updated. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/gnome/desktop/interface/color-scheme '"prefer-light"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gnome\e'[m': Set to light theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/cinnamon/desktop/interface/color-scheme '"prefer-light"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'cinnamon\e'[m': Set to light theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/x/apps/portal/color-scheme '"prefer-light"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'x portal\e'[m': Set to light theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/gnome/gedit/preferences/editor/scheme '"solarized-light"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gedit\e'[m': Updated. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        set -eg PTPYTHON_OPTIONS
        set -Ux PTPYTHON_OPTIONS --light-bg
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'ptpython\e'[m': Set to light theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        crudini --set $XDG_CONFIG_HOME/MuseScore/MuseScore4.ini ui 'application\currentThemeCode' light
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'musescore\e'[m': Set to light theme. (math (date +%s.%N) - $start)s
    else
        set start (date +%s.%N)
        pywalfox dark
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywalfox\e'[m': Set to dark theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        set -eg BAT_THEME
        set -Ux BAT_THEME 'Monokai Extended'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'bat\e'[m': Updated. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gnome\e'[m': Set to dark theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/cinnamon/desktop/interface/color-scheme '"prefer-dark"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'cinnamon\e'[m': Set to dark theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/x/apps/portal/color-scheme '"prefer-dark"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'x portal\e'[m': Set to dark theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        dconf write /org/gnome/gedit/preferences/editor/scheme '"solarized-dark"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gedit\e'[m': Updated. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        set -eg PTPYTHON_OPTIONS
        set -Ux PTPYTHON_OPTIONS --dark-bg
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'ptpython\e'[m': Set to dark theme. (math (date +%s.%N) - $start)s

        set start (date +%s.%N)
        crudini --set $XDG_CONFIG_HOME/MuseScore/MuseScore4.ini ui 'application\currentThemeCode' dark
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'musescore\e'[m': Set to dark theme. (math (date +%s.%N) - $start)s
    end

    set start (date +%s.%N)
    pywal-discord
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal-discord\e'[m': Updated. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    dconf write /org/gnome/shell/extensions/dash-to-dock/background-color (head -n +1 $XDG_CACHE_HOME/wal/colors | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'dash-to-dock\e'[m': Updated. (math (date +%s.%N) - $start)s

    set catppuccin (wal2catppuccin) || return

    set start (date +%s.%N)
    dconf write /org/gnome/desktop/interface/gtk-theme (echo $catppuccin | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gnome gtk\e'[m': Set to $catppuccin. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    dconf write /org/cinnamon/desktop/interface/gtk-theme (echo $catppuccin | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'cinnamon gtk\e'[m': Set to $catppuccin. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    dconf write /org/gnome/shell/extensions/user-theme/name (echo $catppuccin | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gnome-shell\e'[m': Set to $catppuccin. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    dconf write /org/cinnamon/theme/name (echo $catppuccin | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'cinnamon-shell\e'[m': Set to $catppuccin. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    set gtk (wal2gtk4) || return
    touch $XDG_CONFIG_HOME/gtk-4.0/gtk.css

    if grep -qE '@define-color accent_color [^;]*;' $XDG_CONFIG_HOME/gtk-4.0/gtk.css
        sed -i "s/@define-color accent_color [^;]*;/@define-color accent_color $gtk;/g" $XDG_CONFIG_HOME/gtk-4.0/gtk.css
    else
        echo "@define-color accent_color $gtk;" >>$XDG_CONFIG_HOME/gtk-4.0/gtk.css
    end

    if grep -qE '@define-color accent_bg_color [^;]*;' $XDG_CONFIG_HOME/gtk-4.0/gtk.css
        sed -i "s/@define-color accent_bg_color [^;]*;/@define-color accent_bg_color $gtk;/g" $XDG_CONFIG_HOME/gtk-4.0/gtk.css
    else
        echo "@define-color accent_bg_color $gtk;" >>$XDG_CONFIG_HOME/gtk-4.0/gtk.css
    end

    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gtk4\e'[m': Set to $gtk. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    rm -r $pywalpath[1]
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal_update\e'[m': Cleaned up pywalfox stub. (math (date +%s.%N) - $start)s
end
