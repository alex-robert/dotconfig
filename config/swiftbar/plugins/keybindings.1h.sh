#!/bin/zsh

echo "|sfimage=keyboard"
echo "---"
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

CHEAT_LIST=$(cheat -l | tail -n +2)

for line in ${(f)CHEAT_LIST}; do
    sheet_name=$(echo "$line" | awk '{print $1}')
        # echo "$sheet | href='file://$HTML_FILE' webview=true"
        # echo "$sheet | bash='qlmanage' param1='-p' param2='/tmp/cheat-$sheet.html' terminal=false"
    echo "$sheet_name | bash='$HOME/.config/swiftbar/scripts/show-cheat-wezterm.sh' param1=$sheet_name terminal=false"
done

echo "---"
echo "Refresh | refresh=true"


# href='swiftbar://refreshplugin?name=keybindings&webview=$HOME/.config/swiftbar/scripts/gen-cheat-html.sh?$sheet'"
