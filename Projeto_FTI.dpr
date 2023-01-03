program Projeto_FTI;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  U_Functions in 'U_Functions.pas',
  Vcl.Themes,
  Vcl.Styles,
  U_User in 'U_User.pas' {F_User};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TF_Principal, F_Principal);
  Application.CreateForm(TF_User, F_User);
  Application.Run;
end.
