object dm_Emitente: Tdm_Emitente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 455
  Width = 961
  object dsEmitente: TDataSource
    DataSet = cdsEmitente
    Left = 56
    Top = 200
  end
  object cdsEmitente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmitente'
    AfterInsert = cdsEmitenteAfterInsert
    Left = 56
    Top = 144
    object cdsEmitenteID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Required = True
    end
    object cdsEmitenteNOME_RZ: TStringField
      FieldName = 'NOME_RZ'
      Size = 60
    end
    object cdsEmitenteFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 60
    end
    object cdsEmitenteCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
      EditMask = '!000\.000\.00\/0000\-00;0;_'
      Size = 14
    end
    object cdsEmitenteIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object cdsEmitenteCNAE: TStringField
      FieldName = 'CNAE'
      Size = 7
    end
    object cdsEmitenteIM: TStringField
      FieldName = 'IM'
      Size = 15
    end
    object cdsEmitenteIE_ST: TStringField
      FieldName = 'IE_ST'
      Size = 14
    end
    object cdsEmitenteCRT: TSmallintField
      FieldName = 'CRT'
    end
    object cdsEmitenteFLG_AUTORIZADO: TStringField
      FieldName = 'FLG_AUTORIZADO'
      FixedChar = True
      Size = 1
    end
    object cdsEmitenteCOD_UF: TSmallintField
      FieldName = 'COD_UF'
    end
  end
  object dspEmitente: TDataSetProvider
    DataSet = qryEmitente
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 56
    Top = 80
  end
  object qryEmitente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  ID_EMITENTE,'
      '  NOME_RZ,'
      '  FANTASIA,'
      '  CNPJ,'
      '  IE,'
      '  CNAE,'
      '  IM,'
      '  IE_ST,'
      '  CRT,'
      '  FLG_AUTORIZADO,'
      '  COD_UF'
      'FROM '
      '  TB_NFE_EMITENTE')
    SQLConnection = dm_Princial.SQLConnect
    Left = 56
    Top = 24
  end
  object qryEndereco: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      ' SELECT '
      '  ID_ENDERECO,'
      '  ID_EMITENTE,'
      '  LOGRADOURO,'
      '  NUMERO,'
      '  COMPLEMENTO,'
      '  BAIRRO,'
      '  CEP,'
      '  PAIS,'
      '  COD_PAIS,'
      '  UF,'
      '  COD_UF,'
      '  MUNICIPIO,'
      '  COD_MUNICIPIO,'
      '  TELEFONE'
      'FROM '
      '  TB_NFE_ENDERECO ')
    SQLConnection = dm_Princial.SQLConnect
    Left = 176
    Top = 24
  end
  object dspEndereco: TDataSetProvider
    DataSet = qryEndereco
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 80
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEndereco'
    Left = 176
    Top = 136
    object cdsEnderecoID_ENDERECO: TIntegerField
      FieldName = 'ID_ENDERECO'
      Required = True
    end
    object cdsEnderecoID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Required = True
    end
    object cdsEnderecoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Required = True
      Size = 60
    end
    object cdsEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 9
    end
    object cdsEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 60
    end
    object cdsEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsEnderecoCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsEnderecoPAIS: TStringField
      FieldName = 'PAIS'
      Size = 60
    end
    object cdsEnderecoCOD_PAIS: TStringField
      FieldName = 'COD_PAIS'
      Required = True
      Size = 5
    end
    object cdsEnderecoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsEnderecoCOD_UF: TStringField
      FieldName = 'COD_UF'
      Size = 2
    end
    object cdsEnderecoMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Size = 100
    end
    object cdsEnderecoCOD_MUNICIPIO: TIntegerField
      FieldName = 'COD_MUNICIPIO'
      Required = True
    end
    object cdsEnderecoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
  end
  object dsEndereco: TDataSource
    DataSet = cdsEndereco
    Left = 176
    Top = 200
  end
end
