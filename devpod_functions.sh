#!/bin/bash

hoover_keytab () {
    usecretv2-cli --namespace keytab read DATASRE.PROD.UBER.INTERNAL/services/hoover.keytab > $HOME/hoover.keytab
}

kinit_hoover () {
    kinit -kt $HOME/hoover.keytab hoover@DATASRE.PROD.UBER.INTERNAL
}

gcp_hadoop_session_setup () {
	export HADOOP_CONF_DIR=/home/user/cfs/conf && source /home/user/cfs/conf/hadoop-env.sh
}

gcp_hadoop_setup () {
	if [ -f /home/user/cfs/binary/ ]; then
		#following https://docs.google.com/document/d/1ZG59HclmIHRDVYx3-FngFxS26xbA86lsksWOV5t4Nks/edit#heading=h.iw2dysc3a4jw
		sudo apt update && sudo apt-get install hadoop-2.8.2-1310959
		sudo ln -s /opt/hadoop/hadoop-2.8.2-1310959 /home/user/cfs/binary 
		mkdir -p /home/user/cfs/conf
		git clone gitolite@code.uber.internal:data/dsc-builder
		cat "export HADOOP_HOME='/home/user/cfs/binary'" >> /home/user/cfs/conf/hadoop-env.sh
	fi
	IP=`uns uns://dca8/dca8-prod06/us1/storage-access-service/prod-cloudlake/compute-0 | head -1 | awk '{ print $2 }'`
	PORT=`uns uns://dca8/dca8-prod06/us1/storage-access-service/prod-cloudlake/compute-0 | head -1 | awk ' { print $3 } ' | sed 's/^grpc://'`
	ssh -4 -fMNL 5435:$IP:$PORT bastion.uber.com
	gcp_hadoop_session_setup
			
}
