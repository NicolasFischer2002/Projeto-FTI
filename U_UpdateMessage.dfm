object F_UpdateMessage: TF_UpdateMessage
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Aten'#231#227'o!'
  ClientHeight = 180
  ClientWidth = 500
  Color = 5251875
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl_Message: TLabel
    Left = 31
    Top = 24
    Width = 441
    Height = 41
    Caption = 'Deseja realmente deletar o ativo?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Btn_DeleteActive: TButton
    Left = 134
    Top = 112
    Width = 106
    Height = 41
    Caption = 'Deletar Ativo'
    TabOrder = 0
  end
  object Btn_Cancel: TButton
    Left = 270
    Top = 112
    Width = 106
    Height = 41
    Caption = 'Cancelar'
    TabOrder = 1
  end
end
