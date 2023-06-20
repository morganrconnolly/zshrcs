#!/bin/bash

hoover_keytab () {
    usecretv2-cli --namespace keytab read DATASRE.PROD.UBER.INTERNAL/services/hoover.keytab > $HOME/hoover.keytab
}

kinit_hoover () {
    kinit -kt $HOME/hoover.keytab hoover@DATASRE.PROD.UBER.INTERNAL
}

cerberuses () {
	cerberus -s marmaray-job-manager,nightswatch,watchtower-service,umonitor,piper-web,exeggutor -t umonitor --no-status-page
}
