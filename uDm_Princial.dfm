object dm_Princial: Tdm_Princial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 349
  Width = 716
  object SQLConnect: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=WHCI_NFE.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 32
    Top = 24
  end
  object qryGeral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnect
    Left = 136
    Top = 32
  end
  object qryAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnect
    Left = 240
    Top = 32
  end
  object dspGeral: TDataSetProvider
    DataSet = qryGeral
    Constraints = False
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 85
  end
  object dspAux: TDataSetProvider
    DataSet = qryAux
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 88
  end
  object cdsGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGeral'
    Left = 136
    Top = 136
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 240
    Top = 144
  end
  object dsGeral: TDataSource
    DataSet = cdsGeral
    Left = 136
    Top = 192
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 240
    Top = 192
  end
end
