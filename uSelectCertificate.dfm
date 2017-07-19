object frmSelectCertificate: TfrmSelectCertificate
  Left = 263
  Top = 191
  BorderIcons = []
  Caption = 'Selecione o certificado'
  ClientHeight = 371
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 330
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object lbList: TListBox
      Left = 5
      Top = 5
      Width = 491
      Height = 320
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = lbListDblClick
    end
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 330
    Width = 501
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      501
      41)
    object btnSelect: TBitBtn
      Left = 334
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnSelectClick
    end
    object btnCancel: TBitBtn
      Left = 414
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
    object btnRemove: TBitBtn
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Remover'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 2
      OnClick = btnRemoveClick
    end
  end
end
