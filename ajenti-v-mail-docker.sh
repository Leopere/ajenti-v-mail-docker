#!/bin/bash
case $1 in
	start )
		docker run \
		-d --name ajenti-v-mail \
		-v $(pwd)/storage:/etc/ajenti \
		-p 80:80 -p 8000:8000 -p 443:443 -p 143:143 -p 993:993 -p 110:110 -p 995:995 -p 25:25 -p 465:465 \
			ajenti-v-mail 
		;;
	stop )
		docker stop ajenti-v-mail
		;;
	firstrun )
		docker run --name ajenti-v-mail -v $(pwd)/storage/:/root/ajenti/ ajenti-v-mail/latest cp /etc/ajenti/* /root/ajenti/
		;;
	build )
		docker build -t ajenti-v-mail/latest .
		;;
	destroy )
		docker rm -f ajenti-v-mail
		;;
	* )
		echo "Getting Started: build, firstrun, destroy, configure things, start"
		echo "See https://github.com/chamunks/ajenti-v-mail-docker for help"
		;;
esac