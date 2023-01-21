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
procedure ReadDataBaseWriteGrid();


// Functions
function PegaColpipeline_Public (TXT : String; Col : Integer): string;



implementation


uses U_Principal, U_User, U_Investimentos;




// ================== Read from database and write to grid ================== //

procedure ReadDataBaseWriteGrid();
Var
   Str  : String;
   Line : Integer;
begin
     Try
           Query.SQL.Clear;
           Query.SQL.Text := 'SELECT * FROM Investimentos';
           Query.Open;

           if Query.RecordCount > 0 then
            begin
                 Line := 1;
                 Query.First;
                 while not Query.Eof do
                  begin
                       Str := Query.FieldByName('Código').AsString +
                              '|' + Query.FieldByName('Ativo').AsString +
                              '|' + Query.FieldByName('Valor_Negociado').AsString +
                              '|' + Query.FieldByName('Quantidade').AsString +
                              '|' + Query.FieldByName('Taxas').AsString +
                              '|' + Query.FieldByName('Lucro').AsString +
                              '|' + Query.FieldByName('Venda_com_lucro').AsString +
                              '|' + Query.FieldByName('Retorno').AsString;

                       F_Investimentos.StringGrid.Cells[0,Line] := PegaColpipeline_Public(Str,0);
                       F_Investimentos.StringGrid.Cells[1,Line] := PegaColpipeline_Public(Str,1);
                       F_Investimentos.StringGrid.Cells[2,Line] := PegaColpipeline_Public(Str,2);
                       F_Investimentos.StringGrid.Cells[3,Line] := PegaColpipeline_Public(Str,3);
                       F_Investimentos.StringGrid.Cells[4,Line] := PegaColpipeline_Public(Str,4);
                       F_Investimentos.StringGrid.Cells[5,Line] := PegaColpipeline_Public(Str,5);
                       F_Investimentos.StringGrid.Cells[6,Line] := PegaColpipeline_Public(Str,6);
                       F_Investimentos.StringGrid.Cells[7,Line] := PegaColpipeline_Public(Str,7);

                       Inc(Line);
                       Query.Next;
                  end;
            end;

        Except
            Application.MessageBox('Falha ao ler Ativos do banco de dados', 'Atenção!', mb_Ok+mb_IconExclamation);
        End;
end;

// ========================================================================== //



// ============================ PegaColPipeLine ============================= //

function PegaColpipeline_Public (TXT : String; Col : Integer): string;
Var
   N,C,U : Integer;
begin
     C := 0;
     U := 0;
     Result := '';

     For N := 1 to Length(TXT) do
      if copy(TXT,N,1) = '|' then
       begin
            if C = Col then
             begin
                  Result := Trim(Copy(Txt,U+1,(N-1)-(U)));
                  Exit;
             end;
             U := N;
             Inc(C);
       end;
       if (Col = C) then // A última coluna...
        Result := Trim(Copy(Txt,U+1,Length(Txt)));
end;

// ========================================================================== //



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

        F_Principal.Pnl_CenterBottomConectado.Visible := True;

     Except
         Application.MessageBox('Falha ao conectar com banco de dados', 'Atenção!', mb_Ok+mb_IconExclamation);
     End;
end;

// ========================================================================== //

end.
