unit U_Functions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

// Procedures
procedure ImageResponsiveness_Public(NameImage : Timage; NamePanel : TPanel; LeftDividedBy, TopDividedBy : Integer);


// Functions

implementation


procedure ImageResponsiveness_Public(NameImage : Timage; NamePanel : TPanel; LeftDividedBy, TopDividedBy : Integer);
begin
     NameImage.Left := trunc(((NamePanel.width - NameImage.width) / LeftDividedBy));
     NameImage.Top := trunc(((NamePanel.width - NameImage.width) / TopDividedBy));
end;

end.
