object frmEmitente: TfrmEmitente
  Left = 0
  Top = 0
  Width = 534
  Height = 144
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 534
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = 'VERIFICA AUTORIZA'#199#195'O PARA EMISS'#195'O DA NF-e'
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 272
  end
  object lblMsg: TLabel
    Left = 0
    Top = 90
    Width = 534
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 3
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 13
    Width = 534
    Height = 77
    Align = alClient
    Caption = ' Emitente '
    TabOrder = 0
    object Label4: TLabel
      Left = 251
      Top = 26
      Width = 36
      Height = 13
      Caption = 'C.N.P.J'
      FocusControl = dbedtCNPJ
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 19
      Top = 26
      Width = 97
      Height = 13
      Caption = 'Incri'#231#227'o Estadual'
      FocusControl = dbedtIE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 464
      Top = 26
      Width = 14
      Height = 13
      Caption = 'UF'
      FocusControl = dbedtIE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 226
      Top = 45
      Width = 14
      Height = 13
      Caption = 'ou'
      FocusControl = dbedtIE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedtCNPJ: TDBEdit
      Left = 251
      Top = 42
      Width = 192
      Height = 21
      DataField = 'CNPJ'
      DataSource = dm_Emitente.dsEmitente
      TabOrder = 1
    end
    object dbedtIE: TDBEdit
      Left = 19
      Top = 42
      Width = 192
      Height = 21
      DataField = 'IE'
      DataSource = dm_Emitente.dsEmitente
      TabOrder = 0
      OnKeyPress = dbedtIEKeyPress
    end
    object cmbUf: TComboBox
      Left = 464
      Top = 42
      Width = 49
      Height = 21
      Cursor = crHandPoint
      Style = csDropDownList
      TabOrder = 2
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
    end
  end
  object pnlBtn: TPanel
    Left = 0
    Top = 103
    Width = 534
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 204
      Top = 6
      Width = 129
      Height = 25
      Cursor = crHandPoint
      Caption = 'Consultar Autoriza'#231#227'o'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
end
