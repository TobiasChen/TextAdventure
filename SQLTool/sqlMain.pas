unit SQLMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids, DetectWindowsBit;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    DBConnection: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SaveChanges;
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

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
   combobox1.Items.add('Raum');
   combobox1.Items.add('Monster');
   combobox1.Items.add('Items');
   combobox1.Items.add('Savegames');
   combobox1.Items.add('Test');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //SQLQuery1.Close;
  //SQLQuery1.SQL.Text:= 'select * from Monster';
  //SQLQuery1.SQL.Text:= 'select Monster_Id,Health_Points,CAST( Name AS VARCHAR) AS "Monster_Name" from Monster';
  //DBConnection.COnnected:= True;
  //SQLTransaction1.Active:=True;
  //SQLQuery1.Open;
  SaveChanges; //Saves changes and commits transaction
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  SQLQuery1.Close;
  case Combobox1.Itemindex of
   0: SQLQuery1.SQL.Text:='select * from Raum';
   1: SQLQuery1.SQL.Text:='select * from Monster';
   2: SQLQuery1.SQL.Text:='select * from loot';
   3: SQLQuery1.SQL.Text:='select * from Savegame';
   4: SQLQuery1.SQL.Text:='select Monster_Id,Health_Points,CAST( Name AS VARCHAR) AS "Monster_Name" from Monster';
   end;
  DBConnection.Connected:= True;
  SQLTransaction1.Active:=True;
  SQLQuery1.Open;
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

