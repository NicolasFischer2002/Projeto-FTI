object F_UpdateMessageUpdate: TF_UpdateMessageUpdate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Atualizar'
  ClientHeight = 522
  ClientWidth = 497
  Color = 5251875
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    497
    522)
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl_UpdateActive: TLabel
    Left = 40
    Top = 14
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
    Left = 155
    Top = 60
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
    Left = 155
    Top = 128
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
    Left = 155
    Top = 198
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
    Left = 155
    Top = 264
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
    Left = 155
    Top = 335
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
    Left = 155
    Top = 95
    Width = 181
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
    OnKeyDown = FormKeyDown
    OnKeyUp = Edt_ActiveKeyUp
  end
  object Edt_AmountPaid: TEdit
    Left = 155
    Top = 163
    Width = 181
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
    OnKeyDown = FormKeyDown
    OnKeyUp = Edt_AmountPaidKeyUp
  end
  object Edt_Quantity: TEdit
    Left = 155
    Top = 233
    Width = 181
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
    OnKeyDown = FormKeyDown
    OnKeyUp = Edt_QuantityKeyUp
  end
  object Edt_Fees: TEdit
    Left = 155
    Top = 302
    Width = 181
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
    OnKeyDown = FormKeyDown
    OnKeyUp = Edt_FeesKeyUp
  end
  object Edt_Profit: TEdit
    Left = 155
    Top = 370
    Width = 181
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
    OnKeyDown = FormKeyDown
    OnKeyUp = Edt_ProfitKeyUp
  end
  object Btn_Cancel: TButton
    Left = 155
    Top = 460
    Width = 181
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
  object Btn_Update: TButton
    Left = 155
    Top = 410
    Width = 181
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
    OnKeyDown = FormKeyDown
  end
end
