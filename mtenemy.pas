UNIT mTEnemy;

interface

//--------------------  ggf Uses-Liste einfügen !  --------------------
//uses ....;

type
  TEnemy = class

  public //Attribute
    Enemyname : String;
    Beschreibung : String;
    HP : Integer;
    RK : Integer;
    ATK : Integer;
    LootType: String;
  public //Methoden
    constructor create (EnemyN : String; Beschr: String; Health: Integer; RKlasse: Integer; Atck: Integer;LT:String);
   end;
implementation

//+---------------------------------------------------------------------
//|         TRaum: Methodendefinition
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TEnemy.create (EnemyN : String; Beschr: String; Health: Integer; RKlasse: Integer; Atck: Integer;LT:String);
begin
  inherited create;
  Enemyname := EnemyN;
  Beschreibung := Beschr;
  HP := Health;
  RK := RKlasse;
  ATK := ATck;
  LootType:=LT;
end;

end.
