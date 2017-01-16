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
    Funk:function;
    
  public //Methoden
    constructor create (WeaponN : String;Typus:String; Beschr: String;Grad:String;A_W:Integer;W_S:Integer;Func:function);
   end;
implementation

//+---------------------------------------------------------------------
//|         TWeapon: Methodendefinition
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TWeapon.create (WeaponN : String;Typus:String; Beschr: String;Grad:String; A_W:Integer;W_S:Integer;Func:function);
begin
  inherited create;
  Name := WeaponN;
  Typ:=Typus;
  Beschreibung := Beschr;
  Tier:=Grad;
  AW:=A_W;
  WS:=W_S;
  Funk:=func
end;

end.
