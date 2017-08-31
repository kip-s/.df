#/bin/sh

set -u
trap exit ERR

CDIR=$(dirname $(readlink -f $0))
RED=31

INITSH="start.sh"

msg() {
    printf "\033[$1m${@:2}\033[00m\n"
}

if [ -e $CDIR/sh/$INITSH ]; then
    bash $CDIR/sh/$INITSH
else
    msg $RED "[error] '${INITSH}' doesn't exist."
    return 2>&- || exit
fi
