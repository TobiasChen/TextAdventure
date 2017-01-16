UNIT mTRaum;

interface

//--------------------  ggf Uses-Liste einf�gen !  --------------------
//uses ....;
uses
  StdCtrls,mTEnemy,ExtCtrls;

type
  TRaum = class

  public //Attribute
    Raumname : String;
    Beschreibung : String;
    Norden : TRaum;
    Osten : TRaum;
    Sueden : TRaum;
    Westen : TRaum;
    Enemy : TEnemy;
    NORDENLeave:String;
    OSTENLeave:String;
    SUEDENLeave:String;
    WESTENLeave:String;
    Schrittweite:Integer;
    Difficulty:String;
    MD:integer;       //Monster Density
    MDA:Integer;          //Monster Density Subtraction
    MDS:integer;          //MOnster Density Addition
    Camp:boolean;
    Camp_possible:boolean;
    Discoverd:boolean;                //Variablen für die Map
    StrichNorden:TShape;
    StrichOsten:TShape;
    StrichSueden:TShape;
    StrichWesten:TShape;
    Ort:TButton;
  public //Methoden
    constructor create (RaumN : String; Beschr: String; N: TRaum; O: TRaum; S: TRaum; W: TRaum;
    Gegner: TEnemy;NordLeave:String; EastLeave:String; SuedLeave:String; WestLeave:String;
    Weg:Integer;Schwierigkeit:String;Monster_Density:Integer;MOnster_Density_Addition:Integer;
    Monster_Density_Subtraction:Integer;Camp_Active:boolean;Camp_pos:boolean;
    Known:boolean;SN:TShape;SO:TShape;SS:TShape;SW:TShape;Location:TButton);
   end;
implementation

//+---------------------------------------------------------------------
//|         TRaum: Methodendefinition 
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TRaum.create(RaumN : String; Beschr: String; N: TRaum; O: TRaum; S: TRaum; W: TRaum;
    Gegner: TEnemy;NordLeave:String; EastLeave:String; SuedLeave:String; WestLeave:String;
    Weg:Integer;Schwierigkeit:String;Monster_Density:Integer;MOnster_Density_Addition:Integer;
    Monster_Density_Subtraction:Integer;Camp_Active:boolean;Camp_pos:boolean;
    Known:boolean;SN:TShape;SO:TShape;SS:TShape;SW:TShape;Location:TButton);
begin
  inherited create;
  Raumname := RaumN;
  Beschreibung := Beschr;
  Norden := N;
  Osten := O;
  Sueden := S;
  Westen := W;
  Enemy := Gegner;
  NORDENLeave:=NordLeave;
  OSTENLeave:=EastLeave;
  SUEDENLeave:=SuedLeave;
  WESTENLeave:=Westleave;
  Schrittweite:=Weg;
  Difficulty:=Schwierigkeit;
  MD:=Monster_Density;
  MDA:=Monster_Density_Addition;
  MDS:=Monster_Density_Subtraction;
  Camp:=Camp_Active;
  Camp_possible:=Camp_pos;
  Discoverd:=Known;
  StrichNorden:=SN;
  StrichOsten:=SO;
  StrichSueden:=SS;
  StrichWesten:=SW;
  Ort:=Location;
end;

end.
