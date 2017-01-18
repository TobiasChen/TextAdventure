unit LootDrop;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTLoot;
var
  TempLoot:Tloot;
procedure LootDrop();
procedure Pickup();
implementation

uses Unit1,kampfprozedure,UI;   //Benötigte Units zum Funktioniern
procedure LootDrop();
var
  Wuerfel:Integer;
 begin
 Wuerfel:=1+Random(100);//Normales Random 100 wäre 0...99
 	if Gegner.LootType = ('')  then       //Error Überprüfung
         TempLoot:=nil
	else if Gegner.LootType='verschlissen' then					//abfrage der Lootklasse
        begin													
        if Wuerfel <= 20 then									//Random Drops
            TempLoot:=Muerbes_Holzschwert						//Hier: 20% Holzschwert, 20% Kappe, 20% Gewand, 20% Alte_Latscher, 20% Verrotteter_Klumpen
        else if (Wuerfel > 20) and (Wuerfel <=40) then
			TempLoot:=Kappe
        else if (Wuerfel > 40) and (Wuerfel <=60) then
			TempLoot:=Gewand
		else if (Wuerfel > 60) and (Wuerfel <=80) then
			TempLoot:=Alte_Latscher
		else if (Wuerfel > 80) and (Wuerfel <=100) then
			TempLoot:=Verrotteter_Klumpen;
	end
	else if Gegner.LootType='verschlissennormal' then
        begin
             if Wuerfel <= 10 then
                TempLoot:=Muerbes_Holzschwert
             else if (Wuerfel > 10) and (Wuerfel <=20) then
	        TempLoot:=Kappe
             else if (Wuerfel > 20) and (Wuerfel <=30) then
		TempLoot:=Gewand
	     else if (Wuerfel > 30) and (Wuerfel <=40) then
		TempLoot:=Alte_Latscher
             else if (Wuerfel > 40) and (Wuerfel <=50) then
		TempLoot:=Verrotteter_Klumpen
	     else if (Wuerfel > 50) and (Wuerfel <=60) then
	         TempLoot:=Eisenschwert
             else if (Wuerfel > 60) and (Wuerfel <=70) then
		TempLoot:=Lederhelm
	     else if (Wuerfel > 70) and (Wuerfel <=80) then
		TempLoot:=Kettenhemd
	     else if (Wuerfel > 80) and (Wuerfel <=90) then
		TempLoot:=Lederschuhe
	     else if (Wuerfel > 90) and (Wuerfel <=100) then
		TempLoot:=Eisenstreitkolben;
        end
	else if Gegner.LootType='normal' then
        begin
             if Wuerfel <= 20 then
                TempLoot:=Eisenschwert
             else if (Wuerfel > 20) and (Wuerfel <=40) then
	        TempLoot:=Lederhelm
             else if (Wuerfel > 40) and (Wuerfel <=60) then
		TempLoot:=Kettenhemd
	     else if (Wuerfel > 60) and (Wuerfel <=80) then
		TempLoot:=Lederschuhe
	     else if (Wuerfel > 80) and (Wuerfel <=100) then
		TempLoot:=Eisenstreitkolben;
	end
        else if Gegner.LootType='normalerlesen' then
        begin
             if Wuerfel <= 10 then
                TempLoot:=Eisenschwert
             else if (Wuerfel > 10) and (Wuerfel <=20) then
		TempLoot:=Lederhelm
             else if (Wuerfel > 20) and (Wuerfel <=30) then
		TempLoot:=Kettenhemd
             else if (Wuerfel > 30) and (Wuerfel <=40) then
		TempLoot:=Lederschuhe
	     else if (Wuerfel > 40) and (Wuerfel <=50) then
		TempLoot:=Eisenstreitkolben
	     else if (Wuerfel > 50) and (Wuerfel <=60) then
		TempLoot:=Geschmuecktes_Silberschwert
             else if (Wuerfel > 60) and (Wuerfel <=70) then
		TempLoot:=Eisenhelm
	     else if (Wuerfel > 70) and (Wuerfel <=80) then
		TempLoot:=Stahlruestung
	     else if (Wuerfel > 80) and (Wuerfel <=90) then
		TempLoot:=Eisenstiefel
	     else if (Wuerfel > 90) and (Wuerfel <=100) then
		TempLoot:=Orkischer_Hammerzahn;
	end		
        else if Gegner.LootType='erlesen' then
        begin
             if Wuerfel <= 20 then
                TempLoot:=Geschmuecktes_Silberschwert
             else if (Wuerfel > 20) and (Wuerfel <=40) then
		TempLoot:=Eisenhelm
             else if (Wuerfel > 40) and (Wuerfel <=60) then
		TempLoot:=Stahlruestung
	     else if (Wuerfel > 60) and (Wuerfel <=80) then
		TempLoot:=Eisenstiefel
	     else if (Wuerfel > 80) and (Wuerfel <=100) then
		TempLoot:=Orkischer_Hammerzahn;
	end		
	else if Gegner.LootType='erlesenmagisch' then
        begin
             if Wuerfel <= 10 then
                TempLoot:=Geschmuecktes_Silberschwert
             else if (Wuerfel > 10) and (Wuerfel <=20) then
		TempLoot:=Eisenhelm
             else if (Wuerfel > 20) and (Wuerfel <=30) then
		TempLoot:=Stahlruestung
             else if (Wuerfel > 30) and (Wuerfel <=40) then
	        TempLoot:=Eisenstiefel
	     else if (Wuerfel > 40) and (Wuerfel <=50) then
		TempLoot:=Orkischer_Hammerzahn
	     else if (Wuerfel > 50) and (Wuerfel <=60) then
		TempLoot:=Drachenzahn
             else if (Wuerfel > 60) and (Wuerfel <=70) then
		TempLoot:=Gnorignums_Schaedelplatte
	     else if (Wuerfel > 70) and (Wuerfel <=80) then
		TempLoot:=Granitebrows_Stachelpanzer
	     else if (Wuerfel > 80) and (Wuerfel <=90) then
		TempLoot:=Bodenmalmer
	     else if (Wuerfel > 90) and (Wuerfel <=100) then
		TempLoot:=Gigantischer_Knochenmuerber;
        end
	else if Gegner.LootType='magisch' then
        begin
             if Wuerfel <= 20 then
                TempLoot:=Drachenzahn
             else if (Wuerfel > 20) and (Wuerfel <=40) then
		TempLoot:=Gnorignums_Schaedelplatte
             else if (Wuerfel > 40) and (Wuerfel <=60) then
		TempLoot:=Granitebrows_Stachelpanzer
	     else if (Wuerfel > 60) and (Wuerfel <=80) then
		TempLoot:=Bodenmalmer
	     else if (Wuerfel > 80) and (Wuerfel <=100) then
		TempLoot:=Gigantischer_Knochenmuerber;
	end;

  //Aus mir momentan unerfindlichen Gründen funktionierte ein einfaches or Statment
  //hier nicht, zudem ist es unnötig und dient nur dem Programier Komfort.
  if (tempLoot = nil) or (tempLoot=SpielerHelm) or (tempLoot=SpielerRuestung) or (tempLoot=SpielerSchuhe) or (tempLoot=SpielerWaffe) then
        Form1.Memo1.lines.add('Der '+ LetzterGegner.Enemyname +' hatte nichts Wertvolles mit sich')
  else if tempLoot <> nil then
  begin
       if tempLoot.Typ='Waffe' then
       begin
       Form1.Memo1.lines.add('Du hast '+ tempLoot.Beschreibung+' gefunden');
	   Form1.Memo1.lines.add('Stats:  '+' Ausweichen: +'+inttostr(tempLoot.RK)+' HP: +'+inttostr(tempLoot.HP)+' Stärke: +'+ inttostr(tempLoot.SK)+' Treffsicherheit: +'+inttostr(tempLoot.GE)+' Schaden:'+inttostr(tempLoot.AW)+' D'+ inttostr(tempLoot.WS))
       end
       else
       begin
            Form1.Memo1.lines.add('Du hast '+ tempLoot.Beschreibung+' gefunden');
            Form1.Memo1.lines.add('Stats:  '+' Ausweichen: +'+inttostr(tempLoot.RK)+' HP: +'+inttostr(tempLoot.HP)+' Stärke: +'+ inttostr(tempLoot.SK));
       end;
  if tempLoot.Typ='Helm' then
        begin
     Form1.Memo1.lines.add('Momentan trägst du '+ SpielerHelm.Beschreibung);
     Form1.Memo1.lines.add('Stats:  '+' Ausweichen: +'+inttostr(SpielerHelm.RK)+' HP: +'+inttostr(SpielerHelm.HP)+' Stärke: +'+ inttostr(SpielerHelm.SK));
        end
  else if tempLoot.Typ='Ruestung' then
        begin
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerRuestung.Beschreibung);
        Form1.Memo1.lines.add('Stats:  '+' Ausweichen: +'+inttostr(SpielerRuestung.RK)+' HP: +'+inttostr(SpielerRuestung.HP)+' Stärke: +'+ inttostr(SpielerRuestung.SK))
        end
  else if tempLoot.Typ='Schuhe' then
        begin
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerSchuhe.Beschreibung);
        Form1.Memo1.lines.add('Stats:  '+' Ausweichen: +'+inttostr(SpielerSchuhe.RK)+' HP: +'+inttostr(SpielerSchuhe.HP)+' Stärke: +'+ inttostr(SpielerSchuhe.SK))
        end
  else if tempLoot.Typ='Waffe' then
        begin
        Form1.Memo1.lines.add('Momentan schwingst du '+ SpielerWaffe.Beschreibung);
        Form1.Memo1.lines.add('Damit hast du einen Bonus von: +'+inttostr(SpielerWaffe.GE)+' auf Treffsicherheit und machst :'+inttostr(SpielerWaffe.AW)+' D'+ inttostr(SpielerWaffe.WS)+' Schaden');
        end;
  Form1.Memo1.lines.add('Zum austauschen schreibe "pick" oder Drücke die Aktions Taste');
  UI.UIRefresh();
  end
  end;
