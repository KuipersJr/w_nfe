object frmConfiguracao: TfrmConfiguracao
  Left = 0
  Top = 0
  Width = 769
  Height = 360
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 769
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = 'Configura'#231#245'es'
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    ExplicitWidth = 80
  end
  object pgcConfig: TPageControl
    Left = 0
    Top = 13
    Width = 769
    Height = 306
    ActivePage = tbsGeral
    Align = alClient
    TabOrder = 0
    OnChange = pgcConfigChange
    object tbsGeral: TTabSheet
      Caption = 'Geral'
      OnShow = pgcConfigChange
      object dbrbAmbiente: TDBRadioGroup
        Left = 6
        Top = 9
        Width = 213
        Height = 49
        Cursor = crHandPoint
        Caption = ' Ambiente * '
        Columns = 2
        DataField = 'FLG_AMBIENTE'
        DataSource = dm_nfe.dsConfi
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          'Homologa'#231#227'o'
          'Produ'#231#227'o')
        ParentBackground = True
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          'H'
          'P')
        OnChange = pgcConfigChange
      end
      object gbDiretorios: TGroupBox
        Left = 227
        Top = 9
        Width = 519
        Height = 152
        Caption = ' Diret'#243'rios '
        TabOrder = 2
        object lblDirXml: TLabel
          Left = 9
          Top = 53
          Width = 158
          Height = 13
          Caption = 'Diret'#243'rio para exporta'#231#227'o do xml'
        end
        object btnDirXml: TSpeedButton
          Left = 490
          Top = 67
          Width = 25
          Height = 22
          Cursor = crHandPoint
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            FD7997BC777F92DACCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBFCFD688DB71389E055AFE496A9BEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFC688DB71088
            E183E6FE6FDBFD80BEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F8FA678CB71087E182E4FE76DCF870B7EBFAFCFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9CC01389E183E6FE76DC
            F86EB6EBFDFEFFFFFFFFFFFFFFFFFFFFF3F0F0C1B2B2A58D8EA08888B8A5A5DF
            D7D7EEEAE97C819350A3D86FDBFB6FB7EBFCFDFFFFFFFFFFFFFFFFFFFFDAD1D1
            82666696776DC9B8AED9CDCAC6B5AEA58C88997E7FB490898B9CB281BDEEFCFD
            FFFFFFFFFFFFFFFFFFFFE9E3E3785858C2957AFBEECCFEFEEFFEFEFDFEFEF2F7
            E8C9BD9F91B29797EEEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA28D90A66C54
            FECDA2FEE4BFFEF5D6FEFBE0FEF7D9FEE9C4F8C79FBA9C93E8E1E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF836362E09166FEBD8FFECDA4FEDBB6FEE2BEFEDDB8FE
            CFA7FEBE90D99F7FD1C7C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906961F09163
            FBA979FDB989FEC696FEC89CFEC498FEBE8CFEB678E9A97BCDC1C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF906C67EC8F58FEB777FECE93FEDBA3FEDFA8FEDDA7FE
            D9A1FECC8CE6B28DD5CACCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898ACC9670
            FED493FEE1A9FEECBBFEF1C4FEF0C4FEEDB9FEDCA2D7BBAAE5DEDFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD6CCCD9C7A74EDC394FEF3BEFEF5CEFEF7D9FEF8D9FE
            F5CBE8D2B6CFBFC1FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BABB
            A98E87DDC9ACF9EDD0FBF6E3F7F0E0E0CFC0CCBDBDF0ECECFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD4D5BEAEAEBEABA9CDBAB7C9B9BAD8
            CCCDF5F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnDirXmlClick
        end
        object lblDirLog: TLabel
          Left = 9
          Top = 91
          Width = 152
          Height = 13
          Caption = 'Diret'#243'rio dos aquivos de log xml'
          FocusControl = dbedtDirLog
        end
        object btnDirLog: TSpeedButton
          Left = 490
          Top = 106
          Width = 25
          Height = 22
          Cursor = crHandPoint
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            FD7997BC777F92DACCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBFCFD688DB71389E055AFE496A9BEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFC688DB71088
            E183E6FE6FDBFD80BEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F8FA678CB71087E182E4FE76DCF870B7EBFAFCFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9CC01389E183E6FE76DC
            F86EB6EBFDFEFFFFFFFFFFFFFFFFFFFFF3F0F0C1B2B2A58D8EA08888B8A5A5DF
            D7D7EEEAE97C819350A3D86FDBFB6FB7EBFCFDFFFFFFFFFFFFFFFFFFFFDAD1D1
            82666696776DC9B8AED9CDCAC6B5AEA58C88997E7FB490898B9CB281BDEEFCFD
            FFFFFFFFFFFFFFFFFFFFE9E3E3785858C2957AFBEECCFEFEEFFEFEFDFEFEF2F7
            E8C9BD9F91B29797EEEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA28D90A66C54
            FECDA2FEE4BFFEF5D6FEFBE0FEF7D9FEE9C4F8C79FBA9C93E8E1E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF836362E09166FEBD8FFECDA4FEDBB6FEE2BEFEDDB8FE
            CFA7FEBE90D99F7FD1C7C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906961F09163
            FBA979FDB989FEC696FEC89CFEC498FEBE8CFEB678E9A97BCDC1C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF906C67EC8F58FEB777FECE93FEDBA3FEDFA8FEDDA7FE
            D9A1FECC8CE6B28DD5CACCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898ACC9670
            FED493FEE1A9FEECBBFEF1C4FEF0C4FEEDB9FEDCA2D7BBAAE5DEDFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD6CCCD9C7A74EDC394FEF3BEFEF5CEFEF7D9FEF8D9FE
            F5CBE8D2B6CFBFC1FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BABB
            A98E87DDC9ACF9EDD0FBF6E3F7F0E0E0CFC0CCBDBDF0ECECFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD4D5BEAEAEBEABA9CDBAB7C9B9BAD8
            CCCDF5F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnDirLogClick
        end
        object Label17: TLabel
          Left = 9
          Top = 16
          Width = 267
          Height = 13
          Caption = 'Diret'#243'rio de monitoramento dos arquivos txt  *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 490
          Top = 30
          Width = 25
          Height = 22
          Cursor = crHandPoint
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            FD7997BC777F92DACCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBFCFD688DB71389E055AFE496A9BEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFC688DB71088
            E183E6FE6FDBFD80BEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F8FA678CB71087E182E4FE76DCF870B7EBFAFCFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9CC01389E183E6FE76DC
            F86EB6EBFDFEFFFFFFFFFFFFFFFFFFFFF3F0F0C1B2B2A58D8EA08888B8A5A5DF
            D7D7EEEAE97C819350A3D86FDBFB6FB7EBFCFDFFFFFFFFFFFFFFFFFFFFDAD1D1
            82666696776DC9B8AED9CDCAC6B5AEA58C88997E7FB490898B9CB281BDEEFCFD
            FFFFFFFFFFFFFFFFFFFFE9E3E3785858C2957AFBEECCFEFEEFFEFEFDFEFEF2F7
            E8C9BD9F91B29797EEEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA28D90A66C54
            FECDA2FEE4BFFEF5D6FEFBE0FEF7D9FEE9C4F8C79FBA9C93E8E1E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF836362E09166FEBD8FFECDA4FEDBB6FEE2BEFEDDB8FE
            CFA7FEBE90D99F7FD1C7C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906961F09163
            FBA979FDB989FEC696FEC89CFEC498FEBE8CFEB678E9A97BCDC1C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF906C67EC8F58FEB777FECE93FEDBA3FEDFA8FEDDA7FE
            D9A1FECC8CE6B28DD5CACCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898ACC9670
            FED493FEE1A9FEECBBFEF1C4FEF0C4FEEDB9FEDCA2D7BBAAE5DEDFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD6CCCD9C7A74EDC394FEF3BEFEF5CEFEF7D9FEF8D9FE
            F5CBE8D2B6CFBFC1FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BABB
            A98E87DDC9ACF9EDD0FBF6E3F7F0E0E0CFC0CCBDBDF0ECECFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD4D5BEAEAEBEABA9CDBAB7C9B9BAD8
            CCCDF5F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton3Click
        end
        object dbedtDirXml: TDBEdit
          Left = 9
          Top = 68
          Width = 479
          Height = 21
          DataField = 'DIR_EXPORTACAO'
          DataSource = dm_nfe.dsConfi
          TabOrder = 0
        end
        object dbedtDirLog: TDBEdit
          Left = 9
          Top = 107
          Width = 479
          Height = 21
          DataField = 'DIR_LOG'
          DataSource = dm_nfe.dsConfi
          TabOrder = 1
        end
        object DBCheckBox1: TDBCheckBox
          Left = 9
          Top = 130
          Width = 128
          Height = 17
          Cursor = crHandPoint
          Caption = 'Gerar Arquivo de Log.'
          DataField = 'FLG_ARQ_LOG'
          DataSource = dm_nfe.dsConfi
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = DBCheckBox1Click
        end
        object dbedtDirTxt: TDBEdit
          Left = 9
          Top = 31
          Width = 479
          Height = 21
          DataField = 'DIR_TXTNFE'
          DataSource = dm_nfe.dsConfi
          TabOrder = 3
        end
      end
      object gbLogo: TGroupBox
        Left = 6
        Top = 63
        Width = 213
        Height = 206
        Caption = ' Logotipo Danfe '
        TabOrder = 1
        object dbimgLogo: TDBImage
          Left = 2
          Top = 15
          Width = 209
          Height = 164
          Align = alClient
          DataField = 'IMG_LOGO'
          DataSource = dm_nfe.dsConfi
          Proportional = True
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 2
          Top = 179
          Width = 209
          Height = 25
          Cursor = crHandPoint
          Align = alBottom
          Caption = 'Localizar Logo'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            FD7997BC777F92DACCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBFCFD688DB71389E055AFE496A9BEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFC688DB71088
            E183E6FE6FDBFD80BEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F8FA678CB71087E182E4FE76DCF870B7EBFAFCFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9CC01389E183E6FE76DC
            F86EB6EBFDFEFFFFFFFFFFFFFFFFFFFFF3F0F0C1B2B2A58D8EA08888B8A5A5DF
            D7D7EEEAE97C819350A3D86FDBFB6FB7EBFCFDFFFFFFFFFFFFFFFFFFFFDAD1D1
            82666696776DC9B8AED9CDCAC6B5AEA58C88997E7FB490898B9CB281BDEEFCFD
            FFFFFFFFFFFFFFFFFFFFE9E3E3785858C2957AFBEECCFEFEEFFEFEFDFEFEF2F7
            E8C9BD9F91B29797EEEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA28D90A66C54
            FECDA2FEE4BFFEF5D6FEFBE0FEF7D9FEE9C4F8C79FBA9C93E8E1E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF836362E09166FEBD8FFECDA4FEDBB6FEE2BEFEDDB8FE
            CFA7FEBE90D99F7FD1C7C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906961F09163
            FBA979FDB989FEC696FEC89CFEC498FEBE8CFEB678E9A97BCDC1C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF906C67EC8F58FEB777FECE93FEDBA3FEDFA8FEDDA7FE
            D9A1FECC8CE6B28DD5CACCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898ACC9670
            FED493FEE1A9FEECBBFEF1C4FEF0C4FEEDB9FEDCA2D7BBAAE5DEDFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD6CCCD9C7A74EDC394FEF3BEFEF5CEFEF7D9FEF8D9FE
            F5CBE8D2B6CFBFC1FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BABB
            A98E87DDC9ACF9EDD0FBF6E3F7F0E0E0CFC0CCBDBDF0ECECFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD4D5BEAEAEBEABA9CDBAB7C9B9BAD8
            CCCDF5F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 1
          OnClick = BitBtn1Click
        end
      end
      object gbCertifidado: TGroupBox
        Left = 227
        Top = 162
        Width = 519
        Height = 107
        Caption = 'Dados do Certificado Digital'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Label4: TLabel
          Left = 9
          Top = 18
          Width = 123
          Height = 13
          Caption = 'Nome do Certificado *'
          FocusControl = dbedtCertificado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnCertificado: TSpeedButton
          Left = 490
          Top = 33
          Width = 25
          Height = 22
          Cursor = crHandPoint
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            FD7997BC777F92DACCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBFCFD688DB71389E055AFE496A9BEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFC688DB71088
            E183E6FE6FDBFD80BEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F8FA678CB71087E182E4FE76DCF870B7EBFAFCFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9CC01389E183E6FE76DC
            F86EB6EBFDFEFFFFFFFFFFFFFFFFFFFFF3F0F0C1B2B2A58D8EA08888B8A5A5DF
            D7D7EEEAE97C819350A3D86FDBFB6FB7EBFCFDFFFFFFFFFFFFFFFFFFFFDAD1D1
            82666696776DC9B8AED9CDCAC6B5AEA58C88997E7FB490898B9CB281BDEEFCFD
            FFFFFFFFFFFFFFFFFFFFE9E3E3785858C2957AFBEECCFEFEEFFEFEFDFEFEF2F7
            E8C9BD9F91B29797EEEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA28D90A66C54
            FECDA2FEE4BFFEF5D6FEFBE0FEF7D9FEE9C4F8C79FBA9C93E8E1E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF836362E09166FEBD8FFECDA4FEDBB6FEE2BEFEDDB8FE
            CFA7FEBE90D99F7FD1C7C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906961F09163
            FBA979FDB989FEC696FEC89CFEC498FEBE8CFEB678E9A97BCDC1C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF906C67EC8F58FEB777FECE93FEDBA3FEDFA8FEDDA7FE
            D9A1FECC8CE6B28DD5CACCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898ACC9670
            FED493FEE1A9FEECBBFEF1C4FEF0C4FEEDB9FEDCA2D7BBAAE5DEDFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD6CCCD9C7A74EDC394FEF3BEFEF5CEFEF7D9FEF8D9FE
            F5CBE8D2B6CFBFC1FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BABB
            A98E87DDC9ACF9EDD0FBF6E3F7F0E0E0CFC0CCBDBDF0ECECFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD4D5BEAEAEBEABA9CDBAB7C9B9BAD8
            CCCDF5F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = btnCertificadoClick
        end
        object Label6: TLabel
          Left = 9
          Top = 59
          Width = 88
          Height = 13
          Caption = 'TP Certificado *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object dbedtCertificado: TDBEdit
          Left = 9
          Top = 34
          Width = 479
          Height = 21
          DataField = 'NOME_CERTIFICADO'
          DataSource = dm_nfe.dsConfi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 200
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbcmbTpCertificado: TDBComboBox
          Left = 9
          Top = 75
          Width = 50
          Height = 21
          Cursor = crHandPoint
          DataField = 'TIPO_CERTIFICADO'
          DataSource = dm_nfe.dsConfi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'A1'
            'A3')
          ParentFont = False
          TabOrder = 1
          OnChange = dbcmbTpCertificadoChange
        end
        object dbchkAtvMonitor: TDBCheckBox
          Left = 255
          Top = 72
          Width = 129
          Height = 17
          Cursor = crHandPoint
          Hint = 'Ativa o monitoramento do diret'#243'rio dos arquivos txt da nfe'
          Caption = 'Ativar Monitora'#231#227'o'
          DataField = 'FLG_MONITORA'
          DataSource = dm_nfe.dsConfi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = dbchkAtvMonitorClick
        end
        object dbrbValida: TDBCheckBox
          Left = 98
          Top = 72
          Width = 152
          Height = 17
          Cursor = crHandPoint
          Caption = 'Validar NF-e antes do envio '
          DataField = 'FLG_VALIDA'
          DataSource = dm_nfe.dsConfi
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkSimples: TDBCheckBox
          Left = 272
          Top = 87
          Width = 124
          Height = 17
          Cursor = crHandPoint
          Caption = 'Simples Nascional'
          DataField = 'FLG_SIMPLESN'
          DataSource = dm_nfe.dsConfi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbChkHrVerao: TDBCheckBox
          Left = 400
          Top = 72
          Width = 112
          Height = 17
          Caption = 'Hor'#225'rio de ver'#227'o'
          DataField = 'HR_VERAO'
          DataSource = dm_nfe.dsConfi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
    object tbsProxy: TTabSheet
      Caption = 'Proxy'
      ImageIndex = 1
      OnShow = pgcConfigChange
      object Label7: TLabel
        Left = 16
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Proxy'
        FocusControl = dbedtProxy
      end
      object Label8: TLabel
        Left = 208
        Top = 16
        Width = 30
        Height = 13
        Caption = 'Senha'
        FocusControl = dbedtProxyS
      end
      object Label9: TLabel
        Left = 329
        Top = 16
        Width = 36
        Height = 13
        Caption = 'Usuario'
        FocusControl = dbedtUsuproxy
      end
      object dbedtProxy: TDBEdit
        Left = 16
        Top = 35
        Width = 177
        Height = 21
        DataField = 'PROXY'
        DataSource = dm_nfe.dsConfi
        TabOrder = 0
        OnChange = pgcConfigChange
      end
      object dbedtProxyS: TDBEdit
        Left = 208
        Top = 35
        Width = 105
        Height = 21
        DataField = 'PROXY_SENHA'
        DataSource = dm_nfe.dsConfi
        PasswordChar = '*'
        TabOrder = 1
        OnChange = pgcConfigChange
      end
      object dbedtUsuproxy: TDBEdit
        Left = 329
        Top = 35
        Width = 222
        Height = 21
        DataField = 'PROXY_USER'
        DataSource = dm_nfe.dsConfi
        TabOrder = 2
        OnChange = pgcConfigChange
      end
    end
    object tbsImpressao: TTabSheet
      Caption = 'Impress'#227'o'
      ImageIndex = 2
      OnShow = pgcConfigChange
      object GroupBox4: TGroupBox
        Left = 8
        Top = 3
        Width = 742
        Height = 118
        Caption = ' Configura'#231#245'es para impress'#227'o do Danfe '
        TabOrder = 0
        object Label2: TLabel
          Left = 259
          Top = 16
          Width = 119
          Height = 13
          Caption = 'Impressora Padr'#227'o *'
          FocusControl = dbedtImprPadrao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 712
          Top = 31
          Width = 25
          Height = 22
          Cursor = crHandPoint
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            FD7997BC777F92DACCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBFCFD688DB71389E055AFE496A9BEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFC688DB71088
            E183E6FE6FDBFD80BEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F8FA678CB71087E182E4FE76DCF870B7EBFAFCFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9CC01389E183E6FE76DC
            F86EB6EBFDFEFFFFFFFFFFFFFFFFFFFFF3F0F0C1B2B2A58D8EA08888B8A5A5DF
            D7D7EEEAE97C819350A3D86FDBFB6FB7EBFCFDFFFFFFFFFFFFFFFFFFFFDAD1D1
            82666696776DC9B8AED9CDCAC6B5AEA58C88997E7FB490898B9CB281BDEEFCFD
            FFFFFFFFFFFFFFFFFFFFE9E3E3785858C2957AFBEECCFEFEEFFEFEFDFEFEF2F7
            E8C9BD9F91B29797EEEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA28D90A66C54
            FECDA2FEE4BFFEF5D6FEFBE0FEF7D9FEE9C4F8C79FBA9C93E8E1E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF836362E09166FEBD8FFECDA4FEDBB6FEE2BEFEDDB8FE
            CFA7FEBE90D99F7FD1C7C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906961F09163
            FBA979FDB989FEC696FEC89CFEC498FEBE8CFEB678E9A97BCDC1C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF906C67EC8F58FEB777FECE93FEDBA3FEDFA8FEDDA7FE
            D9A1FECC8CE6B28DD5CACCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898ACC9670
            FED493FEE1A9FEECBBFEF1C4FEF0C4FEEDB9FEDCA2D7BBAAE5DEDFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD6CCCD9C7A74EDC394FEF3BEFEF5CEFEF7D9FEF8D9FE
            F5CBE8D2B6CFBFC1FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BABB
            A98E87DDC9ACF9EDD0FBF6E3F7F0E0E0CFC0CCBDBDF0ECECFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD4D5BEAEAEBEABA9CDBAB7C9B9BAD8
            CCCDF5F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton1Click
        end
        object Label3: TLabel
          Left = 259
          Top = 60
          Width = 104
          Height = 13
          Caption = 'Quantidade de c'#243'pias'
          FocusControl = DBCheckBox1
        end
        object dbedtImprPadrao: TDBEdit
          Left = 259
          Top = 32
          Width = 452
          Height = 21
          DataField = 'IMP_PADRAO'
          DataSource = dm_nfe.dsConfi
          TabOrder = 1
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 12
          Top = 21
          Width = 226
          Height = 39
          Cursor = crHandPoint
          Caption = ' Modo de Impress'#227'o '
          Columns = 3
          DataField = 'FLG_TP_IMP'
          DataSource = dm_nfe.dsConfi
          Items.Strings = (
            'Visualizar'
            'Imprimir'
            'Ambos')
          ParentBackground = True
          TabOrder = 0
          Values.Strings = (
            'V'
            'I'
            'A')
          OnChange = pgcConfigChange
        end
        object dbedtQtdeCopias: TDBEdit
          Left = 259
          Top = 79
          Width = 104
          Height = 21
          DataField = 'QTDE_IMP'
          DataSource = dm_nfe.dsConfi
          TabOrder = 2
          OnChange = pgcConfigChange
        end
        object DBCheckBox6: TDBCheckBox
          Left = 12
          Top = 79
          Width = 226
          Height = 17
          Cursor = crHandPoint
          Caption = 'Imprir automaticamente ap'#243's a autoriza'#231#227'o'
          DataField = 'FLG_IMPRIME'
          DataSource = dm_nfe.dsConfi
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 431
          Top = 60
          Width = 185
          Height = 44
          Cursor = crHandPoint
          Caption = 'Tipo de impress'#227'o '
          Columns = 2
          DataField = 'FLG_MODOIMP'
          DataSource = dm_nfe.dsConfi
          Items.Strings = (
            'Retr'#225'to'
            'Paisagem')
          ParentBackground = True
          TabOrder = 4
          Values.Strings = (
            'R'
            'P')
          Visible = False
          OnChange = pgcConfigChange
        end
      end
    end
    object tbsEmail: TTabSheet
      Caption = 'Email'
      ImageIndex = 3
      OnShow = pgcConfigChange
      object Label10: TLabel
        Left = 18
        Top = 13
        Width = 69
        Height = 13
        Caption = 'Servidor SMTP'
        FocusControl = DBEdit1
      end
      object Label11: TLabel
        Left = 208
        Top = 13
        Width = 55
        Height = 13
        Caption = 'Porta SMTP'
        FocusControl = DBEdit2
      end
      object Label12: TLabel
        Left = 329
        Top = 13
        Width = 80
        Height = 13
        Caption = 'Email Remetente'
        FocusControl = DBEdit3
      end
      object Label13: TLabel
        Left = 18
        Top = 57
        Width = 39
        Height = 13
        Caption = 'Assunto'
        FocusControl = DBEdit8
      end
      object Label14: TLabel
        Left = 329
        Top = 57
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
        FocusControl = DBEdit9
      end
      object Label15: TLabel
        Left = 544
        Top = 57
        Width = 30
        Height = 13
        Caption = 'Senha'
        FocusControl = DBEdit10
      end
      object Label16: TLabel
        Left = 18
        Top = 103
        Width = 56
        Height = 13
        Caption = 'Menssagem'
        FocusControl = DBEdit8
      end
      object DBEdit1: TDBEdit
        Left = 18
        Top = 29
        Width = 175
        Height = 21
        DataField = 'SERVER_SMTP'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 0
        OnChange = pgcConfigChange
      end
      object DBEdit2: TDBEdit
        Left = 208
        Top = 29
        Width = 104
        Height = 21
        DataField = 'PORTA_SMTP'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 1
        OnChange = pgcConfigChange
      end
      object DBEdit3: TDBEdit
        Left = 329
        Top = 29
        Width = 415
        Height = 21
        DataField = 'EMAIL_REMETENTE'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 2
        OnChange = pgcConfigChange
      end
      object DBEdit8: TDBEdit
        Left = 18
        Top = 73
        Width = 294
        Height = 21
        DataField = 'ASSUNTO'
        DataSource = dmGeral.dsConfEmail
        MaxLength = 100
        TabOrder = 3
        OnChange = pgcConfigChange
      end
      object DBEdit9: TDBEdit
        Left = 329
        Top = 73
        Width = 200
        Height = 21
        DataField = 'USUARIO'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 4
        OnChange = pgcConfigChange
      end
      object DBEdit10: TDBEdit
        Left = 544
        Top = 73
        Width = 200
        Height = 21
        DataField = 'SENHA'
        DataSource = dmGeral.dsConfEmail
        PasswordChar = '*'
        TabOrder = 5
        OnChange = pgcConfigChange
      end
      object DBMemo1: TDBMemo
        Left = 18
        Top = 118
        Width = 726
        Height = 71
        DataField = 'MENSAGEM'
        DataSource = dmGeral.dsConfEmail
        MaxLength = 255
        TabOrder = 6
        OnChange = pgcConfigChange
      end
      object DBCheckBox2: TDBCheckBox
        Left = 18
        Top = 211
        Width = 143
        Height = 17
        Cursor = crHandPoint
        Caption = 'Utilizar autentica'#231#227'o'
        DataField = 'FLG_SSI'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBox2Click
      end
      object DBCheckBox3: TDBCheckBox
        Left = 303
        Top = 211
        Width = 177
        Height = 17
        Cursor = crHandPoint
        Caption = 'Anexar DANFE em PDF no email'
        DataField = 'FLG_DANFE'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBox2Click
      end
      object DBCheckBox4: TDBCheckBox
        Left = 527
        Top = 211
        Width = 217
        Height = 17
        Cursor = crHandPoint
        Caption = 'Enviar email ap'#243's a autoriza'#231#227'o da NF-e'
        DataField = 'FLG_EMAIL_AUTO'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBox2Click
      end
      object DBCheckBox7: TDBCheckBox
        Left = 167
        Top = 211
        Width = 95
        Height = 17
        Cursor = crHandPoint
        Caption = 'Utilizar SSL/TLS'
        DataField = 'FLG_SSL'
        DataSource = dmGeral.dsConfEmail
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = DBCheckBox2Click
      end
    end
    object tbsRepositorio: TTabSheet
      Caption = 'Reposit'#243'rio'
      ImageIndex = 4
      OnShow = pgcConfigChange
      object GroupBox5: TGroupBox
        Left = 9
        Top = 15
        Width = 742
        Height = 105
        Caption = ' Manuten'#231#227'o do Banco de Dados '
        TabOrder = 0
        object Label18: TLabel
          Left = 6
          Top = 21
          Width = 147
          Height = 13
          Caption = 'Diret'#243'rio do arquivo de Backup'
        end
        object SpeedButton2: TSpeedButton
          Left = 280
          Top = 35
          Width = 25
          Height = 22
          Cursor = crHandPoint
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            FD7997BC777F92DACCCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFBFCFD688DB71389E055AFE496A9BEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFBFC688DB71088
            E183E6FE6FDBFD80BEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF6F8FA678CB71087E182E4FE76DCF870B7EBFAFCFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9CC01389E183E6FE76DC
            F86EB6EBFDFEFFFFFFFFFFFFFFFFFFFFF3F0F0C1B2B2A58D8EA08888B8A5A5DF
            D7D7EEEAE97C819350A3D86FDBFB6FB7EBFCFDFFFFFFFFFFFFFFFFFFFFDAD1D1
            82666696776DC9B8AED9CDCAC6B5AEA58C88997E7FB490898B9CB281BDEEFCFD
            FFFFFFFFFFFFFFFFFFFFE9E3E3785858C2957AFBEECCFEFEEFFEFEFDFEFEF2F7
            E8C9BD9F91B29797EEEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA28D90A66C54
            FECDA2FEE4BFFEF5D6FEFBE0FEF7D9FEE9C4F8C79FBA9C93E8E1E0FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF836362E09166FEBD8FFECDA4FEDBB6FEE2BEFEDDB8FE
            CFA7FEBE90D99F7FD1C7C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906961F09163
            FBA979FDB989FEC696FEC89CFEC498FEBE8CFEB678E9A97BCDC1C3FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF906C67EC8F58FEB777FECE93FEDBA3FEDFA8FEDDA7FE
            D9A1FECC8CE6B28DD5CACCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1898ACC9670
            FED493FEE1A9FEECBBFEF1C4FEF0C4FEEDB9FEDCA2D7BBAAE5DEDFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFD6CCCD9C7A74EDC394FEF3BEFEF5CEFEF7D9FEF8D9FE
            F5CBE8D2B6CFBFC1FAF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BABB
            A98E87DDC9ACF9EDD0FBF6E3F7F0E0E0CFC0CCBDBDF0ECECFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDD4D5BEAEAEBEABA9CDBAB7C9B9BAD8
            CCCDF5F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          OnClick = SpeedButton2Click
        end
        object btnBkpFdb: TSpeedButton
          Left = 603
          Top = 15
          Width = 131
          Height = 37
          Caption = 'Executar &BackUp '
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C000001000000010000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000002080B308DCE308AC900000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000002577B0308DD02F87C500000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000089776296816A9580699580699580699580699580699580699580699580
            689580689880659F7F5F8682772A8AD15CB7E3368CC712334A00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000096816BD4C9B4CFC3AECDC1ACCDC1ACCDC1ACCDC1ACCDC1ACCDC1ACCDC1
            ACCDC1ACCDC1ABD0C2AADAC3A53A8ECB71C9ED8CE6F9358ECE122F4500000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000096816AD3C7B5CABDA9FFFEF3C6B8A4FFFDF2C6B8A4FFFDF2C6B8A4FFFD
            F2C6B8A4FFFDF2C8B9A3FFFFF17DA1B93999D7A8F8FF80DFF7378FCF112C4100
            0000000000000000000000000000000000000000000000000000000000000000
            00000097826BD4CAB8C9BDA7C5B9A2FFFAEFC3B6A0FFFAEFC3B6A0FFFAEFC3B6
            A0FFFAEFC3B6A0FFFBEFCABAA1C1B9A82284D0AEF1FF8DECFD7BDCF5398FD026
            5F8A000000000000000000000000000000000000000000000000000000000000
            00000098836BD8CEBDCABEA8FFFDF2C6BAA4FFFBF0C6BAA3FFFBF0C7BAA4FFFC
            F1C9BAA5FFFCF1C8BAA3FFFEF1D7C1A45497C872C9EDA8F0FE81E9FB78DAF53B
            90D0275F8A000000000000000000000000000000000000000000000000000000
            00000099846CDAD1C0CCC0ABCBBFA9CBBFA9CBBEA9CBBFA9CBBFA9D0C0ABD7C1
            AED8C1AFD4C1AAD6C1A6D9C2A4DFC4A3A6B4BD42A3DCE6FEFF77E1F87EE5FA74
            D8F44197D4285E88000000000000000000000000000000000000000000000000
            00000098836DDDD3C4CEC1ADCEC1ADCEC1ADCEC1ADCEC1ADD0C1AED7C3B1008A
            3A008B39E2C6AE268AD93CA1E03E9FDE419FDB3F9BD7B6F2FD87E4F875E0F778
            E3F977E2F9459CD7367EB5000000000000000000000000000000000000000000
            00000099846DDFD6C7CFC2AED0C4B0D0C4B1D0C4B1D0C4B1D1C5B2D5C5B4DDC7
            B7DFC8B6E2C8AF2E8AD87FEAFF73E3FB74E2FA72E1F96EDEF86DDDF76EDDF76E
            DEF870E0F970DFF8469DD8377EB6000000000000000000000000000000000000
            0000009A856EE1D9CBD1C4B1C1A888C2AA8AC2AA8AC2AA8AC2AA8AC3AA8BC4AA
            8BC6AB8ACEAB864E92C780DDF870DDF86CDCF66CDCF66ADCF69FEBFB9FEDFCA0
            EEFDA0EFFDA2F1FFA3F0FD4AA3DB3F8AC5000000000000000000000000000000
            0000009B866FE3DCCED1C4B0BFA685BFA786BFA786BFA786BFA786BFA786BFA7
            86C1A786C9A8826C95B677CDF07AE0F864D9F565D9F565DBF650B2E23D8ACF3F
            8ED03F8FD1408FD24292D24595D44797D5000000000000000000000000000000
            0000009C8770E7DED2D1C2AFFAF9F8F9F8F7F9F8F7F9F8F7F9F8F7F9F8F7F9F8
            F7FAF9F6FFFBF5A9CBE664BAE98BE5FA5DD5F460D6F463D7F576E0F84CA7DD33
            6E9E000000000000000000000000000000000000000000000000000000000000
            0000009D8870E8E0D5D1C4AFD1C4B0D1C4B0D1C4B0D1C4B0D1C4B0D1C4B0D1C4
            B0D1C5B0D6C6AFB3B9B84FA4E1AEEEFC56D3F35AD4F35AD4F37EDFF767D5F346
            93D409131B000000000000000000000000000000000000000000000000000000
            0000009D8771EAE4D9D3C7B3C0A787C1A889C1A989C1A989C1A989C1A989C1A9
            89C1A989C4AA88CDAA823797DFCCF6FF4ED0F254D1F255D2F25CD4F3A9EDFA49
            ACE14084BB000000000000000000000000000000000000000000000000000000
            0000009E8872ECE5DBD4C6B3BFA584BFA686BFA786BFA786BFA786BFA786BFA7
            86BFA786C1A785C9A8815192C9BFF0FC6FD8F44CCFF14FCFF14CCEF19DE6F87B
            D9F34894D5295273000000000000000000000000000000000000000000000000
            0000009F8972EEE7DED3C5B1FBFAF8FAF9F8FAF9F7FAF9F7FAF9F7FAF9F7FAF9
            F7FAF9F7FBFAF7FFFCF584B8E39BD9F49FE6F941CAF145CBF144CBF148CDF1DD
            FAFE50AEE2488FC9000000000000000000000000000000000000000000000000
            000000A08A73F0EBE1D5C7B3D6C8B5D6C8B5D6C8B5D6C8B5D6C8B5D6C8B5D6C8
            B5D6C8B5D6C8B5DCCAB398B2C37FC4EFD7FBFF93E7FA97E7FA97E7F994E7F9A7
            EDFBB0ECF94E99D83F79A9000000000000000000000000000000000000000000
            000000A08B74F2ECE4D7C9B6BFA786C1A888C1A889C1A889C1A889C1A889C1A8
            89C1A889C1A889C5AA87A6A49B3B94E13E93DD4596DD4C97DB4E98D94E97D84E
            98D84F99D9529CDB549EDB000000000000000000000000000000000000000000
            000000A18C75F4EFE8D8CAB6BEA583BFA685BFA686BFA686BFA686BFA686BFA6
            86BFA686BFA686C0A785C3A681E2CDB4FFF2E3AF8C6800000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A18C76F6F0EAD7C8B5FDFAFAFCFAFAFCFAFAFCFAFAFCFAFAFCFAFAFCFA
            FAFCFAFAFCFAFAFCFAFAFDFBFAD9C8B4F9F1E9A58C7200000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A28D77F7F4ECD8C9B6D9CBB8D9CBB8D9CBB8D9CBB8D9CBB8D9CBB8D9CB
            B8D9CBB8D9CBB8D9CBB8D9CBB8D8C9B6F7F4ECA38D7600000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A38E77F9F5F0DACCB9BFA685C0A888C1A889C1A889C1A889C1A889C1A8
            89C1A889C1A889C0A888BFA685DACCB9F9F5F0A38E7700000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A48F78FBF7F2DBCCB9BEA483BFA685BFA686BFA686BFA686BFA686BFA6
            86BFA686BFA686BFA685BEA483DBCCB9FBF7F2A48F7800000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A59078FBF8F5DACAB6FBFAF8FBFAF8FBFAF8FBFAF8FBFAF8FBFAF8FBFA
            F8FBFAF8FBFAF8FBFAF8FBFAF8DACAB6FBF8F5A5907800000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A5907AFDFAF7DACAB6DAC9B5DAC9B5DAC9B5DAC9B5DAC9B5DAC9B5DAC9
            B5DAC9B5DAC9B5DAC9B5DAC9B5DACAB6FDFAF7A5907A00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A8937CFFFFFDFDFAF6FBF8F5FBF8F4FBF8F4FBF8F4FBF8F4FBF8F4FBF8
            F4FBF8F4FBF8F4FBF8F4FBF8F5FDFAF6FFFFFDA8937C00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000A5917DA7917BC9BBA6CDC0ABCCBFA9CCBFA9CCBFA9CCBFA9CCBFA9CCBF
            A9CCBFA9CCBFA9CCBFA9CDC0ABC9BBA6A7917BA5917D00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000A6927EBFAD98E0D3C0DFD1BFDFD1BEDFD1BEDFD1BEDFD1BEDFD1
            BEDFD1BEDFD1BEDFD1BFE0D3C0BFAD98A6927E00000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000080808
            000000000000000000A99580AD9883AC9782AC9782AC9782AC9782AC9782AC97
            82AC9782AC9782AC9782AD9883A9958000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          OnClick = btnBkpFdbClick
        end
        object SpeedButton4: TSpeedButton
          Left = 603
          Top = 58
          Width = 131
          Height = 37
          Caption = '&Restaurar BackUp '
          Enabled = False
          Glyph.Data = {
            360C0000424D360C000000000000360000002800000020000000200000000100
            180000000000000C000001000000010000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000007B43008E4E0000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000773F00C786008B4B0000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000763E00C08000E5A60088480000000000009D71
            64AC8471AA8471AA8471A78470A1836E99816A95806995806995806995806995
            806995806995806995806996816A897762000000000000000000000000000000
            00000000000000000000773E00BC8100DBA000DCA10083420087460088460089
            4500894400894400894400894241A06DDAC5B2CFC2ADCDC1ACCDC1ACCDC1ACCD
            C1ACCDC1ACCDC1ACCFC3AED4C9B496816B000000000000000000000000000000
            00000000000000773E00BA8000D6A000D39C00D39C00D8A000D9A200DAA200DA
            A200DAA100DAA100DAA131E7BB00823BDABEADFFFEF3C6B8A4FFFDF2C6B8A4FF
            FDF2C6B8A4FFFEF3CABDA9D3C7B596816A000000000000000000000000000000
            000000007C4200B88100D29F00CE9B00CD9A00CD9A00CF9B00CF9B00CF9B00CF
            9B00CF9B00CF9B00CF9A4FE4C2008039FFFFF9C7B8A2FFFAEFC3B6A0FFFAEFC3
            B6A0FFFAEFC5B9A2C9BDA7D4CAB897826B000000000000000000000000000000
            000000008A482CDCB707CDA100C99900C99A00C99900C99900C89900C89900C8
            9900C89900C89800C89769E5CC008139DFC0AFFFFDF3C7BAA4FFFBF0C6BAA3FF
            FBF0C6BAA4FFFDF2CABEA8D8CEBD98836B000000000000000000000000000000
            00000000864700B38162E0C700C69A00C59900C49800C39800C39900C39900C3
            9900C39900C39800C39785E8D700823BECC6B8DBC2B0D0C0ABCBBFA9CBBFA9CB
            BEA9CBBFA9CBBFA9CCC0ABDAD1C099846C000000000000000000000000000000
            00000000000000844400AF7F60DCC600C09794E6D84DE7D151E9D452E9D450E9
            D44FE8D34EE8D34AE8D397EEE300853E008E42008B3BD7C3B1D0C1AECEC1ADCE
            C1ADCEC1ADCEC1ADCEC1ADDDD3C498836D000000000000000000000000000000
            00000000000000000000844300AB7F5AD9C482E3D600823B0086420087420086
            3E00823A00823A00833B00843D439F6FE9CABCDFC7B8D5C5B4D1C5B2D0C4B1D0
            C4B1D0C4B1D0C4B0CFC2AEDFD6C799846D000000000000000000000000000000
            00000000000000000000000000844300AA7F7BE3D8008944000000000000B485
            74F6DCD2E5C8B8D5AC90D4AD92CFAD90C9AB8DC5AA8CC3AA8BC2AA8AC2AA8AC2
            AA8AC2AA8AC1A888D1C4B1E1D9CB9A856E000000000000000000000000000000
            00000000000000000000000000000000854400AB87008C49000000000000A486
            72E7DDD0D4C5B2C2A786C2A787C1A787C0A786C0A786BFA786BFA786BFA786BF
            A786BFA786BFA685D1C4B0E3DCCE9B866F000000000000000000000000000000
            000000000000000000000000000000000000008A4A008E4D0000000000009F87
            71E7DED2D1C2AFFAF9F8F9F8F7F9F8F7F9F8F7F9F8F7F9F8F7F9F8F7F9F8F7F9
            F8F7F9F8F7FAF9F8D1C2AFE7DED29C8770000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000009F88
            70E8E0D5D1C4AFD1C4B0D1C4B0D1C4B0D1C4B0D1C4B0D1C4B0D1C4B0D1C4B0D1
            C4B0D1C4B0D1C4B0D1C4AFE8E0D59D8870000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000009D87
            71EAE4D9D3C7B3C0A787C1A889C1A989C1A989C1A989C1A989C1A989C1A989C1
            A989C1A889C0A787D3C7B3EAE4D99D8771000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000009E88
            72ECE5DBD4C6B3BFA584BFA686BFA786BFA786BFA786BFA786BFA786BFA786BF
            A786BFA686BFA584D4C6B3ECE5DB9E8872000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000009F89
            72EEE7DED3C5B1FBFAF8FAF9F8FAF9F7FAF9F7FAF9F7FAF9F7FAF9F7FAF9F7FA
            F9F7FAF9F8FBFAF8D3C5B1EEE7DE9F8972000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A08A
            73F0EBE1D5C7B3D6C8B5D6C8B5D6C8B5D6C8B5D6C8B5D6C8B5D6C8B5D6C8B5D6
            C8B5D6C8B5D6C8B5D5C7B3F0EBE1A08A73000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A08B
            74F2ECE4D7C9B6BFA786C1A888C1A889C1A889C1A889C1A889C1A889C1A889C1
            A889C1A888BFA786D7C9B6F2ECE4A08B74000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A18C
            75F4EFE8D8CAB6BEA583BFA685BFA686BFA686BFA686BFA686BFA686BFA686BF
            A686BFA685BEA583D8CAB6F4EFE8A18C75000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A18C
            76F6F0EAD7C8B5FDFAFAFCFAFAFCFAFAFCFAFAFCFAFAFCFAFAFCFAFAFCFAFAFC
            FAFAFCFAFAFDFAFAD7C8B5F6F0EAA18C76000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A28D
            77F7F4ECD8C9B6D9CBB8D9CBB8D9CBB8D9CBB8D9CBB8D9CBB8D9CBB8D9CBB8D9
            CBB8D9CBB8D9CBB8D8C9B6F7F4ECA28D77000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A38E
            77F9F5F0DACCB9BFA685C0A888C1A889C1A889C1A889C1A889C1A889C1A889C1
            A889C0A888BFA685DACCB9F9F5F0A38E77000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A48F
            78FBF7F2DBCCB9BEA483BFA685BFA686BFA686BFA686BFA686BFA686BFA686BF
            A686BFA685BEA483DBCCB9FBF7F2A48F78000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A590
            78FBF8F5DACAB6FBFAF8FBFAF8FBFAF8FBFAF8FBFAF8FBFAF8FBFAF8FBFAF8FB
            FAF8FBFAF8FBFAF8DACAB6FBF8F5A59078000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A590
            7AFDFAF7DACAB6DAC9B5DAC9B5DAC9B5DAC9B5DAC9B5DAC9B5DAC9B5DAC9B5DA
            C9B5DAC9B5DAC9B5DACAB6FDFAF7A5907A000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A893
            7CFFFFFDFDFAF6FBF8F5FBF8F4FBF8F4FBF8F4FBF8F4FBF8F4FBF8F4FBF8F4FB
            F8F4FBF8F4FBF8F5FDFAF6FFFFFDA8937C000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000A591
            7DA7917BC9BBA6CDC0ABCCBFA9CCBFA9CCBFA9CCBFA9CCBFA9CCBFA9CCBFA9CC
            BFA9CCBFA9CDC0ABC9BBA6A7917BA5917D000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00A6927EBFAD98E0D3C0DFD1BFDFD1BEDFD1BEDFD1BEDFD1BEDFD1BEDFD1BEDF
            D1BEDFD1BFE0D3C0BFAD98A6927E000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000A99580AD9883AC9782AC9782AC9782AC9782AC9782AC9782AC9782AC
            9782AC9782AD9883A99580000000000000000000000000000000}
        end
        object BitBtn2: TBitBtn
          Left = 6
          Top = 66
          Width = 192
          Height = 30
          Cursor = crHandPoint
          Caption = 'Descartar Nf-e em Homologa'#231#227'o'
          Glyph.Data = {
            96060000424D9606000000000000360000002800000016000000180000000100
            1800000000006006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000F9F9
            F9F5F5F5F2F2F2F0F0F0EFEFEFEDEDEDEDEDEDEBEBEBEBEBEBEBEBEBEDEDECF1
            F1EC9696D7C5C5E3F5F5F1F3F3F3F7F7F6FFFFFBADADE1CDCDEDFFFFFFFFFFFF
            0000E1E1E1DADADAD5D5D5D3D3D3D2D2D2D0D0D0D1D1D1D0D0D0CFCFCFD0D0CF
            D9D9D07777C23E3EC64949C2B2B2CCE4E4D9E6E6DB8E8ECB4646C74848C4CDCD
            ECFFFFFF0000D9D9D97F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F8282BF5858CC6767E05F5FD93737C19999B76E6EB94A4ACB6D6DE47A
            7AE23939BBFFFFFF0000E7E7E77F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFB
            FBFBFBFBFBFFFFFDC8C8E86E6ECB8585E24D4DD95F5FDB5454CE5F5FD55B5CDE
            7474E28282D88C8CD7FFFFFF0000EAEAEA7F7F7FFFFFFFFCFCFCFAFAFAF6F6F6
            F2F2F2F1F1F1F0F0F0EEEEEEF3F3EEC7C7E24747C16162DA4D4CD85655DB5453
            DB6463DF5D5DD07D7DD1FBFBFDFFFFFF0000EAEAEA7F7F7FFFFFFFF8F8F8E0E0
            E0DFDFDFDCDCDCDBDBDBD9D9D9E7E7E7F9F9F8FFFFFAC2C2E34D4DC95C5CDC53
            53DA5959DD6E6EE16262C5FFFFFFFFFFFFFFFFFF0000EAEAEA7F7F7FFFFFFFFA
            FAFAEDEDEDEBEBEBEBEBEBEBEBEBE7E7E7E8E8E8EBEBE8EDEDEA7070CC5959D3
            5A5ADC5959DC5858DD7373E35050C6BABAE6FFFFFFFFFFFF0000EAEAEA7F7F7F
            FFFFFFFCFCFCF8F8F8F7F7F7F7F7F7F6F6F6F5F5F5F9F9F7EDEDF26666C34B4B
            CC5F5FDC6161DEE0E0F9A2A2EB5D5DDE6F6FDE4444C2C6C6EAFFFFFF0000EAEA
            EA7F7F7FFFFFFFF9F9F9E0E0E0E3E3E3E2E2E2E2E2E2E7E7E7E9E9E28E8ECE6B
            6BD46868DF6B6BDF9292DC5151C07070CC8E8EE36363E08787E53C3CBDFFFFFF
            0000EAEAEA7F7F7FFFFFFFF9F9F9EFEFEFEEEEEEEDEDEDEDEDEDEDEDEDF0F0ED
            D5D5E47575C89D9DE68484D86B6BC3FFFFFFBABAE66666CBB3B3EC8686D79191
            D8FFFFFF0000EAEAEA7F7F7FFFFFFFF9F9F9F6F6F6F5F5F5F5F5F5F7F7F7F6F6
            F6F5F5F5FCFCF8E7E7F35151C58484D5F0F0F6FFFFFBFFFFFF9D9DC55656C59A
            9ADBFFFFFFFFFFFF0000EAEAEA7F7F7FFFFFFFF3F3F3DEDEDEE4E4E4E1E1E1DF
            DFDFDEDEDEE3E3E3E2E2E2E2E2E0ECECE0EBEBE2E3E3E1FAFAFAFFFFFF7F7F7F
            FFFFFFFFFFFFFFFFFFFFFFFF0000EAEAEA7F7F7FFDFDFDF3F3F3E6E6E6E9E9E9
            E8E8E8EBEBEBE7E7E7ECECECEAEAEAE8E8E8EAEAEAE9E9E9E7E7E7F7F7F7FFFF
            FF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000EAEAEA7F7F7FFBFBFBF4F4F4F0F0
            F0F2F2F2F0F0F0F1F1F1F1F1F1F1F1F1F2F2F2F0F0F0F0F0F0F0F0F0F0F0F0F6
            F6F6FFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000EAEAEA7F7F7FF9F9F9EF
            EFEFDBDBDBDDDDDDDEDEDEDADADADCDCDCDADADADCDCDCDDDDDDE0E0E0DFDFDF
            DBDBDBF4F4F4FFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000EAEAEA7F7F7F
            F7F7F7EEEEEEE3E3E3E5E5E5E2E2E2E2E2E2E4E4E4E5E5E5E4E4E4E3E3E3E3E3
            E3E3E3E3E1E1E1EFEFEFFDFDFD7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF0000EAEA
            EA7F7F7FF6F6F6EDEDEDEBEBEBECECECEBEBEBEAEAEAEBEBEBEBEBEBEAEAEAEA
            EAEAE9E9E9E5E5E5DCDCDCE3E3E3F6F6F67F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
            0000EAEAEA7F7F7FF5F5F5E9E9E9DADADAD8D8D8D3D3D3D5D5D5D6D6D6D5D5D5
            D4D4D4D7D7D7F0F0F07F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFF
            FFFFFFFF0000EAEAEA7F7F7FF2F2F2E7E7E7DFDFDFE2E2E2DEDEDEDEDEDEDEDE
            DEDFDFDFDFDFDFE0E0E0EFEFEF7F7F7FF7F7F7FFFFFFE9E9E97F7F7FFFFFFFFF
            FFFFFFFFFFFFFFFF0000EAEAEA7F7F7FF1F1F1E8E8E8E3E3E3E4E4E4E3E3E3E1
            E1E1E1E1E1E4E4E4E3E3E3E1E1E1ECECEC7F7F7FF8F8F8E6E6E67F7F7FF9F9F9
            FFFFFFFFFFFFFFFFFFFFFFFF0000EAEAEA7F7F7FF9F9F9F0F0F0F1F1F1F4F4F4
            F1F1F1EFEFEFF2F2F2F1F1F1F1F1F1F2F2F2F1F1F17F7F7FD8D8D87F7F7FFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000EDEDED7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FDFDFDF1F1F1F0F0F0F0
            F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F1F1F1
            FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object edtDirBkp: TEdit
          Left = 6
          Top = 36
          Width = 272
          Height = 21
          TabOrder = 0
        end
        object GroupBox6: TGroupBox
          Left = 313
          Top = 10
          Width = 283
          Height = 88
          Caption = ' Configura'#231#227'o para executar o BackUp '
          TabOrder = 2
          object Label19: TLabel
            Left = 96
            Top = 27
            Width = 15
            Height = 13
            Caption = 'Dia'
          end
          object Label20: TLabel
            Left = 170
            Top = 27
            Width = 28
            Height = 13
            Caption = 'Horas'
          end
          object Label5: TLabel
            Left = 214
            Top = 27
            Width = 37
            Height = 13
            Caption = 'Minutos'
          end
          object rdbDiario: TRadioButton
            Left = 15
            Top = 20
            Width = 73
            Height = 17
            Cursor = crHandPoint
            Caption = 'Di'#225'rio'
            TabOrder = 0
            OnClick = rdbDiarioClick
          end
          object rdbSemanal: TRadioButton
            Left = 15
            Top = 39
            Width = 73
            Height = 17
            Cursor = crHandPoint
            Caption = 'Semanal'
            TabOrder = 1
            OnClick = rdbSemanalClick
          end
          object rdbMensal: TRadioButton
            Left = 15
            Top = 59
            Width = 73
            Height = 17
            Cursor = crHandPoint
            Caption = 'Mensal'
            TabOrder = 2
            OnClick = rdbMensalClick
          end
          object cmbDia: TComboBox
            Left = 96
            Top = 43
            Width = 69
            Height = 21
            Cursor = crHandPoint
            AutoDropDown = True
            Style = csDropDownList
            Enabled = False
            TabOrder = 3
            Items.Strings = (
              'Domingo'
              'Segunda'
              'Ter'#231'a'
              'Quarta '
              'Quinta'
              'Sexta'
              'Sabado')
          end
          object upHora: TUpDown
            Left = 197
            Top = 43
            Width = 16
            Height = 21
            Associate = edtHora
            Max = 23
            TabOrder = 4
          end
          object edtHora: TEdit
            Left = 170
            Top = 43
            Width = 27
            Height = 21
            Cursor = crHandPoint
            Enabled = False
            TabOrder = 5
            Text = '0'
            OnChange = edtHoraChange
          end
          object edtMin: TEdit
            Left = 214
            Top = 43
            Width = 27
            Height = 21
            Cursor = crHandPoint
            Enabled = False
            TabOrder = 6
            Text = '0'
            OnChange = edtMinChange
          end
          object upMin: TUpDown
            Left = 241
            Top = 43
            Width = 16
            Height = 21
            Associate = edtMin
            Max = 59
            TabOrder = 7
          end
        end
      end
      object GroupBox7: TGroupBox
        Left = 265
        Top = 124
        Width = 368
        Height = 132
        Caption = ' Exporta'#231#227'o Automatica dos Arquivos XML '
        Enabled = False
        TabOrder = 1
        Visible = False
        object chkBxAutorizadas: TDBCheckBox
          Left = 11
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Autorizadas'
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox10: TDBCheckBox
          Left = 11
          Top = 42
          Width = 97
          Height = 14
          Caption = 'Cancelada'
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox11: TDBCheckBox
          Left = 11
          Top = 62
          Width = 126
          Height = 14
          Caption = 'Protocolo Autoriza'#231#227'o'
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox12: TDBCheckBox
          Left = 11
          Top = 82
          Width = 156
          Height = 14
          Caption = 'Protocolo de Cancelamento'
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 11
          Top = 103
          Width = 156
          Height = 14
          Caption = 'Protocolo de Inutilizadas'
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object GroupBox2: TGroupBox
          Left = 167
          Top = 16
          Width = 191
          Height = 101
          Caption = 'Config. para Exporta'#231#227'o Automatica '
          Enabled = False
          TabOrder = 5
          object Label29: TLabel
            Left = 15
            Top = 51
            Width = 15
            Height = 13
            Caption = 'Dia'
          end
          object Label30: TLabel
            Left = 87
            Top = 51
            Width = 28
            Height = 13
            Caption = 'Horas'
          end
          object Label31: TLabel
            Left = 131
            Top = 51
            Width = 37
            Height = 13
            Caption = 'Minutos'
          end
          object RadioButton1: TRadioButton
            Left = 15
            Top = 24
            Width = 73
            Height = 17
            Cursor = crHandPoint
            Caption = 'Di'#225'rio'
            TabOrder = 0
            OnClick = rdbDiarioClick
          end
          object RadioButton2: TRadioButton
            Left = 66
            Top = 24
            Width = 61
            Height = 17
            Cursor = crHandPoint
            Caption = 'Semanal'
            TabOrder = 1
            OnClick = rdbSemanalClick
          end
          object RadioButton3: TRadioButton
            Left = 127
            Top = 24
            Width = 55
            Height = 17
            Cursor = crHandPoint
            Caption = 'Mensal'
            TabOrder = 2
            OnClick = rdbMensalClick
          end
          object ComboBox1: TComboBox
            Left = 15
            Top = 67
            Width = 64
            Height = 21
            Cursor = crHandPoint
            AutoDropDown = True
            Style = csDropDownList
            Enabled = False
            TabOrder = 3
            Items.Strings = (
              'Domingo'
              'Segunda'
              'Ter'#231'a'
              'Quarta '
              'Quinta'
              'Sexta'
              'Sabado')
          end
          object UpDown1: TUpDown
            Left = 114
            Top = 67
            Width = 16
            Height = 21
            Associate = Edit1
            Max = 23
            TabOrder = 4
          end
          object Edit1: TEdit
            Left = 87
            Top = 67
            Width = 27
            Height = 21
            Cursor = crHandPoint
            Enabled = False
            TabOrder = 5
            Text = '0'
            OnChange = edtHoraChange
          end
          object Edit2: TEdit
            Left = 131
            Top = 67
            Width = 27
            Height = 21
            Cursor = crHandPoint
            Enabled = False
            TabOrder = 6
            Text = '0'
            OnChange = edtMinChange
          end
          object UpDown2: TUpDown
            Left = 158
            Top = 67
            Width = 16
            Height = 21
            Associate = Edit2
            Max = 59
            TabOrder = 7
          end
        end
      end
      object GroupBox3: TGroupBox
        Left = 9
        Top = 124
        Width = 241
        Height = 132
        Caption = ' Exportar por Periodo '
        TabOrder = 2
        object btnExporta: TSpeedButton
          Left = 135
          Top = 94
          Width = 84
          Height = 30
          Caption = '&Exportar'
          Enabled = False
          Glyph.Data = {
            0E060000424D0E06000000000000360000002800000016000000160000000100
            180000000000D805000001000000010000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF2828287575757575752828
            28FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
            FFFFFFFFFFFFFFFFFFFF000000000000636161000000000000535353F0F0F0F0
            F0F0535353000000000000656464000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            0000FFFFFFFFFFFFFFFFFFFFFFFF282727ACA6A6E2DCDC787676000000515151
            F0F0F0F0F0F05151510000007A7A7AE7E3E3AFABAB282727FFFFFFFFFFFFFFFF
            FFFFFFFF0000FFFFFFFFFFFF000000FFFFFF000000AAA4A4DED7D7D1CECEC5C2
            C2EDEBEBEFEFEFF0F0F0EEEEEEC7C6C6D5D1D1E2DDDDADA9A9000000FFFFFF00
            0000FFFFFFFFFFFF0000FFFFFF000000090808000000000000696565DCD4D4E1
            DBDBE2DCDCE5E0E0E7E3E3E7E4E4E6E3E3E4E0E0E4DFDFE0DADA6B6767000000
            000000090808000000FFFFFF0000FFFFFF000000918383807575504A4AC3B8B8
            D5CBCBD8CFCFE4DCDCEDEBE9EFEEECF2EFEEF1ECECE5E0E0DBD3D3D9D0D0C7BE
            BE524C4C837878958787000000FFFFFF0000000000827777BCA7A7C1ADADC9B8
            B8CCBDBDD0C2C2E9E4E3E5EAE2D9E0D5D5DAD2DCDBD9E6E2E1F3EEEEEDE7E7D3
            C6C6D0C2C2CDBEBEC5B3B3C1ADAD8277770000000000FFFFFF000000A69B9BB3
            A1A1C5B2B2C5B3B3E8E0E0D1DECEB7CFB68CC18F22BC3437BD4ABBC4BDD3D3D1
            EEE8E7EAE2E2C8B8B8C8B7B7B7A5A5A69B9B000000FFFFFF0000000000000000
            0000009E8C8CBBA6A6CEBEBEC5D3C097C0970CB30E09B8110FBB1D26C8452EC7
            515FAE73C7C6C4E4DFDDCEC1BFBEAAA99E8C8C0000000000000000000000110F
            0F221E1E3A3333BBA6A6BBA5A5D5C9C982B2833BB03B00B40003B50623C23B1F
            C439FFFFFFFFFFFFA8A9A8C2BEBBCEC9C4BAA5A4BBA6A63A3333221E1E110F0F
            00006E6161BBA5A5BBA5A5BEA9A9C2AFAFC4C0BD5BA45E02B40200B4000FB817
            19AF29FFFFFFFFFFFFFFFFFFAAAAAAAEA8A8C5C0BDC1AFAEBEA9A9BBA5A5BBA5
            A56E616100008A7F7FDBCFCFDFD5D5E3DADAE3DADA9EAF993DA64101B40100B4
            0011AF1B14AA27FFFFFFFFFFFFFFFFFF3B6943797775989592C0BCB9CCC5C4DB
            D2D1DBCFCF8D828200007F7878A39C9C968E8EE1D9D9E6DFDFA4B4A027A22B11
            B01108B50711B21916AC27FFFFFFFFFFFF00AA5538C35931C5523BC8573AC656
            32C44C26BE4037B7557F78780000FFFFFF000000000000CCC2C2EAE3E3D6D1D0
            20A1261DB51B19BA1909B60B169926FFFFFFFFFFFF38383847544628B7422AC3
            4740C9584BCD604BCD5F3AC958FFFFFF0000FFFFFF000000796F6FDDD5D5EEE8
            E8EEE8E8309B3627BE282ABF2D24BE260DAA1215802325572D3A433833633923
            AA3619BD2F4ACD5F59D46E5BD57042CC5EFFFFFF00000000008E8484EFEAEAF2
            EDEDF0EBEBF2EDEDB8D6B738BB403CC74341C84933C4380BB70F12B51A1FBA2A
            14B91A1EBE284ED16165DB7D69DD816CE08552C66C0000000000FFFFFF000000
            CFC6C6C7BFBFAAA2A2E7E1E1F5F2F266BD6E51D05D54D36358D4685BD66B4AD0
            5844CE5164D9746CDF8372E48D78E69577E59181ECA24BD26EFFFFFF0000FFFF
            FFFFFFFF383535000000000000887F7FF7F4F4F4F5F368CD765ED7706FE18772
            E48C76E6937BE99A7FECA184EFA988EFA862D97E31C85D62DD8158DA7BFFFFFF
            0000FFFFFFFFFFFFFFFFFFFFFFFF000000B1A8A8FDFCFCEDE9E9E1DBDBBEE6C3
            5ED8736ADF8284ECA190F1B087EBA476E49161C578208B40FFFFFF35CF658EE4
            A6FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF151212D3CBCBFCFAFAA8A0A00000
            00827979FBF9F9F2F7F169AA756FD08694AF96FAF9F8D3CBCB151212FFFFFFFF
            FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B6ADAD00
            00000000004B4242F8F6F6F8F6F64B4242000000000000B6ADAD000000FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            000000FFFFFFFFFFFF696262C3BBBBC4BDBD696262FFFFFFFFFFFF000000FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
          OnClick = btnExportaClick
        end
        object Label32: TLabel
          Left = 135
          Top = 15
          Width = 13
          Height = 13
          Caption = 'De'
        end
        object Label33: TLabel
          Left = 135
          Top = 50
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object dtaIni: TDateTimePicker
          Left = 135
          Top = 30
          Width = 97
          Height = 21
          Date = 41444.647398460650000000
          Time = 41444.647398460650000000
          TabOrder = 0
        end
        object dtaFim: TDateTimePicker
          Left = 135
          Top = 64
          Width = 97
          Height = 21
          Date = 41444.647398460650000000
          Time = 41444.647398460650000000
          TabOrder = 1
        end
        object GroupBox9: TGroupBox
          Left = 2
          Top = 15
          Width = 122
          Height = 115
          Align = alLeft
          Caption = 'Arquivos'
          TabOrder = 2
          object chkAutorizadas: TCheckBox
            Left = 3
            Top = 16
            Width = 116
            Height = 17
            Caption = 'Autorizadas'
            TabOrder = 0
            OnClick = chkAutorizadasClick
          end
          object chkCancelada: TCheckBox
            Left = 3
            Top = 35
            Width = 116
            Height = 17
            Caption = 'Cancelada'
            TabOrder = 1
            OnClick = chkAutorizadasClick
          end
          object chkProtAut: TCheckBox
            Left = 3
            Top = 54
            Width = 116
            Height = 17
            Caption = 'Prot. Autoriza'#231#227'o'
            TabOrder = 2
            OnClick = chkAutorizadasClick
          end
          object chkProtCancel: TCheckBox
            Left = 3
            Top = 73
            Width = 116
            Height = 17
            Caption = 'Prot. Cancelamento'
            TabOrder = 3
            OnClick = chkAutorizadasClick
          end
          object chkProtInutilizada: TCheckBox
            Left = 3
            Top = 92
            Width = 116
            Height = 17
            Caption = 'Prot. de Inutilizadas'
            TabOrder = 4
            OnClick = chkAutorizadasClick
          end
        end
      end
    end
    object tbsProtecao: TTabSheet
      Caption = 'Prote'#231#227'o'
      Enabled = False
      ImageIndex = 5
      OnShow = pgcConfigChange
      object GroupBox8: TGroupBox
        Left = 240
        Top = 71
        Width = 259
        Height = 153
        Caption = ' Login '
        Enabled = False
        TabOrder = 1
        object Label21: TLabel
          Left = 24
          Top = 29
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
          FocusControl = dbedtUsuario
        end
        object Label22: TLabel
          Left = 24
          Top = 80
          Width = 30
          Height = 13
          Caption = 'Senha'
          FocusControl = dbedtSenha
        end
        object dbedtUsuario: TDBEdit
          Left = 24
          Top = 45
          Width = 208
          Height = 21
          DataField = 'USUARIO'
          DataSource = dmGeral.dsLogin
          TabOrder = 0
          OnChange = pgcConfigChange
        end
        object dbedtSenha: TDBEdit
          Left = 24
          Top = 96
          Width = 104
          Height = 21
          DataField = 'SENHA'
          DataSource = dmGeral.dsLogin
          MaxLength = 30
          PasswordChar = '*'
          TabOrder = 1
          OnChange = pgcConfigChange
        end
      end
      object DBCheckBox5: TDBCheckBox
        Left = 240
        Top = 48
        Width = 97
        Height = 17
        Cursor = crHandPoint
        Caption = 'Ativar Prote'#231#227'o'
        DataField = 'FLG_ATIVA'
        DataSource = dmGeral.dsLogin
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object tbsContingencia: TTabSheet
      Caption = 'Conting'#234'ncia'
      ImageIndex = 6
      OnShow = pgcConfigChange
      object Label24: TLabel
        Left = 16
        Top = 89
        Width = 203
        Height = 13
        Caption = 'Texto Padr'#227'o de Entrada em Conting'#234'ncia'
        FocusControl = dbedtMotCont
      end
      object dbrbTpContig: TDBRadioGroup
        Left = 328
        Top = 24
        Width = 233
        Height = 49
        Cursor = crHandPoint
        Caption = 'Tipo de Conting'#234'ncia a ser utilizada *'
        Columns = 2
        DataField = 'FLG_TP_CONTI'
        DataSource = dm_nfe.dsConf_Cont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          'SCAN'
          'DPEC')
        ParentBackground = True
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          'S'
          'D')
        Visible = False
        OnChange = pgcConfigChange
      end
      object dbedtMotCont: TDBEdit
        Left = 16
        Top = 108
        Width = 722
        Height = 21
        DataField = 'MOTIVO'
        DataSource = dm_nfe.dsConf_Cont
        TabOrder = 1
        OnChange = pgcConfigChange
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 24
        Width = 235
        Height = 59
        Caption = 'Tipo de Conting'#234'ncia a ser utilizada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object Label28: TLabel
          Left = 16
          Top = 26
          Width = 28
          Height = 13
          Caption = 'DPEC'
        end
      end
    end
    object tbsEmitente: TTabSheet
      Caption = 'Dados do Emitente'
      ImageIndex = 7
      object Label25: TLabel
        Left = 232
        Top = 50
        Width = 24
        Height = 13
        Caption = 'UF *'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 16
        Top = 50
        Width = 49
        Height = 13
        Caption = 'C.N.P.J * '
        FocusControl = dbedtCNPJ
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 16
        Top = 7
        Width = 27
        Height = 13
        Caption = 'Nome'
        FocusControl = dbEdtNome
      end
      object cmbUf: TComboBox
        Left = 232
        Top = 66
        Width = 49
        Height = 21
        Cursor = crHandPoint
        Style = csDropDownList
        TabOrder = 2
        OnSelect = cmbUfSelect
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
      object dbedtCNPJ: TDBEdit
        Left = 16
        Top = 66
        Width = 192
        Height = 21
        DataField = 'CNPJ'
        DataSource = dm_Emitente.dsEmitente
        TabOrder = 1
      end
      object dbEdtNome: TDBEdit
        Left = 16
        Top = 23
        Width = 604
        Height = 21
        DataField = 'FANTASIA'
        DataSource = dm_Emitente.dsEmitente
        TabOrder = 0
      end
    end
  end
  object pnlBtn: TPanel
    Left = 0
    Top = 319
    Width = 769
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label23: TLabel
      Left = 3
      Top = 25
      Width = 177
      Height = 13
      Caption = 'Campos com * s'#227'o obrigat'#243'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnApplicar: TBitBtn
      Left = 675
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Aplicar '
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E794AC9DF2
        F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEFEFEF539E7554E496659F7FF7F7F7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F155997056E5959EFECB81
        E9B1699B7BF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F3F3F359956F2DD7734AE9886EEFA79FFDCE67DE9B6D987BFBFBFBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F55B916D15C85A0CD95425DD684EE78B64
        ED9E6FF2A740CE7871967CFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFF5F5F55F8D6D
        07B94802CB4300CD3E05D64D23DD6632E1742EE07127E26D1ABE5575957EFDFD
        FDFFFFFFFFFFFFFFFFFF76977E00A93400BC3307C23D1CCE5428D86228E26839
        DF732FDC6B18D7580BD55008AD3F7A9680FDFDFDFFFFFFFFFFFF3C995109B731
        38C3595DD37D6ADD8B39D16855B87141DA726CE49263DE8A58DA7F29CF5C00A0
        2C718E75FDFDFDFFFFFF9AB59D38BF518CDC9E89DE9E47D46D90B89AFFFFFF87
        B89556E07F88E4A382DF9D80DC9734C85C008F1A768D77FDFDFDFFFFFF91B195
        66CE7A5ED27889B392FFFFFFFFFFFFFFFFFF83B48F6BDF8AA6E7B69EE1AE9DDF
        AA3FBE5A007C08879887FFFFFFFFFFFF89B49185B58FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF80B08982DF98C4EDCDBCE6C4B8E4BE4ABB5A3B823DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EAB859BE3A7E3F5
        E6E6F6E98FD6957BA47DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7BA780BBE9C0B5E4B86F9F70F9F9F9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE6BA3
        70619E63FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 0
      OnClick = btnApplicarClick
    end
  end
  object opnLogo: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.emf;*.w' +
      'mf)|*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wm' +
      'f|GIF Image (*.gif)|*.gif|Portable Network Graphics (*.png)|*.pn' +
      'g|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|' +
      'Bitmaps (*.bmp)|*.bmp|TIFF Images (*.tif)|*.tif|TIFF Images (*.t' +
      'iff)|*.tiff|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.emf' +
      '|Metafiles (*.wmf)|*.wmf'
    Left = 238
    Top = 307
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 278
    Top = 307
  end
  object tmBkp: TTimer
    Interval = 60000
    OnTimer = tmBkpTimer
    Left = 336
    Top = 310
  end
end
