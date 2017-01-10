unit monsterspawn;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum;
procedure Monsterspawn();

implementation

uses Unit1,ProzedureRaumwechsel;   //Benötigte Units zum Funktioniern
procedure Monsterspawn();
var
  Wuerfel:Integer;
 begin
  Wuerfel:=1+Random(100);//Normales Random 100 wäre 0...99
  if aktuellerRaum.Difficulty='easy'
     then begin                                         //Wäre Optimaler mit einer
       if Wuerfel <= 50  then                           //Case Struktur gelöst worden
          aktuellerRaum.Enemy:=nil
       else if (Wuerfel > 50) and (Wuerfel <=85)   then
          aktuellerRaum.Enemy:=Goblin
       else if (Wuerfel > 85) and (Wuerfel <=100)   then
            aktuellerRaum.Enemy:=Ork;
     end;
   if aktuellerRaum.Difficulty='medium'
      then begin
        if Wuerfel <= 30 then
           aktuellerRaum.Enemy:=nil
        else if (Wuerfel > 30) and (Wuerfel <=65) then
           aktuellerRaum.Enemy:=Goblin
        else if (Wuerfel > 65) and (Wuerfel <=100) then
             aktuellerRaum.Enemy:=Ork;
      end;
   if aktuellerRaum.Difficulty='hard'                 //Nur Beispiel Werte
      then begin                                           //zur Demonstration
        if Wuerfel = 1 then
           aktuellerRaum.Enemy:=Goblin
        else if (Wuerfel > 1) and (Wuerfel <=50) then
           aktuellerRaum.Enemy:=Goblin
        else if (Wuerfel > 50) and (Wuerfel <=85) then
           aktuellerRaum.Enemy:=Ork
        else if (Wuerfel > 85) and (Wuerfel <=100) then
             aktuellerRaum.Enemy:=Oger;
      end;
   if aktuellerRaum.Difficulty= ('')  then       //Error Überprüfung
         aktuellerRaum.Enemy:=Goblin;
   if aktuellerRaum.Difficulty= 'empty'  then
         aktuellerRaum.Enemy:=Goblin;
  //Aus mir momentan unerfindlichen Gründen funktionierte ein einfaches or Statment
  //hier nicht, zudem ist es unnötig und dient nur dem Programier Komfort.
  end;
end.

