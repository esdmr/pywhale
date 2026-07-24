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

        set IS_LIGHT 1
        set IS_DARK 0
        set THEME light

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
        set IS_LIGHT 0
        set IS_DARK 1
        set THEME dark
    
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

    if set -q PYWHALE_CATPW_HOME
        set start (date +%s.%N)
        set accent (CATPW_GTK=1 wal2catppuccin)
        CATPW_DARK=$IS_DARK $PYWHALE_CATPW_HOME/themes/install.sh -d $XDG_DATA_HOME/themes -a $accent -m $theme -l -s compact --shell opacity 1 radius 12
        echo [\e'[1;32m'I\e'[m'] \e'[1;31m'shell\e'[m': Updated. (math (date +%s.%N) - $start)s
    end

    set start (date +%s.%N)
    dconf write /org/gnome/shell/extensions/dash-to-dock/background-color (head -n +1 $XDG_CACHE_HOME/wal/colors | jq -R .)
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'dash-to-dock\e'[m': Updated. (math (date +%s.%N) - $start)s

    set start (date +%s.%N)
    rm -r $pywalpath[1]
    echo [\e'[1;32m'I\e'[m'] \e'[1;31m'pywal_update\e'[m': Cleaned up pywalfox stub. (math (date +%s.%N) - $start)s
end
