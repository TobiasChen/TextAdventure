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
procedure DifficultyUp();
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
                DifficultyUp();
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

procedure DifficultyUp ();
     Begin
	  Spinnennest.Schrittweite:=Spinnennest.Schrittweite+1;				//Entsprechend fortührend	
	  Spinnenkammer.Schrittweite:=Spinnenkammer.Schrittweite+1;
	  Waldlichtung.Schrittweite:=Waldlichtung.Schrittweite+1;
	  Hoehle.Schrittweite:=Hoehle.Schrittweite+1;
	  Abgrund_des_brennenden_Steins.Schrittweite:=Abgrund_des_brennenden_Steins.Schrittweite+1;
	  Tautropfwald.Schrittweite:=Tautropfwald.Schrittweite+1;
	  Weggabelung.Schrittweite:=Weggabelung.Schrittweite+1;
	  Hoehleneingang.Schrittweite:=Hoehleneingang.Schrittweite+1;
	  Lagerhalle.Schrittweite:=Lagerhalle.Schrittweite+1;
	  Feuerschlot.Schrittweite:=Feuerschlot.Schrittweite+1;
	  Oeder_Morast.Schrittweite:=Oeder_Morast.Schrittweite+1;
	  Waldweg.Schrittweite:=Waldweg.Schrittweite+1;
	  Grosse_Blumenwiese.Schrittweite:=Grosse_Blumenwiese.Schrittweite+1;
	  Apfelwiese.Schrittweite:=Apfelwiese.Schrittweite+1;
	  Kaserne.Schrittweite:=Kaserne.Schrittweite+1;
	  Schlafgemach.Schrittweite:=Schlafgemach.Schrittweite+1;
	  Einsame_Herberge.Schrittweite:=Einsame_Herberge.Schrittweite+1;
	  Graumoor.Schrittweite:=Graumoor.Schrittweite+1;
	  Schattenweiden.Schrittweite:=Schattenweiden.Schrittweite+1;
	  Westweg.Schrittweite:=Westweg.Schrittweite+1;
	  Bruecke.Schrittweite:=Bruecke.Schrittweite+1;
	  Augvea.Schrittweite:=Augvea.Schrittweite+1;
	  Ostweg.Schrittweite:=Ostweg.Schrittweite+1;
	  Oestliche_Huegel.Schrittweite:=Oestliche_Huegel.Schrittweite+1;
	  Verlassene_Burg.Schrittweite:=Verlassene_Burg.Schrittweite+1;
	  Wachturm.Schrittweite:=Wachturm.Schrittweite+1;
	  Kleiner_See.Schrittweite:=Kleiner_See.Schrittweite+1;
	  Strasse_in_den_Sueden.Schrittweite:=Strasse_in_den_Sueden.Schrittweite+1;
	  Tal.Schrittweite:=Tal.Schrittweite+1;
	  Grosse_Duene.Schrittweite:=Grosse_Duene.Schrittweite+1;
	  MetSchallWueste.Schrittweite:=MetSchallWueste.Schrittweite+1;
	  Goblinstamm.Schrittweite:=Goblinstamm.Schrittweite+1;
	  Karawane.Schrittweite:=Karawane.Schrittweite+1;
	  Am_schnellen_Bach.Schrittweite:=Am_schnellen_Bach.Schrittweite+1;
	  Traenenwald.Schrittweite:=Traenenwald.Schrittweite+1;
	  Baerenhoehle.Schrittweite:=Baerenhoehle.Schrittweite+1;
	  Spitzdorf.Schrittweite:=Spitzdorf.Schrittweite+1;
	  Kraehenhort.Schrittweite:=Kraehenhort.Schrittweite+1;
	  Der_Grosse_Heuler.Schrittweite:=Der_Grosse_Heuler.Schrittweite+1;
	  Der_Sonnenstich.Schrittweite:=Der_Sonnenstich.Schrittweite+1;
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
       DifficultyUp();
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

