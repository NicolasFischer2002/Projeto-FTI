unit U_UpdateMessageUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TF_UpdateMessageUpdate = class(TForm)
    Lbl_UpdateActive: TLabel;
    Edt_Active: TEdit;
    Edt_AmountPaid: TEdit;
    Edt_Quantity: TEdit;
    Edt_Fees: TEdit;
    Edt_Profit: TEdit;
    Btn_Cancel: TButton;
    Btn_Update: TButton;
    Lbl_Active: TLabel;
    Lbl_AmountPaid: TLabel;
    Lbl_Quantity: TLabel;
    Lbl_Fees: TLabel;
    Lbl_Profit: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Btn_CancelClick(Sender: TObject);
    procedure Btn_UpdateClick(Sender: TObject);
    procedure Edt_ActiveKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_AmountPaidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_QuantityKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edt_FeesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edt_ProfitKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    EdtActiveCompleted     : Bool;
    EdtAmountPaidCompleted : Bool;
    EdtQuantityCompleted   : Bool;
    EdtFeesCompleted       : Bool;
    EdtProfitCompleted     : Bool;

    procedure ActiveBtnUpdate();

  public
    { Public declarations }
  end;

var
  F_UpdateMessageUpdate: TF_UpdateMessageUpdate;

implementation

{$R *.dfm}

Uses U_Functions, U_Update;




// ======================== Active Btn Update =============================== //

procedure TF_UpdateMessageUpdate.ActiveBtnUpdate();
begin
     Try
        if (EdtActiveCompleted = True) and (EdtAmountPaidCompleted = True) and
           (EdtQuantityCompleted = True) and (EdtFeesCompleted = True) and
           (EdtProfitCompleted = True) then
            Btn_Update.Enabled := True
        else
         Btn_Update.Enabled := False;

     Finally

     End;
end;

// ========================================================================== //



// =================== Close Form when click in cancel ====================== //

procedure TF_UpdateMessageUpdate.Btn_CancelClick(Sender: TObject);
begin
     F_UpdateMessageUpdate.Close;
end;

// ========================================================================== //



// ============================ Button Update =============================== //

procedure TF_UpdateMessageUpdate.Btn_UpdateClick(Sender: TObject);
Var
   Code           : String;
   Active         : String;
   AmountPaid     : String; // Valor pago
   Quantity       : String;
   Fees           : String; // Taxas
   Profit         : String; // Lucro
   SaleWithProfit : String; // Venda com Lucro
   Return         : String;
   InvestedAmount : String;
begin
     Try
        Try
           Code := F_Update.StringGrid_Update.Cells[0,LineGridUpdate_Public];

           Active         := Edt_Active.Text;
           AmountPaid     := Edt_AmountPaid.Text;
           Quantity       := Edt_Quantity.Text;
           Fees           := Edt_Fees.Text;
           Profit         := Edt_Profit.Text;

           Profit := StringReplace(Profit,'%','',[rfReplaceAll, rfIgnoreCase]);

           InvestedAmount := InvestedAmount_Public(AmountPaid, Quantity, Fees);
           SaleWithProfit := SaleWithProfit_Public(AmountPaid, Quantity, Fees, Profit);
           Return         := Return_Public(SaleWithProfit, Quantity, AmountPaid);

           // Atualizar no banco pelo código
           Query.SQL.Clear;
           Query.SQL.Text := 'UPDATE Investimentos SET Ativo =' + QuotedStr(Active) + ',' + 'Valor_negociado ='
                          + QuotedStr(AmountPaid) + ',' + 'Quantidade =' + QuotedStr(Quantity) + ',' +
                          'Taxas =' + QuotedStr(Fees) + ',' + 'Valor_investido =' + QuotedStr(InvestedAmount) + ',' +
                          'Lucro =' + QuotedStr(Profit) + ',' + 'Venda_com_lucro =' + QuotedStr(SaleWithProfit) + ',' +
                          'Retorno =' + QuotedStr(Return) + ' WHERE Código =' + Code;
           Query.ExecSQL;


           Application.MessageBox('Ativo atualizado com sucesso!','Atenção!', mb_Ok + MB_ICONINFORMATION);

        Except
            Application.MessageBox('Falha ao atualizar ativo','Atenção!', mb_Ok + mb_IconExclamation);
        End;

     Finally
         ClearGridUpdate_Public();
         StartTheStringGridUpdate_Public();
         FeedTheGridUpdate_Public();
         F_UpdateMessageUpdate.Close;
     End;
end;

// ========================================================================== //



// ========================= Validation of Edts ============================= //

procedure TF_UpdateMessageUpdate.Edt_ActiveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Active : String;
begin
     Try
        Active := Edt_Active.Text;

        if (Length(Trim(Active)) >= 5) and (Length(Trim(Active)) <= 6) then
         begin
              Edt_Active.Font.Color := clGreen;
              EdtActiveCompleted    := True;
         end
        else
         begin
              Edt_Active.Font.Color := clRed;
              EdtActiveCompleted    := False;
         end;

     Finally
         ActiveBtnUpdate();
     End;
