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
    ArqIni_Public           : TIniFile;

    FormUserAtivo           : Bool;
    FormInvestimentosAtivo  : Bool;
    FormPrincipalAtivo      : Bool;
    FormUpdateActive        : Bool;

    EdtAtivoPreenchido      : Bool;
    EdtValorPagoPreenchido  : Bool;
    EdtQuantidadePreenchido : Bool;
    EdtTaxasPreenchido      : Bool;
    EdtLucroPreenchido      : Bool;

    AConnection             : TADOConnection;
    Query                   : TADOQuery;

    Line_public             : Integer;

    LineGridUpdate_Public   : Integer;
    RowGridUpdate_Public    : Integer;

    UpdateDelete_Public     : String;


// Procedures
procedure AtivaBtnCadastrarAtivo_Public();
procedure ApplicationTerminate_Public();
procedure ConnectDatabase_Public();
procedure ReadDataBaseWriteGrid_Public();

procedure ClearGridInvestments_Public();
procedure StartTheStringGridInvestments_Public();
procedure FeedTheGridInvestments_Public();

procedure ClearGridUpdate_Public();
procedure StartTheStringGridUpdate_Public();
procedure FeedTheGridUpdate_Public();



// Functions
function PegaColpipeline_Public (TXT : String; Col : Integer) : string;


implementation


Uses U_Principal, U_User, U_Investimentos, U_Update, U_UpdateMessage, U_UpdateMessageUpdate;







// ========================== Feed The Grid Update ========================== //

procedure FeedTheGridUpdate_Public();
Var
   Str : String;
begin
     Try
        Line_public := 1;

        Query.SQL.Clear;
        Query.SQL.Text := 'SELECT * FROM Investimentos';
        Query.Open;

        if Query.RecordCount > 0 then
         begin
              Query.First;
              while not Query.Eof do
               begin
                    Str := Query.FieldByName('Código').AsString +
                           '|' + Query.FieldByName('Ativo').AsString +
                           '|' + Query.FieldByName('Valor_Negociado').AsString +
                           '|' + Query.FieldByName('Quantidade').AsString +
                           '|' + Query.FieldByName('Taxas').AsString +
                           '|' + Query.FieldByName('Valor_investido').AsString +
                           '|' + Query.FieldByName('Lucro').AsString +
                           '|' + Query.FieldByName('Venda_com_lucro').AsString +
                           '|' + Query.FieldByName('Retorno').AsString;

                    if Query.FieldByName('Ativo').AsString <> '' then
                     begin
                          F_Update.StringGrid_Update.Cells[0,Line_public] := PegaColpipeline_Public(Str,0);
                          F_Update.StringGrid_Update.Cells[1,Line_public] := PegaColpipeline_Public(Str,1);
                          F_Update.StringGrid_Update.Cells[2,Line_public] := PegaColpipeline_Public(Str,2);
                          F_Update.StringGrid_Update.Cells[3,Line_public] := PegaColpipeline_Public(Str,3);
                          F_Update.StringGrid_Update.Cells[4,Line_public] := PegaColpipeline_Public(Str,4);
                          F_Update.StringGrid_Update.Cells[5,Line_public] := PegaColpipeline_Public(Str,5);
                          F_Update.StringGrid_Update.Cells[6,Line_public] := PegaColpipeline_Public(Str,6) + '%';
                          F_Update.StringGrid_Update.Cells[7,Line_public] := PegaColpipeline_Public(Str,7);
                          F_Update.StringGrid_Update.Cells[8,Line_public] := PegaColpipeline_Public(Str,8);
                     end;

                    if Query.FieldByName('Ativo').AsString <> '' then
                     begin
                          Inc(Line_public);
                          F_Update.StringGrid_Update.RowCount := Line_public;
                     end;

                    Query.Next;
               end;
         end;

     Except
         Application.MessageBox('Falha ao ler Ativos do banco de dados', 'Atenção!', mb_Ok+mb_IconExclamation);
     End;
end;




// ========================= Scale the grid Update ========================== //

procedure StartTheStringGridUpdate_Public();
Var
   Str : String;
