unit U_UpdateMessage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TF_UpdateMessage = class(TForm)
    Lbl_Message: TLabel;
    Btn_DeleteActive: TButton;
    Btn_Cancel: TButton;
    Lbl_AtivoCodigo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Btn_CancelClick(Sender: TObject);
    procedure Btn_DeleteActiveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_UpdateMessage: TF_UpdateMessage;

implementation

{$R *.dfm}

Uses U_Update, U_Functions;

procedure TF_UpdateMessage.Btn_CancelClick(Sender: TObject);
begin
     F_UpdateMessage.Close;
end;

procedure TF_UpdateMessage.Btn_DeleteActiveClick(Sender: TObject);
Var
   CodAtivo : String;
begin
     Try
        Try
           CodAtivo := F_Update.StringGrid_Update.Cells[0,LineGridUpdate_Public];

           Query.SQL.Clear;
           Query.SQL.Text := 'DELETE FROM Investimentos WHERE Código=' + CodAtivo;
           Query.ExecSQL;

           Application.MessageBox('Ativo excluído com sucesso!', 'Atenção!', mb_Ok + mb_IconInformation);

           ClearGridUpdate_Public();
           FeedTheGridUpdate_Public();

        Finally
            F_UpdateMessage.Close;
        End;

     Except
         Application.MessageBox('Erro ao deletar ativo do banco de dados!', 'Atenção!', mb_Ok + mb_IconExclamation);
     end;
end;

procedure TF_UpdateMessage.FormCreate(Sender: TObject);
begin
     Try
        LineGridUpdate_Public := F_Update.StringGrid_Update.Row;
        RowGridUpdate_Public  := F_Update.StringGrid_Update.Col;

        Lbl_AtivoCodigo.Caption := '';
        Lbl_AtivoCodigo.Caption := F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public] + ',' + ' código ' + F_Update.StringGrid_Update.Cells[0,LineGridUpdate_Public];

        Btn_DeleteActive.Caption := 'Deletar ' + F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public];

     Except
         Application.MessageBox('Erro ao Deletar Ativo', 'Atenção!', mb_Ok + mb_IconExclamation);
     End;
end;

end.
