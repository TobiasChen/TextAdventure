UNIT mTWeapon;

interface

//--------------------  ggf Uses-Liste einfügen !  --------------------
//uses ....;

type
  TWeapon = class

  public //Attribute
    Name : String;
    Typ:String;
    Beschreibung : String;
    Tier:String;
    AW:integer;//Anzahl Würfel
    WS:Integer;//Würfel Seiten(Dx)
    GE:integer;//Geschick
    //Funk:procedure;   ein versuch proyeduren  als classen atriubte zu benutzen scheiterte
  public //Methoden
    constructor create (WeaponN : String;Typus:String; Beschr: String;Grad:String;A_W:Integer;W_S:Integer; Geschick: Integer);
   end;
implementation

//+---------------------------------------------------------------------
//|         TWeapon: Methodendefinition
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TWeapon.create (WeaponN : String;Typus:String; Beschr: String;Grad:String; A_W:Integer;W_S:Integer; Geschick: Integer);
begin
  inherited create;
  Name := WeaponN;
  Typ:=Typus;
  Beschreibung := Beschr;
  Tier:=Grad;
  AW:=A_W;
  WS:=W_S;
  GE:= Geschick;
end;

end.