begin
     try
        Line_public := 1;

        F_Update.StringGrid_Update.ColCount := 9;
        F_Update.StringGrid_Update.RowCount := Line_public;

        F_Update.StringGrid_Update.Cells[0,0] := 'Código';
        F_Update.StringGrid_Update.Cells[1,0] := 'Ativo';
        F_Update.StringGrid_Update.Cells[2,0] := 'Valor';
        F_Update.StringGrid_Update.Cells[3,0] := 'Quantidade';
        F_Update.StringGrid_Update.Cells[4,0] := 'Taxas';
        F_Update.StringGrid_Update.Cells[5,0] := 'Valor investido';
        F_Update.StringGrid_Update.Cells[6,0] := 'Lucro %';
        F_Update.StringGrid_Update.Cells[7,0] := 'Venda com lucro';
        F_Update.StringGrid_Update.Cells[8,0] := 'Retorno';

        F_Update.StringGrid_Update.ColWidths[0] := 70;
        F_Update.StringGrid_Update.ColWidths[1] := 80;
        F_Update.StringGrid_Update.ColWidths[2] := 80;
        F_Update.StringGrid_Update.ColWidths[3] := 100;
        F_Update.StringGrid_Update.ColWidths[4] := 80;
        F_Update.StringGrid_Update.ColWidths[5] := 120;
        F_Update.StringGrid_Update.ColWidths[6] := 80;
        F_Update.StringGrid_Update.ColWidths[7] := 135;
        F_Update.StringGrid_Update.ColWidths[8] := 100;

     finally

     end;
end;

// ========================================================================== //



// ========================== Clear Grid Update ============================= //

procedure ClearGridUpdate_Public();
Var
   Col  : Integer;
   Line : Integer;
begin
     Try
        for line := 1 to F_Update.StringGrid_Update.RowCount - 1 do
         for Col := 0 to F_Update.StringGrid_Update.ColCount - 1 do
          F_Update.StringGrid_Update.Cells[Col, Line] := '';

        F_Update.StringGrid_Update.RowCount := 1;

     Except
         // continue normally
     End;
end;

// ========================================================================== //



// ======================= Feed The Grid Investment ========================= //

procedure FeedTheGridInvestments_Public();
Var
   Str : String;
begin
     Try
        Line_public := 1;

        Query.SQL.Clear;
        Query.SQL.Text := 'SELECT * FROM Investimentos';
        Query.Open;

        if Query.RecordCount > 0 then
         begin
              Query.First;
              while not Query.Eof do
               begin
                    Str := Query.FieldByName('Código').AsString +
                           '|' + Query.FieldByName('Ativo').AsString +
                           '|' + Query.FieldByName('Valor_Negociado').AsString +
                           '|' + Query.FieldByName('Quantidade').AsString +
                           '|' + Query.FieldByName('Taxas').AsString +
                           '|' + Query.FieldByName('Valor_investido').AsString +
                           '|' + Query.FieldByName('Lucro').AsString +
                           '|' + Query.FieldByName('Venda_com_lucro').AsString +
                           '|' + Query.FieldByName('Retorno').AsString;

                    if Query.FieldByName('Ativo').AsString <> '' then
                     begin
                          F_Investimentos.StringGrid_Investments.Cells[0,Line_public] := PegaColpipeline_Public(Str,0);
                          F_Investimentos.StringGrid_Investments.Cells[1,Line_public] := PegaColpipeline_Public(Str,1);
                          F_Investimentos.StringGrid_Investments.Cells[2,Line_public] := PegaColpipeline_Public(Str,2);
                          F_Investimentos.StringGrid_Investments.Cells[3,Line_public] := PegaColpipeline_Public(Str,3);
                          F_Investimentos.StringGrid_Investments.Cells[4,Line_public] := PegaColpipeline_Public(Str,4);
                          F_Investimentos.StringGrid_Investments.Cells[5,Line_public] := PegaColpipeline_Public(Str,5);
                          F_Investimentos.StringGrid_Investments.Cells[6,Line_public] := PegaColpipeline_Public(Str,6) + '%';
                          F_Investimentos.StringGrid_Investments.Cells[7,Line_public] := PegaColpipeline_Public(Str,7);
                          F_Investimentos.StringGrid_Investments.Cells[8,Line_public] := PegaColpipeline_Public(Str,8);
                     end;

                    if Query.FieldByName('Ativo').AsString <> '' then
                     begin
                          Inc(Line_public);
                          F_Investimentos.StringGrid_Investments.RowCount := Line_public;
                     end;

                    Query.Next;
               end;
         end;

     Except
         Application.MessageBox('Falha ao ler Ativos do banco de dados', 'Atenção!', mb_Ok+mb_IconExclamation);
     End;
end;

// ========================================================================== //



// ======================= Scale the grid Investments ======================= //

procedure StartTheStringGridInvestments_Public();
Var
   Str : String;
