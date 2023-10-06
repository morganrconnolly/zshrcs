#branch service environment
deploy_branch () {
    set -e
    git push origin $1
    buildID=`ubuild build create -b $1 $2 -w | sed -n -e 's/Revision ID: //p'`
    up compute deploy -b $buildID -s $2 -e $3
    set +e
}

cerberuses () {
cerberus -s watchtower-service,data-failover-orchestrator,marmaray-job-manager,nightswatch,hive-sync-web,statsdex_query,queryrunner,querybuilder,wonkamaster,query-result,exeggutor,piper-web,cloudlake-migrator,cloudlake-mesh-production-us-east4 -t umonitor,queryrunner,query-result -r cloudlake-migrator,cloudlake-mesh-production-us-east4  --enable-container-access --container-access-port=2345  --no-status-page
}
#branch region pipeline_ids
piperdev_deploy () {
    #if $3 is the empty string, will still return true
    if [ -z ${3+x} ]; then
        echo piperdev deploy $1 pipelines/core/hadoop_platform $2
        piperdev deploy $1 pipelines/core/hadoop_platform $2
    else
        echo piperdev deploy $1 pipelines/core/hadoop_platform  --pipeline_ids $3 $2
        piperdev deploy $1 pipelines/core/hadoop_platform  --pipeline_ids $3 $2
    fi
}

#host, service
container_ssh () {
    compute-cli config set scope.host $1
    container_id=`compute-cli ps | grep $2 | grab 1 3`  
    echo $container_id
    compute-cli  exec $container_id 
}
define_shortcut darktower ${HOME}/darktower
