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

   //Gegner//

   LabelGegner.Caption := 'Kein Gegner';
   Mieses_Essen := TEnemy.create ('Mieses Essen', 'Entspricht der Norm... von der Schule', 5, 5, 1);

   //Räume//

   Mensa := TRaum.create ('Mensa', 'Hier koennen kleine Kinder Pampe fressen!', nil, Bleises_Folterkeller, Schwimmbad, nil, Mieses_Essen);
   Schwimmbad := TRaum.create ('Schwimmbad', 'Hier koennen kleine Kinder in ihrer Pisse schwimmen!', Mensa, nil, nil, nil, nil);
   Bleises_Folterkeller := TRaum.create ('Bleises Folterkeller', 'Hier koennen kleine Kinder "gut" behandelt werden!', nil, nil, nil, Mensa, nil);

   //Ausgänge//

   Mensa.Osten := Bleises_Folterkeller;
   Mensa.Sueden := Schwimmbad;
   Schwimmbad.Norden := Mensa;
   Bleises_Folterkeller.Westen := Mensa;

   //Startwerte//

   aktuellerRaum := Schwimmbad;
   vorherigerRaum := aktuellerRaum;
   LabelRaum.caption := AktuellerRaum.Raumname;
   Kampf := False;

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
var Eingabe : String; Wurf, Wurfgegner, Initiative : Integer;
begin
 Randomize;
 Eingabe := Edit1.text;

 //Raumbeschreibungen//

 if uppercase(Eingabe) = 'SCHWIMMBAD'
 then Memo1.lines.add(Schwimmbad.beschreibung);
 if uppercase(Eingabe) = 'MENSA'
 then Memo1.lines.add(Mensa.beschreibung);
 if uppercase(Eingabe) = 'BLEISES_FOLTERKELLER'
 then Memo1.lines.add(Bleises_Folterkeller.beschreibung);

 //Raumwechsel//

 if uppercase(Eingabe) = 'NORDEN'
 then
 begin
   if AktuellerRaum.Norden = nil                                    //Geht es dort lang?
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Norden;
      LabelRaum.caption := AktuellerRaum.Raumname;
      if aktuellerRaum.Enemy = nil                                  //Ist dort ein Gegner?
      then
        begin
          Kampf := False;
        end
      else
        begin
          Kampf := True;
          aktuellerGegner := aktuellerRaum.Enemy;
          LabelGegner.Caption := aktuellerRaum.Enemy.Enemyname;
          LabelGegnerHP.Caption := InttoStr(aktuellerGegner.HP);
          Initiative := random(2);
        end;
     end;
 end;

 if uppercase(Eingabe) = 'OSTEN'
 then
 begin
   if AktuellerRaum.Osten = nil
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Osten;
      LabelRaum.caption := AktuellerRaum.Raumname;
      if aktuellerRaum.Enemy = nil                                  //Ist dort ein Gegner?
      then
        begin
          Kampf := False;
        end
      else
        begin
          Kampf := True;
          aktuellerGegner := aktuellerRaum.Enemy;
          LabelGegner.Caption := aktuellerRaum.Enemy.Enemyname;
          LabelGegnerHP.Caption := InttoStr(aktuellerGegner.HP);
          Initiative := random(2);
        end;
     end;
 end;

 if uppercase(Eingabe) = 'SUEDEN'
 then
 begin
   if AktuellerRaum.Sueden = nil
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Sueden;
      LabelRaum.caption := AktuellerRaum.Raumname;
      if aktuellerRaum.Enemy = nil                                  //Ist dort ein Gegner?
      then
        begin
          Kampf := False;
        end
      else
        begin
          Kampf := True;
          aktuellerGegner := aktuellerRaum.Enemy;
          LabelGegner.Caption := aktuellerRaum.Enemy.Enemyname;
          LabelGegnerHP.Caption := InttoStr(aktuellerGegner.HP);
          Initiative := random(2);
        end;
     end;
 end;

 if uppercase(Eingabe) = 'WESTEN'
 then
 begin
   if AktuellerRaum.Westen = nil
   then Memo1.lines.add('Da ist kein Raum!')
   else
     begin
      vorherigerRaum := aktuellerRaum;
      aktuellerRaum := AktuellerRaum.Westen;
      LabelRaum.caption := AktuellerRaum.Raumname;
      if aktuellerRaum.Enemy = nil                                  //Ist dort ein Gegner?
      then
        begin
          Kampf := False;
        end
      else
        begin
          Kampf := True;
          aktuellerGegner := aktuellerRaum.Enemy;
          LabelGegner.Caption := aktuellerRaum.Enemy.Enemyname;
          LabelGegnerHP.Caption := InttoStr(aktuellerGegner.HP);
          Initiative := random(2);
        end;
     end;
 end;

 if uppercase(Eingabe) = 'ZURUECK'
 then
 begin
   aktuellerRaum := VorherigerRaum;
   LabelRaum.caption := AktuellerRaum.Raumname;
 end;

 //------Kampf------//    //Angelehnt an das Pen&Paper-Kampfsystem//

 //Angreifen//

 if (uppercase(Eingabe) = 'ANGREIFEN') and (Kampf = true)
 then
 begin
   if Initiative = 0                                                //Bei In=0: Gegner
   then                                                             //fängt an
     begin
       Wurf := random(20) + 1 + SpielerATK;                         //Wurf des Spielers
       Wurfgegner := random(20) + 1 + aktuellerGegner.ATK;          //Wurf des Gegners
       if SpielerRK < Wurfgegner                                    //Trifft Gegner?
       then
         begin
           SpielerHP := SpielerHP - aktuellerGegner.ATK;
           Memo1.lines.add('Der Gegner hat dich getroffen');
           LabelHP.Caption := InttoStr(SpielerHP);
         end
       else
         begin
           Memo1.lines.add('Der Gegner hat dich verfehlt!');
         end;
       sleep(2000);
       if aktuellerGegner.RK < Wurf                                 //Trifft Spieler?
       then
         begin
           aktuellerGegner.HP := aktuellerGegner.HP - SpielerATK;
           Memo1.lines.add('Du hast den Gegner getroffen!');
           LabelGegnerHP.Caption := InttoStr(aktuellerGegner.ATK);
         end
       else
         begin
           Memo1.lines.add('Du hast den Gegner verfehlt!');
         end;
     end
   else                                                             //Bei In=1: Spieler
     begin                                                          //fängt an
       Wurf := random(20) + 1 + SpielerATK;                         //(Wie oben, aber um-
       Wurfgegner := random(20) + 1 + aktuellerGegner.ATK;          //gekehrt)
       if aktuellerGegner.RK < Wurf
       then
         begin
           aktuellerGegner.HP := aktuellerGegner.HP - SpielerATK;
           Memo1.lines.add('Du hast den Gegner getroffen!');
           LabelGegnerHP.Caption := InttoStr(aktuellerGegner.ATK);
         end
       else
         begin
           Memo1.lines.add('Du hast den Gegner verfehlt!');
         end;
       sleep(3000);
       if SpielerRK < Wurfgegner
       then
         begin
           SpielerHP := SpielerHP - aktuellerGegner.ATK;
           Memo1.lines.add('Der Gegner hat dich getroffen');
           LabelHP.Caption := InttoStr(SpielerHP);
         end
       else
         begin
           Memo1.lines.add('Der Gegner hat dich verfehlt!');
         end;
     end;
 end;

 //Flucht//

 if (uppercase(Eingabe) = 'FLIEHEN') and (Kampf = true)
 then
 begin
   Wurfgegner := random(20) + 1 + aktuellerGegner.ATK;              //Wurf des Gegners
   if SpielerRK < Wurfgegner                                        //Trifft Gegner?
   then
     begin
      SpielerHP := SpielerHP - round(aktuellerGegner.ATK div 2);    //Halber Schaden
      LabelHP.Caption := InttoStr(SpielerHP);
      aktuellerRaum := VorherigerRaum;                              //Flucht geht in
      LabelRaum.caption := AktuellerRaum.Raumname;                  //vorherigen Raum
    end
   else
      begin
       aktuellerRaum := VorherigerRaum;
       LabelRaum.caption := AktuellerRaum.Raumname;
      end;
 end;

//function TForm1.Angriff
end;

end.

