#!/bin/bash

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

done
