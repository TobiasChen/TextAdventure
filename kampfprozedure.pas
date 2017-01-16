unit KampfProzedure;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mTEnemy, sterben;
var
  SpielerHP, SpielerRK, SpielerATK: Integer;
  GegnerHP:Integer;
  WurfSpieler, WurfGegner : Integer;                             //Angelehnt an das Pen&Paper-Kampfsystem//
  IstInKampf: Boolean;
  Gegner:TEnemy;
  LetzterGegner:TEnemy;
procedure Kampf();
implementation
uses Unit1,ProzedureRaumwechsel,LootDrop,UI;                                 //Unit1 muss benutzt werden
//------Kampf------//    //Angelehnt an das Pen&Paper-Kampfsystem//
procedure Kampf();
begin
Gegner:=AktuellerRaum.Enemy;
//Faule Implementation,theroetisch könnte man jedes Gegner in dieser Unit
//mit AktuellerRaum.Enemy ersetzen
if AktuellerRaum.Enemy = nil then
Form1.Memo1.lines.add('Kein Gegner Vorhanden')
else
begin
    WurfSpieler := random(20) + 1 + SpielerATK;                  //Wurf des Spielers
    WurfGegner:= random(20) + 1 + Gegner.ATK;                    //Wurf des Gegners
    Ui.Animation('Attack',10);
    SpielerAngriffsBonus:=SpielerWaffe.GE+WurfSpieler;
    if SpielerRK < Wurfgegner then                               //Trifft Gegner?
         begin
           SpielerHP := SpielerHP - Gegner.ATK;
           if SpielerHp < 1 then
           begin
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
           GegnerHP := GegnerHP - SpielerATK;
           if GegnerHp < 1 then
           begin
           LetzterGegner:=aktuellerRaum.Enemy;
           aktuellerRaum.Enemy:= nil;
           Form1.Memo1.lines.add('Du hast den Gegner mit '+ inttostr(SpielerATK) + ' Schaden  getroffen und ihn getötet');
           IstInKampf:= false;
           Form1.LabelGegnerHP.Caption:=IntToStr(0);
           AktuellerRaum.MD:=AktuellerRaum.MD-AktuellerRaum.MDS;
           LootDrop.LootDrop()  //Fukntion für Loot Generation
           end
           else
           Form1.Memo1.lines.add('Du hast den Gegner mit '+ inttostr(SpielerATK) +' Schaden  getroffen!');
         end
       else
         begin
           Form1.Memo1.lines.add('Du hast den Gegner verfehlt!');
         end;
     end;
     Ui.UiRefresh();
end;

end.

