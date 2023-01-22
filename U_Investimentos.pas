unit U_Investimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Data.DB, Data.Win.ADODB;

type
  TF_Investimentos = class(TForm)
    Pnl_Center: TPanel;
    Pnl_Top: TPanel;
    Pnl_Bottom: TPanel;
    Pnl_Manager: TPanel;
    TImage_Manager: TImage;
    Lbl_Manager: TLabel;
    Pnl_Right: TPanel;
    Lbl_Taxas: TLabel;
    Lbl_Ativo: TLabel;
    Lbl_Quantidade: TLabel;
    Lbl_Lucro: TLabel;
    Lbl_ValorPago: TLabel;
    Edt_Taxas: TEdit;
    Edt_Ativo: TEdit;
    Edt_Quantidade: TEdit;
    Edt_Lucro: TEdit;
    Edt_ValorPago: TEdit;
    Btn_CadastrarAtivo: TButton;
    StringGrid: TStringGrid;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edt_AtivoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_ValorPagoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_QuantidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_TaxasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_LucroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_CadastrarAtivoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ClearEDTs();
  public
    { Public declarations }
  end;

var
  F_Investimentos: TF_Investimentos;

implementation

{$R *.dfm}

uses U_Functions, U_User, U_Principal;






procedure TF_Investimentos.Button1Click(Sender: TObject);
begin
     Query.SQL.Clear;
     Query.SQL.Text := 'DELETE * FROM Investimentos'; // Funcionando
     Query.ExecSQL;
     ShowMessage('Banco de dados limpo');
end;


// ============================= Clear EDTs ================================= //

procedure TF_Investimentos.ClearEDTs();
begin
     Edt_Ativo.Text      := '';
     Edt_ValorPago.Text  := '';
     Edt_Quantidade.Text := '';
     Edt_Taxas.Text      := '';
     Edt_Lucro.Text      := '';
end;

// ========================================================================== //



// ============================ Cadastra Ativo ============================== //

procedure TF_Investimentos.Btn_CadastrarAtivoClick(Sender: TObject);
Var
   Ativo          : String;
   ValorPago      : String;
   Quantidade     : String;
   Taxas          : String;
   Lucro          : String;
   VendaComLucro  : String;
   Retorno        : String;
   ValorInvestido : String;
begin
     Try
        Try
           Ativo      := Edt_Ativo.Text;
           ValorPago  := Edt_ValorPago.Text;
           Quantidade := Edt_Quantidade.Text;
           Taxas      := Edt_Taxas.Text;
           Lucro      := Edt_Lucro.Text;


           ValorInvestido := FloatToStr((StrToFloat(ValorPago) * StrToFloat(Quantidade)) + StrToFloat(Taxas));


           VendaComLucro  := FloatToStr((StrToFloat(ValorPago) +
                            (((StrToFloat(ValorPago) * StrToFloat(Quantidade)) - StrToFloat(Taxas)) * StrToFloat(Lucro)) / 1000));

           Retorno        := FloatToStr((StrToFloat(VendaComLucro) * StrToFloat(Quantidade)) -
                            (StrToFloat(ValorPago) * StrToFloat(Quantidade)));


           Query.SQL.Clear;
           Query.SQL.Text := 'INSERT INTO Investimentos (Ativo,Valor_negociado,Quantidade,Taxas,Valor_investido,Lucro,Venda_Com_Lucro,Retorno)' +
                             'VALUES (' + QuotedStr(Ativo) + ',' + QuotedStr(ValorPago) +
                             ',' + QuotedStr(Quantidade) + ',' + QuotedStr(Taxas) +
                             ',' + QuotedStr(ValorInvestido) + ',' + QuotedStr(Lucro) +
                             ',' + QuotedStr(VendaComLucro) + ',' + QuotedStr(Retorno) + ') ';
           Query.ExecSQL;

           ShowMessage('Cadastrado com sucesso');

           ReadDataBaseWriteGrid_Public();

        Except
            Application.MessageBox('Falha ao cadastrar ativo no banco de dados!','Atenção', mb_Ok+mb_IconExclamation);
        End;

     Finally
         ClearEDTs();
     End;
end;

// ========================================================================== //



// ======================== Validation dos EDTs ============================= //

procedure TF_Investimentos.Edt_AtivoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Ativo : String;
begin
     Try
        Ativo := Edt_Ativo.Text;

        if (Length(Trim(Ativo)) >= 5) and (Length(Trim(Ativo)) <= 6) then
         begin
              Edt_Ativo.Font.Color := clGreen;
              EdtAtivoPreenchido   := True;
         end
        else
         begin
              Edt_Ativo.Font.Color := clRed;
              EdtAtivoPreenchido   := False;
         end;

     Finally
         AtivaBtnCadastrarAtivo_Public();
     End;
end;


