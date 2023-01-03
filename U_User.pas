unit U_User;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TF_User = class(TForm)
    TImage_LogoCenter: TImage;
    Lbl_SerChamado: TLabel;
    Edt_NickName: TEdit;
    Pnl_Apelido: TPanel;
    Lbl_NickName: TLabel;
    Pnl_ValidacaoNickName: TPanel;
    Lbl_Validacao: TLabel;
    Pnl_Adicionar: TPanel;
    procedure Pnl_AdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CaptionValidacao_Public : String;

  end;

var
  F_User: TF_User;

implementation

{$R *.dfm}

uses U_Functions,U_Principal;

procedure TF_User.Pnl_AdicionarClick(Sender: TObject);
begin
     F_Principal.Lbl_BemVindo.Caption := 'Bem vindo, ' + Edt_NickName.Text;
end;

end.

