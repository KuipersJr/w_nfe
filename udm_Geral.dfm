object dmGeral: TdmGeral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 294
  Width = 672
  object qryLogin: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  ID_USUARIO,'
      '  USUARIO,'
      '  SENHA,'
      '  FLG_ATIVA'
      'FROM '
      '  TB_USUARIO ')
    SQLConnection = dm_Princial.SQLConnect
    Left = 124
    Top = 16
  end
  object dspLogin: TDataSetProvider
    DataSet = qryLogin
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 124
    Top = 72
  end
  object cdsLogin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLogin'
    AfterInsert = cdsLoginAfterInsert
    Left = 124
    Top = 128
    object cdsLoginID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object cdsLoginUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object cdsLoginSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object cdsLoginFLG_ATIVA: TStringField
      FieldName = 'FLG_ATIVA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLogin: TDataSource
    DataSet = cdsLogin
    Left = 124
    Top = 176
  end
  object qryConfEmail: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  ID_NFE_CONF_EMAIL,'
      '  SERVER_SMTP,'
      '  PORTA_SMTP,'
      '  EMAIL_REMETENTE,'
      '  ASSUNTO,'
      '  MENSAGEM,'
      '  USUARIO,'
      '  SENHA,'
      '  FLG_SSI,'
      '  FLG_DANFE,'
      '  FLG_EMAIL_AUTO,'
      '  FLG_SSL'
      'FROM '
      '  TB_NFE_CONF_EMAIL ')
    SQLConnection = dm_Princial.SQLConnect
    Left = 256
    Top = 24
  end
  object cdsConfEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfEmail'
    AfterInsert = cdsConfEmailAfterInsert
    Left = 256
    Top = 120
    object cdsConfEmailID_NFE_CONF_EMAIL: TIntegerField
      FieldName = 'ID_NFE_CONF_EMAIL'
      Required = True
    end
    object cdsConfEmailSERVER_SMTP: TStringField
      FieldName = 'SERVER_SMTP'
      Size = 50
    end
    object cdsConfEmailPORTA_SMTP: TSmallintField
      FieldName = 'PORTA_SMTP'
    end
    object cdsConfEmailEMAIL_REMETENTE: TStringField
      FieldName = 'EMAIL_REMETENTE'
      Size = 100
    end
    object cdsConfEmailASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 30
    end
    object cdsConfEmailMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 255
    end
    object cdsConfEmailUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 50
    end
    object cdsConfEmailSENHA: TStringField
      FieldName = 'SENHA'
      Size = 30
    end
    object cdsConfEmailFLG_SSI: TStringField
      FieldName = 'FLG_SSI'
      FixedChar = True
      Size = 1
    end
    object cdsConfEmailFLG_DANFE: TStringField
      FieldName = 'FLG_DANFE'
      FixedChar = True
      Size = 1
    end
    object cdsConfEmailFLG_EMAIL_AUTO: TStringField
      FieldName = 'FLG_EMAIL_AUTO'
      FixedChar = True
      Size = 1
    end
    object cdsConfEmailFLG_SSL: TStringField
      FieldName = 'FLG_SSL'
      FixedChar = True
      Size = 1
    end
  end
  object dspConfEmail: TDataSetProvider
    DataSet = qryConfEmail
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 256
    Top = 72
  end
  object dsConfEmail: TDataSource
    DataSet = cdsConfEmail
    Left = 248
    Top = 176
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 392
    Top = 184
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    ReadOnly = True
    AfterScroll = cdsConsultaAfterScroll
    Left = 392
    Top = 136
    object cdsConsultaSERIE: TStringField
      FieldName = 'SERIE'
      FixedChar = True
      Size = 3
    end
    object cdsConsultaNU_NFE: TFMTBCDField
      FieldName = 'NU_NFE'
      Precision = 18
      Size = 0
    end
    object cdsConsultaNRECIBO: TStringField
      FieldName = 'NRECIBO'
    end
    object cdsConsultaCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Size = 44
    end
    object cdsConsultaPROTOCOLO_ENVIO: TStringField
      FieldName = 'PROTOCOLO_ENVIO'
    end
    object cdsConsultaPROTOCOLO_CANCEL: TStringField
      FieldName = 'PROTOCOLO_CANCEL'
    end
    object cdsConsultaDTA_EMISSAO: TDateField
      FieldName = 'DTA_EMISSAO'
    end
    object cdsConsultaDTA_AUTORIZACAO: TDateField
      FieldName = 'DTA_AUTORIZACAO'
    end
    object cdsConsultaDTA_CANCELAMENTO: TDateField
      FieldName = 'DTA_CANCELAMENTO'
    end
    object cdsConsultaCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
    object cdsConsultaNOME_DEST: TStringField
      FieldName = 'NOME_DEST'
      Size = 30
    end
    object cdsConsultaTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 6
    end
    object cdsConsultaCOD_SITUACAO: TIntegerField
      FieldName = 'COD_SITUACAO'
    end
    object cdsConsultaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
      Size = 11
    end
    object cdsConsultaDANFE_IMPRESSO: TStringField
      FieldName = 'DANFE_IMPRESSO'
      Required = True
      FixedChar = True
      Size = 3
    end
  end
  object dspConsulta: TDataSetProvider
    DataSet = qryConsulta
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 392
    Top = 84
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '       SERIE,'
      '       CAST(NU_NFE AS NUMERIC(09)) NU_NFE,'
      '       NRECIBO,'
      '       CHAVE_NFE,'
      '       PROTOCOLO_ENVIO,'
      '       PROTOCOLO_CANCEL,'
      '       DTA_EMISSAO,'
      '       DTA_AUTORIZACAO,'
      '       DTA_CANCELAMENTO,'
      '       CPF_CNPJ,'
      '       NOME_DEST,'
      '       CASE FLG_TP_TRANS'
      '       WHEN '#39'N'#39' THEN '#39'Normal'#39
      '       WHEN '#39'S'#39' THEN '#39'Scan'#39
      '       WHEN '#39'D'#39' THEN '#39'Dpec'#39
      '       END AS TIPO,'
      '       CASE WHEN COD_SITUACAO > 200 THEN 200 ELSE COD_SITUACAO'
      '       END AS COD_SITUACAO,'
      '       CASE WHEN COD_SITUACAO = 100 THEN '#39'Autorizada'#39
      '       WHEN COD_SITUACAO IN (110,301,302) THEN '#39'Denegada'#39
      '       WHEN COD_SITUACAO IN (101,135) THEN '#39'Cancelada'#39
      '       WHEN COD_SITUACAO IN (103,104,105) THEN '#39'Em Processo'#39
      '       WHEN COD_SITUACAO > 200 THEN '#39'Rejeitada'#39
      '       END AS SITUACAO,'
      '       DECODE(FLG_IMPR,'#39'S'#39','#39'Sim'#39','#39'N'#227'o'#39') DANFE_IMPRESSO'
      ' FROM TB_NFE_TRANS'
      ' UNION'
      ' SELECT NULL SERIE,'
      '        NU_NFE,'
      '        NULL NRECIBO,'
      '        CHAVE_NFE,'
      '        NULL PROTOCOLO_ENVIO,'
      '        NULL PROTOCOLO_CANCEL,'
      '        DTA_EMISSAO,'
      '        NULL DTA_AUTORIZACAO,'
      '        NULL DTA_CANCELAMENTO,'
      '        CPF_CNPJ,'
      '        NOME_DEST,'
      '        NULL TIPO,'
      '        COD_SITUACAO,'
      '        '#39'Rejeitada'#39' SITUACAO,'
      '        '#39'N'#227'o'#39' DANFE_IMPRESSO'
      ' FROM TB_NFE_REJEITADA'
      ' WHERE ID_NF_REG NOT IN (SELECT ID_NFE_TRANS FROM TB_NFE_TRANS)')
    SQLConnection = dm_Princial.SQLConnect
    Left = 392
    Top = 32
  end
  object dsInutilizaNFe: TDataSource
    DataSet = cdsInutilizaNFe
    Left = 498
    Top = 192
  end
  object cdsInutilizaNFe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInutilizaNFe'
    AfterInsert = cdsInutilizaNFeAfterInsert
    Left = 498
    Top = 136
    object cdsInutilizaNFeID_INUT: TIntegerField
      FieldName = 'ID_INUT'
      Required = True
    end
    object cdsInutilizaNFeNU_NF: TFMTBCDField
      FieldName = 'NU_NF'
      Required = True
      Precision = 18
      Size = 0
    end
    object cdsInutilizaNFeANO: TIntegerField
      FieldName = 'ANO'
      DisplayFormat = 'YYYY'
    end
    object cdsInutilizaNFeMODELO: TStringField
      FieldName = 'MODELO'
      Size = 5
    end
    object cdsInutilizaNFeSERIE: TSmallintField
      FieldName = 'SERIE'
    end
    object cdsInutilizaNFeJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Size = 255
    end
    object cdsInutilizaNFeXML_RET: TMemoField
      FieldName = 'XML_RET'
      BlobType = ftMemo
      Size = 1
    end
    object cdsInutilizaNFeCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsInutilizaNFePROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Size = 15
    end
  end
  object dspInutilizaNFe: TDataSetProvider
    DataSet = qryInutilizaNFe
    Options = [poFetchBlobsOnDemand, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 498
    Top = 84
  end
  object qryInutilizaNFe: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT ID_INUT'
      '      ,NU_NF'
      '      ,ANO'
      '      ,MODELO'
      '      ,SERIE'
      '      ,JUSTIFICATIVA'
      '      ,XML_RET'
      '      ,CNPJ'
      '      ,PROTOCOLO'
      'FROM TB_NFE_INUT')
    SQLConnection = dm_Princial.SQLConnect
    Left = 498
    Top = 32
  end
end
