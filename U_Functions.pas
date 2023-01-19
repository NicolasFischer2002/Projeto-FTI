unit U_Functions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, IniFiles, Data.Win.ADODB;

Var
private,
    { Private declarations }

// Procedures


// Functions


public,
    { Public declarations }
    ArqIni                  : TIniFile;
    FormUserAtivo           : Bool;
    FormInvestimentosAtivo  : Bool;

    EdtAtivoPreenchido      : Bool;
    EdtValorPagoPreenchido  : Bool;
    EdtQuantidadePreenchido : Bool;
    EdtTaxasPreenchido      : Bool;
    EdtLucroPreenchido      : Bool;

    AConnection             : TADOConnection;
    Query                   : TADOQuery;


// Procedures
procedure AtivaBtnCadastrarAtivo_Public();
procedure ApplicationTerminate_Public();
procedure ConnectDatabase_Public();


// Functions




implementation


uses U_Principal, U_User, U_Investimentos;


// ======== Activate or not btn_CadastrarAtivo of U_Investimentos =========== //

procedure AtivaBtnCadastrarAtivo_Public();
begin
     if (EdtAtivoPreenchido = True) and (EdtValorPagoPreenchido = True) and
        (EdtQuantidadePreenchido = True) and (EdtTaxasPreenchido = True) and
        (EdtLucroPreenchido = True) then
      F_Investimentos.Btn_CadastrarAtivo.Enabled := True
     else
      F_Investimentos.Btn_CadastrarAtivo.Enabled := False;
end;

// ========================================================================== //



// ================== Close the Application with: crtl + w ================== //

procedure ApplicationTerminate_Public();
begin
     If ((GetKeyState(VK_CONTROL) AND 128)=128) and
        ((GetKeyState(ord('W')) AND 128)=128) then
        Application.Terminate;
end;

// ========================================================================== //



// ========================== Connect with database ========================= //

procedure ConnectDatabase_Public();
begin
     Try
        AConnection                  := TADOConnection.Create(Nil);
        AConnection.Connected        := False;
        AConnection.Provider         := 'Microsoft.Jet.OLEDB.4.0';
        AConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Investimentos.mdb;Persist Security Info=False';
        AConnection.LoginPrompt      := False;
        AConnection.Connected        := True;

        Query            := TADOQuery.Create(Nil);
        Query.Connection := AConnection;

     Except
         Application.MessageBox('Falha ao conectar com banco de dados', 'Atenção!', mb_Ok+mb_IconExclamation);
     End;
end;

// ========================================================================== //

end.
