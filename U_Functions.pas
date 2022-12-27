unit U_Functions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

// Procedures
procedure ImageResponsiveness_Public(NameImage : Timage; NameForm : TForm; LeftDividedBy,
           TopDividedBy : Integer);


// Functions

implementation


procedure ImageResponsiveness_Public(NameImage : Timage; NameForm : TForm; LeftDividedBy, TopDividedBy : Integer);
begin
     // Ajusta a posição horizontal da imagem
     NameImage.Left := trunc(((NameForm.width - NameImage.width) / LeftDividedBy));

     // Ajusta a altura da imagem
     NameImage.Top := trunc(((NameForm.Height - NameImage.width) / TopDividedBy));
end;

end.
