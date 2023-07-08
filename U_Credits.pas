unit U_Credits;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TF_Credits = class(TForm)
    Pnl_Top: TPanel;
    Pnl_Bottom: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Credits: TF_Credits;

implementation

{$R *.dfm}


// =============================== FormKeyDown ============================== //

procedure TF_Credits.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if ((GetKeyState(VK_CONTROL) AND 128)=128) and
        ((GetKeyState(ord('W')) AND 128)=128) then
      begin
           Close;
      end;
end;

// ========================================================================== //

end.
