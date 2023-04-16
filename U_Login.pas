unit U_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons, Data.Win.ADODB;

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
    procedure Lbl_ForgotPasswordClick(Sender: TObject);
    procedure Lbl_CreateAccountClick(Sender: TObject);
    procedure Edt_PassWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

procedure TF_Login.Edt_PassWordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   KeyChar: Char;
begin
     Try
        if Key = VK_RETURN then
         Pnl_Enter.OnClick(Nil);

     Finally

     End;
end;

procedure TF_Login.FormShow(Sender: TObject);
begin
     Try
        Pnl_Enter.SetFocus;
        TimeTimer := 0;

     Finally

     End;
end;

// ========================================================================== //



// ========================================================================== //

procedure TF_Login.Lbl_CreateAccountClick(Sender: TObject);
begin
     ShowMessage('Desabilitado por enquanto');
end;

procedure TF_Login.Lbl_ForgotPasswordClick(Sender: TObject);
Var
   QueryLogin : TADOQuery;
   AdoLogin   : TADOConnection;
   NickName   : String;
   PassWord   : String;
   Permission : String;
begin
     Try
//        NickName   := 'GodModeOn';
//        PassWord   := 'PassWord';
//        Permission := 'Administrador';
//
//        NickName   := Criptografa_Public(NickName, 100);
//        PassWord   := Criptografa_Public(PassWord, 100);
//        Permission := Criptografa_Public(Permission, 100);
//
//        AdoLogin                  := TADOConnection.Create(Nil);
//        AdoLogin.Connected        := False;
//        AdoLogin.Provider         := 'Microsoft.Jet.OLEDB.4.0';
//        AdoLogin.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Investimentos.mdb;Persist Security Info=False';
//        AdoLogin.LoginPrompt      := False;
//        AdoLogin.Connected        := True;
//
//        QueryLogin            := TADOQuery.Create(Nil);
//        QueryLogin.Connection := AdoLogin;
//     
//        QueryLogin.SQL.Clear;
//        QueryLogin.SQL.Text := 'INSERT INTO Login (Usuario,Senha,Permissao) VALUES (' + QuotedStr(NickName) + 
//                           ',' + QuotedStr(PassWord) + ',' + QuotedStr(Permission) + ')';
//        QueryLogin.ExecSQL;
//        ShowMessage('OK');

          ShowMessage('Desabilitado por enquanto');

          // Usuario cadastrado   : GodModeOn
          // Senha cadastrada     : PassWord
          // Permissao cadastrada : Administrador
          // Now, realizar for dentro do banco e ir descriptografando as info
          // e comparando com as digitadas para verificar se existem ou não

          // Dar um clear no banco e inserir novamente essas informações
     
     Except
         // ShowMessage('Erro');
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

        if (NickName = 'GodModeOn') and (PassWord = 'senha') then
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
