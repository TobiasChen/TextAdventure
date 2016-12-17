unit KampfProzedure;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mTEnemy, sterben;
var
  SpielerHP, SpielerRK, SpielerATK: Integer;
  WurfSpieler, WurfGegner : Integer;                             //Angelehnt an das Pen&Paper-Kampfsystem//
  IstInKampf: Boolean;
  Gegner:TEnemy;
procedure Kampf();
implementation
uses Unit1,ProzedureRaumwechsel;                                 //Unit1 muss benutzt werden
//------Kampf------//    //Angelehnt an das Pen&Paper-Kampfsystem//
procedure Kampf();
begin
Gegner:=AktuellerRaum.Enemy;
//Sehr faule Implementation,theroetisch könnte man jedes Gegner in dieser Unit
//mit AktuellerRaum.Enemy ersetzen
if AktuellerRaum.Enemy = nil then
Form1.Memo1.lines.add('Kein Gegner Vorhanden')
else
begin
    WurfSpieler := random(20) + 1 + SpielerATK;                  //Wurf des Spielers
    WurfGegner:= random(20) + 1 + Gegner.ATK;                    //Wurf des Gegners
    if SpielerRK < Wurfgegner                                    //Trifft Gegner?
       then
         begin
           SpielerHP := SpielerHP - Gegner.ATK;
           if SpielerHp < 1 then
           begin
           IstInKampf:=false;
           sterben.Sterben();
           end
           else
           Form1.Memo1.lines.add('Der Gegner hat dich mit '+ inttostr(Gegner.atk) +' Schaden getroffen');
         end
       else
         begin
           Form1.Memo1.lines.add('Der Gegner hat dich verfehlt!');
         end;
    if Gegner.RK < WurfSpieler                                   //Trifft Spieler?
       then
         begin
           Gegner.HP := Gegner.HP - SpielerATK;
           if Gegner.Hp < 1 then
           begin
           aktuellerRaum.Enemy:= nil;
           Form1.Memo1.lines.add('Du hast den Gegner mit '+ inttostr(SpielerATK) + ' Schaden  getroffen und ihn getötet');
           IstInKampf:= false;
           Form1.LabelGegnerHP.Caption:=IntToStr(0);
           end
           else
           Form1.Memo1.lines.add('Du hast den Gegner mit '+ inttostr(SpielerATK) +' Schaden  getroffen!');
         end
       else
         begin
           Form1.Memo1.lines.add('Du hast den Gegner verfehlt!');
         end;
     end;
end;

end.

