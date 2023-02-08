#!/bin/sh

echo \
	mstream \
	--port $PORT \
	--musicdir $MUSIC_DIR \
	${NO_UPLOAD:+'--noupload'} \
	${USER:+'--user' $USER} \
	${PASSWORD:+'--password' $PASSWORD}

./cli-boot-wrapper.js \
	--port $PORT \
	--musicdir $MUSIC_DIR \
	${NO_UPLOAD:+'--noupload'} \
	${USER:+'--user' $USER} \
	${PASSWORD:+'--password' $PASSWORD}
