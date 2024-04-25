#branch service environment
deploy_branch () {
    git push origin $1
    buildID=`ubuild build create -b $1 $2 -w | sed -n -e 's/Revision ID: //p'`
    up compute deploy -b $buildID -s $2 -e $3
}

cerberuses () {
cerberus -s piper-phx2,schema-service,cloudlake-mesh,cloudlake-mesh-production-us-east4,watchtower-service,data-failover-orchestrator,marmaray-job-manager,nightswatch-production-cloudlake,nightswatch,hive-sync-web,statsdex_query,queryrunner,querybuilder,wonkamaster,query-result,exeggutor,piper-web -t moncon-meta,moncon-staging,moncon,umonitor,queryrunner,query-result -r cloudlake-migrator,cloudlake-mesh,cloudlake-mesh-production-us-east4  --enable-container-access --container-access-port=2345  --no-status-page
}

cloudlake-migration-cerberuses () {

cerberus -s watchtower-service,marmaray-job-manager,hive-sync-web  -r cloudlake-migrator,cloudlake-mesh-production-us-east4  --enable-container-access --container-access-port=2345  --no-status-page --containerized-gateway-uns uns://phx2/phx2-kubernetes-stateless01/us1/cerberus-gateway-container/production/compute-0
 
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
marmaray_build () {
    mvn package -DskipTests=true
}
define_shortcut darktower ${HOME}/darktower
define_shortcut obs_alerts /Users/connolly/config/observability/alerts/infra/portability/workspace/hoover
define_shortcut alerts /Users/connolly/config/observability/alerts/data/ingestion
