unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, DateUtils, IniFiles;

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
    Lbl_Time: TLabel;
    Lbl_FullDate: TLabel;
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
    TImage_Credits: TImage;
    Pnl_BemVindo: TPanel;
    TImage_User: TImage;
    Lbl_BemVindo: TLabel;
    TImage_Menu: TImage;
    Pnl_CenterBottomConectado: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure TTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure TImage_MenuClick(Sender: TObject);
    procedure TImage_UserClick(Sender: TObject);
    procedure Pnl_InvestimentosClick(Sender: TObject);
    procedure Lbl_InvestimentosClick(Sender: TObject);
    procedure TImage_InvestimentosClick(Sender: TObject);
    procedure Pnl_DashboardClick(Sender: TObject);
    procedure Lbl_DashBoardClick(Sender: TObject);
    procedure Pnl_AtualizarClick(Sender: TObject);
    procedure Lbl_AtualizarClick(Sender: TObject);
    procedure TImage_AtualizarClick(Sender: TObject);
    procedure TImage_CreditsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }

     // Vars

     MenuCollapsed : Bool;

     Tempo         : Integer;

     // Procedures/Functions

     procedure ScreenMaximized();
     procedure ScreenMinimized();

  public
    { Public declarations }
  end;

var
  F_Principal : TF_Principal;

implementation

{$R *.dfm}

// Calling functions from another Unit
uses U_Functions, U_User, U_Investimentos, U_Update, U_Credits, U_Login;


// ====================== FormShow of TF_Principal ========================== //

procedure TF_Principal.FormShow(Sender: TObject);
var
   LongDayNames   : array[1..7] of string;
   MyDate         : TDateTime;
   Data           : TDate;
   MonthInt       : Integer;
   Day,Month,Year : String;
   MyDateStr      : String;
   MonthStr       : String;
   DayWeekStr     : String;

   LengthFullDate : Integer;
begin
     Try
        MenuCollapsed := False;
        FormUserAtivo := False;

        LongDayNames[1] := 'Domingo';
        LongDayNames[2] := 'Segunda-Feira';
        LongDayNames[3] := 'Ter�a-Feira';
        LongDayNames[4] := 'Quarta-Feira';
        LongDayNames[5] := 'Quinta-Feira';
        LongDayNames[6] := 'Sexta-Feira';
        LongDayNames[7] := 'S�bado';

        MyDateStr := DateToStr(Date());
        Day       := Copy(MyDateStr,0,2);
        Month     := Copy(MyDateStr,4,2);
        Year      := Copy(MyDateStr,7,9);

        myDate     := EncodeDate(StrToInt(Year),StrToInt(Month),StrToInt(Day));
        DayWeekStr := LongDayNames[DayOfWeek(myDate)];

        Data := Date();

        MonthInt := StrToInt(formatdatetime(' mm',Data));

        case MonthInt of
             1  : MonthStr := 'Janeiro';
             2  : MonthStr := 'Fevereiro';
             3  : MonthStr := 'Mar�o';
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

        Lbl_FullDate.Caption := ('');
        Lbl_FullDate.Caption := (DayWeekStr + ', ' + MonthStr + formatdatetime(' dd',data) +
                                    ',' + FormatDateTime(' yyyy', Data));

        // Position the Lbl dynamically according to the text size of the dates
        // 16.33333333 is the size each character occupies
        // (maximum label width / number of characters occupied = 16.3333...)
        // Lbl_FullDate.Caption := 'Ter�a-feira,Dezembro 19, 2023';
        // Lbl_FullDate.Caption := 'Quinta-feira, Novembro 19, 2023';

        LengthFullDate := Length(Lbl_FullDate.Caption);

        if LengthFullDate < 30 then
         begin
              Lbl_FullDate.Width := Trunc((Length(Lbl_FullDate.Caption) * 16.9));
              Lbl_FullDate.Left  := Trunc((Pnl_Center.Width / 2) - (Lbl_FullDate.Width / 2) - 6);
         end
        else
         begin
              Lbl_FullDate.Width := Trunc((Length(Lbl_FullDate.Caption) * 16.9));
              Lbl_FullDate.Left  := Trunc((Pnl_Center.Width / 2) - (Lbl_FullDate.Width / 2) + 2);
         end;

        Try
           Try
              if FileExists(ExtractFilePath(Application.ExeName) + 'ArqIni.ini') then
               begin
                    ArqIni_Public := TIniFile.Create(ExtractFilePath(Application. ExeName) + '\ArqIni.ini');
                    Lbl_BemVindo.Caption := ('Bem vindo, ' + ArqIni_Public.ReadString('NickName', 'Username', 'Erro ao ler o valor'));
               end
              else
               begin
                    Lbl_BemVindo.Caption := ('Bem vindo, Amigo');
               end;

           Except
            on E: Exception do
             begin
                  ShowMessage('Erro na manipula��o de File Ini: ' + E.Message );
                  Close;
             end;

           end;

        Finally
            FreeAndNil(ArqIni_Public);
        End;

     Finally
        ConnectDatabase_Public();

        Line_public := 1;

        F_Login.Visible := False;
     End;
