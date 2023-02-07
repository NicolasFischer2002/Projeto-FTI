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
    StringGrid_Investments: TStringGrid;
    TImage_Search: TImage;
    Edt_Search: TEdit;
    Lbl_Search: TLabel;
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
    procedure FormResize(Sender: TObject);
    procedure Edt_SearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

Uses U_Functions, U_User, U_Principal, U_Update;





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



// ============================ Register active ============================= //

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
   Copied         : String;
begin
     Try
        Try
           Ativo      := Edt_Ativo.Text;
           ValorPago  := Edt_ValorPago.Text;
           Quantidade := Edt_Quantidade.Text;
           Taxas      := Edt_Taxas.Text;
           Lucro      := Edt_Lucro.Text;

           ValorInvestido := InvestedAmount_Public(ValorPago, Quantidade, Taxas);

           VendaComLucro := SaleWithProfit_Public(ValorPago, Quantidade, Taxas, Lucro);

           Retorno := Return_Public(VendaComLucro, Quantidade, ValorPago);

           if Length(Retorno) > 4 then
            begin                                  //****************************//
                 Copied  := Retorno;               //  Arrumar essa varzea aqui  //
                 Retorno := Copy(Copied,0,6);      //****************************//
            end;

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
            Application.MessageBox('Falha ao cadastrar ativo no banco de dados!','Aten��o', mb_Ok+mb_IconExclamation);
        End;

     Finally
         ClearEDTs();
         Btn_CadastrarAtivo.Enabled := False;
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

// ========================================================================== //



// ========================================================================== //

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

// ========================================================================== //



// ========================================================================== //

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

// ========================================================================== //



// ========================================================================== //

procedure TF_Investimentos.Edt_SearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Search  : String;
   Content : String;
   Line    : Integer;
   Col     : Integer;
begin
     Try
        Search := Edt_Search.Text;

        for line := 1 to StringGrid_Investments.RowCount -1 do
         for Col := 0 to 1 do
          begin
               Content := StringGrid_Investments.Cells[Col, Line];
               if Search = Content then
                begin
                     ClearGridInvestments_Public();
                     StringGrid_Investments.RowCount := 2;

                     // Mandar um SQL para pegar os dados do banco pelo c�digo(Line, Col 0) e preencher uma linha
                     // Caso o Edt esteja vazio recarregar o grid
                     // Deixar registrar apenas ativos n�o repetidos

                     Break;
                end;
          end;

     Finally

     End;
end;

// ========================================================================== //



// ========================================================================== //

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

// ========================================================================== //



// ========================================================================== //

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



// ========================================================================== //

procedure TF_Investimentos.FormResize(Sender: TObject);
begin

     TImage_Search.Top  := 62;
     TImage_Search.Left := 840;

     Edt_Search.Height := 25;
     Edt_Search.Width  := 200;
     Edt_Search.Left   := 900;
     Edt_Search.Top    := 80;

     Lbl_Search.Top    := 43;
     Lbl_Search.Left   := 916;

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
