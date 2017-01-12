unit Map;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, RichMemo, mTRaum, MTEnemy, Kampfprozedure, ProzedureRaumWechsel,
  UIRefresh, mTLoot, LootDrop, RaumUpdate;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Augvea2Schlafgemach: TShape;
    Auvea2Oststrase: TShape;
    Oststrase2OstMoor: TShape;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

end.

