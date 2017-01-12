unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RichMemo, mTRaum, MTEnemy, Kampfprozedure, ProzedureRaumWechsel, UIRefresh,
  mTLoot,LootDrop,RaumUpdate,Map;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
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
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  //Räume//
  EmptyPreset:TRaum;
  Spinnennest:TRaum;
  Spinnenkammer:TRaum;
  Waldlichtung:TRaum;
  Hoehle:TRaum;
  Tautropfwald:TRaum;
  Weggabelung:TRaum;
  Hoehleneingang:TRaum;
  Lagerhalle:TRaum;
  Feuerschlot:TRaum;
  Abgrund_des_brennenden_Steins:TRaum;
  Waldweg:TRaum;
  Grosse_Blumenwiese:TRaum;
  Kaserne:TRaum;
  Schlafgemach:TRaum;
  Einsame_Herberge:TRaum;
  Graumoor:TRaum;
  Schattenweiden:TRaum;
  Westweg:TRaum;
  Bruecke:TRaum;
  Augvea:TRaum;
  Ostweg:TRaum;
  Oestliche_Huegel:TRaum;
  Verlassene_Burg:TRaum;
  Wachturm:TRaum;
  Kleiner_See:TRaum;
  Strasse_in_den_Sueden:TRaum;
  Tal:TRaum;
  Goblinstamm:TRaum;
  Karawane:TRaum;
  Am_schnellen_Bach:TRaum;
  Traenenwald:TRaum;
  Baerenhoehle:TRaum;
  Spitzdorf:TRaum;
  Der_grosse_Heuler:TRaum;
  Der_Sonnenstich:TRaum;
  //AnfangsVariablen für Setback nach Tod
  AnfangsRaum: TRaum;
  AnfangsHP:Integer;
  AnfangsRK:Integer;
  AnfangsAtk:Integer;
  MaxHP:Integer;
  //Gegner//
  Mieses_Essen: TEnemy;
  Goblin: TEnemy;
  Ork: TEnemy;
  Oger: TEnemy;				
  Goblinhaeuptling: TEnemy;		
  Wolf: TEnemy;					
  Spinnenschwarm: TEnemy;		
  Riesenspinne: TEnemy;			
  Rolf: TEnemy;					
  Untoter: TEnemy;				
  Bewaffneter_Untoter: TEnemy;	
  Untoter_Ritter: TEnemy;		
  Fliegendes_Schwert: TEnemy;  	
  Riesenfledermaus: TEnemy;		
  Feuerelementar: TEnemy;		
  Bandit: TEnemy;				
  Schleim: TEnemy;				
  Baer: TEnemy;					
  Skorpione: TEnemy;			
  Schattenkraehe: TEnemy;		
  Mumie: TEnemy;				
  Sumpfhexe: TEnemy;			
  Der_Gestuerzte_Koenig: TEnemy;
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
  Alte_Latscher:Tloot;
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
   Memo1.Lines.Add ('Du kannst dich mit dem Namen der Richung[Norden/Nord/N] bewegen');
      Memo1.Lines.Add ('Hilfe findest du mit ?');
         Memo1.Lines.Add ('Du kannst mit "camp" schlafen und HP regenrieren');
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
   Alte_Latscher:=TLoot.create('Alte_Latscher','Schuhe','ein Paar abgewetzter und vielgetragene Schuhe','verschlissen',0,0,0);
   Lederschuhe:=TLoot.create('Lederschuhe','Schuhe','ein Paar guter Lederschuhe','normal',0,1,0);
   Eisenstiefel:=TLoot.create('Eisenstiefel','Schuhe','ein Paar dicker Eisenstiefel','magisch',0,3,0);
   Bodenmalmer:=TLoot.create('Bodenmalmer','Schuhe','die dir aus Geschichten bekannten Bodenmalmer','erlesen',5,5,0);
   //Waffen-Loot//
   Verrotteter_Klumpen:=TLoot.create('Verrotteter Klumpen','Waffe','einen modrigen Klumpen, den man zum Zuschlagen verwenden könnte,','verschlissen',0,1,4);
   Eisenstreitkolben:=TLoot.create('Eisenstreitkolben','Waffe','einen benutzten Eisenstreitkolben','normal',0,2,7);
   Orkischer_Hammerzahn:=TLoot.create('Orkischer Hammerzahn','Waffe','einen für Kriege verwendeten orkischen Hammerzahn','erlesen',0,3,11);
   Gigantischer_Knochenmuerber:=TLoot.create('Gigantischer Knochenmürber','Waffe','einen der mächtigsten Streitkolben, den Gigantischen Knochenmürber,','magisch',0,4,22);
   Muerbes_Holzschwert:=TLoot.create('Mürbes Holzschwert','Waffe','ein mürbes Holzschwert, welches vielleicht etwas besser als die Faust ist,','verschlissen',1,0,4);
   Eisenschwert:=TLoot.create('Eisenschwert','Waffe','ein stumpfes Eisenschwert','normal',2,0,7);
   Geschmuecktes_Silberschwert:=TLoot.create('Geschmücktes Silberschwert','Waffe','ein hochwertiges Silberschwert voller Verzierungen','erlesen',3,0,11);
   Drachenzahn:=TLoot.create('Drachenzahn','Waffe','einen mächtigen Drachenzahn','magisch',4,0,22);
   //Gegner//
   //Var				:= TEnemy.create('Name','Beschreibung',HP,RK,ATK,'Loot_Type');
   
			//Wald und offene Welt//
   Ork 					:= TEnemy.create('Ork', 'einem Krieger mit Blutunerlaufenen Augen', 11,14,3,'normal');
   Oger					:= TEnemy.create('Oger', 'einem Abkömmlinge der Riesen mit einer Keule', 15,15, 4,'erlesen');
   Goblin 				:= TEnemy.create('Goblin', 'einem kleinen Wesen ,dass erstaunlich flink ist,',3, 12, 2,'verschlissennormal');
   Goblinhaeuptling		:= TEnemy.create('Goblinhäuptling','einem mächtiger erscheinendem Goblin voller Schmuck',20,15,4,'erlesen');
   Wolf					:= TEnemy.create('Wolf','einem zähnefletschendem Pelzbiest',5,12,2,'verschlissen');
   Baer					:= TEnemy.create('Bär','einem bösen Bären mit großen Pranken',25,15,5,'normalerlesen');
   Schattenkraehe		:= TEnemy.create('Schattenkraehe','einem Vogel schwärzer als die Nacht',12,17,3,'verschlissennormal');
   Bandit				:= TEnemy.create('Bandit','einer Person, die dein Geld will,',10,13,2,'verschlissennormal');
   
			//Höhle//
   Spinnenschwarm		:= TEnemy.create('Spinnenschwarm','unzähligen Spinnen, die es auf dich abgesehen haben,',40,2,1,'verschlissennormal');
   Riesenspinne			:= TEnemy.create('Riesenspinne','einer gigantischen Spinne, die ihre jungen füttern will,',25,7,5,'erlesenmagisch');
   Riesenfledermaus		:= TEnemy.create('Riesenfledermaus','einer übergroßen Fledermaus, die dich aus dem Dunkeln überrascht',7,15,2,'normal');
   
			//Herberge//
   Rolf					:= TEnemy.create('Rolf','dem unheimlichen Rolf',15,10,3,'normal');
   
			//Rolf//
   Untoter				:= TEnemy.create('Untoter','einem stinkendem und halb verrottetem Humanoiden',8,9,2,'verschlissennormal');
   Bewaffneter_Untoter	:= TEnemy.create('Bewaffneter Untoter','einem stinkendem und halb verrottetem Humanoiden mit einer Waffe',8,9,4,'normal');
   Untoter_Ritter		:= TEnemy.create('Untoter Ritter','einem stinkendem und halb verrottetem Humanoiden in prächtiger Rüstung',25,14,4,'normalerlesen');
   Fliegendes_Schwert  	:= TEnemy.create('Fliegendes Schwert','einer plötzlich nach dir schlagenden Waffe',5,18,3,'erlesen');
   Der_Gestuerzte_Koenig:= TEnemy.create('Der Gestürzte König','dem früheren König dieser Lande. Er ist einem Fluch unterlegen und du wirst von ihm bei erblicken',60,20,8,'magisch');
   
			//Vulkan//
   Feuerelementar		:= TEnemy.create('Feuerelementar','sich scheinbar kontrolliert bewegendem, dass nach dir ausschlägt,',45,19,6,'magisch');
   
			//Wüste//
   Skorpione			:= TEnemy.create('Skorpione','einigen kleinen und wirklich giftigen Skorpionen',5,18,8,'verschlissen');	
   Mumie				:= TEnemy.create('Mumie','einem einbalsamierten Mumienwesen voller magischer Macht',20,16,4,'erlesenmagisch');
   
			//Sumpf//
   Schleim				:= TEnemy.create('Schleim','grünem, alles verdauendem Glibber',17,10,3,'normal');		
   Sumpfhexe			:= TEnemy.create('Sumpfhexe','einer hässlichen Frau mit warziger Nase und krummer Haltung',22,13,5,'erlesenmagisch');

   //Räume//Hier am Besten nur lere Presetes erstellen und sie mit der Funktion RaumUpdate ändern
   //Räume müssen hier deklariert werden, aber zusätzlich in der RaumWechselProzedure eingetragen werden
   EmptyPreset					:=TRaum.create('An Empty Preset','to quickly create Rooms',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Spinnennest					:=TRaum.create('Spinnennest','An der gesamten Höhlenwand sind Kokons zu sehen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Spinnenkammer				:=TRaum.create('Spinnenkammer','In dieser Höhle wimmelt es von Spinnen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Waldlichtung					:=TRaum.create('Waldlichtung','Die Sonne auf dem Gesicht tut dir gut',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Hoehle						:=TRaum.create('Höhle','Ein modriger Geruch kommt von weiter Innen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Abgrund_des_brennenden_Steins:=TRaum.create('Abgrund des brennenden Steins','Im inneren des Abgrunds fließt der brennende Stein',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Tautropfwald					:=TRaum.create('Tautropfwald','Überall hörst du Wasser von den Bäumen tropfen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Weggabelung					:=TRaum.create('Weggabelung','Der Weg gabelt sich hier nach West und Ost',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Hoehleneingang				:=TRaum.create('Höhleneingang','Beim Anblick dieser dunklen Höhle wird dir etwas mulmig',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Lagerhalle					:=TRaum.create('Lagerhalle','Hier gibt es viele Sachen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Feuerschlot					:=TRaum.create('Feuerschlot','Der heiße Gestank von Schwefel und Asche umgibt dich',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Oeder_Morast 				:=TRaum.create('Öder Morast','Du bist umgeben von Nebel',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Waldweg						:=TRaum.create('Waldweg','Du siehst den Wald und auf der anderen Seite Augvea',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Grosse_Blumenwiese			:=TRaum.create('Große Blumenwiese','Deine Nase wird von verschiedensten Gerüchen betört',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Apfelwiese					:=TRaum.create('Apfelwiese','Die Äpfel der aufgegebenen Baumschule sehen nicht sehr appetitlich aus',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Kaserne						:=TRaum.create('Kaserne','Der Ruheort der Soldaten und Wächter - doch sie fehlen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Schlafgemach					:=TRaum.create('Schlafgemach','Der Besitzer der Burg besaß ein wirklich großes Bett',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Einsame_Herberge				:=TRaum.create('Einsame Herberge','Diese Herberge ist einsam, verlassen, verstaubt und dreckig',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Graumoor						:=TRaum.create('Graumoor','Dir fröstelt es etwas in diesem Morast',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Schattenweiden				:=TRaum.create('Schattenweiden','Die Schattenweiden des Graumoors scheinen überall hinzugreifen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Westweg						:=TRaum.create('Westweg','Auf diesem gut befestigten Weg kommst du gut voran',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Bruecke						:=TRaum.create('Brücke','Unter dir rauscht der Fluss',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Augvea						:=TRaum.create('Augvea','Das rege Treiben der Stadt zeugt von Zivilisation',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Ostweg						:=TRaum.create('Ostweg','Der Weg ist Umgeben von schönem Gelände',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Oestliche_Huegel				:=TRaum.create('Östliche Hügel','Die sanften Hügel machen das Vorankommen beschwerlicher',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Verlassene_Burg				:=TRaum.create('Verlassene Burg','Diese Burg ist mysteriöserweise verlassen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Wachturm						:=TRaum.create('Wachturm','Hier wacht keiner mehr',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Kleiner_See					:=TRaum.create('Kleiner See','Das sanfte Rauschen des Wassers entspannt dich',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Strasse_in_den_Sueden		:=TRaum.create('Straße in den Süden','Diese Straße wird häufig von Händlern verwendet',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Tal							:=TRaum.create('Tal','Die Stille misfällt dir',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Grosse_Duene					:=TRaum.create('Große Düne','Der Sand bildete einen stattlichen Hügel',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   MetSchallWueste				:=TRaum.create('Met´Schall-Wüste','Der Durst befällt dich bei der prallenden Sonne',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Goblinstamm					:=TRaum.create('Goblinstamm','Angespannt bist du bereit für einen Kampf gegen einen Goblin',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Karawane						:=TRaum.create('Karawane','Hier rasten die Händler',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Am_schnellen_Bach			:=TRaum.create('Am schnellen Bach','Aus dem Tränenwald läuft ein Bach in den Fluss',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Traenenwald					:=TRaum.create('Tränenwald','Aus den Tiefen des Waldes hörst du ein gequältes Kind',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Baerenhoehle					:=TRaum.create('Bärenhöhle','In der Höhle siehst du ein kleines Skelett',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Spitzdorf					:=TRaum.create('Spitzdorf','In diesem ruhigen Dorf kann man gut rasten',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Kraehenhort					:=TRaum.create('Krähenhort','Ein unheimlicher Friedhof im Wald - voller Krähen',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Der_Grosse_Heuler			:=TRaum.create('Der Große Heuler','In der Rinde dieser großen Eiche erkennst du weinende Gesichter',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);
   Der_Sonnenstich				:=TRaum.create('Der Sonnenstich','Alle 10.000 Jahre soll dieser Berg die Sonne berühren',nil,nil,nil,nil,nil,'','','','',0,'',0,0,0,false,false);

   //RaumUpdate//
   //Die Prozedure RaumUpdate() braucht 6 Pointer und zwar den Raum der zu
   //ändern ist die Räume die in den HimmelsRichtungen um ihn herum liegen
   //RaumUpdate.RaumUpdate(,nil,nil,nil,nil);
   RaumUpdate.RaumUpdate(Spinnennest,nil,Spinnenkammer,nil,nil);
   RaumUpdate.RaumUpdate(Spinnenkammer,nil,nil,Hoehle,Spinnennest);
   RaumUpdate.RaumUpdate(Waldlichtung,nil,nil,Tautropfwald,nil);
   RaumUpdate.RaumUpdate(Hoehle,Spinnenkammer,nil,Hoehleneingang,nil);
   RaumUpdate.RaumUpdate(Abgrund_des_brennenden_Steins,nil,nil,Feuerschlot,nil);
   RaumUpdate.RaumUpdate(Tautropfwald,Waldlichtung,Weggabelung,nil,nil);
   RaumUpdate.RaumUpdate(Weggabelung,nil,Hoehleneingang,Waldweg,Tautropfwald);
   RaumUpdate.RaumUpdate(Hoehleneingang,Hoehle,nil,Grosse_Blumenwiese,Weggabelung);
   RaumUpdate.RaumUpdate(Lagerhalle,nil,nil,Schlafgemach,nil);
   RaumUpdate.RaumUpdate(Feuerschlot,Abgrund_des_brennenden_Steins,Oeder_Morast,Graumoor,nil);
   RaumUpdate.RaumUpdate(Oeder_Morast,nil,nil,Schattenweiden,Feuerschlot);
   RaumUpdate.RaumUpdate(Waldweg,Weggabelung,Grosse_Blumenwiese,Augvea,nil);
   RaumUpdate.RaumUpdate(Grosse_Blumenwiese,Hoehleneingang,Apfelwiese,Ostweg,Augvea);
   RaumUpdate.RaumUpdate(Apfelwiese,nil,nil,Oestliche_Huegel,Grosse_Blumenwiese);
   RaumUpdate.RaumUpdate(Kaserne,nil,Schlafgemach,Wachturm,nil);
   RaumUpdate.RaumUpdate(Schlafgemach,Lagerhalle,nil,nil,Kaserne);
   RaumUpdate.RaumUpdate(Einsame_Herberge,nil,Graumoor,nil,nil);
   RaumUpdate.RaumUpdate(Graumoor,Feuerschlot,Schattenweiden,Kleiner_See,Einsame_Herberge);
   RaumUpdate.RaumUpdate(Schattenweiden,Oeder_Morast,Westweg,nil,Graumoor);
   RaumUpdate.RaumUpdate(Westweg,nil,Bruecke,nil,Schattenweiden);
   RaumUpdate.RaumUpdate(Bruecke,nil,Augvea,nil,Westweg);
   RaumUpdate.RaumUpdate(Augvea,Waldweg,Ostweg,Strasse_in_den_Sueden,Bruecke);
   RaumUpdate.RaumUpdate(Ostweg,Grosse_Blumenwiese,Oestliche_Huegel,Tal,Augvea);
   RaumUpdate.RaumUpdate(Oestliche_Huegel,Apfelwiese,Verlassene_Burg,Grosse_Duene,Ostweg);
   RaumUpdate.RaumUpdate(Verlassene_Burg,nil,Wachturm,MetSchallWueste,Oestliche_Huegel);
   RaumUpdate.RaumUpdate(Wachturm,Kaserne,nil,nil,Verlassene_Burg);
   RaumUpdate.RaumUpdate(Kleiner_See,Graumoor,nil,Goblinstamm,nil);
   RaumUpdate.RaumUpdate(Strasse_in_den_Sueden,Augvea,Tal,Karawane,nil);
   RaumUpdate.RaumUpdate(Tal,Ostweg,Grosse_Duene,Am_schnellen_Bach,Strasse_in_den_Sueden);
   RaumUpdate.RaumUpdate(Grosse_Duene,Oestliche_Huegel,MetSchallWueste,Traenenwald,Tal);
   RaumUpdate.RaumUpdate(MetSchallWueste,Verlassene_Burg,nil,Baerenhoehle,Grosse_Duene);
   RaumUpdate.RaumUpdate(Goblinstamm,Kleiner_See,nil,nil,nil);
   RaumUpdate.RaumUpdate(Karawane,Strasse_in_den_Sueden,Am_schnellen_Bach,nil,nil);
   RaumUpdate.RaumUpdate(Am_schnellen_Bach,Tal,Traenenwald,Spitzdorf,Karawane);
   RaumUpdate.RaumUpdate(Traenenwald,Grosse_Duene,Baerenhoehle,Kraehenhort,Am_schnellen_Bach);
   RaumUpdate.RaumUpdate(Baerenhoehle,MetSchallWueste,nil,Der_Grosse_Heuler,Traenenwald);
   RaumUpdate.RaumUpdate(Spitzdorf,Am_schnellen_Bach,Kraehenhort,nil,nil);
   RaumUpdate.RaumUpdate(Kraehenhort,Traenenwald,Der_Grosse_Heuler,nil,Spitzdorf);
   RaumUpdate.RaumUpdate(Der_Grosse_Heuler,Baerenhoehle,nil,Der_Sonnenstich,Kraehenhort);
   RaumUpdate.RaumUpdate(Der_Sonnenstich,Der_Grosse_Heuler,nil,nil,nil);
   //RaumUpdate Benötigt RaumPointer+AusgangsBeschreibungen
   RaumNamenUpdate(Augvea,'','Du tritts durch die Stadttore und siehst die Oststraße vor dir. In der ferne kannst du das Moor erkennen','Du tritts in die Herberge,hier kannst du die erholen','Du tritts durch die Stadttore und siehst den Weg der sich in die Berge schlängelt');
   RaumNamenUpdate(Schlafgemach,'Du verlässt die Herberge und stehst wieder auf dem Marktplatz','','','');
   RaumNamenUpdate(Ostweg,'','Deine Stiefel sinken im Morast ein und du hörst die Geräusche seltsamer Kreaturen um dich herum','','Du betritts die Stadt und findest dich auf dem Marktplatz wieder');
   RaumNamenUpdate(Westweg,'','Du betritts die Stadt und findest dich auf dem Marktplatz wieder','','');
   RaumNamenUpdate(Graumoor,'','','','Auf dem Weg aus dem Moor verfolgen dich die Albtraumhaften Bilder die du gesehen hast');
   //Zusätzliches Updates RaumPointer+Schwierigkeit+MD+MDA+MDS(ProzedureRaumwechsel und mTRAum)+Camp+CampPossible
   ZusaetzlicheUpdates(Spinnennest,'Hoehlespinne',0,0,0,false);					
   ZusaetzlicheUpdates(Spinnenkammer,'Hoehleboss',0,0,0,false);				
   ZusaetzlicheUpdates(Waldlichtung,'Wald',0,0,0,false);					
   ZusaetzlicheUpdates(Hoehle,'Hoehle',0,0,0,false);						
   ZusaetzlicheUpdates(Abgrund_des_brennenden_Steins,'Vulkan',0,0,0,false);
   ZusaetzlicheUpdates(Tautropfwald,'Waldstark',0,0,0,false);
   ZusaetzlicheUpdates(Weggabelung,'Wald',0,0,0,false);
   ZusaetzlicheUpdates(Hoehleneingang,'Hoehle',0,0,0,false);
   ZusaetzlicheUpdates(Lagerhalle,'Koenig',0,0,0,false);
   ZusaetzlicheUpdates(Feuerschlot,'Vulkan',0,0,0,false);
   ZusaetzlicheUpdates(Oeder_Morast,'Sumpf',0,0,0,false);
   ZusaetzlicheUpdates(Waldweg,'Wald',0,0,0,false);
   ZusaetzlicheUpdates(Grosse_Blumenwiese,'Offene_Landschaft',0,0,0,false);
   ZusaetzlicheUpdates(Apfelwiese,'Offene_Landschaft',0,0,0,false);
   ZusaetzlicheUpdates(Kaserne,'Burgstark',0,0,0,false);
   ZusaetzlicheUpdates(Schlafgemach,'Burgstark',0,0,0,true);
   ZusaetzlicheUpdates(Einsame_Herberge,'Herberge',0,0,0,true);
   ZusaetzlicheUpdates(Graumoor,'Sumpf',0,0,0,false);
   ZusaetzlicheUpdates(Schattenweiden,'Sumpf',0,0,0,false);
   ZusaetzlicheUpdates(Westweg,'Weg',0,0,0,false);
   ZusaetzlicheUpdates(Bruecke,'Weg',0,0,0,false);
   ZusaetzlicheUpdates(Augvea,'',0,0,0,true);
   ZusaetzlicheUpdates(Ostweg,'Weg',0,0,0,false);
   ZusaetzlicheUpdates(Oestliche_Huegel,'Offene_Landschaft',0,0,0,false);
   ZusaetzlicheUpdates(Verlassene_Burg,'Burg',0,0,0,false);
   ZusaetzlicheUpdates(Wachturm,'Burg',0,0,0,false);
   ZusaetzlicheUpdates(Kleiner_See,'Sumpf',0,0,0,false);
   ZusaetzlicheUpdates(Strasse_in_den_Sueden,'Weg',0,0,0,false);
   ZusaetzlicheUpdates(Tal,'Offene_Landschaft',0,0,0,false);
   ZusaetzlicheUpdates(Grosse_Duene,'Wueste',0,0,0,false);
   ZusaetzlicheUpdates(MetSchallWueste,'Wueste',0,0,0,false);
   ZusaetzlicheUpdates(Goblinstamm,'Goblinstark',0,0,0,false);
   ZusaetzlicheUpdates(Karawane,'Weg',0,0,0,false);
   ZusaetzlicheUpdates(Am_schnellen_Bach,'Offene_Landschaft',0,0,0,false);
   ZusaetzlicheUpdates(Traenenwald,'Waldstark',0,0,0,false);
   ZusaetzlicheUpdates(Baerenhoehle,'Baer',0,0,0,false);
   ZusaetzlicheUpdates(Spitzdorf,'',0,0,0,true);
   ZusaetzlicheUpdates(Kraehenhort,'Friedhof',0,0,0,false);
   ZusaetzlicheUpdates(Der_Grosse_Heuler,'Waldstark',0,0,0,false);
   ZusaetzlicheUpdates(Der_Sonnenstich,'Zufall',0,0,0,false);
   
   //Startwerte//
   AnfangsRaum:= Augvea;
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
   MaxHP:=AnfangsHP;
   SpielerHelm:=Kappe;
   SpielerRuestung:=Gewand;
   SpielerSchuhe:=Alte_Latscher;
   SpielerWaffe:=Verroteter_Klumpen;
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
     Memo1.lines.add('[Norden/Osten/Sueden/Westen]/[N/O/S/W]: In diese Richtung gehen');  //HIlfe Stellung
     Memo1.lines.add('Zurueck: In die vorherige Richtung gehen');
     Memo1.lines.add('Angreifen: Im Kampf einen Gegner attackieren');
     Memo1.lines.add('Fliehen: Im Kampf zum vorherigen Raum fliehen');
   end

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

 else if uppercase(Eingabe) = 'FLIEHEN'
 then
 begin
   aktuellerRaum:=vorherigerRaum;
   IstInKampf:=false;
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
//RefresUI

UIRefresh.UiRefresh()
end;
//REpitirion der FUnktionalität, ist jedoch wesentlich angenehmer zu bedienen.
procedure TForm1.Button10Click(Sender: TObject);
begin
 Kampf()
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
   LootDrop.Pickup();
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
   aktuellerRaum:=vorherigerRaum;
   IstInKampf:=false;
end;

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

procedure TForm1.Button6Click(Sender: TObject);
begin
  RaumWechsel(AktuellerRaum.Norden);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  RaumWechsel(AktuellerRaum.Westen);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
   RaumWechsel(AktuellerRaum.Osten);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  RaumWechsel(AktuellerRaum.Sueden);
end;

end.

