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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl_Message: TLabel
    Left = 33
    Top = 24
    Width = 429
    Height = 35
    Caption = 'Deseja realmente deletar o ativo?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Lbl_AtivoCodigo: TLabel
    Left = 187
    Top = 65
    Width = 135
    Height = 29
    Caption = 'Ativo, c'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Btn_DeleteActive: TButton
    Left = 96
    Top = 121
    Width = 150
    Height = 41
    Caption = 'Deletar Ativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Btn_DeleteActiveClick
    OnKeyDown = FormKeyDown
  end
  object Btn_Cancel: TButton
    Left = 280
    Top = 121
    Width = 150
    Height = 41
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Btn_CancelClick
    OnKeyDown = FormKeyDown
  end
end
