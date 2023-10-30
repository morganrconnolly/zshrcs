define_shortcut() {
    declare "$1"="$2"
    alias $1="cd $2"
}

add_shortcut () {
    echo "define_shortcut $1 $2" >> $zshrcs/uber_functions.sh
}