procedure Pickup();
begin
 if TempLoot=nil   then
   Form1.Memo1.lines.add('Es gibt hier keinen Loot')
  else if tempLoot.Typ='Helm' then
    begin
        SpielerHelm:=tempLoot;
        Form1.Memo1.lines.add('Du hast '+SpielerHelm.Beschreibung+' aufgenommen') ;
        tempLoot:=nil;
    end
  else if tempLoot.Typ='Ruestung' then
    begin
       SpielerRuestung:=tempLoot;
       Form1.Memo1.lines.add('Du hast '+SpielerRuestung.Beschreibung+' aufgenommen');
       tempLoot:=nil
    end
   else if tempLoot.Typ='Schuhe' then
     begin
         SpielerSchuhe:=tempLoot;
         Form1.Memo1.lines.add('Du hast '+SpielerSchuhe.Beschreibung+' aufgenommen');
         tempLoot:=nil
     end
   else if tempLoot.Typ='Waffe' then
     begin
         SpielerWaffe:=tempLoot;
         Form1.Memo1.lines.add('Du hast '+SpielerWaffe.Beschreibung+' aufgenommen');
         tempLoot:=nil;
     end;
     SpielerStaerke:=AnfangsStaerke+SpielerHelm.Sk+SpielerRuestung.SK+SpielerSchuhe.Sk+SpielerWaffe.Sk;
     SpielerRK:=AnfangsRK+SpielerHelm.RK+SpielerRuestung.RK+SpielerSchuhe.RK+SpielerWaffe.RK;
     MaxHP:=AnfangsHP+SpielerHelm.HP+SpielerRuestung.HP+SpielerSchuhe.HP+SpielerWaffe.HP;
     UI.UIRefresh();
  end;
end.

