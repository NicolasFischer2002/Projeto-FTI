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
    procedure Edt_NickNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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


// ============================= Valid NickName ============================= //

procedure TF_User.Edt_NickNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   NickName : String;
begin
     NickName := Edt_NickName.Text;

     if (Length(Trim(NickName)) >= 3) and (Length(Trim(NickName)) <= 10) then
      begin
           Lbl_Validacao.Left       := 350;
           Lbl_Validacao.Font.Color := clGreen;
           Lbl_Validacao.Caption    := 'V�lido';
           Pnl_Adicionar.Enabled    := True;
      end
     else
      begin
           Lbl_Validacao.Left       := 318;
           Lbl_Validacao.Font.Color := clRed;
           Lbl_Validacao.Caption    := 'Inv�lido';
           Pnl_Adicionar.Enabled    := False;
      end;
end;

// ========================================================================== //



// ============================ Add the NickName ============================ //

procedure TF_User.Pnl_AdicionarClick(Sender: TObject);
begin
     F_Principal.Lbl_BemVindo.Caption := 'Bem vindo, ' + Trim(Edt_NickName.Text);
     Lbl_Validacao.Left    := 100;
     Lbl_Validacao.Caption := 'Alterado com sucesso!';
end;

// ========================================================================== //

end.

