if ! (( $+commands[curl] )); then
    echo "hitokoto plugin needs curl to work" >&2
    return
fi

if ! (( $+commands[jq] )); then
    echo "hitokoto plugin needs jq to work" >&2
    return
fi

FILE=$( curl -sL https://v1.hitokoto.cn/\?
    c\=c\&c\=f\&c\=g\&c\=d\&c\=e\&c\=h\&c=i\&encode\=json )
# The hitokoto main contant,
HITOKOTO=$( echo $FILE | jq '.hitokoto' )

# The auther of the contant.
AUTHER=$( echo $FILE | jq '.from_who' )

echo $HITOKOTO | lolcat -f
