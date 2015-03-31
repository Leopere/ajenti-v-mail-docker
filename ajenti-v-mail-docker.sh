#!/bin/bash
case $1 in
	start )
		;;
	stop )
		;;
	firstrun )
		docker run --name ajenti-v-mail -v ajenti-v-mail
		;;
	build )
		docker build -t ajenti-v-mail/latest .
		;;
	destroy )
		docker rm -f ajenti-v-mail
		;;
	* )
		echo "See https://github.com/chamunks/ajenti-v-mail-docker for help"
		;;
esac