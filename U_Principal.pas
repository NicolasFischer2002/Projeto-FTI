unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TF_Principal = class(TForm)
    Pnl_GreyTop: TPanel;
    Pnl_LeftPai: TPanel;
    TImage_LogoLeftTop: TImage;
    Pnl_CenterPai: TPanel;
    Pnl_Center: TPanel;
    Pnl_TopPurple: TPanel;
    TImage_LogoCenter: TImage;
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

// Chamando as func�es de outra Unit
uses U_Functions;


procedure TF_Principal.FormResize(Sender: TObject);
begin
     try
        if IsZoomed(F_Principal.Handle) then
         begin
              // Responsividade logo Center
              ImageResponsiveness_Public(TImage_LogoCenter,Pnl_Center,2,6);

              // Responsividade logo Left Top
              ImageResponsiveness_Public(TImage_LogoLeftTop,Pnl_LeftPai,2,2);
         end
        else
         begin
              // Responsividade logo Center
              ImageResponsiveness_Public(TImage_LogoCenter,Pnl_Center,2,3);

              // Responsividade logo Left Top
              ImageResponsiveness_Public(TImage_LogoLeftTop,Pnl_LeftPai,2,2);
         end;

     finally

     end;

end;

end.