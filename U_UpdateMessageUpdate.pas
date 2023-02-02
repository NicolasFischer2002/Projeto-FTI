unit U_UpdateMessageUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TF_UpdateMessageUpdate = class(TForm)
    Lbl_UpdateActive: TLabel;
    Edt_Ativo: TEdit;
    Edt_ValorPago: TEdit;
    Edt_Quantidade: TEdit;
    Edt_Taxas: TEdit;
    Edt_Lucro: TEdit;
    Btn_Cancel: TButton;
    Btn_Update: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Btn_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_UpdateMessageUpdate: TF_UpdateMessageUpdate;

implementation

{$R *.dfm}

Uses U_Functions, U_Update;

procedure TF_UpdateMessageUpdate.Btn_CancelClick(Sender: TObject);
begin
     F_UpdateMessageUpdate.Close;
end;

procedure TF_UpdateMessageUpdate.FormCreate(Sender: TObject);
begin
     Try
        Btn_Update.Caption := 'Atualizar ' + F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public];

        Lbl_UpdateActive.Left    := 115;
        Lbl_UpdateActive.Caption := 'Atualizar ativo ' + F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public] + ',' + ' código ' + F_Update.StringGrid_Update.Cells[0,LineGridUpdate_Public];

        Edt_Ativo.Text      := F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public];
        Edt_ValorPago.Text  := F_Update.StringGrid_Update.Cells[2,LineGridUpdate_Public];
        Edt_Quantidade.Text := F_Update.StringGrid_Update.Cells[3,LineGridUpdate_Public];
        Edt_Taxas.Text      := F_Update.StringGrid_Update.Cells[4,LineGridUpdate_Public];
        Edt_Lucro.Text      := F_Update.StringGrid_Update.Cells[6,LineGridUpdate_Public];

     Except

     End;
end;

end.
