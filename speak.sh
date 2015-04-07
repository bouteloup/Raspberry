#!/bin/bash

while [ 1 ]
do
	HEURE=$(date +'%k')
	##########################       DIFFUSE LE SLOGAN DE LA SNCF ET PRONONCE L'HEURE TOUTE LES HEURES             #################
	while [ $HEURE -ge 13 -a $HEURE -le 23 ]
	do
		HEURE=$(date +'%k')
		MINUTE=$(date +'%M')
        	SECOND=$(date +'%S')

	        while [ $SECOND != 00 ]
        	do
                	sleep 1s
	                SECOND=$(date +'%S')
        	done

		while [ $MINUTE != 00 ]
		do
			sleep 30s
			MINUTE=$(date +'%M')
				while [ $MINUTE == 59 ]
				do
					MINUTE=$(date +'%M')
					sleep 1s
				done
		done
		(($HEURE+1))

		MESSAGE="Il est actuellement "$HEURE" heure."
		mplayer /home/pi/sncf.mp3
		mplayer "http://translate.google.com/translate_tts?tl=fr&q=$MESSAGE"
		sleep 1m

		###############    REVEIL    #############
		HEURE=$(date +'%k')
        	NUMJOUR1=$(date | cut -c 1-5)
	        NUMJOUR2=$(date | cut -c 1-8)

		if [ "$NUMJOUR2" = "vendredi" ]
		then
			if [ $HEURE -eq 7 ]
			then
				sleep 40
				mplayer /home/pi/sncf.mp3
			fi
		fi

		if [ $HEURE -eq 6 ]
		then
			sleep 40m
			mplayer /media/dd/Musique/La\ Belle\ Mixtape\ \ Spring\ Awakening\ \ Gamper\ \&\ Dadoni.mp3
		fi
	done
done