end;

// ========================================================================== //



// ======================== Close hidden login form ========================= //

procedure TF_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     F_Login.Close;
end;

// ========================================================================== //



// ================== Close the Application with: crtl + w ================== //

procedure TF_Principal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     ApplicationTerminate_Public();
end;

// ========================================================================== //



// ============================ ScreenMaximizade ============================ //

procedure TF_Principal.ScreenMaximized();
begin
     Pnl_LeftPai.Width  := 400;
     Pnl_LeftTop.Height := 180;

     TImage_LogoLeftTop.Picture.LoadFromFile('Img/Logo/LogoSuperiorEsquerdaEscuraMaior.png');

     TImage_LogoLeftTop.Width  := 315;
     TImage_LogoLeftTop.Height := 100;

     TImage_DashBoard.Left     := 55;
     Lbl_DashBoard.Left        := 155;

     TImage_Investimentos.Left := 55;
     Lbl_Investimentos.Left    := 155;

     TImage_Atualizar.Left     := 55;
     Lbl_Atualizar.Left        := 155;
end;

// ========================================================================== //



// =========================== ScreenMinimized ============================== //

procedure TF_Principal.ScreenMinimized;
begin
     Pnl_LeftPai.Width  := 300;
     Pnl_LeftTop.Height := 150;

     TImage_LogoLeftTop.Picture.LoadFromFile('Img/Logo/LogoSuperiorEsquerdaEscuraMenor.png');

     TImage_LogoLeftTop.Width  := 229;
     TImage_LogoLeftTop.Height := 80;

     TImage_DashBoard.Left     := 35;
     Lbl_DashBoard.Left        := 131;

     TImage_Investimentos.Left := 35;
     Lbl_Investimentos.Left    := 131;

     TImage_Atualizar.Left     := 35;
     Lbl_Atualizar.Left        := 131;
end;

// ========================================================================== //



// =============================== FormResize =============================== //

procedure TF_Principal.FormResize(Sender: TObject);
begin
     if F_Principal.WindowState = WsMaximized then
      begin
           if MenuCollapsed = False then
            begin
                 ScreenMaximized();
            end
           else
            Pnl_LeftPai.Width := 0;
      end
     else
      begin
           if MenuCollapsed = False then
            begin
                 ScreenMinimized();
            end
           else
            Pnl_LeftPai.Width := 0;
      end;
end;

// ========================================================================== //



// ================ Close all forms Returning to Dashboard ================== //

procedure TF_Principal.Pnl_DashboardClick(Sender: TObject);
begin
     if not FormPrincipalAtivo then
      begin
           if FormUserAtivo then
            begin
                 F_User.Close;
                 FormUserAtivo := False;
            end;
           if FormInvestimentosAtivo then
            begin
                 F_Investimentos.Close;
                 FormInvestimentosAtivo := False;
            end;
           if FormUpdateActive then
            begin
                 F_Update.Close;
                 FormUpdateActive := False;
            end;
      end
     else
      begin
           FormPrincipalAtivo := False;
      end;
end;

// ========================================================================== //



// ===================== Call the Form Investimentos ======================== //

procedure TF_Principal.Pnl_InvestimentosClick(Sender: TObject);  
begin
     if not FormInvestimentosAtivo then
      begin
           if FormUserAtivo then
            begin
                 F_User.Close;
                 FormUserAtivo := False;
            end;
           if FormUpdateActive then
            begin
                 F_Update.Close;
                 FormUpdateActive := False;
            end;

           F_Principal.WindowState := wsMaximized;

           F_Investimentos := TF_Investimentos.Create(Self);

           F_Investimentos.Parent      := Pnl_Center;
           F_Investimentos.Align       := AlClient;
           F_Investimentos.BorderStyle := BsNone;

           F_Investimentos.Show;

           FormInvestimentosAtivo := True;

           ClearGridInvestments_Public();
           StartTheStringGridInvestments_Public();
           FeedTheGridInvestments_Public();
      end
     else
      begin
           F_Investimentos.Close;
           FreeAndNil(F_Investimentos);

           FormInvestimentosAtivo := False;
      end;
