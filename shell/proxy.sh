#!/bin/bash
#set -x

function usage {

	echo "./proxy.sh [npm]"
}

OP="generic"
PROXY_TYPE="HTTP"
PROXY_VAR="http_proxy"
PROXY_VAL="http://cn-proxy.cn.oracle.com:80"

PROXY_SSL_VAR="https_proxy"
PROXY_SSL_VAL="http://cn-proxy.cn.oracle.com:80"

PROXY_LIST=("http_proxy" "https_proxy" "npm_config_proxy")

if [ $# == 1 ]; then OP=$1; fi

case $OP in
		generic|clean|bower)
				;;
		"npm")
				PROXY_VAR="npm_config_proxy"
				;;
		*)
				usage
				;;
esac

if [ $OP != clean ]; then
	export $PROXY_VAR=$PROXY_VAL
	export $PROXY_SSL_VAR=$PROXY_SSL_VAL
else
	for var in ${PROXY_LIST[@]}; do unset $var; done
fi


