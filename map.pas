unit Map;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Baerenhoehle2Kraehenhort: TShape;
    Augvea: TButton;
    Kaserne: TButton;
    Ueberschrift: TLabel;
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
    Westweg2Schattenweiden: TShape;
    Schattenweiden2Einsame_Herberge: TShape;
    Oeder_Morast2Graumoor: TShape;
    Oeder_Morast2Kleiner_See: TShape;
    Kleiner_See2Goblin_Dorf: TShape;
    Schattenweiden2Feuerschlot: TShape;
    Feuerschlot2Abgrund_des_brennenden_Steins: TShape;
    Schattenweiden2Oeder_Morast: TShape;
    Westweg: TButton;
    Tal2Grosse_Duenne: TShape;
    Grosse_Duene2Met_Schall_Wueste: TShape;
    Augvea2Bruecke: TShape;
    Bruecke2Westweg: TShape;
    Tal: TButton;
    Traenenwald2Baerenhoehle: TShape;
    Strasse_in_den_Sueden2Tal: TShape;
    Traenenwald: TButton;
    Am_Schnellen_Bach2Traenenwald: TShape;
    Spitzdorf2Der_Grosse_Heuler: TShape;
    Der_grosse_Heuler2Kraehenhort: TShape;
    Spitzdorf: TButton;
    Karawane_Pfad2Am_Schnellen_Bach: TShape;
    Strasse_in_den_Sueden: TButton;
    Schlafgemach: TButton;
    Ostweg: TButton;
    Grosse_Blumenwiese: TButton;
    Hoehleneingang: TButton;
    Grosse_Blumenwiese2Hoehleneingang: TShape;
    Hoehle: TButton;
    Apfelwiese: TButton;
    Oestliche_Huegel: TButton;
    Verlassene_Burg: TButton;
    Kaserne2Schlafgemach: TShape;
    Schlafgemach2Lagerhalle: TShape;
    Augvea2Strasse_in_den_Sueden: TShape;
    Apfelwiese2Oestliche_Huegel: TShape;
    Strasse_in_den_Sueden2Karawane_Pfad: TShape;
    Am_Schnellen_Bach2Spitzdorf: TShape;
    Kraenhort2Der_Sonnenstich: TShape;
    Tal2Am_Schnellen_Bach: TShape;
    Verlassene_Burg2Wachturm: TShape;
    Wachturm: TButton;
    Grosse_Blumenwiese2Apfelwiese: TShape;
    Ostweg2Oestliche_Huegel: TShape;
    Oestliche_Huegel2Verlassene_Burg: TShape;
    Wachturm2Kaserne: TShape;
    Spinnennest: TButton;
    Spinnenkammer2Spinnennest: TShape;
    Spinnenkammer: TButton;
    Hoehle2Spinnenkammer: TShape;
    Waldlichtung: TButton;
    Hoehleneingang2Hoehle: TShape;
    Tautrofwald2Waldlichtung: TShape;
    Tautropfwald: TButton;
    Weggabelung: TButton;
    Waldweg2Grosse_Blumenwiese: TShape;
    Weggabelung2Tautropfwald: TShape;
    Waldweg2Weggabelung: TShape;
    Waldweg: TButton;
    Augvea2Schlafgemach: TShape;
    Augvea2Ostweg: TShape;
    Augvea2Waldweg: TShape;
    procedure FormCreate(Sender: TObject);
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

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.OstwegClick(Sender: TObject);
begin

end;
end.

