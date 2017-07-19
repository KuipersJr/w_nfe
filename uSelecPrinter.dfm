object frmSelectPrinter: TfrmSelectPrinter
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Impressoras disponiveis'
  ClientHeight = 216
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 6
    Width = 91
    Height = 13
    Caption = 'Impressoras Locais'
  end
  object Label2: TLabel
    Left = 264
    Top = 6
    Width = 102
    Height = 13
    Caption = 'Impressoras da Rede'
  end
  object lstImprLocal: TListBox
    Left = 8
    Top = 25
    Width = 241
    Height = 137
    Cursor = crHandPoint
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = btnOkClick
    OnEnter = lstImprLocalEnter
  end
  object lstImprRede: TListBox
    Left = 264
    Top = 25
    Width = 241
    Height = 137
    Cursor = crHandPoint
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = btnOkClick
    OnEnter = lstImprRedeEnter
  end
  object pnlBtn: TPanel
    Left = 0
    Top = 175
    Width = 517
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOk: TButton
      Left = 216
      Top = 9
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
end