end;

// ========================================================================== //



// ======================== Call the form Update ============================ //

procedure TF_Principal.Pnl_AtualizarClick(Sender: TObject);
begin
     if not FormUpdateActive then
      begin
           if FormUserAtivo then
            begin
                 F_User.Close;
                 FormUserAtivo := False;
            end;
           if FormInvestimentosAtivo then
            begin
                 F_Investimentos.Close;
                 FormInvestimentosAtivo := False;
            end;

           F_Principal.WindowState := wsMaximized;

           F_Update := TF_Update.Create(Self);

           F_Update.Parent      := Pnl_Center;
           F_Update.Align       := AlClient;
           F_Update.BorderStyle := BsNone;

           F_Update.Show;

           FormUpdateActive := True;

           ClearGridUpdate_Public();
           StartTheStringGridUpdate_Public();
           FeedTheGridUpdate_Public();
      end
     else
      begin
           F_Update.Close;
           FreeAndNil(F_Update);

           FormUpdateActive := False;
      end;
end;

// ========================================================================== //



// ================ Call the events of Click in Pnl_Dashboard =============== //

procedure TF_Principal.Lbl_DashBoardClick(Sender: TObject);
begin
     Pnl_DashboardClick(Sender);
end;

// ========================================================================== //



// =============== Call the events of Click in Pnl_Investimentos ==============//

procedure TF_Principal.Lbl_InvestimentosClick(Sender: TObject);
begin
     Pnl_InvestimentosClick(Sender);
end;

procedure TF_Principal.TImage_InvestimentosClick(Sender: TObject);
begin
     Pnl_InvestimentosClick(Sender);
end;

// ========================================================================== //



// ================ Call the events of click in Pnl_Update ================== //

procedure TF_Principal.Lbl_AtualizarClick(Sender: TObject);
begin
     Pnl_AtualizarClick(Sender);
end;

procedure TF_Principal.TImage_AtualizarClick(Sender: TObject);
begin
     Pnl_AtualizarClick(Sender);
end;

// ========================================================================== //



// ========================================================================== //

procedure TF_Principal.TImage_CreditsClick(Sender: TObject);
begin
     F_Credits := TF_Credits.Create(Self);
     F_Credits.Visible := False;
     F_Credits.ShowModal;
end;

// ========================================================================== //



// =============================== Left Menu ================================ //

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


// ========================================================================== //



// ========================= Resize panel LeftPai =========================== //

procedure TF_Principal.TImage_MenuClick(Sender: TObject);
begin
     if (Pnl_LeftPai.Width = 400) or (Pnl_LeftPai.Width = 300)then
      begin
           Pnl_LeftPai.Width := 0;
           MenuCollapsed     := True;
      end

     else if (Pnl_LeftPai.Width = 0) and (F_Principal.WindowState = WsMaximized) then
      begin
           MenuCollapsed := False;
           ScreenMaximized();
      end

     else if (Pnl_LeftPai.Width = 0) and not (F_Principal.WindowState = WsMaximized) then
      begin
           MenuCollapsed := False;
           ScreenMinimized();
      end;
end;

// ========================================================================== //



// ============================ Call user form ============================== //

procedure TF_Principal.TImage_UserClick(Sender: TObject);
begin
     if not FormUserAtivo then
      begin
           if FormInvestimentosAtivo then
            begin
                 F_Investimentos.Close;
                 FormInvestimentosAtivo := False;
            end;

           F_User := TF_User.Create(Self);

           F_User.Parent      := Pnl_Center;
           F_User.Align       := AlClient;
           F_User.BorderStyle := BsNone;

           F_User.Show;

           FormUserAtivo := True;
      end
     else
      begin
           F_User.Close;
           FreeAndNil(F_User);

           FormUserAtivo := False;
      end;
end;

// ========================================================================== //



// ================================ Timer  ================================== //

procedure TF_Principal.TTimerTimer(Sender: TObject);
begin
     Try
        Lbl_Time.Caption := TimeToStr(Time);

        if Tempo < 4000 then
         begin
              if Pnl_CenterBottomConectado.Visible then
               Tempo := Tempo + 1000;

              if Tempo > 3000 then
               begin
                    Pnl_CenterBottomConectado.Visible := False;
                    // F_Login.Close;
               end;
         end;

     Except
         Application.MessageBox('Erro na inicializa��o do Timer', 'Aten��o!', mb_Ok + mb_IconExclamation);
     End;
end;

// ========================================================================== //


end.

