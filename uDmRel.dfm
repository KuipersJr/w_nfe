object dmRel: TdmRel
  OldCreateOrder = False
  Height = 451
  Width = 873
  object qryPesqLog: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DTAINI'
        ParamType = ptInput
        Value = 41365d
      end
      item
        DataType = ftDate
        Name = 'DTAFIM'
        ParamType = ptInput
        Value = 41389d
      end
      item
        DataType = ftFloat
        Name = 'NU_NF'
        ParamType = ptInput
        Value = 6205.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'NU_NF'
        ParamType = ptInput
        Value = 6205.000000000000000000
      end>
    SQL.Strings = (
      'SELECT CAST(DATA_HORA AS DATE) DATA'
      '         ,CAST(DATA_HORA AS TIME) HORA'
      '         ,NU_NF'
      '         ,DESC_EVENTO'
      'FROM TB_NFE_LOG'
      'WHERE CAST(DATA_HORA AS DATE) BETWEEN :DTAINI AND :DTAFIM'
      '  AND (NU_NF = :NU_NF OR :NU_NF = -1)'
      'ORDER BY DATA_HORA DESC')
    SQLConnection = dm_Princial.SQLConnect
    Left = 48
    Top = 16
  end
  object dspPesqLog: TDataSetProvider
    DataSet = qryPesqLog
    Constraints = False
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 48
    Top = 69
  end
  object cdsPesqLog: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftDate
        Name = 'DTAINI'
        ParamType = ptInput
        Value = 41365d
      end
      item
        DataType = ftDate
        Name = 'DTAFIM'
        ParamType = ptInput
        Value = 41389d
      end
      item
        DataType = ftFloat
        Name = 'NU_NF'
        ParamType = ptInput
        Value = 6205.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'NU_NF'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesqLog'
    Left = 48
    Top = 120
    object cdsPesqLogDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPesqLogHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsPesqLogDESC_EVENTO: TStringField
      FieldName = 'DESC_EVENTO'
      Size = 500
    end
    object cdsPesqLogNU_NF: TFMTBCDField
      FieldName = 'NU_NF'
      Precision = 18
      Size = 0
    end
  end
  object PesqLog: TDataSource
    DataSet = cdsPesqLog
    Left = 48
    Top = 176
  end
  object frxdbdtsLog: TfrxDBDataset
    UserName = 'dbLog'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'HORA=HORA'
      'DESC_EVENTO=DESC_EVENTO'
      'NU_NF=NU_NF')
    DataSet = cdsPesqLog
    BCDToCurrency = False
    Left = 40
    Top = 232
  end
  object frxRLog: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41389.487242268500000000
    ReportOptions.LastChange = 41389.487242268500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  Shape1.Visible := not Shape1.Visible;                         ' +
        '                           '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 40
    Top = 288
    Datasets = <
      item
        DataSet = frxdbdtsLog
        DataSetName = 'dbLog'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 217.322975000000000000
          Top = 1.779530000000001000
          Width = 283.464750000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Listagem do eventos ocorridos')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 623.622450000000000000
          Top = 3.220469999999999000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 582.047620000000000000
          Top = 25.897650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8W = (
            'Pag. [<Page>] de [<Page#>]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 30.236240000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        Condition = 'dbLog."NU_NF"'
        KeepTogether = True
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 1.000000000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            'Eventos relacionados com a Nota N'#186' ')
        end
        object dbLogNU_NF: TfrxMemoView
          Align = baLeft
          Left = 222.992270000000000000
          Top = 1.000000000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NU_NF'
          DataSet = frxdbdtsLog
          DataSetName = 'dbLog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dbLog."NU_NF"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 21.677179999999990000
          Width = 718.110236220000000000
          ShowHint = False
          Diagonal = True
        end
        object Line2: TfrxLineView
          Width = 718.110236220000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtsLog
        DataSetName = 'dbLog'
        RowCount = 0
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 120.944960000000000000
          ShowHint = False
          DataField = 'NU_NF'
          DataSet = frxdbdtsLog
          DataSetName = 'dbLog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dbLog."NU_NF"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 3.779530000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Width = 718.110236220000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object DetailData1: TfrxDetailData
        Height = 22.677180000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = frxdbdtsLog
        DataSetName = 'dbLog'
        RowCount = 0
        object Shape1: TfrxShapeView
          Top = 0.779529999999994100
          Width = 718.110236220000000000
          Height = 18.897650000000000000
          Visible = False
          ShowHint = False
          Color = clSilver
          Frame.Color = clSilver
          Frame.ShadowColor = clSilver
        end
        object dbLogDESC_EVENTO: TfrxMemoView
          Left = 158.740260000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DESC_EVENTO'
          DataSet = frxdbdtsLog
          DataSetName = 'dbLog'
          Memo.UTF8W = (
            '[dbLog."DESC_EVENTO"]')
          WordWrap = False
        end
        object dbLogDATA: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DATA'
          DataSet = frxdbdtsLog
          DataSetName = 'dbLog'
          Memo.UTF8W = (
            '[dbLog."DATA"]')
        end
        object dbLogHORA: TfrxMemoView
          Left = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'HORA'
          DataSet = frxdbdtsLog
          DataSetName = 'dbLog'
          Memo.UTF8W = (
            '[dbLog."HORA"]')
        end
      end
    end
  end
end
