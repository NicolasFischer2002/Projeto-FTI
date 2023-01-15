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
    ADOConnection: TADOConnection;
    Query: TADOQuery;
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
    procedure FormCreate(Sender: TObject);
    procedure Edt_AtivoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Investimentos: TF_Investimentos;

implementation

{$R *.dfm}

uses U_Functions, U_User, U_Principal;

// ======================== Validation dos EDTs ============================= //

procedure TF_Investimentos.Edt_AtivoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   Ativo : String;
begin
     Try
        Ativo := Edt_Ativo.Text;

        if (Length(Trim(Ativo)) >= 4) and (Length(Trim(Ativo)) <= 5) then
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



// ====================== OnCreate do TF_Investimentos ====================== //

procedure TF_Investimentos.FormCreate(Sender: TObject);
begin
     Try
        StringGrid.Cells[0,0] := 'Código';
        StringGrid.Cells[1,0] := 'Ativo';
        StringGrid.Cells[2,0] := 'Valor';
        StringGrid.Cells[3,0] := 'Qtd';
        StringGrid.Cells[4,0] := 'Taxas';
        StringGrid.Cells[5,0] := 'Lucro %';
        StringGrid.Cells[6,0] := 'Retorno';


        // Base está pronta, conectado e funcionando

        Query.SQL.Clear;
        Query.SQL.Text := 'INSERT INTO Investimentos (Ativo) VALUES (1234)';
        Query.ExecSQL;


        Query.SQL.Clear;
        Query.SQL.Text := 'INSERT INTO Investimentos (Ativo) VALUES ("asdd")';
        Query.ExecSQL;


        Query.SQL.Clear;
        Query.SQL.Text := 'SELECT * FROM Investimentos WHERE Ativo = "1234"';
        Query.Open;


         StringGrid.Cells[1,1] := Query.FieldByName('Ativo').AsString;


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
