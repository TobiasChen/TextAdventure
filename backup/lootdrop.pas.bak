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
  Form1.Memo1.lines.add('Du hast '+ tempLoot.Beschreibung+'gefunden' +'Es gibt einen Boni von'+inttostr(tempLoot.RK)+'RK'+inttostr(tempLoot.HP)+'HP'+ inttostr(tempLoot.atk)+'ATK');
  if tempLoot.Typ='Helm' then
     Form1.Memo1.lines.add('Momentan trägst du '+ SpielerHelm.Beschreibung+'gefunden' +'Es gibt einen Boni von'+inttostr(SpielerHelm.RK)+'RK'+inttostr(SpielerHelm.HP)+'HP'+ inttostr(SpielerHelm.atk)+'ATK')
  else if tempLoot.Typ='Ruestung' then
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerRuestung.Beschreibung+'gefunden' +'Es gibt einen Boni von'+inttostr(SpielerRuestung.RK)+'RK'+inttostr(SpielerRuestung.HP)+'HP'+ inttostr(SpielerRuestung.atk)+'ATK')
  else if tempLoot.Typ='Schuhe' then
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerSchuhe.Beschreibung+'gefunden' +'Es gibt einen Boni von'+inttostr(SpielerSchuhe.RK)+'RK'+inttostr(SpielerSchuhe.HP)+'HP'+ inttostr(SpielerSchuhe.atk)+'ATK')
  else if tempLoot.Typ='Waffe' then
        Form1.Memo1.lines.add('Momentan trägst du '+ SpielerWaffe.Beschreibung+'gefunden' +'Es gibt einen Boni von'+inttostr(SpielerWaffe.RK)+'RK'+inttostr(SpielerWaffe.HP)+'HP'+ inttostr(SpielerWaffe.atk)+'ATK');

  Form1.Memo1.lines.add('Zum tauschen schreibe PickUp ansonsten verlasse den Raum');
  end;
procedure Pickup();
begin
 if TempLoot=nil   then
   Form1.Memo1.lines.add('Es gibt hier keinen Loot')
  else if tempLoot.Typ='Helm' then
    begin
        SpielerHelm:=tempLoot;
        Form1.Memo1.lines.add('Du hast '+SpielerHelm.Beschreibung+'aufgenommen') ;
        tempLoot:=nil;
    end
  else if tempLoot.Typ='Ruestung' then
    begin
       SpielerRuestung:=tempLoot;
       Form1.Memo1.lines.add('Du hast '+SpielerRuestung.Beschreibung+'aufgenommen');
       tempLoot:=nil
    end
   else if tempLoot.Typ='Schuhe' then
     begin
         SpielerSchuhe:=tempLoot;
         Form1.Memo1.lines.add('Du hast '+SpielerSchuhe.Beschreibung+'aufgenommen');
         tempLoot:=nil
     end
   else if tempLoot.Typ='Waffe' then
     begin
         SpielerWaffe:=tempLoot;
         Form1.Memo1.lines.add('Du hast '+SpielerWaffe.Beschreibung+'aufgenommen');
         tempLoot:=nil;
     end;
     SpielerAtk:=AnfangsATK+SpielerHelm.Atk+SpielerRuestung.ATK+SpielerSchuhe.Atk+SpielerWaffe.Atk;
     SpielerRK:=AnfangsRK+SpielerHelm.RK+SpielerRuestung.RK+SpielerSchuhe.RK+SpielerWaffe.RK;
     SpielerHP:=AnfangsHP+SpielerHelm.HP+SpielerRuestung.HP+SpielerSchuhe.HP+SpielerWaffe.HP;
  end;
end.

