unit Special;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
procedure Jump();

implementation

uses Unit1,UI,sterben,ProzedureRaumwechsel;   //Benötigte Units zum Funktioniern
procedure Jump();
 begin
    if aktuellerRaum=Bruecke then
    begin
      Form1.Memo1.Lines.Add('You jump down the bridge, seconds later and still falling the thought crosses your Mind that this was not the brightest idea');
      Form1.Memo1.Lines.Add('You Die');
      sterben.sterben(1000);
    end;
 end;
end.

