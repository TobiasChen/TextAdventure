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
    HP : Integer;    //Leben
    RK : Integer;    //Ausweichen
    SK :Integer;     //Stärke/Teil Schaden
//Waffen only
    AW:integer;//Anzahl Würfel
    WS:Integer;//Würfel Seiten(Dx)
    GE:integer;//Geschick
  public //Methoden
    constructor create (LootN : String;Typus:String; Beschr: String;Grad:String; Health: Integer; RKlasse: Integer;Staerke:Integer;A_W:Integer;W_S:Integer; Geschick: Integer);
   end;
implementation

//+---------------------------------------------------------------------
//|         TRaum: Methodendefinition
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TLoot.create (LootN : String;Typus:String; Beschr: String;Grad:String; Health: Integer; RKlasse: Integer;Staerke:integer;A_W:Integer;W_S:Integer; Geschick: Integer);
begin
  inherited create;
  Name := LootN;
  Typ:=Typus;
  Beschreibung := Beschr;
  Tier:=Grad;
  HP := Health;
  RK := RKlasse;
  Sk:=Staerke;
//Waffen only
  AW:=A_W;
  WS:=W_S;
  GE:=Geschick;
end;

end.
