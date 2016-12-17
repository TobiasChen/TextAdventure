unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  mTRaum, MTEnemy,Kampfprozedure,ProzedureRaumWechsel,UIRefresh,RaumUpdate;

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
  EmptyPreset:TRaum;
  //AnfangsVariablen für Setback nach Tod
  AnfangsRaum: TRaum;
  AnfangsHP:Integer;
  AnfangsRK:Integer;
  //Gegner//
  Mieses_Essen: TEnemy;
  aktuellerGegner: TEnemy;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   Memo1.Lines.Add ('Hallo, willkommen im Textadventure');

   //Gegner//
   Mieses_Essen := TEnemy.create ('Mieses Essen', 'Entspricht der Norm... von der Schule', 5, 5, 1);

   //Räume//Hier am Besten nur lere Presetes erstellen und sie mit der Funktion RaumUpdate ändern
   EmptyPreset:=TRaum.create('An Empty Preset','to quickly create Rooms',nil,nil,nil,nil,nil);
   Mensa := TRaum.create ('Mensa', 'Hier koennen kleine Kinder Pampe fressen!',nil,nil,nil,nil,nil);
   Schwimmbad := TRaum.create ('Schwimmbad', 'Hier koennen kleine Kinder in ihrer Pisse schwimmen!',nil,nil,nil,nil,nil);
   Bleises_Folterkeller := TRaum.create ('Bleises Folterkeller', 'Hier koennen kleine Kinder "gut" behandelt werden!',nil,nil,nil,nil,nil);

   //RaumUpdate//
   //Die Prozedure braucht 6 Pointer,den Raum der zu ändern ist
   //die Räume die in den HimmelsRichtungen um ihn herum liegen
   //und immoment den Gegner im Raum
   RaumUpdate.RaumUpdate(Mensa,nil,Schwimmbad,Bleises_Folterkeller,nil,nil);
   RaumUpdate.RaumUpdate(Schwimmbad,nil,nil,nil,Mensa,nil);
   RaumUpdate.RaumUpdate(Bleises_Folterkeller,Mensa,nil,nil,nil,nil);
   //Startwerte//
   AnfangsRaum:=Bleises_Folterkeller;
   aktuellerRaum := AnfangsRaum;
   LabelRaum.caption := AktuellerRaum.Raumname;
   KampfProzedure.IstInKampf := False;
   //Spieler-Start-StatsNR2//
   AnfangsHP:=10;
   AnfangsRK:=10;
   //Spieler-start-stats//

   SpielerHP := AnfangsHP;
   SpielerRK := AnfangsRK;
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

 //Befehlsauflistung: help //
 if (uppercase(Eingabe) = 'HELP') or (uppercase(Eingabe) = 'HILFE') or (uppercase(Eingabe) = 'BEFEHLE')  or (Eingabe='?') then
   begin
     Memo1.lines.add('');
     Memo1.lines.add('help/Hilfe/Befehle: Befehlsauflistung');
     Memo1.lines.add('[Raumname]: Raumbeschreibung anzeigen');
     Memo1.lines.add('Norden/Osten/Sueden/Westen: In diese Richtung gehen');  //HIlfe Stellung
     Memo1.lines.add('Zurueck: In die vorherige Richtung gehen');
     Memo1.lines.add('Angreifen: Im Kampf einen Gegner attackieren');
     Memo1.lines.add('Fliehen: Im Kampf zum vorherigen Raum fliehen');
   end

 //Raumbeschreibungen//

 else if (uppercase(Eingabe) = 'SCHWIMMBAD') then
 Memo1.lines.add(Schwimmbad.beschreibung)
 else if (uppercase(Eingabe) = 'MENSA') then
 Memo1.lines.add(Mensa.beschreibung)
 else if (uppercase(Eingabe) = 'BLEISES_FOLTERKELLER') then
 Memo1.lines.add(Bleises_Folterkeller.beschreibung)

 //Raumwechsel//

 else if uppercase(Eingabe) = 'NORDEN'        //Anstat den ganzen Code in jeder Eingabe zu haben wird nur noch eine Funktion "Raumwechsel" aufgerufen
 then
   begin
   RaumWechsel(AktuellerRaum.Norden);
 end

 else if uppercase(Eingabe) = 'OSTEN'
 then
 begin
     RaumWechsel(AktuellerRaum.Osten);
 end

 else if (uppercase(Eingabe) = 'SÜDEN') or   (uppercase(Eingabe) = 'SUEDEN')
 then
 begin
    RaumWechsel(AktuellerRaum.Sueden);
 end

 else if uppercase(Eingabe) = 'WESTEN'
 then
 begin
    RaumWechsel(AktuellerRaum.Westen);
 end

 else if uppercase(Eingabe) = 'ZURUECK'
 then
 begin
   LabelRaum.caption := AktuellerRaum.Raumname;
 end

 //Angreifen//

 else if (uppercase(Eingabe) = 'ANGREIFEN')
 then
 Kampf()
 else if Eingabe = '' then
 begin
 Memo1.lines.add('');
 Memo1.lines.add('Schreibe etwas in die Box um mit der Welt zu interagieren');
 Memo1.lines.add('Für Hilfe schreibe ?');
 end;
 //ELSE IF Schleife muss gefixt werden, sodaß bei unerkannter Eingabe die Hilfe angezeigt wird //
 //else
 //Memo1.lines.add('Unbekannte Eingabe');
 //Memo1.lines.add('Liste der Befehle mit : ?');//Hilfe Ausgabe bei unerkannter Eingabe

//RefresUI

UIRefresh.UiRefresh()
end;

end.

