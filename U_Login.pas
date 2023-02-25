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
    Edt_NickName: TEdit;
    Edt_PassWord: TEdit;
    Pnl_Enter: TPanel;
    Lbl_ForgotPassword: TLabel;
    Lbl_CreateAccount: TLabel;
    Pnl_UserPassWordIncorrect: TPanel;
    Timer: TTimer;
    procedure Pnl_EnterMouseEnter(Sender: TObject);
    procedure Pnl_EnterMouseLeave(Sender: TObject);
    procedure Pnl_EnterClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    TimeTimer : Integer;

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
        TimeTimer := 0;

     Finally

     End;
end;

// ========================================================================== //



// ============================== Enter Click =============================== //

procedure TF_Login.Pnl_EnterClick(Sender: TObject);
Var
   NickName : String;
   PassWord : String;
begin
     Try
        NickName := Edt_NickName.Text;
        PassWord := Edt_PassWord.Text;

        if (NickName = 'GodModeOn') and (PassWord = 'GodModeOn') then
         begin
              F_Principal := TF_Principal.Create(Self);
              F_Principal.Show;
         end
        else
         begin
              Pnl_UserPassWordIncorrect.Visible := True;
         end;

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


// =============================== Timer ==================================== //

procedure TF_Login.TimerTimer(Sender: TObject);
begin
     if Pnl_UserPassWordIncorrect.Visible = True then
      begin
           TimeTimer := TimeTimer + 1000;
           if TimeTimer >= 3000 then
            begin
                 Pnl_UserPassWordIncorrect.Visible := False;
                 TimeTimer := 0;
            end;
      end;
end;

// ========================================================================== //



end.
