unit ProzedureRaumwechsel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum,KampfProzedure;
var
 aktuellerRaum: TRaum;
procedure RaumWechsel(Eingabe:Traum);
implementation
uses Unit1,UIRefresh;
procedure RaumWechsel(Eingabe:Traum);
   begin
   if Eingabe = nil        //Prozedur wird mit Eingabe als Nördlicher Raum übergeben
   then Form1.Memo1.lines.add('Da ist kein Raum!')
   else
     if IstInKampf = true  then
     begin
     Form1.Memo1.lines.add('Du bist in einem Kampf und kannst nur flüchten oder Angreifen')
     end
     else
     begin
      aktuellerRaum := Eingabe;
      Form1.Memo1.lines.add(Eingabe.Raumname);
      if AktuellerRaum.Enemy <> nil then
      begin
      IstInKampf:=true;
      AktuellerGegner:=AktuellerRaum.Enemy;
      SpielerRK:=SPielerRK -2;
      SpielerATK:=SPielerATK -2;
      Kampf();                      //Ersatz für das Initative System
      SpielerATK:=SPielerATK +2;    //Bei Betreten eines Raumes mit einem Gegner
      SpielerRK:=SpielerRK +2;      //Wird dem Spieler 2 RK abgezogen
      UIRefresh.UIRefresh();
      end;
  end;
end;

end.

