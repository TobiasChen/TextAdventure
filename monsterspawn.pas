unit monsterspawn;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum;
procedure Monsterspawn();

implementation

uses Unit1,ProzedureRaumwechsel,KampfProzedure,UI;   //Benötigte Units zum Funktioniern
procedure Monsterspawn();
var
  Wuerfel:Integer;
 begin
  Wuerfel:=1+Random(100);//Normales Random 100 wäre 0...99
    if aktuellerRaum.Difficulty='Hoehlespinne'then
    begin                                         //Wäre Optimaler mit einer
       if Wuerfel <= 10  then                           //Case Struktur gelöst worden
          aktuellerRaum.Enemy:=nil
       else if (Wuerfel > 10) and (Wuerfel <=85)   then
          aktuellerRaum.Enemy:=Spinnenschwarm
       else if (Wuerfel > 85) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Riesenfledermaus;
    end;
	 
    if aktuellerRaum.Difficulty='Hoehleboss' then
    begin
       if Wuerfel <= 100  then                           
          aktuellerRaum.Enemy:=Riesenspinne;
    end;
	 
    if aktuellerRaum.Difficulty='Wald' then
    begin
       if Wuerfel <= 30  then                           
          aktuellerRaum.Enemy:=Wolf
       else if (Wuerfel > 30) and (Wuerfel <=60)   then
          aktuellerRaum.Enemy:=Goblin
       else if (Wuerfel > 60) and (Wuerfel <=80)   then
          aktuellerRaum.Enemy:=Bandit
       else if (Wuerfel > 80) and (Wuerfel <=100)   then
          aktuellerRaum.Enemy:=Ork;
     end;
	 
     if aktuellerRaum.Difficulty='Hoehle' then
     begin
       if Wuerfel <= 80  then                           
          aktuellerRaum.Enemy:=Riesenfledermaus
       else if (Wuerfel > 80) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Spinnenschwarm;
     end;
	 
     if aktuellerRaum.Difficulty='Vulkan' then
     begin
       if Wuerfel <= 40  then                           
          aktuellerRaum.Enemy:=Feuerelementar;
		  else if (Wuerfel > 40) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Imp;
     end;
	 
     if aktuellerRaum.Difficulty='Sumpf' then
     begin
       if Wuerfel <= 40  then                           
          aktuellerRaum.Enemy:=Goblin
       else if (Wuerfel > 40) and (Wuerfel <=80)   then
          aktuellerRaum.Enemy:=Schleim
       else if (Wuerfel > 80) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Sumpfhexe;
     end;
	 
     if aktuellerRaum.Difficulty='Offene_Landschaft' then
     begin
       if Wuerfel <= 35  then                           
          aktuellerRaum.Enemy:=Bandit
       else if (Wuerfel > 25) and (Wuerfel <=50)   then
          aktuellerRaum.Enemy:=Goblin
	   else if (Wuerfel > 50) and (Wuerfel <=75)   then
          aktuellerRaum.Enemy:=Wolf
       else if (Wuerfel > 75) and (Wuerfel <=80)   then
          aktuellerRaum.Enemy:=Ork
	   else if (Wuerfel > 80) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=nil;
     end;
	 
     if aktuellerRaum.Difficulty='Burgstark' then
     begin
       if Wuerfel <= 45  then                           
          aktuellerRaum.Enemy:=Bewaffneter_Untoter
       else if (Wuerfel > 45) and (Wuerfel <=80)   then
          aktuellerRaum.Enemy:=Fliegendes_Schwert
       else if (Wuerfel > 80) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Untoter_Ritter;
     end;
	 
     if aktuellerRaum.Difficulty='Herberge' then
     begin
       if Wuerfel <= 100  then                           
          aktuellerRaum.Enemy:=Rolf;
     end;
	 
     if aktuellerRaum.Difficulty='Weg' then
     begin
       if Wuerfel <= 30  then                           
          aktuellerRaum.Enemy:=nil
       else if (Wuerfel > 30) and (Wuerfel <=70)   then
          aktuellerRaum.Enemy:=Bandit
       else if (Wuerfel > 70) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Goblin;
     end;
	 
     if aktuellerRaum.Difficulty='Burg' then
     begin
       if Wuerfel <= 60  then                           
          aktuellerRaum.Enemy:=Untoter
       else if (Wuerfel > 60) and (Wuerfel <=100)   then
          aktuellerRaum.Enemy:=Bewaffneter_Untoter;
     end;
	 
     if aktuellerRaum.Difficulty='Wueste' then
     begin
       if Wuerfel <= 70  then                           
          aktuellerRaum.Enemy:=Skorpione
       else if (Wuerfel > 70) and (Wuerfel <=100)   then
          aktuellerRaum.Enemy:=Mumie;
     end;
	 
     if aktuellerRaum.Difficulty='Goblinstark' then
     begin
       if Wuerfel <= 30  then                           
          aktuellerRaum.Enemy:=Goblinhaeuptling
       else if (Wuerfel > 30) and (Wuerfel <=100)   then
          aktuellerRaum.Enemy:=Goblin;
     end;
	 
     if aktuellerRaum.Difficulty='Baer' then
     begin
       if Wuerfel <= 100  then                           
          aktuellerRaum.Enemy:=Baer;
     end;
	 
     if aktuellerRaum.Difficulty='Friedhof' then
     begin
       if Wuerfel <= 20  then                           
          aktuellerRaum.Enemy:=nil
       else if (Wuerfel > 20) and (Wuerfel <=60)   then
          aktuellerRaum.Enemy:=Untoter
       else if (Wuerfel > 60) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Schattenkraehe;
     end;
	 
     if aktuellerRaum.Difficulty='Waldstark' then
     begin
       if Wuerfel <= 20  then                           
          aktuellerRaum.Enemy:=Bandit
       else if (Wuerfel > 20) and (Wuerfel <=40)   then
          aktuellerRaum.Enemy:=Ork
       else if (Wuerfel > 40) and (Wuerfel <=60)   then
          aktuellerRaum.Enemy:=Baer
       else if (Wuerfel > 60) and (Wuerfel <=80)   then
          aktuellerRaum.Enemy:=Oger
       else if (Wuerfel > 80) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Schattenkraehe;
     end

     else if aktuellerRaum.Difficulty='Zufall' then
     begin
       if Wuerfel <= 5  then                           
          aktuellerRaum.Enemy:=Ork
       else if (Wuerfel > 5) and (Wuerfel <=10)   then
          aktuellerRaum.Enemy:=Oger
       else if (Wuerfel > 10) and (Wuerfel <=15)   then
          aktuellerRaum.Enemy:=Goblin
       else if (Wuerfel > 15) and (Wuerfel <=20)   then
          aktuellerRaum.Enemy:=Goblinhaeuptling
       else if (Wuerfel > 20) and (Wuerfel <=25)   then
          aktuellerRaum.Enemy:=Wolf
       else if (Wuerfel > 25) and (Wuerfel <=30) then
          aktuellerRaum.Enemy:=Baer
       else if (Wuerfel > 30) and (Wuerfel <=35)   then
          aktuellerRaum.Enemy:=Schattenkraehe
       else if (Wuerfel > 35) and (Wuerfel <=40)   then
          aktuellerRaum.Enemy:=Bandit
       else if (Wuerfel > 40) and (Wuerfel <=45)   then
          aktuellerRaum.Enemy:=Spinnenschwarm
       else if (Wuerfel > 45) and (Wuerfel <=50)   then
          aktuellerRaum.Enemy:=Riesenfledermaus
       else if (Wuerfel > 50) and (Wuerfel <=55)   then
          aktuellerRaum.Enemy:=Riesenspinne
       else if (Wuerfel > 55) and (Wuerfel <=60)   then
          aktuellerRaum.Enemy:=Untoter
       else if (Wuerfel > 60) and (Wuerfel <=65)   then
          aktuellerRaum.Enemy:=Bewaffneter_Untoter
       else if (Wuerfel > 65) and (Wuerfel <=70)   then
          aktuellerRaum.Enemy:=Untoter_Ritter
       else if (Wuerfel > 70) and (Wuerfel <=75)   then
          aktuellerRaum.Enemy:=Fliegendes_Schwert
       else if (Wuerfel > 75) and (Wuerfel <=80)   then
          aktuellerRaum.Enemy:=Feuerelementar
       else if (Wuerfel > 80) and (Wuerfel <=85)   then
          aktuellerRaum.Enemy:=Skorpione
       else if (Wuerfel > 85) and (Wuerfel <=90)   then
          aktuellerRaum.Enemy:=Mumie
       else if (Wuerfel > 90) and (Wuerfel <=95)   then
          aktuellerRaum.Enemy:=Schleim
       else if (Wuerfel > 95) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Sumpfhexe;
     end
      else if aktuellerRaum.Difficulty='test' then               //Nur Beispiel Werte
      begin                                           //zur Demonstration
      aktuellerRaum.Enemy:=Ork
      end;

   //Error Überprüfung und eig. Spawn
   if aktuellerRaum.Difficulty= ('')  then
         aktuellerRaum.Enemy:=nil
   else if aktuellerRaum.Difficulty= 'empty'  then
         aktuellerRaum.Enemy:=nil
   else if aktuellerRaum.Enemy <> nil then
        GegnerHP:=aktuellerRaum.Enemy.HP;
  //GegnerHP Variable aus KampfProzedure
  UI.UIRefresh();
  end;
end.

