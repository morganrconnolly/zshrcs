
define_shortcut() {
    declare "$1"="$2"
    alias $1="cd $2"
}

zshrcs=${HOME}/zshrcs/

config_files=(
    git_functions.sh
    uber_variables.sh
    uber_functions.sh
    life_variables.sh
    functions.sh
)
for f in $config_files; do
    source ${zshrcs}/$f
done

source_zshrc () {
    source ~/.zshrc
}
