unit UIRefresh;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
procedure UIRefresh();
implementation
uses
  Unit1,ProzedureRaumwechsel,KampfProzedure, mTEnemy;
procedure UIRefresh();
begin
  Form1.LabelHP.Caption := InttoStr(SpielerHP);
  Form1.LabelRK.Caption := InttoStr(SpielerRK);
  Form1.LabelATK.Caption := InttoStr(SpielerATK);
  Form1.LabelRaum.caption := AktuellerRaum.Raumname;
  Form1.LabelRaumBeschreibung.caption:=AktuellerRaum.Beschreibung;
  Form1.MD.caption:=inttostr(aktuellerRaum.MD);
  Form1.Schwierigkeit.caption:=aktuellerRaum.Difficulty;
  If AktuellerRaum.Enemy <> nil then  // <> = is not
     begin
     Form1.LabelGegner.Caption := AktuellerRaum.Enemy.Enemyname;
     Form1.LabelGegnerHP.Caption:= InttoStr(aktuellerRaum.Enemy.HP) ;
     end
     //Überprüft ob Gegner vorhanden sind
  else
     Form1.LabelGegner.Caption := 'Kein Gegner';
  end;
end.

