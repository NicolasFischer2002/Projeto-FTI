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
    procedure Edt_SearchKeyDown(Sender: TObject; var Key: Word;
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
   ActiveGrid     : String;
   Line           : Integer;
   Col            : Integer;
   ActiveExists   : Bool;
begin
     Try
        Try
           ActiveExists := False;

           for line := 1 to StringGrid_Investments.RowCount do
            for Col := 1 to 1 do
             begin
                  ActiveGrid := LowerCase(StringGrid_Investments.Cells[Col,Line]);
                  if ActiveGrid = LowerCase(Trim(Edt_Ativo.Text)) then
                   begin
                        ActiveExists := True;
                        Application.MessageBox('Ativo já cadstrado com este código!', 'Atenção', mb_Ok+mb_IconExclamation);
                        Break;
                   end
             end;

             if not ActiveExists then
              begin
                   Ativo      := Edt_Ativo.Text;
                   ValorPago  := Edt_ValorPago.Text;
                   Quantidade := Edt_Quantidade.Text;
                   Taxas      := Edt_Taxas.Text;
                   Lucro      := Edt_Lucro.Text;

                   ValorInvestido := InvestedAmount_Public(ValorPago, Quantidade, Taxas);

                   VendaComLucro  := SaleWithProfit_Public(ValorPago, Quantidade, Taxas, Lucro);

                   Retorno        := Return_Public(VendaComLucro, Quantidade, ValorPago);

                   Query.SQL.Clear;
                   Query.SQL.Text := 'INSERT INTO Investimentos (Ativo,Valor_negociado,Quantidade,Taxas,Valor_investido,Lucro,Venda_Com_Lucro,Retorno)' +
                                     'VALUES (' + QuotedStr(Ativo) + ',' + QuotedStr(ValorPago) +
                                     ',' + QuotedStr(Quantidade) + ',' + QuotedStr(Taxas) +
                                     ',' + QuotedStr(ValorInvestido) + ',' + QuotedStr(Lucro) +
                                     ',' + QuotedStr(VendaComLucro) + ',' + QuotedStr(Retorno) + ') ';
                   Query.ExecSQL;

                   ShowMessage('Cadastrado com sucesso');

                   ReadDataBaseWriteGrid_Public();
              end;



        Except
            Application.MessageBox('Falha ao cadastrar ativo no banco de dados!','Atenção', mb_Ok+mb_IconExclamation);
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



// ============ Used to clear the text of all Edits on the form ============= //
// Todos os KeyDown dos Edts (deste form) apontam para esse evento

procedure TF_Investimentos.Edt_SearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ((GetKeyState(VK_CONTROL) AND 128)=128) and (key = VK_DELETE) then
      begin
           (Sender as Tedit).Clear;
      end;

     if ((GetKeyState(VK_CONTROL) AND 128)=128) and
        ((GetKeyState(ord('W')) AND 128)=128) then
      begin
           Application.Terminate;
      end;
end;

// ========================================================================== //

procedure TF_Investimentos.Edt_SearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Search  : String;
   Content : String;
   Line    : Integer;
   Col     : Integer;

   Code           : String;
   Active         : String;
   AmountPaid     : String;
   Quantity       : String;
   Fees           : String;
   AmountInvested : String;
   Profit         : String;
   SaleWithProfit : String;
   Return         : String;

   Key_par : Word;

begin
     Try
        Search := Edt_Search.Text;

        if Search <> '' then
         begin
              for line := 1 to StringGrid_Investments.RowCount -1 do
               for Col := 0 to 1 do
                begin
                     Content := StringGrid_Investments.Cells[Col, Line];
                     if LowerCase(Search) = LowerCase(Content) then
                      begin
                           Code           := StringGrid_Investments.Cells[0,Line];
                           Active         := StringGrid_Investments.Cells[1,Line];
                           AmountPaid     := StringGrid_Investments.Cells[2,Line];
                           Quantity       := StringGrid_Investments.Cells[3,Line];
                           Fees           := StringGrid_Investments.Cells[4,Line];
                           AmountInvested := StringGrid_Investments.Cells[5,Line];
                           Profit         := StringGrid_Investments.Cells[6,Line];
                           SaleWithProfit := StringGrid_Investments.Cells[7,Line];
                           Return         := StringGrid_Investments.Cells[8,Line];

                           ClearGridInvestments_Public();
                           StringGrid_Investments.RowCount := 2;

                           StringGrid_Investments.Cells[0,1] := Code;
                           StringGrid_Investments.Cells[1,1] := Active;
                           StringGrid_Investments.Cells[2,1] := AmountPaid;
                           StringGrid_Investments.Cells[3,1] := Quantity;
                           StringGrid_Investments.Cells[4,1] := Fees;
                           StringGrid_Investments.Cells[5,1] := AmountInvested;
                           StringGrid_Investments.Cells[6,1] := Profit;
                           StringGrid_Investments.Cells[7,1] := SaleWithProfit;
                           StringGrid_Investments.Cells[8,1] := Return;

                           Break;
                      end;
                end;
         end;
        if Search = '' then
         begin
              ClearGridInvestments_Public();
              FeedTheGridInvestments_Public();
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



// ============================== Form Resize =============================== //

procedure TF_Investimentos.FormResize(Sender: TObject);
begin
     Lbl_Search.Left := Trunc(F_Investimentos.Width - 355);

     Edt_Search.Width  := Trunc(F_Investimentos.Width / 4);
     Edt_Search.Left   := Trunc(F_Investimentos.Width - 380);
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
