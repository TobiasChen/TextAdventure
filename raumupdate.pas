unit RaumUpdate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum,MTEnemy;
procedure RaumUpdate(Raumhier:Traum;Nord:Traum;Ost:TRaum;Sued:TRaum;West:TRaum;Enemy:TEnemy);

implementation

uses Unit1;   //Benötigte Units zum Funktioniern
procedure RaumUpdate(Raumhier:Traum;Nord:Traum;Ost:TRaum;Sued:TRaum;West:TRaum;Enemy:TEnemy);
 begin
      Raumhier.Norden:=Nord;
      Raumhier.Osten:=Ost;
      Raumhier.Sueden:=Sued;
      Raumhier.Westen:=West;
      Raumhier.Enemy:=Enemy;
  end;
end.

