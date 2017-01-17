unit KampfProzedure;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mTEnemy, sterben, Forms, Controls, Graphics,
  ExtCtrls, RichMemo;
var
  SpielerHP, SpielerRK, SpielerStaerke: Integer;
  GegnerHP, Schaden:Integer;
  WurfSpieler, WurfGegner,SpielerAngriffsBonus : Integer;                             //Angelehnt an das Pen&Paper-Kampfsystem//
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
         WurfSpieler := random(20) + 1 + SpielerStaerke;                  //Wurf des Spielers
         WurfGegner:= random(20) + 1 + Gegner.ATK;                    //Wurf des Gegners
         Ui.Animation('Attack',10);
         SpielerAngriffsBonus:=SpielerWaffe.GE+WurfSpieler;
         if Gegner.RK <= SpielerAngriffsBonus then    //trifft Spieler?
            begin
            If WurfSpieler=20 then
               begin
                    Schaden:=(2*(SpielerWaffe.Aw*(random(SpielerWaffe.WS)+1)));
                    Form1.Memo1.lines.add('CRIT!');
               end
            else  Schaden:=(SpielerWaffe.Aw*(random(SpielerWaffe.WS)+1));
                 GegnerHP := GegnerHP - Schaden; //Anzahl Wuerfel sind fixed mal Anzahl Seiten der Wuerfel
                 if GegnerHp < 1 then
                    begin
                         LetzterGegner:=aktuellerRaum.Enemy;
                         aktuellerRaum.Enemy:= nil;
                         IstInKampf:= false;
                         Form1.LabelGegnerHP.Caption:=IntToStr(0);
                         AktuellerRaum.MD:=AktuellerRaum.MD-AktuellerRaum.MDS;
                         if AktuellerRaum.MD<0 then
                            AktuellerRaum.MD:=0;
                         LootDrop.LootDrop()  //Fukntion für Loot Generation
                    end
                 else
                 begin
                     Form1.Memo1.lines.add('Du hast den Gegner mit '+ inttostr(Schaden) +' Schaden  getroffen!');
                     end;
            end
         else
             begin
                  Form1.Memo1.lines.add('Du hast den Gegner verfehlt!');
             end;
         If aktuellerRaum.Enemy<>nil then
            begin
                 if SpielerRK < Wurfgegner then                               //Trifft Gegner?
                    begin
                         SpielerHP := SpielerHP - Gegner.ATK;
                                   if SpielerHp < 1 then
                                      begin
                                           sterben.Sterben();
                                      end
                                   else
                                   begin
                                       Form1.Memo1.lines.add('Der Gegner hat dich mit '+ inttostr(Gegner.atk) +' Schaden getroffen');
                                   end
                         end
                 else
                     begin
                          Form1.Memo1.lines.add('Der Gegner hat dich verfehlt!');
                     end;
            end;
   end;
   Ui.UiRefresh();
end;

end.
