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
    Augvea: TButton;
    Augvea1: TButton;
    Augvea2Ostweg1: TShape;
    Augvea2Ostweg2: TShape;
    Augvea2Ostweg3: TShape;
    Augvea2Ostweg4: TShape;
    Augvea2Ostweg5: TShape;
    Augvea2Ostweg6: TShape;
    Augvea2Ostweg7: TShape;
    Augvea2Ostweg8: TShape;
    Schlafgemach: TButton;
    Ostweg: TButton;
    Oestliche_Huegel: TButton;
    Augvea2Schlafgemach: TShape;
    Augvea2Ostweg: TShape;
    Ostweg2Oestliche_Huegel: TShape;
    procedure AugveaClick(Sender: TObject);
    procedure OstwegClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
var
  Form2: TForm2;
implementation
{$R *.lfm}
uses
    unit1;

{ TForm2 }

procedure TForm2.OstwegClick(Sender: TObject);
begin

end;

procedure TForm2.AugveaClick(Sender: TObject);
begin

end;

end.

