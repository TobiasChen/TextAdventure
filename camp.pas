unit camp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
procedure camp();
procedure Sleep();

implementation

uses Unit1,KampfProzedure,ProzedureRaumwechsel,UI;   //Benötigte Units zum Funktioniern
procedure camp();
 begin
if IstInKampf=True then
   Form1.Memo1.lines.add('Du kannst mit einem anwesendem Monster nur kämpfen oder flüchten')
else if (aktuellerRaum.camp=false) and (aktuellerRaum.camp_possible=true) and (aktuellerRaum.MD<=30)  then
   begin
    Form1.Memo1.lines.add('Du hast erfolgreich ein Camp gebaut');
    aktuellerRaum.Camp:=true;
    Sleep()
   end
else if (aktuellerRaum.camp_possible=false) then
    Form1.Memo1.lines.add('Du kannst hier kein Camp bauen')
else if  (aktuellerRaum.camp=true) then
   Sleep();
UI.UIRefresh();
  end;
procedure Sleep();
begin
   SpielerHP:=MaxHP;
  end;
end.

