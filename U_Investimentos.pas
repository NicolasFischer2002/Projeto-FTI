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
    StringGrid1: TStringGrid;
    Pnl_Manager: TPanel;
    TImage_Manager: TImage;
    Lbl_Manager: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Investimentos: TF_Investimentos;

implementation

{$R *.dfm}

end.
