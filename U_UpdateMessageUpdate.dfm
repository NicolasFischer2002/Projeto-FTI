object F_UpdateMessageUpdate: TF_UpdateMessageUpdate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Atualizar'
  ClientHeight = 300
  ClientWidth = 650
  Color = 5251875
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    650
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl_UpdateActive: TLabel
    Left = 239
    Top = 18
    Width = 181
    Height = 35
    Caption = 'Atualizar ativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lbl_Active: TLabel
    Left = 50
    Top = 74
    Width = 52
    Height = 29
    Caption = 'Ativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lbl_AmountPaid: TLabel
    Left = 261
    Top = 74
    Width = 114
    Height = 29
    Caption = 'Valor pago'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lbl_Quantity: TLabel
    Left = 462
    Top = 74
    Width = 121
    Height = 29
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lbl_Fees: TLabel
    Left = 156
    Top = 148
    Width = 63
    Height = 29
    Caption = 'Taxas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Lbl_Profit: TLabel
    Left = 363
    Top = 148
    Width = 89
    Height = 29
    Caption = 'Lucro %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edt_Active: TEdit
    Left = 50
    Top = 109
    Width = 150
    Height = 27
    Hint = 'ITUB4, BBDC4 ...'
    Anchors = [akTop]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'ITUB4, BBDC4 ...'
    OnKeyUp = Edt_ActiveKeyUp
  end
  object Edt_AmountPaid: TEdit
    Left = 261
    Top = 109
    Width = 150
    Height = 27
    Hint = '25,00'
    Anchors = [akTop]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = '25,00'
    OnKeyUp = Edt_AmountPaidKeyUp
  end
  object Edt_Quantity: TEdit
    Left = 459
    Top = 109
    Width = 150
    Height = 27
    Hint = '15, 20, 100 ...'
    Anchors = [akTop]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TextHint = '15, 20, 100 ...'
    OnKeyUp = Edt_QuantityKeyUp
  end
  object Edt_Fees: TEdit
    Left = 156
    Top = 186
    Width = 150
    Height = 27
    Hint = '4,90 + 4,90'
    Anchors = [akTop]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TextHint = 'Taxas de opera'#231#227'o'
    OnKeyUp = Edt_FeesKeyUp
  end
  object Edt_Profit: TEdit
    Left = 363
    Top = 186
    Width = 150
    Height = 27
    Hint = 'Sem %'
    Anchors = [akTop]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TextHint = 'Lucro esperado'
    OnKeyUp = Edt_ProfitKeyUp
  end
  object Btn_Cancel: TButton
    Left = 344
    Top = 241
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
  end
  object Btn_Update: TButton
    Left = 171
    Top = 241
    Width = 150
    Height = 41
    Caption = 'Atualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Btn_UpdateClick
  end
end
