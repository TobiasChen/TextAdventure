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
    Button1: TButton;
    Speichern: TButton;
    Eingabefeld: TEdit;
    procedure Button1Click(Sender: TObject);
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
  if nAttribut = Zahlattribute
  then Form2.close
  else
    begin
//      nAttribut = nAttribut + 1;
//      AngabeTabelle.Caption :=
      case Unit1.DerzeitigesItemCombobox of
       0:  AngabeTabelle.Caption := 'Raeume';
       1:  AngabeTabelle.Caption := 'Monster';
       2:  AngabeTabelle.Caption := 'Item';
      end;
//      AngabeVarTyp.Caption :=
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form1.Label2.caption:=inttostr(Form1.Combobox1.Itemindex);
  Zahlattribute := Form1.DBGrid1.Columns.Count;
  Setlength(Eingabe, Zahlattribute);
     case DerzeitigesItemCombobox of
      0:  AngabeTabelle.Caption := 'Raeume';
      1:  AngabeTabelle.Caption := 'Monster';
      2:  AngabeTabelle.Caption := 'Item';
     end;
//  AngabeAttribut.Caption :=
  AngabeVarTyp.Caption := InttoStr(Zahlattribute);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  AngabeVarTyp.Caption := test;
end;

end.

