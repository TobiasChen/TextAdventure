unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  mTRaum, MTEnemy,Kampfprozedure,ProzedureRaumWechsel,UIRefresh;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    LabelGegnerHPunverwendet: TLabel;
    LabelGegnerHP: TLabel;
    LabelGegner: TLabel;
    Labeleingabeunverwendet: TLabel;
    LabelHPunverwendet: TLabel;
    LabelHP: TLabel;
    LabelRKunverwendet: TLabel;
    LabelRK: TLabel;
    LabelATKunverwendet: TLabel;
    LabelATK: TLabel;
    LabelRaum: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  Memo1: TMemo;
  //Räume//
  Schwimmbad: TRaum;
  Mensa: TRaum;
  Bleises_Folterkeller: TRaum;

  //Gegner//
  Mieses_Essen: TEnemy;
  aktuellerGegner: TEnemy;
  Wurf, Wurfgegner, Initiative : Integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   Memo1.Lines.Add ('Hallo, willkommen im Textadventure');

   //Gegner//

   LabelGegner.Caption := 'Kein Gegner';
   Mieses_Essen := TEnemy.create ('Mieses Essen', 'Entspricht der Norm... von der Schule', 5, 5, 1);

   //Räume//

   Mensa := TRaum.create ('Mensa', 'Hier koennen kleine Kinder Pampe fressen!', nil, Bleises_Folterkeller, Schwimmbad, nil, nil);
   Schwimmbad := TRaum.create ('Schwimmbad', 'Hier koennen kleine Kinder in ihrer Pisse schwimmen!', nil, nil, Bleises_Folterkeller, nil, nil);
   Bleises_Folterkeller := TRaum.create ('Bleises Folterkeller', 'Hier koennen kleine Kinder "gut" behandelt werden!', nil, nil, nil, Mensa, nil);

   //Ausgänge//

   Mensa.Osten := Bleises_Folterkeller;
   Mensa.Sueden := Schwimmbad;
   Schwimmbad.Norden := Mensa;
   Bleises_Folterkeller.Westen := Mensa;
   Schwimmbad.Sueden:=Bleises_Folterkeller;
   //Startwerte//

   aktuellerRaum := Schwimmbad;
   LabelRaum.caption := AktuellerRaum.Raumname;
   KampfProzedure.IstInKampf := False;

   //Spieler-start-stats//

   SpielerHP := 10;
   SpielerRK := 10;
   SpielerATK := 3;
   UIRefresh.UiRefresh();
end;

//--------------------------------Der Absolut------------------------------------//
//--------------------------------Heilige Button---------------------------------//

procedure TForm1.Button1Click(Sender: TObject);
var Eingabe : String;
begin
 Randomize;
 Eingabe := Edit1.text;

 //Befehlsauflistung: help//
 if (uppercase(Eingabe) = 'MIAU')
 then
     begin
      KampfProzedure.Kampf();
     end;
 if (uppercase(Eingabe) = 'HELP') or (uppercase(Eingabe) = 'HILFE') or (uppercase(Eingabe) = 'BEFEHLE')
 then
   begin
     Memo1.lines.add('help/Hilfe/Befehle: Befehlsauflistung');
     Memo1.lines.add('[Raumname]: Raumbeschreibung anzeigen');
     Memo1.lines.add('Norden/Osten/Sueden/Westen: In diese Richtung gehen');
     Memo1.lines.add('Zurueck: In die vorherige Richtung gehen');
     Memo1.lines.add('Angreifen: Im Kampf einen Gegner attackieren');
     Memo1.lines.add('Fliehen: Im Kampf zum vorherigen Raum fliehen');
   end;

 //Raumbeschreibungen//

 if uppercase(Eingabe) = 'SCHWIMMBAD'
 then Memo1.lines.add(Schwimmbad.beschreibung);
 if uppercase(Eingabe) = 'MENSA'
 then Memo1.lines.add(Mensa.beschreibung);
 if uppercase(Eingabe) = 'BLEISES_FOLTERKELLER'
 then Memo1.lines.add(Bleises_Folterkeller.beschreibung);

 //Raumwechsel//

 if uppercase(Eingabe) = 'NORDEN'        //Anstat den ganzen Code in jeder Eingabe zu haben wird nur noch eine Funktion "Raumwechsel" aufgerufen
 then
   begin
   RaumWechsel(AktuellerRaum.Norden);
 end;

 if uppercase(Eingabe) = 'OSTEN'
 then
 begin
     RaumWechsel(AktuellerRaum.Osten);
 end;

 if uppercase(Eingabe) = 'SUEDEN'
 then
 begin
    RaumWechsel(AktuellerRaum.Sueden);
 end;

 if uppercase(Eingabe) = 'WESTEN'
 then
 begin
    RaumWechsel(AktuellerRaum.Westen);
 end;

 if uppercase(Eingabe) = 'ZURUECK'
 then
 begin
   LabelRaum.caption := AktuellerRaum.Raumname;
 end;

 //------Kampf------//    //Angelehnt an das Pen&Paper-Kampfsystem//

 //Angreifen//

 if (uppercase(Eingabe) = 'ANGREIFEN') and (IstInKampf = true)
 then
 begin
 end;

//RefresUI
UIRefresh.UiRefresh()
end;

end.