procedure TF_Investimentos.Edt_ValorPagoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   ValorPago : Double;
begin
     Try
        Try
           ValorPago := StrToFloat(Edt_ValorPago.Text);

           if (ValorPago > 0) then
            begin
                 Edt_ValorPago.Font.Color := clGreen;
                 EdtValorPagoPreenchido   := True;
            end
           else
            begin
                 Edt_ValorPago.Font.Color := clRed;
                 EdtValorPagoPreenchido   := False;
            end;

        Except
            EdtValorPagoPreenchido   := False;
            Edt_ValorPago.Font.Color := clRed;
            AtivaBtnCadastrarAtivo_Public();
        End;

     Finally
         AtivaBtnCadastrarAtivo_Public();
     End;
end;


procedure TF_Investimentos.Edt_QuantidadeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Quantidade : Integer;
begin
     Try
        Try
           Quantidade := StrToInt(Edt_Quantidade.Text);

           if (Quantidade > 0) then
            begin
                 Edt_Quantidade.Font.Color := clGreen;
                 EdtQuantidadePreenchido   := True;
            end
           else
            begin
                 Edt_Quantidade.Font.Color := clRed;
                 EdtQuantidadePreenchido   := False;
            end;

        Except
            EdtQuantidadePreenchido   := False;
            Edt_Quantidade.Font.Color := clRed;
            AtivaBtnCadastrarAtivo_Public();
        End;

     Finally
         AtivaBtnCadastrarAtivo_Public();
     End;
end;


procedure TF_Investimentos.Edt_TaxasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Taxas : Double;
begin
     Try
        Try
           Taxas := StrToFloat(Edt_Taxas.Text);

           if (Taxas >= 0) then
            begin
                 Edt_Taxas.Font.Color := clGreen;
                 EdtTaxasPreenchido   := True;
            end
           else
            begin
                 Edt_Taxas.Font.Color := clRed;
                 EdtTaxasPreenchido   := False;
            end;

        Except
            EdtTaxasPreenchido   := False;
            Edt_Taxas.Font.Color := clRed;
            AtivaBtnCadastrarAtivo_Public();
        End;

     Finally
         AtivaBtnCadastrarAtivo_Public();
     End;
end;


procedure TF_Investimentos.Edt_LucroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Lucro : Double;
begin
     Try
        try
           Lucro := StrToFloat(Edt_Lucro.Text);

           if Lucro > 0 then
            begin
                 Edt_Lucro.Font.Color := clGreen;
                 EdtLucroPreenchido   := True;
            end
           else
            begin
                 Edt_Lucro.Font.Color := clRed;
                 EdtLucroPreenchido   := False;
            end;

        Except
            EdtLucroPreenchido   := False;
            Edt_Lucro.Font.Color := clRed;
            AtivaBtnCadastrarAtivo_Public();
        end;

     Finally
         AtivaBtnCadastrarAtivo_Public();
     End;

end;

// ========================================================================== //



// ====================== OnCreate do TF_Investimentos ====================== //

procedure TF_Investimentos.FormCreate(Sender: TObject);
Var
   Str : String;
begin
     Try
        ClearGrid_Public();

        Line_public := 1;

        StringGrid.ColCount := 9;
        StringGrid.RowCount := Line_public;

        StringGrid.Cells[0,0] := 'Código';
        StringGrid.Cells[1,0] := 'Ativo';
        StringGrid.Cells[2,0] := 'Valor';
        StringGrid.Cells[3,0] := 'Quantidade';
        StringGrid.Cells[4,0] := 'Taxas';
        StringGrid.Cells[5,0] := 'Valor investido';
        StringGrid.Cells[6,0] := 'Lucro %';
        StringGrid.Cells[7,0] := 'Venda com lucro';
        StringGrid.Cells[8,0] := 'Retorno';

        Try
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
                             StringGrid.Cells[0,Line_public] := PegaColpipeline_Public(Str,0);
                             StringGrid.Cells[1,Line_public] := PegaColpipeline_Public(Str,1);
                             StringGrid.Cells[2,Line_public] := PegaColpipeline_Public(Str,2);
                             StringGrid.Cells[3,Line_public] := PegaColpipeline_Public(Str,3);
                             StringGrid.Cells[4,Line_public] := PegaColpipeline_Public(Str,4);
                             StringGrid.Cells[5,Line_public] := PegaColpipeline_Public(Str,5);
                             StringGrid.Cells[6,Line_public] := PegaColpipeline_Public(Str,6) + '%';
                             StringGrid.Cells[7,Line_public] := PegaColpipeline_Public(Str,7);
                             StringGrid.Cells[8,Line_public] := PegaColpipeline_Public(Str,8);
                        end;

                       if Query.FieldByName('Ativo').AsString <> '' then
                        begin
                             Inc(Line_public);
                             StringGrid.RowCount := Line_public;
                        end;

                       Query.Next;
                  end;
            end;

        Except
            Application.MessageBox('Falha ao ler Ativos do banco de dados', 'Atenção!', mb_Ok+mb_IconExclamation);
        End;

     Finally

     End;
end;

// ========================================================================== //



// ================== Close the Application with: crtl + w ================== //

procedure TF_Investimentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     ApplicationTerminate_Public();
end;

// ========================================================================== //

end.
