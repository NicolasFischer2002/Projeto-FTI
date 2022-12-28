unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TF_Principal = class(TForm)
    Pnl_GreyTop: TPanel;
    Pnl_LeftPai: TPanel;
    TImage_LogoLeftTop: TImage;
    Pnl_CenterPai: TPanel;
    Pnl_Center: TPanel;
    Pnl_TopPurple: TPanel;
    TImage_LogoCenter: TImage;
    Pnl_LeftTop: TPanel;
    SB_Atualizar: TSpeedButton;
    SB_Investimentos: TSpeedButton;
    SB_Dashboard: TSpeedButton;
    TImage_Home: TImage;
    Label1: TLabel;
    Pnl_TopHome: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

{$R *.dfm}

// Chamando as funcões de outra Unit
uses U_Functions;


procedure TF_Principal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If ((GetKeyState(VK_CONTROL) AND 128)=128) and
        ((GetKeyState(ord('W')) AND 128)=128) then
        Application.Terminate;
end;

procedure TF_Principal.FormResize(Sender: TObject);
begin
     if F_Principal.WindowState = WsMaximized then
      begin
           Pnl_LeftPai.Width := 400;

           Pnl_LeftTop.Height := 200;

           TImage_LogoLeftTop.Width  := 315;
           TImage_LogoLeftTop.Height := 100;

           TImage_LogoLeftTop.Picture.LoadFromFile('Img/Logo/LogoSuperiorEsquerdaEscuraMaior.png');
      end;
end;

end.
