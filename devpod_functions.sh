#!/bin/bash

INSTANCE=uns://dca11/dca11-kubernetes-stateless01/us1/storage-access-service/prod-cloudlake/compute-0
hoover_keytab () {
    usecretv2-cli --namespace keytab read DATASRE.PROD.UBER.INTERNAL/services/hoover.keytab > $HOME/hoover.keytab
}

kinit_hoover () {
    kinit -kt $HOME/hoover.keytab hoover@DATASRE.PROD.UBER.INTERNAL
}

gcp_hadoop_session_setup () {
	kinit connolly
	export HADOOP_CONF_DIR=/home/user/cfs/conf && source /home/user/cfs/conf/hadoop-env.sh
	echo 'testing connection to gcp'
	echo 'hadoop fs -ls cfs://ns-cloudlake/'
	hadoop fs -ls cfs://ns-cloudlake/
}

gcp_hadoop_setup () {
	set -x
	if [ ! -f /home/user/cfs/binary/bin/hadoop ]; then
		echo 'hi'
		#following https://docs.google.com/document/d/1ZG59HclmIHRDVYx3-FngFxS26xbA86lsksWOV5t4Nks/edit#heading=h.iw2dysc3a4jw
		sudo apt update && sudo apt-get install hadoop-2.8.2-1310959
		sudo ln -s /opt/hadoop/hadoop-2.8.2-1310959 /home/user/cfs/binary 
		mkdir -p /home/user/cfs/conf
		git clone gitolite@code.uber.internal:data/dsc-builder
	fi
	cat "export HADOOP_HOME='/home/user/cfs/binary'" >> /home/user/cfs/conf/hadoop-env.sh
	IP=`uns ${INSTANCE} | head -1 | awk '{ print $2 }'`
	PORT=`uns  ${INSTANCE} | head -1 | awk ' { print $3 } ' | sed 's/^grpc://'`
	ssh -4 -fMNL 5435:$IP:$PORT bastion.uber.com
	gcp_hadoop_session_setup
	set +x
			
}
