unit U_Investimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TF_Investimentos = class(TForm)
    Pnl_Right: TPanel;
    Edt_Ativo: TEdit;
    Lbl_Ativo: TLabel;
    Edt_Quantidade: TEdit;
    Lbl_Quantidade: TLabel;
    Edt_Lucro: TEdit;
    Lbl_Lucro: TLabel;
    Edt_Taxas: TEdit;
    Lbl_Taxas: TLabel;
    Pnl_Center: TPanel;
    Pnl_Top: TPanel;
    Pnl_Bottom: TPanel;
    StringGrid: TStringGrid;
    Pnl_Manager: TPanel;
    TImage_Manager: TImage;
    Lbl_Manager: TLabel;
    Lbl_ValorPago: TLabel;
    Edt_ValorPago: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Investimentos: TF_Investimentos;

implementation

{$R *.dfm}

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



        Try



        Except
           ShowMessage('Erro ao conectar com banco de dados');

        End;



     Finally

     End;
end;

end.
