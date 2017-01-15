unit UI;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;
procedure UIRefresh();
procedure Animation(Animation:String;FrameCount:Integer);
var
  Frame:Integer;
implementation
uses
  Unit1,ProzedureRaumwechsel,KampfProzedure, mTEnemy;
procedure UIRefresh();
begin
  Form1.LabelHP.Caption := InttoStr(SpielerHP);
  Form1.LabelRK.Caption := InttoStr(SpielerRK);
  Form1.LabelATK.Caption := InttoStr(SpielerATK);
  Form1.LabelRaum.caption := AktuellerRaum.Raumname;
  Form1.LabelRaumBeschreibung.caption:=AktuellerRaum.Beschreibung;
  Form1.MD.caption:=(inttostr(aktuellerRaum.MD)+'%');
  Form1.Button2.Caption:=SpielerHelm.Name;
  Form1.Button3.Caption:=SpielerRuestung.Name;
  Form1.Button4.Caption:=SpielerSchuhe.Name;
  Form1.Button5.Caption:=SpielerWaffe.Name;
  Form1.LabelGegnerHP.Caption:= InttoStr(0) ;
  Form1.LabelGegner.Caption := ('Kein Gegner');
  If AktuellerRaum.Enemy <> nil then  // <> = is not
     begin
     Form1.LabelGegner.Caption := AktuellerRaum.Enemy.Enemyname;
     Form1.LabelGegnerHP.Caption:= InttoStr(GegnerHP) ;
     end
     //Überprüft ob Gegner vorhanden sind
  else
     Form1.LabelGegner.Caption := 'Kein Gegner';
  end;
procedure Animation(Animation:String;FrameCount:Integer);         //Animation wird von Frame1 bis FrameCount abgespielt
begin
      Form1.Character_Picture.SpriteCount:=1;
      for Frame:=1 to FrameCount do
      begin
      Form1.Character_Picture.Sprite.LoadFromFile(Application.Location+'data/bmp/'+Animation+' ('+inttostr(Frame)+').bmp');
      sleep(40);                                  //Der Prozess wird 40 ms zwischen jedem Frame pausiert
      Application.ProcessMessages;                //Leider Sind es nur 10 Frames pro Animation,wodurch das gesamt Bild nicht flüssig ist
      end;                                        //Theoretisch könnte diese
      Form1.Character_Picture.SpriteCount:=10;
      Form1.Character_Picture.Sprite.LoadFromFile(Application.Location+'data/SpriteSheets/idle.bmp');
      Form1.Character_Picture.AnimRepeat:=0;
end;

end.

