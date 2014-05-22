# startup commands to be run on every new shell or reload
if [ `which keychain` ];then
    eval `keychain --eval >> /tmp/null 2&> /tmp/null`
fi
