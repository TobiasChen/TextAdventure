unit UIRefresh;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
procedure UIRefresh();
implementation
uses
  Unit1,ProzedureRaumwechsel,KampfProzedure;
procedure UIRefresh();
begin
  Form1.LabelHP.Caption := InttoStr(SpielerHP);
  Form1.LabelRK.Caption := InttoStr(SpielerRK);
  Form1.LabelATK.Caption := InttoStr(SpielerATK);
  Form1.LabelRaum.caption := AktuellerRaum.Raumname;
  end;
end.

