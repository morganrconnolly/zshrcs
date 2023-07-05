deploy_branch () {
    set -e
    git push origin $1
    buildID=`ubuild build create -b $1 $2 -w | sed -n -e 's/Revision ID: //p'`
    up compute deploy -b $buildID -s $2 -e $3
    set +e
}

cerberuses () {
cerberus -s marmaray-job-manager,nightswatch,hive-sync-web,statsdex_query,queryrunner,querybuilder,wonkamaster,query-result,exeggutor,piper-web -t umonitor,queryrunner,query-result  --enable-container-access --container-access-port=2345  --no-status-page
}
