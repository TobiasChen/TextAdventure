unit RaumUpdate;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTraum,MTenemy;
procedure RaumUpdate(EigenerRaum:TRAum;Nord:TRAum;Ost:TRAum;Sued:TRAum;West:TRAum;Gegner:TEnemy);
procedure RaumNamenUpdate(EigenerRaum:Traum;Nord:String;Ost:String;Sued:String;West:String);
implementation
   //Benötigte Units zum Funktioniern
procedure RaumUpdate(EigenerRaum:TRAum;Nord:TRAum;Ost:TRAum;Sued:TRAum;West:TRAum;Gegner:TEnemy);
 begin
EigenerRaum.Norden:=Nord;
EigenerRaum.Osten:=Ost;
EigenerRaum.Sueden:=Sued;
EigenerRaum.Westen:=West;
EigenerRaum.Enemy:=Gegner;
  end;
procedure RaumNamenUpdate(EigenerRaum:Traum;Nord:String;Ost:String;Sued:String;West:String);
 begin
EigenerRaum.NORDENLeave:=Nord;
EigenerRaum.OSTENLeave:=Ost;
EigenerRaum.SUEDENLeave:=Sued;
EigenerRaum.WESTENLeave:=West;
  end;
end.

