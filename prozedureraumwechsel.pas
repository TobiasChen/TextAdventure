unit ProzedureRaumwechsel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum,KampfProzedure;
var
 aktuellerRaum: TRaum;
 vorherigerRaum: TRaum;
 repeatcount:integer;
 PictureNumber:integer;
procedure RaumWechsel(Eingabe:Traum);
procedure escape();
procedure leave();
procedure DifficultyUp(AnzahlSchritte:integer);
//procedure Hunt();
implementation
uses Unit1,UI,Monsterspawn,LootDrop;
procedure RaumWechsel(Eingabe:Traum);
var
WuerfelErgebnis:Integer;
   begin
   if Eingabe = nil  then      //Fehler Ausschluß 
          Form1.Memo1.lines.add('Da ist kein Raum!')
   else
   if IstInKampf = true  then
      begin
          Form1.Memo1.lines.add('Du bist in einem Kampf und kannst nur flüchten oder Angreifen')
      end
    else
        begin
             Leave();
             vorherigerRaum:=aktuellerRaum;
             aktuellerRaum:=Eingabe;
             //Wahrscheinlichkeit ein Monster zu spawnen
             AktuellerRaum.MD:=AktuellerRaum.MD+ AktuellerRaum.Schrittweite*AktuellerRaum.MDA;
             if AktuellerRaum.MD>=100 then
                AktuellerRaum.MD:=100;
             Wuerfelergebnis:= 1+random(100);
             if WuerfelErgebnis-aktuellerRaum.MD<=0 then
                Monsterspawn.Monsterspawn();
             if AktuellerRaum.Enemy <> nil then
                begin
                KampfProzedure.IstInKampf:=true;
                AktuellerGegner:=AktuellerRaum.Enemy;
                Form1.Memo1.lines.add('Du wirst von '+aktuellerGegner.Beschreibung+' angegriffen!');
                SpielerRK:=SPielerRK -2;
                Kampf();                   //Ersatz für das Initative System
                SpielerRK:=SpielerRK +2;   //Bei Betreten eines Raumes mit einem Gegner
                UI.UIRefresh();            //Wird dem Spieler 2 RK abgezogen
                DifficultyUp(1);
                end;
             aktuellerRaum.Ort.default:=true;  //WOllte sie hier eigentlich einfärben und habe zuspät festgestellt, dass Button Einfärben unter Windoofs nicht unterstützt wird.
             vorherigerRaum.Ort.default:=false;
             //Animation wird abgespielt
             UI.UIRefresh;
             UI.Animation('Walk',14);
             //Temporäre Loot aus dem vorherigem Raum wird gelöscht
             tempLoot:=nil;
             UI.UIRefresh();//Anzeige dws RaumNamens
             if aktuellerRaum.Discoverd=false then         //Für die Map
             begin
              aktuellerRaum.Discoverd:=true;
              if aktuellerRaum.StrichNorden <> nil then
              aktuellerRaum.StrichNorden.visible:=true;
              if aktuellerRaum.StrichOsten <> nil then
              aktuellerRaum.StrichOsten.visible:=true;
              if aktuellerRaum.StrichSueden <> nil then
              aktuellerRaum.StrichSueden.visible:=true;
              if aktuellerRaum.StrichWesten <> nil then
              aktuellerRaum.StrichWesten.visible:=true;
              if aktuellerRaum.Ort <> nil then
              aktuellerRaum.Ort.visible:=true;
             end;
        end;
   end;

