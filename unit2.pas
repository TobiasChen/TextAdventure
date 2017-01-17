unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,Unit1,Map;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
begin
   if Form1<>nil then
   Form1.free;
   Form1:=TForm1.create(Unit2.Form3);
   Form2:=Tform2.create(Unit1.form1);
   Form1.UpdateProcedure();
   Form2.Show;
   Form2.Hide;
   Form1.Show;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

end.

