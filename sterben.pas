unit sterben;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Forms;
procedure Sterben(WaitTime:integer);

implementation

uses Unit1,UI;   //Benötigte Units zum Funktioniern
procedure sterben(WaitTime:integer);
 begin
  UI.Animation('Dead',10);
  sleep(WaitTime);
  Application.ProcessMessages;
  Unit1.Form1.close;
  end;
end.

