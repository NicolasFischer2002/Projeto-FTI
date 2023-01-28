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
    procedure FormCreate(Sender: TObject);
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

procedure TF_UpdateMessage.FormCreate(Sender: TObject);
begin
     Try
        LineGridUpdate := F_Update.StringGrid_Update.Row;
        RowGridUpdate  := F_Update.StringGrid_Update.Col;

        Btn_DeleteActive.Caption := 'Deletar ' + F_Update.StringGrid_Update.Cells[1,LineGridUpdate];

     Except
         Application.MessageBox('Erro ao Deletar Ativo', 'Atenção!', mb_Ok + mb_IconExclamation);
     End;
end;

end.
