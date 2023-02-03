object F_UpdateMessageUpdate: TF_UpdateMessageUpdate
  Left = 0
  Top = 0
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
    Top = 41
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
  object Edt_Ativo: TEdit
    Left = 50
    Top = 116
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
  end
  object Edt_ValorPago: TEdit
    Left = 255
    Top = 116
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
  end
  object Edt_Quantidade: TEdit
    Left = 155
    Top = 174
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
  end
  object Edt_Taxas: TEdit
    Left = 448
    Top = 116
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
  end
  object Edt_Lucro: TEdit
    Left = 348
    Top = 174
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
    TextHint = 'Lucro esperado, ex 10'
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
