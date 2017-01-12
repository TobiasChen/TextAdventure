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

uses Unit1,kampfprozedure,UIRefresh;   //Benötigte Units zum Funktioniern
procedure LootDrop();
var
  Wuerfel:Integer;
 begin
 Wuerfel:=1+Random(100);//Normales Random 100 wäre 0...99
 	if Gegner.LootType = ('')  then       //Error Überprüfung
         TempLoot:=nil
	else if Gegner.LootType='verschlissen' then
        begin
        if Wuerfel <= 20 then
            TempLoot:=Muerbes_Holzschwert
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
  Form1.Memo1.lines.add('Du hast '+ tempLoot.Beschreibung+' gefunden');
  Form1.Memo1.lines.add('Stats:  '+' RK:'+inttostr(tempLoot.RK)+' HP:'+inttostr(tempLoot.HP)+' ATK:'+ inttostr(tempLoot.atk));
  if tempLoot.Typ='Helm' then
        begin
     Form1.Memo1.lines.add('Momentan trägst du '+ SpielerHelm.Beschreibung);
     Form1.Memo1.lines.add('Stats:  '+' RK:'+inttostr(SpielerHelm.RK)+' HP:'+inttostr(SpielerHelm.HP)+' ATK:'+ inttostr(SpielerHelm.atk));
        end
  else if tempLoot.Typ='Ruestung' then
        begin
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerRuestung.Beschreibung);
        Form1.Memo1.lines.add('Stats:  '+' RK:'+inttostr(SpielerRuestung.RK)+' HP:'+inttostr(SpielerRuestung.HP)+' ATK:'+ inttostr(SpielerRuestung.atk))
        end
  else if tempLoot.Typ='Schuhe' then
        begin
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerSchuhe.Beschreibung);
        Form1.Memo1.lines.add('Stats:  '+' RK:'+inttostr(SpielerSchuhe.RK)+' HP:'+inttostr(SpielerSchuhe.HP)+' ATK:'+ inttostr(SpielerSchuhe.atk))
        end
  else if tempLoot.Typ='Waffe' then
        begin
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerWaffe.Beschreibung);
        Form1.Memo1.lines.add('Stats:  '+' RK:'+inttostr(SpielerWaffe.RK)+' HP:'+inttostr(SpielerWaffe.HP)+' ATK:'+ inttostr(SpielerWaffe.atk));
        end;
  Form1.Memo1.lines.add('Zum austauschen schreibe "pick"');
  UIRefresh.UIRefresh();
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
     SpielerAtk:=AnfangsATK+SpielerHelm.Atk+SpielerRuestung.ATK+SpielerSchuhe.Atk+SpielerWaffe.Atk;
     SpielerRK:=AnfangsRK+SpielerHelm.RK+SpielerRuestung.RK+SpielerSchuhe.RK+SpielerWaffe.RK;
     MaxHP:=AnfangsHP+SpielerHelm.HP+SpielerRuestung.HP+SpielerSchuhe.HP+SpielerWaffe.HP;
     UIRefresh.UIRefresh();
  end;
end.

