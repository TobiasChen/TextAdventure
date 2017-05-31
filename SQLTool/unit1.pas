unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids, Menus, DetectWindowsBit, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Entfernen: TButton;
    Erstellen: TButton;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    DBConnection: TSQLite3Connection;
    Label2: TLabel;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure EntfernenClick(Sender: TObject);
    procedure ErstellenClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SaveChanges;
    { private declarations }
  public
    DerzeitigesItemCombobox: Integer;
    { public declarations }
  end;

var
  Form1: TForm1;
  DerzeitigesItemCombobox: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  if detectwindowsbit.IsWindows64 then  //Loads the correct Bit Version depending on WindowsBits
    SQLiteLibraryName:='x64/sqlite3.dll'
  else
     SQLiteLibraryName:='x32/sqlite3.dll';

   DBConnection.DatabaseName:='Default.sqlite';
   SQLTransaction1.DataBase:=DBConnection;
   SQLQuery1.Transaction:=SQLTransaction1;

   DBConnection.open;
   if DBConnection.Connected then
      Label1.caption:='Connected';
     combobox1.Items.clear;
   combobox1.Items.add('Raeume');
   combobox1.Items.add('Monster');
   combobox1.Items.add('Item');
 //  combobox1.Items.add('Test');
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  SQLQuery1.Close;
  case Combobox1.Itemindex of
   0: begin
        SQLQuery1.SQL.Text := 'select * from Raeume';
        DerzeitigesItemCombobox := 0;
      end;
   1: begin
        SQLQuery1.SQL.Text := 'select * from Monster';
        DerzeitigesItemCombobox := 1;
      end;
   2: begin
        SQLQuery1.SQL.Text := 'select * from Item';
        DerzeitigesItemCombobox := 2;
      end;
   end;
  Label1.Caption := InttoStr(DerzeitigesItemCombobox);
  DBConnection.Connected:= True;
  SQLTransaction1.Active:=True;
  SQLQuery1.Open;
  end;

procedure TForm1.ErstellenClick(Sender: TObject);
begin
  if Form2<>nil then
   Form2.close;
  Form2 := TForm2.create(Unit2.Form2);
  Form2.show;
end;

procedure TForm1.EntfernenClick(Sender: TObject);
begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  case Combobox1.Itemindex of
   0: begin
        SQLQuery1.SQL.Text := 'DELETE from Raeume WHERE Row_Number() = '' + Inttostr(DBGrid1.SelectedRows.CurrentRowSelected)''';
      end;
   1: begin
        SQLQuery1.SQL.Text := 'DELETE from Monster WHERE Row_Number() = '' + Inttostr(DBGrid1.SelectedRows.CurrentRowSelected)''';
      end;
   2: begin
        SQLQuery1.SQL.Text := 'DELETE from Item WHERE Row_Number() = '' + Inttostr(DBGrid1.SelectedRows.CurrentRowSelected)''';
      end;
   end;
  SQLQuery1.ExecSQL;
  SQLTransaction1.CommitRetaining;
end;

procedure TForm1.SaveChanges;
begin
  try
    if Form1.SQLTransaction1.Active then
    begin
      Form1.SQLQuery1.ApplyUpdates; //Pass user-generated changes back to database
      Form1.SQLTransaction1.Commit; //Commit them using the transaction.
                              //SQLTransaction1.Active now is false
    end;
  except
  on E: EDatabaseError do
    begin
      MessageDlg('Error', 'A database error has occurred. Technical error message: ' +
        E.Message, mtError, [mbOK], 0);
      Form1.Edit1.Text := '';
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  SaveChanges; //Saves changes and commits transaction
  SQLQuery1.Close; //Closes Connection to the databes
  SQLTransaction1.Active:= False;
  DBConnection.Connected:= False;
end;


end.

