unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RichMemo, mTRaum, MTEnemy, Kampfprozedure, ProzedureRaumWechsel, UIRefresh,mTLoot,LootDrop,
  RaumUpdate;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    LabelMDUnverwendet: TLabel;
    MD: TLabel;
    LabelRaumBeschreibung: TLabel;
    NotRichMemo1: TMemo;
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
    Memo1: TRichMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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
  EmptyPreset:TRaum;
  //AnfangsVariablen für Setback nach Tod
  AnfangsRaum: TRaum;
  AnfangsHP:Integer;
  AnfangsRK:Integer;
  AnfangsAtk:Integer;
  MaxHP:Integer ;
  //Gegner//
  Mieses_Essen: TEnemy;
  Goblin: TEnemy;
  Ork: TEnemy;
  Oger: TEnemy;
  aktuellerGegner: TEnemy;
  //Helm//
  Kappe:Tloot;
  Lederhelm:TLoot;
  Eisenhelm:TLoot;
  Gnorignums_Schaedelplatte:TLoot;
  //Rüstung//
  Gewand:Tloot;
  Kettenhemd:Tloot;
  Stahlruestung:Tloot;
  Granitebrows_Stachelpanzer:Tloot;
  //Stiefel//
  Alte_Latschen:Tloot;
  Lederschuhe:Tloot;
  Eisenstiefel:Tloot;
  Bodenmalmer:Tloot;
  //Waffen//
  Verroteter_Klumpen:TLoot;
  Eisenstreitkolben:Tloot;
  Orkischer_Hammerzahn:Tloot;
  Gigantischer_Knochenmuerber:Tloot;
  Muerbes_Holzschwert:Tloot;
  Eisenschwert:Tloot;
  Geschmuecktes_Silberschwert:Tloot;
  Drachenzahn:Tloot;
  //Spieler Items
  SpielerHelm:Tloot;
  SpielerRuestung:Tloot;
  SpielerSchuhe:Tloot;
  SpielerWaffe:Tloot;
  //Implementation
  Eingabe : String;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
   Memo1.Lines.Clear;
   Memo1.Lines.Add ('Hallo, willkommen im Textadventure');
   //Typen sind Helm,Ruestung,Schuhe,Waffe
   //Helm-Loot//
   Kappe:=TLoot.create('Kappe','Helm','eine leichte Lederkappe','verschlissen',0,0,0);
   Lederhelm:=TLoot.create('Lederhelm','Helm','einen Lederhelm, der etwas Schutz bieten sollte,','normal',0,1,0);
   Eisenhelm:=TLoot.create('Eisenhelm','Helm','einen gut gebauten Eisenhelm','erlesen',0,3,0);
   Gnorignums_Schaedelplatte:=TLoot.create('gnorignums schädelplatte','Helm','gnorignums sagenhaften kopfschutz','magisch',5,5,0);
   //Rüstungs-Loot//
   Gewand:=TLoot.create('Gewand','Ruestung','ein einfaches Gewand','verschlissen',0,1,0);
   Kettenhemd:=TLoot.create('Kettenhemd','Ruestung','ein leichtes Kettenhemd','normal',0,3,0);
   Stahlruestung:=TLoot.create('Stahlrüstung','Ruestung','eine äußerst widerstandsfähgige Stahlrüstung','erlesen',2,5,0);
   Granitebrows_Stachelpanzer:=TLoot.create('Granitebrows Stachelpanzer','Ruestung','den legendären Stachelpanzer Granitebrows','magisch',5,10,1);
   //Stiefel-Loot//
   Alte_Latschen:=TLoot.create('Alte Latschen','Schuhe','ein Paar abgewetzter und vielgetragene Schuhe','verschlissen',0,0,0);
   Lederschuhe:=TLoot.create('Lederschuhe','Schuhe','ein Paar guter Lederschuhe','normal',0,1,0);
   Eisenstiefel:=TLoot.create('Eisenstiefel','Schuhe','ein Paar dicker Eisenstiefel','erlesen',0,3,0);
   Bodenmalmer:=TLoot.create('Bodenmalmer','Schuhe','die dir aus Geschichten bekannten Bodenmalmer','magisch',5,5,0);
   //Waffen-Loot//
   Verroteter_Klumpen:=TLoot.create('Verroteter Klumpen','Waffe','einen modrigen Klumpen, den man zum Zuschlagen verwenden könnte,','verschlissen',0,1,4);
   Eisenstreitkolben:=TLoot.create('Eisenstreitkolben','Waffe','einen benutzten Eisenstreitkolben','normal',0,2,7);
   Orkischer_Hammerzahn:=TLoot.create('Orkischer Hammerzahn','Waffe','einen für Kriege verwendeten orkischen Hammerzahn','erlesen',0,3,11);
   Gigantischer_Knochenmuerber:=TLoot.create('Gigantischer Knochenmürber','Waffe','einen der mächtigsten Streitkolben, den Gigantischen Knochenmürber,','magisch',0,4,22);
   Muerbes_Holzschwert:=TLoot.create('Mürbes Holzschwert','Waffe','ein mürbes Holzschwert, welches vielleicht etwas besser als die Faust ist,','verschlissen',1,0,4);
   Eisenschwert:=TLoot.create('Eisenschwert','Waffe','ein stumpfes Eisenschwert','normal',2,0,7);
   Geschmuecktes_Silberschwert:=TLoot.create('Geschmücktes Silberschwert','Waffe','ein hochwertiges Silberschwert voller Verzierungen','erlesen',3,0,11);
   Drachenzahn:=TLoot.create('Drachenzahn','Waffe','einen mächtigen Drachenzahn','magisch',4,0,22);
   //Gegner//
   Mieses_Essen := TEnemy.create ('Mieses Essen', 'Entspricht der Norm... von der Schule', 5, 5, 1,'zerfetzt');
   Goblin := TEnemy.create ('Goblin', 'einem kleinen flinken Wesen mit spitzen Zähnen',1, 1, 1,'zerfetzt');
   Ork := TEnemy.create ('Ork', 'einem grobschlächtigem Krieger mit blut unterlaufenen Augen ',15, 10, 1,'zerfetzt');
   Oger := TEnemy.create ('Oger', 'Abkömlinge der Riesen die dich mit gewaltigen Hieben erledigen können', 1,1, 1,'zerfetzt');

   //Räume//Hier am Besten nur lere Presetes erstellen und sie mit der Funktion RaumUpdate ändern
   //Räume müssen hier deklariert werden, aber zusätzlich in der RaumWechselProzedure eingetragen werden
   EmptyPreset:=TRaum.create('An Empty Preset','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Mensa := TRaum.create ('Mensa', 'Hier koennen kleine Kinder Pampe fressen!',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Schwimmbad := TRaum.create ('Schwimmbad', 'Hier koennen kleine Kinder in ihrer Pisse schwimmen!',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Bleises_Folterkeller := TRaum.create ('Bleises Folterkeller', 'Hier koennen kleine Kinder "gut" behandelt werden!',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);

   //RaumUpdate//
   //Die Prozedure RaumUpdate() braucht 6 Pointer und zwar den Raum der zu
   //ändern ist die Räume die in den HimmelsRichtungen um ihn herum liegen
   //und immoment den Gegner im Raum
   RaumUpdate.RaumUpdate(Mensa,nil,Schwimmbad,Bleises_Folterkeller,nil);
   RaumUpdate.RaumUpdate(Schwimmbad,nil,nil,nil,Mensa);
   RaumUpdate.RaumUpdate(Bleises_Folterkeller,Mensa,nil,nil,nil);
   //RaumUpdate AusgangsBeschreibungen
   RaumNamenUpdate(Mensa,'','Du tritts durch eine große Tür in einen Raum voller hießer Dämpfe','Durch die Trepper gelangst du in ein dunkles Verlies','');
   RaumNamenUpdate(Schwimmbad,'','','','Beim Öffnen der Türen schlägt dir ein übeleregender Gestank entgegnen');
   RaumNamenUpdate(Bleises_Folterkeller,'Beim Öffnen der Türen schlägt dir ein übeleregender Gestank entgegnen','','','');
   //Zusätzliches Update
   ZusaetzlicheUpdates(Mensa,'hard',100,5,50,false);
   ZusaetzlicheUpdates(Schwimmbad,'hard',100,1,70,false);      //Density von Hundert spawnt beim ersten Betreten
   ZusaetzlicheUpdates(Bleises_Folterkeller,'hard',100,20,25,false);      //Immer ein Monster
   //Startwerte//
   AnfangsRaum:=Bleises_Folterkeller;
   aktuellerRaum := AnfangsRaum;
   LabelRaum.caption := AktuellerRaum.Raumname;
   KampfProzedure.IstInKampf := False;
   //Spieler-Start-StatsNR2//
   AnfangsHP:=10;
   AnfangsRK:=10;
   AnfangsAtk:=3;
   //Spieler-start-stats//

   SpielerHP := AnfangsHP;
   SpielerRK := AnfangsRK;
   SpielerATK := AnfangsAtk;
   SpielerHelm:=Kappe;
   SpielerRuestung:=Gewand;
   SpielerSchuhe:=Alte_Latschen;
   SpielerWaffe:=Muerbes_Holzschwert;
   UIRefresh.UiRefresh();
end;

//--------------------------------Der Absolut------------------------------------//
//--------------------------------Heilige Button---------------------------------//

procedure TForm1.Button1Click(Sender: TObject);
begin
 Randomize;
 Eingabe := Edit1.text;

 //Befehlsauflistung: help //
 if (uppercase(Eingabe) = 'HELP') or (uppercase(Eingabe) = 'HILFE') or (uppercase(Eingabe) = 'BEFEHLE')  or (Eingabe='?') then
   begin
     Memo1.lines.add('');
     Memo1.lines.add('Help/Hilfe/Befehle: Befehlsauflistung');
     Memo1.lines.add('[Raumname]: Raumbeschreibung anzeigen');
     Memo1.lines.add('[Norden/Osten/Sueden/Westen]/[N/O/S/W]: In diese Richtung gehen');  //HIlfe Stellung
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

 else if (uppercase(Eingabe) = 'NORDEN') or (uppercase(Eingabe)='NORD') or (uppercase(Eingabe)='N')       //Anstatt den ganzen Code in jeder Eingabe zu haben wird nur noch eine Funktion "Raumwechsel" aufgerufen
 then
   begin
   RaumWechsel(AktuellerRaum.Norden);
 end

 else if (uppercase(Eingabe) = 'OSTEN') or (uppercase(Eingabe)='OST') or (uppercase(Eingabe)='O')
 then
 begin
     RaumWechsel(AktuellerRaum.Osten);
 end

 else if (uppercase(Eingabe) = 'SUEDEN') or (uppercase(Eingabe)='SUED') or (uppercase(Eingabe)='S')
 then
 begin
    RaumWechsel(AktuellerRaum.Sueden);
 end

 else if (uppercase(Eingabe) = 'WESTEN') or (uppercase(Eingabe)='WEST') or (uppercase(Eingabe)='W')
 then
 begin
    RaumWechsel(AktuellerRaum.Westen);
 end
 else if uppercase(Eingabe) = 'PICK'
 then
 begin
    LootDrop.Pickup();
 end
 //else if uppercase(Eingabe) = 'HUNT' then
 //begin
 //     RaumWechsel(aktuellerRaum)
 //end
 else if uppercase(Eingabe) = 'ZURUECK'
 then
 begin
   LabelRaum.caption := vorherigerRaum.Raumname;          //NOch nicht korrekt
   aktuellerRaum:=vorherigerRaum;
 end
 //Angreifen//

 else if (uppercase(Eingabe) = 'ANGREIFEN')
 then
 Kampf()
 else
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
 //Inventar Knöpfe
procedure TForm1.Button2Click(Sender: TObject);
begin
   Memo1.lines.add(SpielerHelm.Beschreibung)
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Memo1.lines.add(SpielerRuestung.Beschreibung)
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.lines.add(SpielerSchuhe.Beschreibung)
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo1.lines.add(SpielerWaffe.Beschreibung)
end;

end.

