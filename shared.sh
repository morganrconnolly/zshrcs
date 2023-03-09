config_files=(
    git_functions.sh
    uber_variables.sh
    uber_functions.sh
)
for f in $config_files; do
    source ${personal_configs}/$f
done
