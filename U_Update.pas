unit U_Update;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Grids, Vcl.Imaging.jpeg;

type
  TF_Update = class(TForm)
    Pnl_Bottom: TPanel;
    Pnl_Right: TPanel;
    Pnl_Center: TPanel;
    Pnl_CenterTop: TPanel;
    TImage_UpdateGrid: TImage;
    Lbl_UpdateYourInvestments: TLabel;
    StringGrid_Update: TStringGrid;
    procedure StringGrid_UpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Update: TF_Update;

implementation

{$R *.dfm}

uses U_Functions, U_User, U_Investimentos, U_Principal, U_UpdateMessage;

procedure TF_Update.StringGrid_UpdateClick(Sender: TObject);
Var
   Line   : Integer;
   Col    : Integer;
   Ativo  : String;
   Codigo : String;
begin
     Line := StringGrid_Update.Row;
     Col  := StringGrid_Update.Col;

     Ativo  := StringGrid_Update.Cells[1,Line];
     Codigo := StringGrid_Update.Cells[0,Line];

//     ShowMessage('Ativo ' + Ativo + ' Codigo ' + Codigo);

     F_UpdateMessage := TF_UpdateMessage.Create(Self);
     F_UpdateMessage.Show;


end;


end.
