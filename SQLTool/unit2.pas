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
  if nAttribut = Zahlattribute
  then Form2.close
  else
    begin
//      nAttribut = nAttribut + 1;
//      AngabeTabelle.Caption :=
//      AngabeAttribut.Caption :=
//      AngabeVarTyp.Caption :=
    end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Zahlattribute := Form1.DBGrid1.Columns.Count;
  Setlength(Eingabe, Zahlattribute);
//  AngabeTabelle.Caption :=
//  AngabeAttribut.Caption :=
  AngabeVarTyp.Caption := InttoStr(Zahlattribute);
end;

end.

