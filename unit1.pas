unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  mTRaum, MTEnemy;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Labeleingabeunverwendet: TLabel;
    LabelHPunverwendet: TLabel;
    LabelHP: TLabel;
    LabelRKunverwendet: TLabel;
    LabelRK: TLabel;
    LabelATKunverwendet: TLabel;
    LabelATK: TLabel;
    LabelRaum: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  //Räume//
  Schwimmbad: TRaum;
  Mensa: TRaum;
  Bleises_Folterkeller: TRaum;

  aktuellerRaum, vorherigerRaum: TRaum;
  //Gegner//
  Mieses_Essen: TEnemy;
  aktuellerGegner: TEnemy;

  SpielerHP, SpielerRK, SpielerATK: Integer;  //Angelehnt an das Pen&Paper-Kampfsystem//
  Kampf: Boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   Memo1.Lines.Add ('Hallo, willkommen im Textadventure');

   //Räume//

   Mensa := TRaum.create ('Mensa', 'Hier koennen kleine Kinder Pampe fressen!', nil, Bleises_Folterkeller, Schwimmbad, nil);
   Schwimmbad := TRaum.create ('Schwimmbad', 'Hier koennen kleine Kinder in ihrer Pisse schwimmen!', Mensa, nil, nil, nil);
   Bleises_Folterkeller := TRaum.create ('Bleises Folterkeller', 'Hier koennen kleine Kinder "gut" behandelt werden!', nil, nil, nil, Mensa);

   //Ausgänge//

   Mensa.Osten := Bleises_Folterkeller;
   Mensa.Sueden := Schwimmbad;
   Schwimmbad.Norden := Mensa;
   Bleises_Folterkeller.Westen := Mensa;

   //Gegner//

   Mieses_Essen := TEnemy.create ('Mieses Essen', 'Entspricht der Norm... von der Schule', 5, 5, 1, Mensa);

   //Startraum//

   aktuellerRaum := Mensa;
   vorherigerRaum := aktuellerRaum;
   LabelRaum.caption := AktuellerRaum.Raumname;

   //Spieler-start-stats//

   SpielerHP := 10;
   SpielerRK := 10;
   SpielerATK := 3;
   LabelHP.Caption := InttoStr(SpielerHP);
   LabelRK.Caption := InttoStr(SpielerRK);
   LabelATK.Caption := InttoStr(SpielerATK);
end;

//--------------------------------Der Absolut------------------------------------//
//--------------------------------Heilige Button---------------------------------//

procedure TForm1.Button1Click(Sender: TObject);
var Eingabe : String; Wurf, Wurfgegner : Integer;
begin
 Randomize;
 Eingabe := Edit1.text;

 //Raumbeschreibungen//

 if Eingabe = 'Schwimmbad'
 then Memo1.lines.add(Schwimmbad.beschreibung);
 if Eingabe = 'Mensa'
 then Memo1.lines.add(Mensa.beschreibung);
 if Eingabe = 'Bleises_Folterkeller'
 then Memo1.lines.add(Bleises_Folterkeller.beschreibung);

 //Raumwechsel//

 if Eingabe = 'Norden'
 then
 begin
   if AktuellerRaum.Norden = nil
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Norden;
      LabelRaum.caption := AktuellerRaum.Raumname;
     end;
 end;

 if Eingabe = 'Osten'
 then
 begin
   if AktuellerRaum.Osten = nil
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Osten;
      LabelRaum.caption := AktuellerRaum.Raumname;
     end;
 end;

 if Eingabe = 'Sueden'
 then
 begin
   if AktuellerRaum.Sueden = nil
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Sueden;
      LabelRaum.caption := AktuellerRaum.Raumname;
     end;
 end;

 if Eingabe = 'Westen'
 then
 begin
   if AktuellerRaum.Westen = nil
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Westen;
      LabelRaum.caption := AktuellerRaum.Raumname;
     end;
 end;

 if Eingabe = 'Zurueck'
 then
 begin
   aktuellerRaum := VorherigerRaum;
   LabelRaum.caption := AktuellerRaum.Raumname;
 end;

 //------Kampf------//    //Angelehnt an das Pen&Paper-Kampfsystem//

 //Flucht//

 // if Eingabe = 'Fliehen' and Kampf = true
 // then
 // begin
 //   Wurf := random(20) + 1 + SpielerRK;
 //   Wurfgegner := random(20) + 1 + aktuellerGegner.ATK;
 //   if Wurf < Wurfgegner
 //   then
 //     begin
 //      SpielerHP := SpielerHP - round(aktuellerGegner.ATK div 2);
 //      LabelHP.Caption := InttoStr(SpielerHP);
 //      aktuellerRaum := VorherigerRaum;
 //      LabelRaum.caption := AktuellerRaum.Raumname;
 //    end
 //   else
 //     begin
 //       aktuellerRaum := VorherigerRaum;
 //       LabelRaum.caption := AktuellerRaum.Raumname;
 //     end;
 // end;
end;

end.

