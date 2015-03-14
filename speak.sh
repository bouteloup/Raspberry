#!/bin/sh

#Annoncer l'heure toute les heures

while [ 1 ]
do
	MINUTE=$(date +'%M')
	SECOND=$(date +'%S')
	HEURE=$(date +'%k')

	while [ $HEURE -ge 15 -a $HEURE -le 23 ]
	do
		MINUTE=$(date +'%M')
        	SECOND=$(date +'%S')
		HEURE=$(date +'%k')

	        while [ $SECOND != 00 ]
        	do
                	sleep 1s
	                SECOND=$(date +'%S')
        	done

		echo "Calibrage -- OK"

		while [ $MINUTE != 00 ]
		do
			sleep 1m
			MINUTE=$(date +'%M')
				while [ $MINUTE -eq 59 ]
				do
					MINUTE=$(date +'%M')
					sleep 1s
				done
			sleep 1s
		done

		HEURE=$(date +'%k')
		if [ $HEURE == 23 ]
		then
			sleep 18h
		fi
	done
		sleep 1h

HEURE=$(date +'%k')
MINUTE=$(date +'%M')
NOMJOUR=$(date +'%A')
NUMJOUR=$(date +'%d')
NOMMOIS=$(date +'%B')
ANNEE=$(date +'%Y')
SECOND=$(date +'%S')
MESSAGE="Salut Mr Bouteloup. Nous sommes le "$NOMJOUR" "$NUMJOUR" "$NOMMOIS" "$ANNEE", et il est "$HEURE" heures "$MINUTE
mplayer "http://translate.google.com/translate_tts?tl=fr&q=$MESSAGE"

done
