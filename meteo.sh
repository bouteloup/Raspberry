#!/bin/bash

#Récupération du flux météo
wget -O indice http://api.openweathermap.org/data/2.5/forecast/daily?lat\=47.87\&lon\=0.33\&cnt\=4\&mode\=json\&units\=metric\&lang\=fr
sleep 2s

#Récupération des honoraires
HOUR=$(date +'%H')
MINUTE=$(date +'%M')
DAY_LETTER=$(date +'%A')
DAY=$(date +'%d')
MONTH=$(date +'%B')
YEARS=$(date +'%Y')

#Déclaration du tableau
declare -a TAB=([1]=lundi [2]=mardi [3]=mercredi [4]=jeudi [5]=vendredi [6]=samedi [7]=dimanche)
i=0

#Faire en sorte de trouver quel jour nous serons demain
while [ $i -le 7 ]
do
	if [ "${TAB[$i]}" ==  $DAY_LETTER ]
	then
		valeur_de_i=$i
		let valeur_de_i++
		NEXT_DAY="${TAB[$valeur_de_i]}"
		break
	fi
let i++
done

#Haut-parleur - Annonce de l'heure et date
DATE_HEURE="Il est actuellement $HOUR heures et $MINUTE minutes. Nous sommes le $DAY_LETTER $DAY $MONTH $YEARS"
mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=fr&q=$DATE_HEURE"

#Récupérer des caractères voulu dans le fichier indice contenant le flux météo
#Récupération de la descriptions et des températures min et max
DESCRIPTION=$(cut -d '"' -f 62 indice)
TEMPERATURE_MIN=$(cut -d  '"' -f 83 indice)
TEMPERATURE_MAX=$(cut -d  '"' -f 85 indice)

#Haut-parleur - Annonce de la météo
DAY_NEXT="Demain, nous seront $NEXT_DAY"
METEO_COMPLET="Météo pour demain, $DESCRIPTION Température minimal $TEMPERATURE_MIN degré Maximum $TEMPERATURE_MAX degré"
ANNONCE="Je te souhaite une bonne fin de soirée"
mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=fr&q=$DAY_NEXT"
mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=fr&q=$METEO_COMPLET"
mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=fr&q=$ANNONCE"

###Pour lancé le scripts : ./meteo.sh
###Problème avec : sh meteo.sh
