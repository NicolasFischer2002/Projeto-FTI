unit U_Functions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, IniFiles;

Var
private,
    { Private declarations }

// Procedures


// Functions


public,
    { Public declarations }
    ArqIni                 : TIniFile;
    FormUserAtivo          : Bool;
    FormInvestimentosAtivo : Bool;


// Procedures


// Functions




implementation


uses U_Principal, U_User, U_Investimentos;



end.
