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
      Form2.close;
    end
  else
    begin
      nAttribut := nAttribut + 1;
      Zahlattribut.caption := InttoStr(nAttribut);
      AngabeAttribut.Caption := Form1.DBGrid1.Columns[nAttribut].Title.Caption;
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form1.Label2.caption:=inttostr(Form1.Combobox1.Itemindex);
  nAttribut := 1;
  Zahlattribute := Form1.DBGrid1.Columns.Count;
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

