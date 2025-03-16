function pywhale_update
    set -l t (math (date +%H) x 100 + (date +%M))

    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywhale_update\e'[m': Dark theme

    wal -i $pywhale_image $pywhale_options
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal\e'[m': Updated.

    pywalfox update
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywalfox\e'[m': Updated.

    if test -z "$pywhale_force"
        and test "$t" -ge 530 -a "$t" -le 1730
        or test "+$pywhale_force" = +light

        pywalfox light
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywalfox\e'[m': Set to light theme.

        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywhale_update\e'[m': Light theme

        wal -i $pywhale_image $pywhale_options -l
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal\e'[m': Updated.

        set -eg BAT_THEME
        set -Ux BAT_THEME 'Monokai Extended Light'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'bat\e'[m': Updated.

        dconf write /org/gnome/gedit/preferences/editor/scheme '"solarized-light"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gedit\e'[m': Updated.

        set -U PTPYTHON_OPTIONS --light-bg
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'ptpython\e'[m': Set to light theme.

        crudini --set $XDG_CONFIG_HOME/MuseScore/MuseScore4.ini ui 'application\currentThemeCode' light
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'musescore\e'[m': Set to light theme.
    else
        pywalfox dark
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywalfox\e'[m': Set to dark theme.

        set -eg BAT_THEME
        set -Ux BAT_THEME 'Monokai Extended'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'bat\e'[m': Updated.

        dconf write /org/gnome/gedit/preferences/editor/scheme '"solarized-dark"'
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gedit\e'[m': Updated.

        set -U PTPYTHON_OPTIONS --dark-bg
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'ptpython\e'[m': Set to dark theme.

        crudini --set $XDG_CONFIG_HOME/MuseScore/MuseScore4.ini ui 'application\currentThemeCode' dark
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'musescore\e'[m': Set to dark theme.
    end

    pywal-discord
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal-discord\e'[m': Updated.

    dconf write /org/gnome/shell/extensions/dash-to-dock/background-color (head -n +1 $XDG_CACHE_HOME/wal/colors | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'dash-to-dock\e'[m': Updated.

    set catppuccin (wal2catppuccin) || return

    dconf write /org/gnome/desktop/interface/gtk-theme (echo $catppuccin | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gtk\e'[m': Set to $catppuccin.

    dconf write /org/gnome/shell/extensions/user-theme/name (echo $catppuccin | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'gnome-shell\e'[m': Set to $catppuccin.
end
