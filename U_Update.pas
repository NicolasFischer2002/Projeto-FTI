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
    Btn_Updating: TButton;
    Btn_Deleting: TButton;
    Lbl_Updating: TLabel;
    Label1: TLabel;
    procedure StringGrid_UpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Btn_UpdatingClick(Sender: TObject);
    procedure Btn_DeletingClick(Sender: TObject);
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

procedure TF_Update.Btn_DeletingClick(Sender: TObject);
begin
     if UpdateDelete_Public <> 'Delete' then
     begin
          Lbl_Updating.Left    := 45;
          Lbl_Updating.Caption := 'Deletando ';
          UpdateDelete_Public  := 'Delete';

          Lbl_Updating.Font.Style := [fsItalic];
     end;
end;

procedure TF_Update.Btn_UpdatingClick(Sender: TObject);
begin
     if UpdateDelete_Public <> 'Update' then
     begin
          Lbl_Updating.Left    := 41;
          Lbl_Updating.Caption := 'Atualizando';
          UpdateDelete_Public  := 'Update';

//          Lbl_Updating.Font.Color := $00C100;
          Lbl_Updating.Font.Style := [fsUnderline];
     end;
end;

procedure TF_Update.FormCreate(Sender: TObject);
begin
     UpdateDelete_Public     := 'Update';
//     Lbl_Updating.Font.Color := $00C100;
end;

procedure TF_Update.StringGrid_UpdateClick(Sender: TObject);
Var
   Line   : Integer;
   Col    : Integer;
   Ativo  : String;
   Codigo : String;
begin
     LineGridUpdate_Public := F_Update.StringGrid_Update.Row;

     if (LineGridUpdate_Public > 0) and (UpdateDelete_Public = 'Delete') then
      begin
           F_UpdateMessage := TF_UpdateMessage.Create(Self);
           F_UpdateMessage.Visible := False;
           F_UpdateMessage.ShowModal;
      end;
end;


end.
