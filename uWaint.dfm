object frmWaint: TfrmWaint
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 87
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMsg: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 87
    Align = alClient
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 86
    object lblMsg: TLabel
      Left = 6
      Top = 7
      Width = 453
      Height = 73
      Alignment = taCenter
      AutoSize = False
      Caption = 'Teste'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      WordWrap = True
    end
  end
end
