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

uses Unit1,kampfprozedure;   //Benötigte Units zum Funktioniern
procedure LootDrop();
var
  Wuerfel:Integer;
 begin
  tempLoot:=Bessere_Kappe;
 { Wuerfel:=1+Random(100);//Normales Random 100 wäre 0...99
  if Gegner.LootType='zerfetzt'
     then begin                                         //Wäre Optimaler mit einer
     tempLoot:=Kappe;
     end;
  if Gegner.LootType='zerfetzt'
      then begin
        if Wuerfel <= 30 then
            TempLoot:=nil
        else if (Wuerfel > 30) and (Wuerfel <=65) then
            TempLoot:=Goblin
        else if (Wuerfel > 65) and (Wuerfel <=100) then
             TempLoot:=Ork;
      end;
   if Gegner.LootType='zerfetzt'                  //Nur Beispiel Werte
      then begin                                           //zur Demonstration
        if Wuerfel = 1 then
            TempLoot:=nil
        else if Wuerfel <= 2 then
            TempLoot:=Goblin
        else if (Wuerfel > 50) and (Wuerfel <=85) then
            TempLoot:=Ork
        else if (Wuerfel > 85) and (Wuerfel <=100) then
              TempLoot:=Oger;
      end;
      }
      if Gegner.LootType = ('')  then       //Error Überprüfung
         TempLoot:=nil;
   if Gegner.LootType= 'empty'  then
         TempLoot:=nil;

  //Aus mir momentan unerfindlichen Gründen funktionierte ein einfaches or Statment
  //hier nicht, zudem ist es unnötig und dient nur dem Programier Komfort.
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
        Form1.Memo1.lines.add('Stats:  '+' RK:'+inttostr(SpielerSchuhe.RK)+' HP:'+inttostr(SpielerSchuhe.HP)+' ATK:'+ inttostr(SpielerSchuhe.atk));
        end;
  Form1.Memo1.lines.add('Zum austauschen schreibe "pick"');
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
     SpielerHP:=AnfangsHP+SpielerHelm.HP+SpielerRuestung.HP+SpielerSchuhe.HP+SpielerWaffe.HP;
  end;
end.

