UNIT mTLoot;

interface

//--------------------  ggf Uses-Liste einfügen !  --------------------
//uses ....;

type
  TLoot = class

  public //Attribute
    Name : String;
    Typ:String;
    Beschreibung : String;
    Tier:String;
    HP : Integer;
    RK : Integer;
    GE : Integer;
    SK :Integer;
  public //Methoden
    constructor create (LootN : String;Typus:String; Beschr: String;Grad:String; Health: Integer; RKlasse: Integer; Geschick: Integer;Stärke:Integer);
   end;
implementation

//+---------------------------------------------------------------------
//|         TRaum: Methodendefinition
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TLoot.create (LootN : String;Typus:String; Beschr: String;Grad:String; Health: Integer; RKlasse: Integer; Geschick: Integer;Stärke:integer);
begin
  inherited create;
  Name := LootN;
  Typ:=Typus;
  Beschreibung := Beschr;
  Tier:=Grad;
  HP := Health;
  RK := RKlasse;
  GK:= Geschick;
  Sk:=Stärke
end;

end.
