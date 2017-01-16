unit sterben;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
procedure Sterben();

implementation

uses Unit1,UI,ProzedureRaumwechsel,KampfProzedure;   //Benötigte Units zum Funktioniern
procedure sterben();
 begin
  UI.Animation('Dead',10);
  IstInKampf:=false;
  Form1.Memo1.lines.add('Du bist gestorben!');
  aktuellerRaum:=AnfangsRaum;
  SpielerHP:=AnfangsHP;
  SpielerRK:=AnfangsRK;
  SpielerStaerke:=AnfangsStaerke;
  SpielerHelm:=Kappe;
  SpielerRuestung:=Gewand;
  SpielerSchuhe:=Alte_Latscher;
  SpielerWaffe:=Verrotteter_Klumpen;
  UI.UIRefresh();
  end;
end.

