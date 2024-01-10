
dssh() {
    ssh-add $HOME/.ssh/id_ecdsa
    set -x
    devpod wait $1 && ssh -A connolly-$1.devpod-us-or "${@:2}"
    unset -x
}

fireup () {
    devpod create $1 || devpod start $1 && dssh $1
}


