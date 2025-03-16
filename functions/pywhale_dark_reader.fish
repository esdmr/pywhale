function pywhale_dark_reader
    wal -i $pywhale_image $pywhale_options
    set dark_background (head -n 1 ~/.cache/wal/colors)
    set dark_foreground (tail -n 1 ~/.cache/wal/colors)

    wal -i $pywhale_image $pywhale_options -l
    set light_background (head -n 1 ~/.cache/wal/colors)
    set light_foreground (tail -n 1 ~/.cache/wal/colors)

    pywhale update

    echo '
		chrome.runtime.sendMessage({
			type: \'ui-bg-set-theme\',
			data: {
				darkSchemeBackgroundColor: "'$dark_background'",
				darkSchemeTextColor: "'$dark_foreground'",
				lightSchemeBackgroundColor: "'$light_background'",
				lightSchemeTextColor: "'$light_foreground'",
			},
		});
	' | fish_clipboard_copy

    firefox moz-extension://dfb20859-8b4a-4e95-adf2-59bc75a1cd84/ui/popup/index.html
end
