#deprecated due to not working on devpod for great mystery

zshrcs=${HOME}/zshrcs/
#use this
create_shortcut() {
    set -x
  echo "$1"="$2" >> ${zshrcs}/uber_functions.sh
  echo alias $1=\"cd $2\" >> ${zshrcs}/uber_functions.sh
  source ${zshrcs}/uber_functions.sh
set +x
}


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

zource () {
    source ~/.zshrc
}
define_shortcut() {
    declare "$1"="$2"
    alias $1="cd $2"
}
