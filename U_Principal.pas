unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, DateUtils;

type
  TF_Principal = class(TForm)
    Pnl_GreyTop: TPanel;
    Pnl_LeftPai: TPanel;
    TImage_LogoLeftTop: TImage;
    Pnl_CenterPai: TPanel;
    Pnl_Center: TPanel;
    Pnl_TopPurple: TPanel;
    TImage_LogoCenter: TImage;
    Pnl_LeftTop: TPanel;
    TImage_Home: TImage;
    Label1: TLabel;
    Pnl_TopHome: TPanel;
    Image1: TImage;
    Lbl_Time: TLabel;
    Lbl_DataCompleta: TLabel;
    TTimer: TTimer;
    TImage_DashBoard: TImage;
    TImage_Investimentos: TImage;
    TImage_Atualizar: TImage;
    Pnl_Atualizar: TPanel;
    Pnl_Dashboard: TPanel;
    Pnl_Investimentos: TPanel;
    Lbl_DashBoard: TLabel;
    Lbl_Investimentos: TLabel;
    Lbl_Atualizar: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure TTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Pnl_DashboardMouseEnter(Sender: TObject);
    procedure Pnl_DashboardMouseLeave(Sender: TObject);
    procedure Lbl_DashBoardMouseEnter(Sender: TObject);
    procedure Lbl_DashBoardMouseLeave(Sender: TObject);
    procedure TImage_DashBoardMouseEnter(Sender: TObject);
    procedure TImage_DashBoardMouseLeave(Sender: TObject);
    procedure Lbl_InvestimentosMouseEnter(Sender: TObject);
    procedure Lbl_InvestimentosMouseLeave(Sender: TObject);
    procedure TImage_InvestimentosMouseEnter(Sender: TObject);
    procedure TImage_InvestimentosMouseLeave(Sender: TObject);
    procedure Lbl_AtualizarMouseEnter(Sender: TObject);
    procedure Lbl_AtualizarMouseLeave(Sender: TObject);
    procedure TImage_AtualizarMouseEnter(Sender: TObject);
    procedure TImage_AtualizarMouseLeave(Sender: TObject);
    procedure Pnl_InvestimentosMouseEnter(Sender: TObject);
    procedure Pnl_InvestimentosMouseLeave(Sender: TObject);
    procedure Pnl_AtualizarMouseEnter(Sender: TObject);
    procedure Pnl_AtualizarMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

{$R *.dfm}

// Calling functions from another Unit
uses U_Functions;


procedure TF_Principal.FormCreate(Sender: TObject);
var
   LongDayNames   : array[1..7] of string;
   MyDate         : TDateTime;
   Data           : TDate;
   MonthInt       : Integer;
   Day,Month,Year : String;
   MyDateStr      : String;
   MonthStr       : String;
   DayWeekStr     : String;

begin
     LongDayNames[1] := 'Domingo';
     LongDayNames[2] := 'Segunda-Feira';
     LongDayNames[3] := 'Terça-Feira';
     LongDayNames[4] := 'Quarta-Feira';
     LongDayNames[5] := 'Quinta-Feira';
     LongDayNames[6] := 'Sexta-Feira';
     LongDayNames[7] := 'Sábado';

     MyDateStr := DateToStr(Date());
     Day       := Copy(MyDateStr,0,2);
     Month     := Copy(MyDateStr,4,2);
     Year      := Copy(MyDateStr,7,9);

     myDate := EncodeDate(StrToInt(Year),StrToInt(Month),StrToInt(Day));

     DayWeekStr := LongDayNames[DayOfWeek(myDate)];

     Data := Date();

     MonthInt := StrToInt(formatdatetime(' mm',Data));

     case MonthInt of
          1  : MonthStr := 'Janeiro';
          2  : MonthStr := 'Fevereiro';
          3  : MonthStr := 'Março';
          4  : MonthStr := 'Abril';
          5  : MonthStr := 'Maio';
          6  : MonthStr := 'Junho';
          7  : MonthStr := 'Julho';
          8  : MonthStr := 'Agosto';
          9  : MonthStr := 'Setembro';
          10 : MonthStr := 'Outubro';
          11 : MonthStr := 'Novembro';
          12 : MonthStr := 'Dezembro';
     end;

     Lbl_DataCompleta.Caption := ('');
     Lbl_DataCompleta.Caption := (DayWeekStr + ', ' + MonthStr + formatdatetime(' dd',data) +
                                 ',' + FormatDateTime(' yyyy', Data));
