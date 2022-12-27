unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TF_Principal = class(TForm)
    Pnl_GreyTop: TPanel;
    Pnl_LeftPai: TPanel;
    TImage_LogoLeftTop: TImage;
    Pnl_CenterPai: TPanel;
    Pnl_Center: TPanel;
    Pnl_TopPurple: TPanel;
    TImage_LogoCenter: TImage;
    TImage_Dashboard: TImage;
    TImage_Investimentos: TImage;
    TImage_Crud: TImage;
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
     try
        if IsZoomed(F_Principal.Handle) then
         begin
              Pnl_LeftPai.Width := 400;

              // Logo central

              TImage_LogoLeftTop.Picture.LoadFromFile('Img/Logo/LogoSuperiorEsquerdaEscuraMaior.png');
              TImage_LogoLeftTop.Width  := 315;
              TImage_LogoLeftTop.Height := 105;

              // Responsividade logo Center

              TImage_LogoCenter.Left := trunc((F_Principal.Width - TImage_LogoCenter.Width) / 2.82);
              TImage_LogoCenter.Top  := trunc((F_Principal.Height - TImage_LogoCenter.Height) / 4);

              // Dashboard
              TImage_Dashboard.Picture.LoadFromFile('Img/Icones/Dashboard.png');
              TImage_Dashboard.Width  := 64;
              TImage_Dashboard.Height := 64;

              TImage_Dashboard.Left := trunc((F_Principal.Width - TImage_Dashboard.Width) / 25);
              TImage_Dashboard.Top  := trunc((F_Principal.Height - TImage_Dashboard.Height) / 4);


              // Investimentos
              TImage_Investimentos.Picture.LoadFromFile('Img/Icones/Investimentos.png');
              TImage_Investimentos.Width  := 64;
              TImage_Investimentos.Height := 64;

              TImage_Investimentos.Left := trunc((F_Principal.Width - TImage_Investimentos.Width) / 25);
              TImage_Investimentos.Top  := trunc((F_Principal.Height - TImage_Investimentos.Height) / 2);


              // Crud

              TImage_Crud.Picture.LoadFromFile('Img/Icones/Crud.png');
              TImage_Crud.Width  := 64;
              TImage_Crud.Height := 64;

              TImage_Crud.Left := trunc((F_Principal.Width - TImage_Crud.Width) / 25);
              TImage_Crud.Top  := trunc((F_Principal.Height - TImage_Crud.Height) / 1.30);

         end
        else
         begin
              Pnl_LeftPai.Width := 300;

              TImage_LogoLeftTop.Picture.LoadFromFile('Img/Logo/LogoSuperiorEsquerdaEscuraMenor.png');
              TImage_LogoLeftTop.Width  := 229;
              TImage_LogoLeftTop.Height := 80;

              // Responsividade logo Center

              TImage_LogoCenter.Left := trunc((F_Principal.Width - TImage_LogoCenter.Width) / 3.5);
              TImage_LogoCenter.Top  := trunc((F_Principal.Height - TImage_LogoCenter.Height) / 4);

              // Dashboard
              TImage_Dashboard.Picture.LoadFromFile('Img/Icones/Dashboard.png');
              TImage_Dashboard.Width  := 64;
              TImage_Dashboard.Height := 64;

              TImage_Dashboard.Left := trunc((F_Principal.Width - TImage_Dashboard.Width) / 25);
              TImage_Dashboard.Top  := trunc((F_Principal.Height - TImage_Dashboard.Height) / 4);


              // Investimentos
              TImage_Investimentos.Picture.LoadFromFile('Img/Icones/Investimentos.png');
              TImage_Investimentos.Width  := 64;
              TImage_Investimentos.Height := 64;

              TImage_Investimentos.Left := trunc((F_Principal.Width - TImage_Investimentos.Width) / 25);
              TImage_Investimentos.Top  := trunc((F_Principal.Height - TImage_Investimentos.Height) / 2);


              // Crud

              TImage_Crud.Picture.LoadFromFile('Img/Icones/Crud.png');
              TImage_Crud.Width  := 64;
              TImage_Crud.Height := 64;

              TImage_Crud.Left := trunc((F_Principal.Width - TImage_Crud.Width) / 25);
              TImage_Crud.Top  := trunc((F_Principal.Height - TImage_Crud.Height) / 1.30);
         end;

     Except
//     on E: Exception do
//        begin
//             Application.MessageBox('Cuidado! A responsividade pode travar sua máquina!',
//                                     'Confirmação',mb_YesNo+mb_IconInformation);
//             Application.Terminate;
//        end;

          Application.Terminate; // Impede que o Delphi trave a máquina tentando dividir por 0

     end;

end;

end.
