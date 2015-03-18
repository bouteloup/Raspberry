#!/bin/bash

while [ 1 ]
do
<<<<<<< HEAD
	HEURE=$(date +'%k')

	while [ $HEURE -ge 9 -a $HEURE -le 23 ]
	do
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
			sleep 1s
		done

	HEURE=$(date +'%k')
	NUMJOUR1=$(date | cut -c 1-5)
	NUMJOUR2=$(date | cut -c 1-8)

	if [ $NUMJOUR1 == "lundi" || $NUMJOUR1 == "mardi" || $NUMJOUR2 == "mercredi" || $NUMJOUR1 == "jeudi" ]
	then
		if [ $HEURE == 6 ]
		then
			sleep 40m
			#mplayer LIENDELAPLAYLIST
		fi
	fi

	if [ $NUMJOUR2 == "vendredi" ]
	then
		if [ $HEURE == 7 ]
		then
			sleep 40m
			#mplayer LIENDELAPLAYLIST
		fi
	fi
=======
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
	
	#echo "Calibrage -- OK"
	
	while [ $MINUTE -eq 59 ]
	do
	    MINUTE=$(date +'%M')
	    SECOND=$(date +'%S')
	    sleep 1s
	done

	# Actualisation des minutes
	MINUTE=$(date +'%M')
	
	if [ $MINUTE -eq 00 ]
	then
	    echo "lol"
	    MESSAGE="Il est "$HEURE" heures"
	    mplayer "http://translate.google.com/translate_tts?tl=fr&q=$MESSAGE"
	fi
	    
	sleep 1m
	# Attention ! Après l'exécution du mplayer, le temps n'est plus synchronisé, il se resynchronise donc.
    done
	

#POUR REVEIL
HEURE=$(date +'%k')
MINUTE=$(date +'%M')
NOMJOUR=$(date +'%A')
NUMJOUR=$(date +'%d')
NOMMOIS=$(date +'%B')
ANNEE=$(date +'%Y')
SECOND=$(date +'%S')
#MESSAGE="Salut Mr Bouteloup. Nous sommes le "$NOMJOUR" "$NUMJOUR" "$NOMMOIS" "$ANNEE", et il est "$HEURE" heures "$MINUTE
#mplayer "http://translate.google.com/translate_tts?tl=fr&q=$MESSAGE"
MESSAGE="Il est actuellement "$HEURE" heure."
mplayer /home/pi/sncf.mp3
mplayer "http://translate.google.com/translate_tts?tl=fr&q=$MESSAGE"
sleep 2m
done
	sleep 1h
done
