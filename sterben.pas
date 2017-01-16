unit sterben;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Forms;
procedure Sterben();

implementation

uses Unit1,UI;   //Benötigte Units zum Funktioniern
procedure sterben();
 begin
  UI.Animation('Dead',10);
  sleep(300);
  Application.ProcessMessages;
  Unit1.Form1.close;
  end;
end.

