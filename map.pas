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
    Kaserne: TButton;
    Label1: TLabel;
    Lagerhalle: TButton;
    Karawane_Pfad: TButton;
    Am_Schnellen_Bach: TButton;
    Kraehenhort: TButton;
    Der_Grosse_Heuler: TButton;
    Der_Sonnenstich: TButton;
    Baerenhoehle: TButton;
    Grosse_Duene: TButton;
    Met_Schall_Wueste: TButton;
    Bruecke: TButton;
    Graumoor: TButton;
    Oeder_Morast: TButton;
    Kleiner_See: TButton;
    Goblin_Dorf: TButton;
    Feuerschlot: TButton;
    Abgrund_des_brennenden_Steins: TButton;
    Einsame_Herberge: TButton;
    Schattenweiden: TButton;
    ShapePreset17: TShape;
    ShapePreset18: TShape;
    ShapePreset19: TShape;
    VerticalPreset10: TShape;
    VerticalPreset11: TShape;
    VerticalPreset12: TShape;
    VerticalPreset13: TShape;
    VerticalPreset9: TShape;
    Westweg: TButton;
    ShapePreset13: TShape;
    ShapePreset14: TShape;
    ShapePreset15: TShape;
    ShapePreset16: TShape;
    Tal: TButton;
    ShapePreset11: TShape;
    ShapePreset12: TShape;
    Traenenwald: TButton;
    ShapePreset10: TShape;
    ShapePreset8: TShape;
    ShapePreset9: TShape;
    Spitzdorf: TButton;
    ShapePreset7: TShape;
    Strasse_in_den_Sueden: TButton;
    Schlafgemach: TButton;
    Ostweg: TButton;
    Augvea2Ostweg1: TShape;
    Grosse_Blumenwiese: TButton;
    Hoehleneingang: TButton;
    Grosse_Blumenwiese2Hoehleneingang: TShape;
    Hoehle: TButton;
    Apfelwiese: TButton;
    Oestliche_Huegel: TButton;
    Verlassene_Burg: TButton;
    VerticalPreset1: TShape;
    VerticalPreset2: TShape;
    VerticalPreset3: TShape;
    VerticalPreset4: TShape;
    VerticalPreset5: TShape;
    VerticalPreset6: TShape;
    VerticalPreset7: TShape;
    VerticalPreset8: TShape;
    Wachturm2Kaserne: TShape;
    Wachturm: TButton;
    ShapePreset3: TShape;
    ShapePreset4: TShape;
    ShapePreset5: TShape;
    ShapePreset6: TShape;
    Spinnennest: TButton;
    ShapePreset2: TShape;
    Spinnenkammer: TButton;
    ShapePresetSenkrecht3: TShape;
    Waldlichtung: TButton;
    ShapePresetSenkrecht1: TShape;
    ShapePresetSenkrecht2: TShape;
    Tautropfwald: TButton;
    Weggabelung: TButton;
    ShapePreset1: TShape;
    Weggabelung2Tautropfwald: TShape;
    Waldweg2Weggabelung: TShape;
    Waldweg: TButton;
    Augvea2Schlafgemach: TShape;
    Augvea2Ostweg: TShape;
    Ostweg2Oestliche_Huegel: TShape;
    Augvea2Waldweg: TShape;
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

{ TForm2 }



end.

