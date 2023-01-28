program Projeto_FTI;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Functions in 'U_Functions.pas',
  Vcl.Themes,
  Vcl.Styles,
  U_User in 'U_User.pas' {F_User},
  U_Investimentos in 'U_Investimentos.pas' {F_Investimentos},
  U_Update in 'U_Update.pas' {F_Update},
  U_UpdateMessage in 'U_UpdateMessage.pas' {F_UpdateMessage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.Run;
end.
