Bugs:
  Animation:
	Wenn der spieler Animations spammt(besonders Angriffe) werden die Animationen nicht fertig abgespielt.(weniger bug als Design choice)[Durch ButtonCoolDown gefixed]
	
	Animationen werden teilweise abgeschnitten dargestellt, dies liegt an dem Atribute SpriteCount, dies wird für die Idle Animation auf 10 gesetzt, 
	ist dieses Atribute noch gesetzt wird das Bild in 10 Streifen zerteilt.
  
	Verschiedene Bugs, die auf fehlerhafte Timings(und daraus resultierende NullPointer) zurückzuführen sind.
		(Map muss einmal geöffnet werden um korrekt zu tracken)[Eventuell gefixed]
	
Fehlender Content:

	Räumen fehlt die Exit Message, die beim Raumverlassen ausgegbe wird.
	Form3/Startup Form hat keinerlei Design Überlegungen und besteht nur aus einem Button.
	Fehlende Startup message
	BALANCING(spiel macht sehr wenig Spaß, da man die meisten Gegner kaum töten kann.
	Buttons auf der Karte sollten Funktion haben(Teleport/Beschreibung anzeigen)
	Das TRichMemo nutzen, um Farben/Bold,Italic/ und andere Styles zwischen den Nachrichten zu variieren
	
	
Dirty Hacks:
	Die gesamte Kampfprozedur ist eine einzige lange If Schleife
	LootDrops benötigen eigentlich die Attribute  AW/WS/GE nicht sondern nur die Waffen, bekommen diese aber, da es das LootSystem enorm vereinfacht.
	