end;

procedure TF_UpdateMessageUpdate.Edt_AmountPaidKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
   AmountPaid : Double;
begin
     Try
        Try
           AmountPaid := StrToFloat(Edt_AmountPaid.Text);

           if (AmountPaid > 0) then
            begin
                 Edt_AmountPaid.Font.Color := clGreen;
                 EdtAmountPaidCompleted    := True;
            end
           else
            begin
                 Edt_AmountPaid.Font.Color := clRed;
                 EdtAmountPaidCompleted    := False;
            end;

        Except
            EdtAmountPaidCompleted    := False;
            Edt_AmountPaid.Font.Color := clRed;
            ActiveBtnUpdate();
        End;

     Finally
         ActiveBtnUpdate();
     End;
end;

procedure TF_UpdateMessageUpdate.Edt_FeesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Fees : Double;
begin
     Try
        Try
           Fees := StrToFloat(Edt_Fees.Text);

           if (Fees >= 0) then
            begin
                 Edt_Fees.Font.Color := clGreen;
                 EdtFeesCompleted    := True;
            end
           else
            begin
                 Edt_Fees.Font.Color := clRed;
                 EdtFeesCompleted    := False;
            end;

        Except
            EdtFeesCompleted    := False;
            Edt_Fees.Font.Color := clRed;
            ActiveBtnUpdate();
        End;

     Finally
         ActiveBtnUpdate();
     End;
end;

procedure TF_UpdateMessageUpdate.Edt_ProfitKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Profit : Double;
begin
     Try
        try
           Profit := StrToFloat(Edt_Profit.Text);

           if Profit > 0 then
            begin
                 Edt_Profit.Font.Color := clGreen;
                 EdtProfitCompleted    := True;
            end
           else
            begin
                 Edt_Profit.Font.Color := clRed;
                 EdtProfitCompleted    := False;
            end;

        Except
            EdtProfitCompleted    := False;
            Edt_Profit.Font.Color := clRed;
            ActiveBtnUpdate();
        end;

     Finally
         ActiveBtnUpdate();
     End;

end;

procedure TF_UpdateMessageUpdate.Edt_QuantityKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
Var
   Quantity : Integer;
begin
     Try
        Try
           Quantity := StrToInt(Edt_Quantity.Text);

           if (Quantity > 0) then
            begin
                 Edt_Quantity.Font.Color := clGreen;
                 EdtQuantityCompleted    := True;
            end
           else
            begin
                 Edt_Quantity.Font.Color := clRed;
                 EdtQuantityCompleted    := False;
            end;

        Except
            EdtQuantityCompleted    := False;
            Edt_Quantity.Font.Color := clRed;
            ActiveBtnUpdate();
        End;

     Finally
         ActiveBtnUpdate();
     End;
end;

// ========================================================================== //



// ============================= Form Create ================================ //

procedure TF_UpdateMessageUpdate.FormCreate(Sender: TObject);
Var
   Profit : String;
begin
     Try
        EdtActiveCompleted     := True;
        EdtAmountPaidCompleted := True;
        EdtQuantityCompleted   := True;
        EdtFeesCompleted       := True;
        EdtProfitCompleted     := True;

        Btn_Update.Caption := 'Atualizar ' + F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public];

        Lbl_UpdateActive.Left    := 115;
        Lbl_UpdateActive.Caption := 'Atualizar ativo ' + F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public] + ',' + ' código ' + F_Update.StringGrid_Update.Cells[0,LineGridUpdate_Public];

        Profit := F_Update.StringGrid_Update.Cells[6,LineGridUpdate_Public];
        Profit := StringReplace(Profit,'%','',[rfReplaceAll, rfIgnoreCase]);

        Edt_Active.Text     := F_Update.StringGrid_Update.Cells[1,LineGridUpdate_Public];
        Edt_AmountPaid.Text := F_Update.StringGrid_Update.Cells[2,LineGridUpdate_Public];
        Edt_Quantity.Text   := F_Update.StringGrid_Update.Cells[3,LineGridUpdate_Public];
        Edt_Fees.Text       := F_Update.StringGrid_Update.Cells[4,LineGridUpdate_Public];
        Edt_Profit.Text     := Profit;

     Except

     End;
end;

procedure TF_UpdateMessageUpdate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ((GetKeyState(VK_CONTROL) AND 128)=128) and
        ((GetKeyState(ord('W')) AND 128)=128) then
        begin
             Close;
        end;
     if ((GetKeyState(VK_CONTROL) AND 128)=128) and (key = VK_DELETE) then
      begin
           (Sender as Tedit).Clear;
      end;
end;

// ========================================================================== //



end.
