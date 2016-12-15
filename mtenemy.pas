UNIT mTEnemy;

interface

//--------------------  ggf Uses-Liste einfügen !  --------------------
//uses ....;
uses
  MTRaum;
type
  TEnemy = class

  public //Attribute
    Enemyname : String;
    Beschreibung : String;
    HP : Integer;
    RK : Integer;
    ATK : Integer;
    Raum : TRaum;

  public //Methoden
    constructor create (EnemyN : String; Beschr: String; Health: Integer; RKlasse: Integer; Atck: Integer; Room: TRaum);
   end;
implementation

//+---------------------------------------------------------------------
//|         TRaum: Methodendefinition
//+---------------------------------------------------------------------

//-------- create (public) ---------------------------------------------
constructor TEnemy.create (EnemyN : String; Beschr: String; Health: Integer; RKlasse: Integer; Atck: Integer; Room: TRaum);
begin
  inherited create;
  Enemyname := EnemyN;
  Beschreibung := Beschr;
  HP := Health;
  RK := RKlasse;
  ATK := ATck;
  Raum := Room;
end;

end.
