# shellcheck disable=SC2317 # don't warn about unreachable code

list="$(sed '1,/^### DATA ###$/d' "$0")"
dmenu="fuzzel --dmenu -w 70"

# WIP: once fuzzel fixes "nth-delimiter" debug output bug, change DMENU and switch to:
# symbol="$(printf "$list" | $dmenu)"
echo -e "$list" | $dmenu | cut -d ' ' -f 1 | tr -d '\n' | wl-copy

exit

### DATA ###
😀 grinning face [happy, smile, joy, cheer, delight]
😃 grinning face with big eyes [excited, happy, smile, delighted]
😄 grinning face with smiling eyes [laugh, happy, joy, funny]
😁 beaming face with smiling eyes [grin, cheese, happy, radiant]
😆 grinning squinting face [laugh, excited, lol, happy]
