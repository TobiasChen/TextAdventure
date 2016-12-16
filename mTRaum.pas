UNIT mTRaum;

interface

//--------------------  ggf Uses-Liste einfügen !  --------------------
//uses ....;
uses
  mTEnemy;

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

  public //Methoden
    constructor create (RaumN : String; Beschr: String; N: TRaum; O: TRaum; S: TRaum; W: TRaum; Gegner: TEnemy);
   end;
implementation

//+---------------------------------------------------------------------
//|         TRaum: Methodendefinition 
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TRaum.create (RaumN : String; Beschr: String; N: TRaum; O: TRaum; S: TRaum; W: TRaum; Gegner: TEnemy);
begin
  inherited create;
  Raumname := RaumN;
  Beschreibung := Beschr;
  Norden := N;
  Osten := O;
  Sueden := S;
  Westen := W;
  Enemy := Gegner;
end;

end.
