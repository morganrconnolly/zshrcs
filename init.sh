#deprecated due to not working on devpod for great mystery
define_shortcut() {
    declare "$1"="$2"
    alias $1="cd $2"
}
#use this
create_shortcut() {
  echo "$1"="$2" >> uber_functions.sh
  echo alias $1="cd $2" >> uber_functions.sh
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