begin
     try
        Line_public := 1;

        F_Investimentos.StringGrid_Investments.ColCount := 9;
        F_Investimentos.StringGrid_Investments.RowCount := Line_public;

        F_Investimentos.StringGrid_Investments.Cells[0,0] := 'Código';
        F_Investimentos.StringGrid_Investments.Cells[1,0] := 'Ativo';
        F_Investimentos.StringGrid_Investments.Cells[2,0] := 'Valor';
        F_Investimentos.StringGrid_Investments.Cells[3,0] := 'Quantidade';
        F_Investimentos.StringGrid_Investments.Cells[4,0] := 'Taxas';
        F_Investimentos.StringGrid_Investments.Cells[5,0] := 'Valor investido';
        F_Investimentos.StringGrid_Investments.Cells[6,0] := 'Lucro %';
        F_Investimentos.StringGrid_Investments.Cells[7,0] := 'Venda com lucro';
        F_Investimentos.StringGrid_Investments.Cells[8,0] := 'Retorno';

        F_Investimentos.StringGrid_Investments.ColWidths[0] := 70;
        F_Investimentos.StringGrid_Investments.ColWidths[1] := 80;
        F_Investimentos.StringGrid_Investments.ColWidths[2] := 80;
        F_Investimentos.StringGrid_Investments.ColWidths[3] := 100;
        F_Investimentos.StringGrid_Investments.ColWidths[4] := 80;
        F_Investimentos.StringGrid_Investments.ColWidths[5] := 120;
        F_Investimentos.StringGrid_Investments.ColWidths[6] := 80;
        F_Investimentos.StringGrid_Investments.ColWidths[7] := 135;
        F_Investimentos.StringGrid_Investments.ColWidths[8] := 100;

     finally

     end;
end;

// ========================================================================== //



// ======================== Clear Grid Investment =========================== //

procedure ClearGridInvestments_Public();
Var
   Col  : Integer;
   Line : Integer;
begin
     Try
        for line := 1 to F_Investimentos.StringGrid_Investments.RowCount - 1 do
         for Col := 0 to F_Investimentos.StringGrid_Investments.ColCount - 1 do
          F_Investimentos.StringGrid_Investments.Cells[Col, Line] := '';

     Except
         // continue normally
     End;
end;

// ========================================================================== //


// ================== Read from database and write to grid ================== //

procedure ReadDataBaseWriteGrid_public();
Var
   Str  : String;
begin
     Try
        ClearGridInvestments_Public();

        Line_public := 1;

        F_Investimentos.StringGrid_Investments.ColCount := 9;
        F_Investimentos.StringGrid_Investments.RowCount := Line_public;

        Query.SQL.Clear;
        Query.SQL.Text := 'SELECT * FROM Investimentos';
        Query.Open;

        if Query.RecordCount > 0 then
         begin
              Query.First;
              while not Query.Eof do
               begin
                    Str := Query.FieldByName('Código').AsString +
                           '|' + Query.FieldByName('Ativo').AsString +
                           '|' + Query.FieldByName('Valor_Negociado').AsString +
                           '|' + Query.FieldByName('Quantidade').AsString +
                           '|' + Query.FieldByName('Taxas').AsString +
                           '|' + Query.FieldByName('Valor_investido').AsString +
                           '|' + Query.FieldByName('Lucro').AsString +
                           '|' + Query.FieldByName('Venda_com_lucro').AsString +
                           '|' + Query.FieldByName('Retorno').AsString;

                    if Query.FieldByName('Ativo').AsString <> '' then
                     begin
                          F_Investimentos.StringGrid_Investments.Cells[0,Line_public] := PegaColpipeline_Public(Str,0);
                          F_Investimentos.StringGrid_Investments.Cells[1,Line_public] := PegaColpipeline_Public(Str,1);
                          F_Investimentos.StringGrid_Investments.Cells[2,Line_public] := PegaColpipeline_Public(Str,2);
                          F_Investimentos.StringGrid_Investments.Cells[3,Line_public] := PegaColpipeline_Public(Str,3);
                          F_Investimentos.StringGrid_Investments.Cells[4,Line_public] := PegaColpipeline_Public(Str,4);
                          F_Investimentos.StringGrid_Investments.Cells[5,Line_public] := PegaColpipeline_Public(Str,5);
                          F_Investimentos.StringGrid_Investments.Cells[6,Line_public] := PegaColpipeline_Public(Str,6) + '%';
                          F_Investimentos.StringGrid_Investments.Cells[7,Line_public] := PegaColpipeline_Public(Str,7);
                          F_Investimentos.StringGrid_Investments.Cells[8,Line_public] := PegaColpipeline_Public(Str,8);
                     end;

                    if Query.FieldByName('Ativo').AsString <> '' then
                    begin
                         Inc(Line_public);
                         F_Investimentos.StringGrid_Investments.RowCount := Line_public;
                    end;

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