end;

// Close the Form with: crtl + w
procedure TF_Principal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     If ((GetKeyState(VK_CONTROL) AND 128)=128) and
        ((GetKeyState(ord('W')) AND 128)=128) then
        Application.Terminate;
end;

procedure TF_Principal.FormResize(Sender: TObject);
begin
     if F_Principal.WindowState = WsMaximized then
      begin
           Pnl_LeftPai.Width := 400;

           Pnl_LeftTop.Height := 200;

           TImage_LogoLeftTop.Picture.LoadFromFile('Img/Logo/LogoSuperiorEsquerdaEscuraMaior.png');

           TImage_LogoLeftTop.Width  := 315;
           TImage_LogoLeftTop.Height := 100;
      end
     else
      begin
           Pnl_LeftPai.Width := 300;

           Pnl_LeftTop.Height := 150;

           TImage_LogoLeftTop.Picture.LoadFromFile('Img/Logo/LogoSuperiorEsquerdaEscuraMenor.png');

           TImage_LogoLeftTop.Width  := 229;
           TImage_LogoLeftTop.Height := 80;
      end;
end;

procedure TF_Principal.Lbl_AtualizarMouseEnter(Sender: TObject);
begin
     Pnl_Atualizar.Color := ClHotLight;
end;

procedure TF_Principal.Lbl_AtualizarMouseLeave(Sender: TObject);
begin
     Pnl_Atualizar.Color := $0047201F;
end;

procedure TF_Principal.Lbl_DashBoardMouseEnter(Sender: TObject);
begin
     Pnl_Dashboard.Color := ClHotLight;
end;

procedure TF_Principal.Lbl_DashBoardMouseLeave(Sender: TObject);
begin
     Pnl_Dashboard.Color := $0047201F;
end;

procedure TF_Principal.Lbl_InvestimentosMouseEnter(Sender: TObject);
begin
     Pnl_Investimentos.Color := ClHotLight;
end;

procedure TF_Principal.Lbl_InvestimentosMouseLeave(Sender: TObject);
begin
     Pnl_Investimentos.Color := $0047201F;
end;

procedure TF_Principal.Pnl_AtualizarMouseEnter(Sender: TObject);
begin
     Pnl_Atualizar.Color := ClHotLight;
end;

procedure TF_Principal.Pnl_AtualizarMouseLeave(Sender: TObject);
begin
     Pnl_Atualizar.Color := $0047201F;
end;

procedure TF_Principal.Pnl_DashboardMouseEnter(Sender: TObject);
begin
     Pnl_Dashboard.Color := ClHotLight;
end;

procedure TF_Principal.Pnl_DashboardMouseLeave(Sender: TObject);
begin
     Pnl_Dashboard.Color := $0047201F;
end;

procedure TF_Principal.Pnl_InvestimentosMouseEnter(Sender: TObject);
begin
     Pnl_Investimentos.Color := ClHotLight;
end;

procedure TF_Principal.Pnl_InvestimentosMouseLeave(Sender: TObject);
begin
     Pnl_Investimentos.Color := $0047201F;
end;

procedure TF_Principal.TImage_AtualizarMouseEnter(Sender: TObject);
begin
     Pnl_Atualizar.Color := ClHotLight;
end;

procedure TF_Principal.TImage_AtualizarMouseLeave(Sender: TObject);
begin
     Pnl_Atualizar.Color := $0047201F;
end;

procedure TF_Principal.TImage_DashBoardMouseEnter(Sender: TObject);
begin
     Pnl_Dashboard.Color := ClHotLight;
end;

procedure TF_Principal.TImage_DashBoardMouseLeave(Sender: TObject);
begin
     Pnl_Dashboard.Color := $0047201F;
end;

procedure TF_Principal.TImage_InvestimentosMouseEnter(Sender: TObject);
begin
     Pnl_Investimentos.Color := ClHotLight;
end;

procedure TF_Principal.TImage_InvestimentosMouseLeave(Sender: TObject);
begin
     Pnl_Investimentos.Color := $0047201F;
end;

procedure TF_Principal.TTimerTimer(Sender: TObject);
begin
     Lbl_Time.Caption := TimeToStr(Time);
end;

end.