procedure DifficultyUp (AnzahlSchritte:integer);
     Begin
	  Spinnennest.Schrittweite:=Spinnennest.Schrittweite + AnzahlSchritte;				//Entsprechend fortührend	
	  Spinnenkammer.Schrittweite:=Spinnenkammer.Schrittweite + AnzahlSchritte;
	  Waldlichtung.Schrittweite:=Waldlichtung.Schrittweite + AnzahlSchritte;
	  Hoehle.Schrittweite:=Hoehle.Schrittweite + AnzahlSchritte;
	  Abgrund_des_brennenden_Steins.Schrittweite:=Abgrund_des_brennenden_Steins.Schrittweite + AnzahlSchritte;
	  Tautropfwald.Schrittweite:=Tautropfwald.Schrittweite + AnzahlSchritte;
	  Weggabelung.Schrittweite:=Weggabelung.Schrittweite + AnzahlSchritte;
	  Hoehleneingang.Schrittweite:=Hoehleneingang.Schrittweite + AnzahlSchritte;
	  Lagerhalle.Schrittweite:=Lagerhalle.Schrittweite + AnzahlSchritte;
	  Feuerschlot.Schrittweite:=Feuerschlot.Schrittweite + AnzahlSchritte;
	  Oeder_Morast.Schrittweite:=Oeder_Morast.Schrittweite + AnzahlSchritte;
	  Waldweg.Schrittweite:=Waldweg.Schrittweite + AnzahlSchritte;
	  Grosse_Blumenwiese.Schrittweite:=Grosse_Blumenwiese.Schrittweite + AnzahlSchritte;
	  Apfelwiese.Schrittweite:=Apfelwiese.Schrittweite + AnzahlSchritte;
	  Kaserne.Schrittweite:=Kaserne.Schrittweite + AnzahlSchritte;
	  Schlafgemach.Schrittweite:=Schlafgemach.Schrittweite + AnzahlSchritte;
	  Einsame_Herberge.Schrittweite:=Einsame_Herberge.Schrittweite + AnzahlSchritte;
	  Graumoor.Schrittweite:=Graumoor.Schrittweite + AnzahlSchritte;
	  Schattenweiden.Schrittweite:=Schattenweiden.Schrittweite + AnzahlSchritte;
	  Westweg.Schrittweite:=Westweg.Schrittweite + AnzahlSchritte;
	  Bruecke.Schrittweite:=Bruecke.Schrittweite + AnzahlSchritte;
	  Augvea.Schrittweite:=Augvea.Schrittweite + AnzahlSchritte;
	  Ostweg.Schrittweite:=Ostweg.Schrittweite + AnzahlSchritte;
	  Oestliche_Huegel.Schrittweite:=Oestliche_Huegel.Schrittweite + AnzahlSchritte;
	  Verlassene_Burg.Schrittweite:=Verlassene_Burg.Schrittweite + AnzahlSchritte;
	  Wachturm.Schrittweite:=Wachturm.Schrittweite + AnzahlSchritte;
	  Kleiner_See.Schrittweite:=Kleiner_See.Schrittweite + AnzahlSchritte;
	  Strasse_in_den_Sueden.Schrittweite:=Strasse_in_den_Sueden.Schrittweite + AnzahlSchritte;
	  Tal.Schrittweite:=Tal.Schrittweite + AnzahlSchritte;
	  Grosse_Duene.Schrittweite:=Grosse_Duene.Schrittweite + AnzahlSchritte;
	  MetSchallWueste.Schrittweite:=MetSchallWueste.Schrittweite + AnzahlSchritte;
	  Goblinstamm.Schrittweite:=Goblinstamm.Schrittweite + AnzahlSchritte;
	  Karawane.Schrittweite:=Karawane.Schrittweite + AnzahlSchritte;
	  Am_schnellen_Bach.Schrittweite:=Am_schnellen_Bach.Schrittweite + AnzahlSchritte;
	  Traenenwald.Schrittweite:=Traenenwald.Schrittweite + AnzahlSchritte;
	  Baerenhoehle.Schrittweite:=Baerenhoehle.Schrittweite + AnzahlSchritte;
	  Spitzdorf.Schrittweite:=Spitzdorf.Schrittweite + AnzahlSchritte;
	  Kraehenhort.Schrittweite:=Kraehenhort.Schrittweite + AnzahlSchritte;
	  Der_Grosse_Heuler.Schrittweite:=Der_Grosse_Heuler.Schrittweite + AnzahlSchritte;
	  Der_Sonnenstich.Schrittweite:=Der_Sonnenstich.Schrittweite + AnzahlSchritte;
     //Muss leider hard coded werden
     //Eine Möglichkeit dies zu ändern wäre alle Räume durch Zahlen zu identifizieren
     //und duch eine for i to schleife zu jagen
     End;
Procedure leave();
Begin
      if uppercase(Unit1.Eingabe) = 'NORDEN' then
      Form1.Memo1.lines.add(aktuellerRaum.NORDENLeave)
      else if uppercase(Unit1.Eingabe) = 'OSTEN' then
      Form1.Memo1.lines.add(aktuellerRaum.OSTENLeave)
      else if (uppercase(Unit1.Eingabe) = 'SÜDEN') or   (uppercase(Unit1.Eingabe) = 'SUEDEN') then
      Form1.Memo1.lines.add(aktuellerRaum.SUEDENLeave)
      else if uppercase(Unit1.Eingabe) = 'WESTEN' then
      Form1.Memo1.lines.add(aktuellerRaum.WESTENLeave);
End;
Procedure escape();
  Begin
     If KampfProzedure.IstInKampf=false then
        Form1.Memo1.Lines.Add('Du bist nicht im Kampf,zum Raumwechsel nutze die Richtungstasten')
     else if KampfProzedure.IstInKampf=true then
      begin
       KampfProzedure.IstInKampf:=false;
       UI.Animation('Run',10);
       aktuellerRaum :=vorherigerRaum;
       AktuellerRaum.Enemy:=nil;
       temploot:=nil;
       DifficultyUp(1);
       UI.UIRefresh();
      end;
  End;
{procedure Hunt();
var
 WuerfelErgebnis:Integer;
 Begin
 if IstInKampf = true  then
     begin
          Form1.Memo1.lines.add('Du bist in einem Kampf und kannst nur flüchten oder Angreifen')
     end
     else
     begin

     AktuellerRaum.MD:=AktuellerRaum.MD+ AktuellerRaum.Schrittweite*AktuellerRaum.MDA;
     if AktuellerRaum.MD>=100 then
        AktuellerRaum.MD:=100;
     Wuerfelergebnis:= 1+random(100);
     if WuerfelErgebnis-aktuellerRaum.MD<=0 then
         Monsterspawn.Monsterspawn();
     if AktuellerRaum.Enemy <> nil then
      begin
      IstInKampf:=true;
      AktuellerGegner:=AktuellerRaum.Enemy;
      Form1.Memo1.lines.add('Du wirst von '+aktuellerGegner.Beschreibung+' angegriffen!');
      Kampf();
      UIRefresh.UIRefresh();
      end;
     end;
     end;
 }
end.
