unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    AngabeTabelle: TLabel;
    AngabeAttribut: TLabel;
    AngabeVarTyp: TLabel;
    Zahlattribut: TLabel;
    Speichern: TButton;
    Eingabefeld: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpeichernClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  Zahlattribute, nAttribut: Integer;
  Eingabe: array of String;

implementation

uses Unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.SpeichernClick(Sender: TObject);
begin
  Eingabe[nAttribut] := Eingabefeld.text;

  if nAttribut = Zahlattribute - 1

  then
    begin
      Form1.SQLQuery1.Close;
      Form1.SQLQuery1.SQL.Clear;
      case Unit1.DerzeitigesItemCombobox of
       0:  Form1.SQLQuery1.SQL.Text := 'insert into monster(Enemyname,Beschreibung,HP,RK,ATK,LootType) Values(''s'',''c'',''g'',''t'',''a'',''v'')';
       1:  Form1.SQLQuery1.SQL.Add('insert into monster (Enemyname,Beschreibung,HP,RK,ATK,LootType) Values(''s'',''c'',''g'',''t'',''a'',''v'')');
       2:  Form1.SQLQuery1.SQL.Text := 'insert into monster (Enemyname,Beschreibung,HP,RK,ATK,LootType) Values(''s'',''c'',''g'',''t'',''a'',''v'')';
    end;
      Form1.SQLQuery1.ExecSQL;
      Form1.SQLTransaction1.CommitRetaining;
       Form2.close;
    end
  else
    begin
      nAttribut := nAttribut + 1;
      form1.label1.caption:=inttostr(nAttribut);
      Eingabe[Nattribut]:=Form2.Eingabefeld.Text;
      Form1.Label1.Caption:=Eingabe[Nattribut];
//      AngabeTabelle.Caption :=
      case Unit1.DerzeitigesItemCombobox of
       0:  AngabeTabelle.Caption := 'Raeume';
       1:  AngabeTabelle.Caption := 'Raeume';
       2:  AngabeTabelle.Caption := 'Item';
      end;
      Zahlattribut.caption := InttoStr(nAttribut);
      AngabeAttribut.Caption := Form1.DBGrid1.Columns[nAttribut].Title.Caption;
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  nAttribut := 0;
  Zahlattribute := Form1.DBGrid1.Columns.Count;
  Form1.Label2.caption:=inttostr(Zahlattribute);
  Setlength(Eingabe, Zahlattribute);
     case DerzeitigesItemCombobox of
      0:  begin
            AngabeTabelle.Caption := 'Raeume';
          end;
      1:  begin
            AngabeTabelle.Caption := 'Monster';
          end;
      2:  begin
            AngabeTabelle.Caption := 'Item';
          end;
     end;
  AngabeAttribut.Caption := Form1.DBGrid1.Columns[nAttribut].Title.Caption;
  AngabeVarTyp.Caption := InttoStr(Zahlattribute);
end;

end.

