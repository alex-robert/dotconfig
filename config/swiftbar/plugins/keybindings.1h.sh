#!/bin/zsh

echo "|sfimage=arrowkeys"
echo "---"
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

CHEAT_LIST=$(cheat -l | tail -n +2)

PERSONAL_SHEETS=()
COMMUNITY_SHEETS=()

for line in ${(f)CHEAT_LIST}; do
    sheet_name=$(echo "$line" | awk '{print $1}')
    sheet_path=$(echo "$line" | awk '{print $2}')

    if [[ "$sheet_path" == *"/personal/"* ]]; then
        PERSONAL_SHEETS+=("$sheet_name")
    else
        COMMUNITY_SHEETS+=("$sheet_name")
    fi
done

for sheet in ${PERSONAL_SHEETS[@]}; do
    echo "$sheet | bash='$HOME/.config/swiftbar/scripts/show-cheat-html.sh' param1=$sheet terminal=false"
done

echo "---"
echo "Community Cheatsheets"

for sheet in ${COMMUNITY_SHEETS[@]}; do
    echo "--$sheet | bash='$HOME/.config/swiftbar/scripts/show-cheat-html.sh' param1=$sheet terminal=false"
done

echo "---"
echo "Refresh | refresh=true"
