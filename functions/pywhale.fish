function pywhale
    argparse \
        (fish_opt -s i -l set-image --required-val) \
        (fish_opt -s f -l force --required-val) \
        (fish_opt -s h -l help) \
        -- $argv

    if test -n "$_flag_help"
        set -p argv help
    end

    switch "$argv[1]"
        case update
            set -U pywhale_force $_flag_force

            if set -q argv[2]
                set -U pywhale_options $argv[2..]
            end

            if test -n "$_flag_set_image"
                set -U pywhale_image $_flag_set_image
                pywhale_dark_reader
            else
                pywhale_update
            end

        case help ''
            echo 'usage: pywhale [-h | --help] [-i <path> | --set-image <path>]'
            echo '               [-f light | -f dark | --force light | --force dark]'
            echo '               <command> [<args>]'
            echo ''
            echo 'commands:'
            echo '   update [-- <options...>]'
            echo '   help'

            set -q argv[1]
    end
end
