
define_shortcut() {
    typeset -g $1=$2
    alias $1="cd $2"
}

define_shortcut cli ${HOME}/marmaray/marmaray-uber-tools/src/main/cli
define_shortcut fievel ${HOME}/fievel
define_shortcut watchtower ${fievel}/data/data-ingestion/watchtower-service
watchtower=${fievel}/data/data-ingestion/watchtower-service

define_shortcut pcp ${HOME}/uber-one/piper-core-pipelines
define_shortcut piper_tools ${pcp}/piper_tools
define_shortcut marmaray ${HOME}/marmaray
define_shortcut cloudlake_tools ${cli}/cloudlake_tools
cloudlake_tools=${cli}/cloudlake_tools


cli=${HOME}/marmaray/marmaray-uber-tools/src/main/cli
fievel=${HOME}/fievel

marmaray=${HOME}/marmaray




define_shortcut hdrone ${HOME}/hdrone-new
define_shortcut resources ${hdrone}/hdrone-api/src/main/resources
define_shortcut mjm ${HOME}/mjm
