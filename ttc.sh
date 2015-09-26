#!/bin/bash

#Suche nach Schlüsselwort, wenn gefunden
if grep -o "Musik" stt.txt  || grep -o "Music" stt.txt
 
then 
	#Bestätigung per Audio
	espeak -vde "Musik"
	#Suche nach Dateien im Ordner die, die Wörter nach dem Schlüsselwort in der Datei stt.txt enthalten und schreibt den ersten Treffer in die 		Datei datei.txt
	find ~/Musik/ -name "*$(cat stt.txt | cut -c 7- | sed '1d' | sed -e 's/  */*/g')*" | head -1> datei.txt

	#Wenn was gefunden wurde(wenn die Ausgabe von "find" nicht leer ist)
	if [ -s datei.txt ]

		then
	
		#Starte gefundene Datei mit entsprechendem Programm
		nohup cvlc --play-and-exit -f "$(cat datei.txt)" &
		else
		#Gibt per Audio bekannt das nichts gefunden wurde
		espeak -vde "nicht gefunden"
	fi
fi




if grep -o "video" stt.txt  || grep -o "Video" stt.txt
 
then 
	espeak -vde "Video"
	find ~/Videos/ -name "*$(cat stt.txt | cut -c 7- | sed '1d' | sed -e 's/  */*/g')*" | head -1> datei.txt

	if [ -s datei.txt ]

		then

		nohup cvlc --play-and-exit -f "$(cat datei.txt)" &
		else
		espeak -vde "nicht gefunden"
	fi
fi




if grep -o "Dokument" stt.txt
then 
	espeak -vde "Dokument"
	find ~/Dokumente/ -name "*$(cat stt.txt | cut -c 10- | sed '1d' | sed -e 's/  */*/g')*" | head -1> datei.txt

	if [ -s datei.txt ]

		then

		nohup libreoffice "$(cat datei.txt)" &
		else
		espeak -vde "nicht gefunden"
	fi
fi




if grep -o "Editor" stt.txt
then 
	espeak -vde "Editor"
	find ~/Dokumente/ -name "*$(cat stt.txt | cut -c 8- | sed '1d' | sed -e 's/  */*/g')*" | head -1> datei.txt

	if [ -s datei.txt ]

		then

		nohup gedit "$(cat datei.txt)" &
		else
		espeak -vde "nicht gefunden"
	fi
fi



if grep -o "Minecraft" stt.txt
then 
	espeak -ven "Minecraft"
	find ~/ -name "Minecraft.jar" | head -1> datei.txt

	if [ -s datei.txt ]

		then

		nohup java -jar "$(cat datei.txt)" &
		else
		espeak -vde "nicht gefunden"
	fi
fi




if grep -o "Chrome" stt.txt
then 
	espeak -ven "Chrome"
	nohup google-chrome &
fi




if grep -o "Steam" stt.txt
then 
	espeak -ven "Steam"
	nohup steam &
fi
