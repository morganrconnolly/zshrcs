
dssh() {
    set -x
    devpod wait $1 && ssh -A connolly-$1.devpod-us-or
    unset -x
}

fireup () {
    devpod create $1 || devpod start $1 && dssh $1
}
