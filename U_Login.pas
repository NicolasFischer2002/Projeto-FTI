unit U_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TF_Login = class(TForm)
    Pnl_Center: TPanel;
    Pnl_LoginCenter: TPanel;
    TImage_Wallpaper: TImage;
    Lbl_Login: TLabel;
    Lbl_User: TLabel;
    Lbl_Password: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Pnl_Enter: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Pnl_EnterMouseEnter(Sender: TObject);
    procedure Pnl_EnterMouseLeave(Sender: TObject);
    procedure Pnl_EnterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Login: TF_Login;

implementation

{$R *.dfm}

uses U_Functions, U_Principal;




// ============================== FormShow ================================== //

procedure TF_Login.FormShow(Sender: TObject);
begin
     Try
        Pnl_Enter.SetFocus;

     Finally

     End;
end;

// ========================================================================== //



// ============================== Enter Click =============================== //

procedure TF_Login.Pnl_EnterClick(Sender: TObject);
begin
     Try
        F_Principal := TF_Principal.Create(Self);
        F_Principal.Show;

     Finally

     End;
end;

// ========================================================================== //



// ========================== Enter Mouse Enter ============================= //

procedure TF_Login.Pnl_EnterMouseEnter(Sender: TObject);
begin
     Try
        Pnl_Enter.Color := $3c3c3c;

     Finally

     End;
end;

// ========================================================================== //



// ========================= Enter Mouse Leave ============================== //

procedure TF_Login.Pnl_EnterMouseLeave(Sender: TObject);
begin
     Try
        Pnl_Enter.Color := $002D2D2D;

     Finally

     End;
end;

// ========================================================================== //

end.
