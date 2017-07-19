object frmEmail: TfrmEmail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Envio de NFe por Email'
  ClientHeight = 341
  ClientWidth = 489
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
  object Label2: TLabel
    Left = 16
    Top = 98
    Width = 51
    Height = 13
    Caption = 'Mensagem'
  end
  object edt_AddressTo: TLabeledEdit
    Left = 16
    Top = 20
    Width = 449
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'Para'
    TabOrder = 0
    OnExit = edt_AddressToExit
  end
  object edt_Subject: TLabeledEdit
    Tag = 2
    Left = 16
    Top = 71
    Width = 449
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Assunto'
    TabOrder = 1
  end
  object mm_Mensagens: TMemo
    Tag = 2
    Left = 16
    Top = 116
    Width = 449
    Height = 166
    Hint = 'M'#225'ximo 500 caracteres'
    MaxLength = 500
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 2
  end
  object pnlBtn: TPanel
    Left = 0
    Top = 300
    Width = 489
    Height = 41
    Align = alBottom
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Enviar'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 384
      Top = -40
      Width = 75
      Height = 25
      Caption = 'BitBtn2'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 97
      Top = 9
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
end
