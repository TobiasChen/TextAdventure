unit ProzedureRaumwechsel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum,KampfProzedure;
var
 aktuellerRaum: TRaum;
procedure RaumWechsel(Eingabe:Traum);
implementation
uses Unit1;
procedure RaumWechsel(Eingabe:Traum);
begin
   begin
   if Eingabe = nil        //Prozeduer wird mit Eingabe als Nördlicher Raum übergeben
   then Form1.Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      aktuellerRaum := Eingabe;
      Form1.LabelRaum.caption := AktuellerRaum.Raumname;
      Form1.Memo1.lines.add(Eingabe.Raumname);
     end;
  end;
end;

end.

