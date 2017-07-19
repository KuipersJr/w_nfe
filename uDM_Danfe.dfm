object DM_Danfe: TDM_Danfe
  OldCreateOrder = False
  Height = 665
  Width = 825
  object dsNFE: TDataSource
    DataSet = cdsNFE
    Left = 25
    Top = 20
  end
  object dsCobranca: TDataSource
    DataSet = cdsCobranca
    Left = 210
    Top = 20
  end
  object cdsNFE: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodBarra'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NatOper'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Serie'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DtEmissao'
        Attributes = [faUnNamed]
        DataType = ftDate
      end
      item
        Name = 'DtSaida'
        Attributes = [faUnNamed]
        DataType = ftDate
      end
      item
        Name = 'nNF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nTpNF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitNome'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitCNPJ'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitIE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitIEST'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitEnd'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitBairro'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitMun'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitUF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitCEP'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitIM'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EmitFone'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EmitMunUF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 150
      end
      item
        Name = 'EmitFoneStr'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LogotipoEmitente'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestNome'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestCNPJ'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestIE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestEnd'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestBairro'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestMun'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestUF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestCEP'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DestFoneFax'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'QtdeItem'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'Item'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BaseCalcICMS'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorICMS'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'BaseCalcICMSSubs'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorICMSSubs'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorTotProd'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorFrete'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorSeguro'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'Desconto'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'OutrasDesp'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorIPI'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorTotNota'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'BaseCalcISSQN'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorTotServ'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ValorTotISSQN'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'TraModFrete'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TraCNPJ'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TraNome'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TraIE'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TraEnd'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TraMun'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TraUF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VeiCodigoANTT'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VeiPlaca'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VeiUF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VolQuantidade'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VolEspecie'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VolMarca'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VolNumeracao'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VolPesoBruto'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'VolPesoLiquido'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ObsFisco'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'ObsContribuinte'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'tpAmb'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'tpEmis'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TextoCanhoto'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NumProtocolo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cUF'
        DataType = ftInteger
      end
      item
        Name = 'vTotTrib'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 76
    Data = {
      750800009619E0BD010000001800000046000000000003000000750808436F64
      4261727261020049001000010005574944544802000200FF00074E61744F7065
      72020049001000010005574944544802000200FF000553657269650100490010
      000100055749445448020002001400094474456D697373616F04000600100000
      0007447453616964610400060010000000036E4E460200490010000100055749
      44544802000200FF00056E54704E460200490010000100055749445448020002
      00FF0008456D69744E6F6D65020049001000010005574944544802000200FF00
      08456D6974434E504A020049001000010005574944544802000200FF0006456D
      69744945020049001000010005574944544802000200FF0008456D6974494553
      54020049001000010005574944544802000200FF0007456D6974456E64020049
      001000010005574944544802000200FF000A456D697442616972726F02004900
      1000010005574944544802000200FF0007456D69744D756E0200490010000100
      05574944544802000200FF0006456D6974554602004900100001000557494454
      4802000200FF0007456D69744345500200490010000100055749445448020002
      00FF0006456D6974494D020049001000010005574944544802000200FF000845
      6D6974466F6E650100490010000100055749445448020002001E0009456D6974
      4D756E554601004900100001000557494454480200020096000B456D6974466F
      6E655374720100490010000100055749445448020002003200104C6F676F7469
      706F456D6974656E7465020049001000010005574944544802000200FF000844
      6573744E6F6D65020049001000010005574944544802000200FF000844657374
      434E504A020049001000010005574944544802000200FF000644657374494502
      0049001000010005574944544802000200FF000744657374456E640200490010
      00010005574944544802000200FF000A4465737442616972726F020049001000
      010005574944544802000200FF0007446573744D756E02004900100001000557
      4944544802000200FF0006446573745546020049001000010005574944544802
      000200FF000744657374434550020049001000010005574944544802000200FF
      000B44657374466F6E65466178020049001000010005574944544802000200FF
      0008517464654974656D0400010010000000044974656D020049001000010005
      574944544802000200FF000C4261736543616C6349434D530800040010000100
      07535542545950450200490006004D6F6E6579000956616C6F7249434D530800
      04001000010007535542545950450200490006004D6F6E657900104261736543
      616C6349434D5353756273080004001000010007535542545950450200490006
      004D6F6E6579000D56616C6F7249434D53537562730800040010000100075355
      42545950450200490006004D6F6E6579000C56616C6F72546F7450726F640800
      04001000010007535542545950450200490006004D6F6E6579000A56616C6F72
      4672657465080004001000010007535542545950450200490006004D6F6E6579
      000B56616C6F7253656775726F08000400100001000753554254595045020049
      0006004D6F6E65790008446573636F6E746F0800040010000100075355425459
      50450200490006004D6F6E6579000A4F75747261734465737008000400100001
      0007535542545950450200490006004D6F6E6579000856616C6F724950490800
      04001000010007535542545950450200490006004D6F6E6579000C56616C6F72
      546F744E6F7461080004001000010007535542545950450200490006004D6F6E
      6579000D4261736543616C63495353514E080004001000010007535542545950
      450200490006004D6F6E6579000C56616C6F72546F7453657276080004001000
      010007535542545950450200490006004D6F6E6579000D56616C6F72546F7449
      5353514E080004001000010007535542545950450200490006004D6F6E657900
      0B5472614D6F644672657465020049001000010005574944544802000200FF00
      07547261434E504A020049001000010005574944544802000200FF0007547261
      4E6F6D65020049001000010005574944544802000200FF000554726149450200
      49001000010005574944544802000200FF0006547261456E6402004900100001
      0005574944544802000200FF00065472614D756E020049001000010005574944
      544802000200FF00055472615546020049001000010005574944544802000200
      FF000D566569436F6469676F414E545402004900100001000557494454480200
      0200FF0008566569506C616361020049001000010005574944544802000200FF
      00055665695546020049001000010005574944544802000200FF000D566F6C51
      75616E746964616465020049001000010005574944544802000200FF000A566F
      6C45737065636965020049001000010005574944544802000200FF0008566F6C
      4D61726361020049001000010005574944544802000200FF000C566F6C4E756D
      65726163616F020049001000010005574944544802000200FF000C566F6C5065
      736F427275746F080004001000010007535542545950450200490006004D6F6E
      6579000E566F6C5065736F4C69717569646F0800040010000100075355425459
      50450200490006004D6F6E657900084F6273466973636F020049001000010005
      57494454480200020088130F4F6273436F6E7472696275696E74650200490010
      000100055749445448020002008813057470416D620400010010000000067470
      456D697301004900100001000557494454480200020001000C546578746F4361
      6E686F746F020049000000010005574944544802000200FF000C4E756D50726F
      746F636F6C6F0100490000000100055749445448020002006400036355460400
      0100000000000876546F745472696208000400100000000000}
    object cdsNFECodBarra: TStringField
      FieldName = 'CodBarra'
      Size = 255
    end
    object cdsNFENatOper: TStringField
      FieldName = 'NatOper'
      Size = 255
    end
    object cdsNFESerie: TStringField
      FieldName = 'Serie'
    end
    object cdsNFEDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object cdsNFEDtSaida: TDateField
      FieldName = 'DtSaida'
    end
    object cdsNFEnNF: TStringField
      FieldName = 'nNF'
      Size = 255
    end
    object cdsNFEnTpNF: TStringField
      FieldName = 'nTpNF'
      Size = 255
    end
    object cdsNFEEmitNome: TStringField
      FieldName = 'EmitNome'
      Size = 255
    end
    object cdsNFEEmitCNPJ: TStringField
      FieldName = 'EmitCNPJ'
      Size = 255
    end
    object cdsNFEEmitIE: TStringField
      FieldName = 'EmitIE'
      Size = 255
    end
    object cdsNFEEmitIEST: TStringField
      FieldName = 'EmitIEST'
      Size = 255
    end
    object cdsNFEEmitEnd: TStringField
      FieldName = 'EmitEnd'
      Size = 255
    end
    object cdsNFEEmitBairro: TStringField
      FieldName = 'EmitBairro'
      Size = 255
    end
    object cdsNFEEmitMun: TStringField
      FieldName = 'EmitMun'
      Size = 255
    end
    object cdsNFEEmitUF: TStringField
      FieldName = 'EmitUF'
      Size = 255
    end
    object cdsNFEEmitCEP: TStringField
      FieldName = 'EmitCEP'
      Size = 255
    end
    object cdsNFEEmitIM: TStringField
      FieldName = 'EmitIM'
      Size = 255
    end
    object cdsNFEEmitFone: TStringField
      FieldName = 'EmitFone'
      Size = 30
    end
    object cdsNFEEmitMunUF: TStringField
      FieldName = 'EmitMunUF'
      Size = 150
    end
    object cdsNFEEmitFoneStr: TStringField
      FieldName = 'EmitFoneStr'
      Size = 50
    end
    object cdsNFELogotipoEmitente: TStringField
      FieldName = 'LogotipoEmitente'
      Size = 255
    end
    object cdsNFEDestNome: TStringField
      FieldName = 'DestNome'
      Size = 255
    end
    object cdsNFEDestCNPJ: TStringField
      FieldName = 'DestCNPJ'
      Size = 255
    end
    object cdsNFEDestIE: TStringField
      FieldName = 'DestIE'
      Size = 255
    end
    object cdsNFEDestEnd: TStringField
      FieldName = 'DestEnd'
      Size = 255
    end
    object cdsNFEDestBairro: TStringField
      FieldName = 'DestBairro'
      Size = 255
    end
    object cdsNFEDestMun: TStringField
      FieldName = 'DestMun'
      Size = 255
    end
    object cdsNFEDestUF: TStringField
      FieldName = 'DestUF'
      Size = 255
    end
    object cdsNFEDestCEP: TStringField
      FieldName = 'DestCEP'
      Size = 255
    end
    object cdsNFEDestFoneFax: TStringField
      FieldName = 'DestFoneFax'
      Size = 255
    end
    object cdsNFEQtdeItem: TIntegerField
      FieldName = 'QtdeItem'
    end
    object cdsNFEItem: TStringField
      FieldName = 'Item'
      Size = 255
    end
    object cdsNFEBaseCalcICMS: TCurrencyField
      FieldName = 'BaseCalcICMS'
    end
    object cdsNFEValorICMS: TCurrencyField
      FieldName = 'ValorICMS'
    end
    object cdsNFEBaseCalcICMSSubs: TCurrencyField
      FieldName = 'BaseCalcICMSSubs'
    end
    object cdsNFEValorICMSSubs: TCurrencyField
      FieldName = 'ValorICMSSubs'
    end
    object cdsNFEValorTotProd: TCurrencyField
      FieldName = 'ValorTotProd'
    end
    object cdsNFEValorFrete: TCurrencyField
      FieldName = 'ValorFrete'
    end
    object cdsNFEValorSeguro: TCurrencyField
      FieldName = 'ValorSeguro'
    end
    object cdsNFEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object cdsNFEOutrasDesp: TCurrencyField
      FieldName = 'OutrasDesp'
    end
    object cdsNFEValorIPI: TCurrencyField
      FieldName = 'ValorIPI'
    end
    object cdsNFEValorTotNota: TCurrencyField
      FieldName = 'ValorTotNota'
    end
    object cdsNFEBaseCalcISSQN: TCurrencyField
      FieldName = 'BaseCalcISSQN'
    end
    object cdsNFEValorTotServ: TCurrencyField
      FieldName = 'ValorTotServ'
    end
    object cdsNFEValorTotISSQN: TCurrencyField
      FieldName = 'ValorTotISSQN'
    end
    object cdsNFETraModFrete: TStringField
      FieldName = 'TraModFrete'
      Size = 255
    end
    object cdsNFETraCNPJ: TStringField
      FieldName = 'TraCNPJ'
      Size = 255
    end
    object cdsNFETraNome: TStringField
      FieldName = 'TraNome'
      Size = 255
    end
    object cdsNFETraIE: TStringField
      FieldName = 'TraIE'
      Size = 255
    end
    object cdsNFETraEnd: TStringField
      FieldName = 'TraEnd'
      Size = 255
    end
    object cdsNFETraMun: TStringField
      FieldName = 'TraMun'
      Size = 255
    end
    object cdsNFETraUF: TStringField
      FieldName = 'TraUF'
      Size = 255
    end
    object cdsNFEVeiCodigoANTT: TStringField
      FieldName = 'VeiCodigoANTT'
      Size = 255
    end
    object cdsNFEVeiPlaca: TStringField
      FieldName = 'VeiPlaca'
      Size = 255
    end
    object cdsNFEVeiUF: TStringField
      FieldName = 'VeiUF'
      Size = 255
    end
    object cdsNFEVolQuantidade: TStringField
      FieldName = 'VolQuantidade'
      Size = 255
    end
    object cdsNFEVolEspecie: TStringField
      FieldName = 'VolEspecie'
      Size = 255
    end
    object cdsNFEVolMarca: TStringField
      FieldName = 'VolMarca'
      Size = 255
    end
    object cdsNFEVolNumeracao: TStringField
      FieldName = 'VolNumeracao'
      Size = 255
    end
    object cdsNFEVolPesoBruto: TCurrencyField
      FieldName = 'VolPesoBruto'
    end
    object cdsNFEVolPesoLiquido: TCurrencyField
      FieldName = 'VolPesoLiquido'
    end
    object cdsNFEObsFisco: TStringField
      FieldName = 'ObsFisco'
      Size = 5000
    end
    object cdsNFEObsContribuinte: TStringField
      FieldName = 'ObsContribuinte'
      Size = 5000
    end
    object cdsNFEtpAmb: TIntegerField
      FieldName = 'tpAmb'
    end
    object cdsNFEtpEmis: TStringField
      FieldName = 'tpEmis'
      Size = 1
    end
    object cdsNFETextoCanhoto: TStringField
      FieldName = 'TextoCanhoto'
      Size = 255
    end
    object cdsNFENumProtocolo: TStringField
      FieldName = 'NumProtocolo'
      Size = 100
    end
    object cdsNFEcUF: TIntegerField
      FieldName = 'cUF'
    end
    object cdsNFEvTotTrib: TFloatField
      FieldName = 'vTotTrib'
      DisplayFormat = ',0.00'
    end
  end
  object cdsCobranca: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nNF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumDuplicata'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DtVencimento'
        Attributes = [faUnNamed]
        DataType = ftDate
      end
      item
        Name = 'ValorDuplicata'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end>
    IndexDefs = <>
    IndexFieldNames = 'nNF'
    MasterFields = 'nNF'
    MasterSource = dsNFE
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 209
    Top = 74
    Data = {
      930000009619E0BD0100000018000000040000000000030000009300036E4E46
      01004900100001000557494454480200020014000C4E756D4475706C69636174
      6101004900100001000557494454480200020014000C447456656E63696D656E
      746F04000600100000000E56616C6F724475706C696361746108000400100001
      0007535542545950450200490006004D6F6E6579000000}
    object cdsCobrancanNF: TStringField
      FieldName = 'nNF'
    end
    object cdsCobrancaNumDuplicata: TStringField
      FieldName = 'NumDuplicata'
    end
    object cdsCobrancaDtVencimento: TDateField
      FieldName = 'DtVencimento'
    end
    object cdsCobrancaValorDuplicata: TCurrencyField
      FieldName = 'ValorDuplicata'
    end
  end
  object cdsNFE_Itens: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'nNF'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemCodigo'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemNCM'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemDescricao'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 800
      end
      item
        Name = 'ItemCST'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemCFOP'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemUnidade'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemQuantidade'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ItemVUnit'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ItemVTotal'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ItemBCalcIcms'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ItemVICMS'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ItemVIPI'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ItemAliqICMS'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'ItemAliqIPI'
        Attributes = [faUnNamed]
        DataType = ftCurrency
      end
      item
        Name = 'infAdProd'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end
      item
        Name = 'idx_NF'
        Fields = 'nNF;ItemCodigo'
      end>
    IndexFieldNames = 'nNF'
    MasterFields = 'nNF'
    MasterSource = dsNFE
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    OnNewRecord = cdsNFE_ItensNewRecord
    Left = 115
    Top = 76
    Data = {
      5A0200009619E0BD0100000018000000100000000000030000005A02036E4E46
      020049001000010005574944544802000200FF000A4974656D436F6469676F02
      0049001000010005574944544802000200FF00074974656D4E434D0200490010
      00010005574944544802000200FF000D4974656D44657363726963616F020049
      0010000100055749445448020002002003074974656D43535402004900100001
      0005574944544802000200FF00084974656D43464F5002004900100001000557
      4944544802000200FF000B4974656D556E696461646502004900100001000557
      4944544802000200FF000E4974656D5175616E74696461646508000400100001
      0007535542545950450200490006004D6F6E657900094974656D56556E697408
      0004001000010007535542545950450200490006004D6F6E6579000A4974656D
      56546F74616C080004001000010007535542545950450200490006004D6F6E65
      79000D4974656D4243616C6349636D7308000400100001000753554254595045
      0200490006004D6F6E657900094974656D5649434D5308000400100001000753
      5542545950450200490006004D6F6E657900084974656D564950490800040010
      00010007535542545950450200490006004D6F6E6579000C4974656D416C6971
      49434D53080004001000010007535542545950450200490006004D6F6E657900
      0B4974656D416C69714950490800040010000100075355425459504502004900
      06004D6F6E65790009696E66416450726F640200490010000100055749445448
      02000200F40101000D44454641554C545F4F524445520200820000000000}
    object cdsNFE_ItensnNF: TStringField
      FieldName = 'nNF'
      Size = 255
    end
    object cdsNFE_ItensItemCodigo: TStringField
      FieldName = 'ItemCodigo'
      Size = 255
    end
    object cdsNFE_ItensItemNCM: TStringField
      FieldName = 'ItemNCM'
      Size = 255
    end
    object cdsNFE_ItensItemDescricao: TStringField
      FieldName = 'ItemDescricao'
      Size = 800
    end
    object cdsNFE_ItensItemCST: TStringField
      FieldName = 'ItemCST'
      Size = 255
    end
    object cdsNFE_ItensItemCFOP: TStringField
      FieldName = 'ItemCFOP'
      Size = 255
    end
    object cdsNFE_ItensItemUnidade: TStringField
      FieldName = 'ItemUnidade'
      Size = 255
    end
    object cdsNFE_ItensItemQuantidade: TCurrencyField
      FieldName = 'ItemQuantidade'
    end
    object cdsNFE_ItensItemVUnit: TCurrencyField
      FieldName = 'ItemVUnit'
    end
    object cdsNFE_ItensItemVTotal: TCurrencyField
      FieldName = 'ItemVTotal'
    end
    object cdsNFE_ItensItemBCalcIcms: TCurrencyField
      FieldName = 'ItemBCalcIcms'
    end
    object cdsNFE_ItensItemVICMS: TCurrencyField
      FieldName = 'ItemVICMS'
    end
    object cdsNFE_ItensItemVIPI: TCurrencyField
      FieldName = 'ItemVIPI'
    end
    object cdsNFE_ItensItemAliqICMS: TCurrencyField
      FieldName = 'ItemAliqICMS'
    end
    object cdsNFE_ItensItemAliqIPI: TCurrencyField
      FieldName = 'ItemAliqIPI'
    end
    object cdsNFE_ItensinfAdProd: TStringField
      FieldName = 'infAdProd'
      Size = 500
    end
  end
  object dsNFE_Itens: TDataSource
    DataSet = cdsNFE_Itens
    Left = 115
    Top = 20
  end
  object RelDanfe: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40074.348425925900000000
    ReportOptions.LastChange = 41437.510939027780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <NFE."tpEmis"> = '#39'1'#39' then'
      '  begin'
      '     Memo10.Text := '#39'PROTOCOLO DE AUTORIZA'#199#195'O DE USO'#39';'
      
        '     Memo133.Visible := True;                                   ' +
        '                      '
      
        '     Memo134.Visible := True;                                   ' +
        '                      '
      
        '     Memo135.Visible := True;                                   ' +
        '                      '
      
        '     Memo136.Visible := True;                                   ' +
        '                      '
      '     BarCode2.Visible := False;    '
      '  end'
      '  else '
      '  if <NFE."tpEmis"> = '#39'4'#39' then'
      '  begin'
      '     Memo10.Text := '#39'N'#218'MERO DE REGISTRO DPEC'#39';'
      
        '     Memo133.Visible := True;                                   ' +
        '                      '
      
        '     Memo134.Visible := True;                                   ' +
        '                      '
      
        '     Memo135.Visible := False;                                  ' +
        '                       '
      
        '     Memo136.Visible := True;                                   ' +
        '                      '
      '     BarCode2.Visible := False;    '
      '  end'
      '  else                 '
      '  begin'
      '     Memo10.Text := '#39'DADOS DA NFe'#39';'
      
        '     Memo133.Visible := False;                                  ' +
        '                       '
      
        '     Memo134.Visible := False;                                  ' +
        '                       '
      
        '     Memo135.Visible := False;                                  ' +
        '                       '
      
        '     Memo136.Visible := True;                                   ' +
        '                      '
      '     BarCode2.Visible := True;    '
      '  end;'
      ''
      '  memHomolog.Visible := (<NFE."tpAmb"> = '#39'2'#39');'
      ''
      'end;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FreeSpace > GroupFooter1.Height then'
      '  begin'
      '    Engine.CurY := Engine.PageHeight - GroupFooter1.height - 1;'
      '  end;'
      'end;'
      ''
      'begin'
      'end.')
    OnBeforePrint = RelDanfeBeforePrint
    Left = 64
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'NFE'
      end
      item
        DataSet = frxDBDataset3
        DataSetName = 'NFE_Cob'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'NFE_Itens'
      end
      item
        DataSet = frxDBDataset4
        DataSetName = 'NFE_logo'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = 14211288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -7
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 20.000000000000000000
      DataSet = frxDBDataset1
      DataSetName = 'NFE'
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      EndlessWidth = True
      ResetPageNumbers = True
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        Height = 15.118110240000000000
        Top = 714.331170000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'NFE_Itens'
        RowCount = 0
        Stretched = True
        object Shape9: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 15.118110240000000000
          ShowHint = False
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.500000000000000000
          Frame.TopLine.Color = clWhite
        end
        object NFE_ItensItemDescricao: TfrxMemoView
          Left = 54.692950000000000000
          Width = 177.637910000000000000
          Height = 11.338590000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'ItemDescricao'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemDescricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object NFE_ItensItemCodigo: TfrxMemoView
          Left = 1.779530000000000000
          Width = 49.133890000000000000
          Height = 11.338590000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'ItemCodigo'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemCodigo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 236.889920000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemNCM"]')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 281.574788500000000000
          Width = 22.677180000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemCST"]')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 306.897623150000000000
          Width = 22.677180000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemCFOP'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemCFOP"]')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 335.267704330000000000
          Width = 43.086628820000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'ItemUnidade'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE_Itens."ItemUnidade"]')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 381.732530000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemQuantidade'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemQuantidade"]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 442.205010000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVUnit'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVUnit"]')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 487.559370000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVTotal'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVTotal"]')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 532.913730000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemBCalcIcms'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemBCalcIcms"]')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Left = 578.268090000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVICMS'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVICMS"]')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Left = 623.622450000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVIPI'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVIPI"]')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 664.197280000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemAliqICMS'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE_Itens."ItemAliqICMS"]')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 691.653990000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemAliqIPI'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE_Itens."ItemAliqIPI"]')
          ParentFont = False
        end
        object Line60: TfrxLineView
          Left = 280.023810000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line61: TfrxLineView
          Left = 305.141930000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line62: TfrxLineView
          Left = 333.378170000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line63: TfrxLineView
          Left = 379.732530000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line64: TfrxLineView
          Left = 234.330860000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line65: TfrxLineView
          Left = 52.913420000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line66: TfrxLineView
          Left = 438.425480000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line67: TfrxLineView
          Left = 487.559370000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line68: TfrxLineView
          Left = 532.913730000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line69: TfrxLineView
          Left = 578.268090000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line70: TfrxLineView
          Left = 619.842920000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line71: TfrxLineView
          Left = 661.417750000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line72: TfrxLineView
          Left = 689.874460000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
      end
      object Child3: TfrxChild
        Height = 241.889920000000000000
        Top = 449.764070000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 3.779530000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#193'LCULO DO IMPOSTO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 2.779530000000000000
          Top = 15.897649999999880000
          Width = 115.267780000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO DO ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 2.779530000000000000
          Top = 25.236240000000010000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."BaseCalcICMS"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 137.063080000000000000
          Top = 15.118119999999920000
          Width = 115.267780000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR DO ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 137.063080000000000000
          Top = 24.456709999999870000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorICMS"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 274.567100000000000000
          Top = 15.118119999999920000
          Width = 130.385900000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO DO ICMS S.T.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 274.567100000000000000
          Top = 24.456709999999870000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."BaseCalcICMSSubs"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 421.630180000000000000
          Top = 15.118119999999920000
          Width = 130.385900000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR DO ICMS S.T.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 421.630180000000000000
          Top = 24.456709999999870000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorICMSSubs"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 574.488560000000000000
          Top = 15.118119999999920000
          Width = 130.385900000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR TOTAL DOS PRODUTOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 574.488560000000000000
          Top = 24.456709999999870000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorTotProd"]')
          ParentFont = False
        end
        object Line22: TfrxLineView
          Top = 42.133889999999780000
          Width = 718.110236220000000000
          ShowHint = False
          Diagonal = True
        end
        object Line24: TfrxLineView
          Left = 124.724490000000000000
          Top = 15.118119999999920000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line25: TfrxLineView
          Left = 264.567100000000000000
          Top = 15.118119999999920000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line26: TfrxLineView
          Left = 411.968770000000000000
          Top = 15.118119999999920000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line27: TfrxLineView
          Left = 566.929500000000000000
          Top = 15.118119999999920000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Shape7: TfrxShapeView
          Top = 82.708720000000030000
          Width = 718.110700000000000000
          Height = 79.370130000000000000
          ShowHint = False
        end
        object Memo70: TfrxMemoView
          Left = 3.779530000000000000
          Top = 68.031539999999900000
          Width = 268.346630000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TRANSPORTADOR / VOLUMES TRANSPORTADOS')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 2.779530000000000000
          Top = 83.929190000000000000
          Width = 115.267780000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'NOME / RAZ'#195'O SOCIAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 2.779530000000000000
          Top = 93.267779999999850000
          Width = 226.771800000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TraNome"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 238.212740000000000000
          Top = 83.149659999999990000
          Width = 81.252010000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'FRETE POR CONTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 324.700990000000000000
          Top = 88.708720000000030000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraModFrete"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 360.598640000000000000
          Top = 83.149659999999990000
          Width = 119.047310000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'C'#211'DIGO ANTT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 361.378170000000000000
          Top = 92.488250000000050000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."VeiCodigoANTT"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 485.220780000000000000
          Top = 83.149659999999990000
          Width = 69.913420000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'PLACA VE'#205'CULO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 486.000310000000000000
          Top = 92.488249999999820000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."VeiPlaca"]')
          ParentFont = False
        end
        object Line23: TfrxLineView
          Top = 110.165430000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo81: TfrxMemoView
          Left = 3.779530000000000000
          Top = 109.606369999999900000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 3.779530000000000000
          Top = 118.944960000000000000
          Width = 321.260050000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TraEnd"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 333.937230000000000000
          Top = 109.606369999999900000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'MUNIC'#205'PIO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 333.937230000000000000
          Top = 118.944960000000000000
          Width = 222.992270000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TraMun"]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 561.811380000000000000
          Top = 109.606369999999900000
          Width = 17.000000000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 562.590910000000000000
          Top = 118.944960000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraUF"]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 594.047620000000000000
          Top = 109.606369999999900000
          Width = 115.267780000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 594.827150000000000000
          Top = 118.944960000000000000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraIE"]')
          ParentFont = False
        end
        object Line34: TfrxLineView
          Left = 234.551330000000000000
          Top = 83.149659999999990000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line35: TfrxLineView
          Left = 355.496290000000000000
          Top = 83.149659999999990000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line36: TfrxLineView
          Left = 483.000310000000000000
          Top = 83.149659999999990000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line37: TfrxLineView
          Left = 328.819110000000000000
          Top = 109.606369999999900000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line38: TfrxLineView
          Left = 559.590910000000000000
          Top = 109.606369999999900000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line39: TfrxLineView
          Left = 591.827150000000000000
          Top = 109.606369999999900000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo73: TfrxMemoView
          Left = 238.110236220000000000
          Top = 92.488250000000050000
          Width = 81.252010000000000000
          Height = 16.574830000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            ' 0: Emit  -  1: Dest  '
            ' 2:Terc   -  9: S/Frete')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 561.811380000000000000
          Top = 83.149659999999990000
          Width = 20.779530000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 562.590910000000000000
          Top = 92.488249999999820000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VeiUF"]')
          ParentFont = False
        end
        object Line33: TfrxLineView
          Left = 559.590910000000000000
          Top = 83.149659999999990000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo94: TfrxMemoView
          Left = 594.047620000000000000
          Top = 83.149659999999990000
          Width = 43.456710000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 594.827150000000000000
          Top = 92.488249999999820000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraCNPJ"]')
          ParentFont = False
        end
        object Line42: TfrxLineView
          Left = 591.827150000000000000
          Top = 83.149659999999990000
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line40: TfrxLineView
          Top = 136.063079999999800000
          Width = 718.110236220000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo89: TfrxMemoView
          Left = 4.559060000000000000
          Top = 137.842609999999900000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 4.559060000000000000
          Top = 147.181199999999900000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."VolQuantidade"]')
          ParentFont = False
        end
        object Line41: TfrxLineView
          Left = 94.488250000000000000
          Top = 136.063079999999800000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo91: TfrxMemoView
          Left = 98.267780000000000000
          Top = 136.063079999999800000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'ESP'#201'CIE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 98.267780000000000000
          Top = 145.401669999999900000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VolEspecie"]')
          ParentFont = False
        end
        object Line43: TfrxLineView
          Left = 234.330860000000000000
          Top = 136.063079999999800000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo96: TfrxMemoView
          Left = 238.110390000000000000
          Top = 136.063079999999800000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'MARCA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 238.110390000000000000
          Top = 145.401669999999900000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VolMarca"]')
          ParentFont = False
        end
        object Line44: TfrxLineView
          Left = 393.071120000000000000
          Top = 136.063079999999800000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo98: TfrxMemoView
          Left = 396.850650000000000000
          Top = 136.063079999999800000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'N'#218'MERO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 396.850650000000000000
          Top = 145.401669999999900000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VolNumeracao"]')
          ParentFont = False
        end
        object Line45: TfrxLineView
          Left = 480.000310000000000000
          Top = 136.063079999999800000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo100: TfrxMemoView
          Left = 483.779840000000000000
          Top = 136.063079999999800000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'PESO BRUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 483.779840000000000000
          Top = 145.401669999999900000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%3.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."VolPesoBruto"]')
          ParentFont = False
        end
        object Line46: TfrxLineView
          Left = 591.827150000000000000
          Top = 136.063079999999800000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo102: TfrxMemoView
          Left = 597.165740000000000000
          Top = 136.063079999999800000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'PESO L'#205'QUIDO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 597.165740000000000000
          Top = 145.401669999999900000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%3.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."VolPesoLiquido"]')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 3.779530000000000000
          Top = 204.094620000000000000
          Width = 192.756030000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DADOS DOS PRODUTOS / SERVI'#199'OS')
          ParentFont = False
        end
        object Shape8: TfrxShapeView
          Top = 219.212739999999900000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          ShowHint = False
        end
        object Memo105: TfrxMemoView
          Left = 3.779530000000000000
          Top = 219.212739999999900000
          Width = 43.456710000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#211'DIGO'
            'PRODUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 53.692950000000000000
          Top = 219.212739999999900000
          Width = 179.519790000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DESCRI'#199#195'O DO PRODUTO / SERVI'#199'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 236.889920000000000000
          Top = 219.212739999999900000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NCM/SH')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 281.574788500000000000
          Top = 219.212739999999900000
          Width = 20.779530000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CST')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 306.897623150000000000
          Top = 219.212739999999900000
          Width = 24.559060000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CFOP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 334.488174330000000000
          Top = 219.212739999999900000
          Width = 43.456710000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'UN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 391.291590000000000000
          Top = 219.212739999999900000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'QUANT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 445.984540000000000000
          Top = 219.212739999999900000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'UNIT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 491.338900000000000000
          Top = 219.212739999999900000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 537.693260000000000000
          Top = 219.212739999999900000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'B.C'#193'LC'
            'ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 582.047620000000000000
          Top = 219.212739999999900000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 623.622450000000000000
          Top = 219.212739999999900000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'IPI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 662.417750000000000000
          Top = 219.212739999999900000
          Width = 24.559060000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'AL'#205'Q.'
            'ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 691.653990000000000000
          Top = 219.212739999999900000
          Width = 24.559060000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'AL'#205'Q.'
            'IPI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line47: TfrxLineView
          Left = 689.874460000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line48: TfrxLineView
          Left = 661.417750000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line49: TfrxLineView
          Left = 619.842920000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line50: TfrxLineView
          Left = 578.268090000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line51: TfrxLineView
          Left = 532.913730000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line52: TfrxLineView
          Left = 487.559370000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line53: TfrxLineView
          Left = 438.425480000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line54: TfrxLineView
          Left = 379.732530000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line55: TfrxLineView
          Left = 333.378170000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line56: TfrxLineView
          Left = 305.141930000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line57: TfrxLineView
          Left = 280.023810000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line58: TfrxLineView
          Left = 234.330860000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line59: TfrxLineView
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo138: TfrxMemoView
          Left = 3.779530000000000000
          Top = 162.519790000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#193'LCULO DO ISSQN')
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Top = 176.417439999999900000
          Width = 718.110236220000000000
          Height = 26.456710000000000000
          ShowHint = False
        end
        object Memo139: TfrxMemoView
          Left = 3.779530000000000000
          Top = 177.637909999999900000
          Width = 100.149660000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O MUNICIPAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 158.740260000000000000
          Top = 177.637909999999900000
          Width = 179.519790000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR TOTAL DOS SERVI'#199'OS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 158.740260000000000000
          Top = 186.976499999999900000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."ValorTotServ"]')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 344.157700000000000000
          Top = 177.637909999999900000
          Width = 179.519790000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO DO ISSQN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 344.157700000000000000
          Top = 186.976499999999900000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."BaseCalcISSQN"]')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          Left = 533.354670000000000000
          Top = 177.637909999999900000
          Width = 179.519790000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR DO ISSQN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Left = 533.354670000000000000
          Top = 186.976499999999900000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."ValorTotISSQN"]')
          ParentFont = False
        end
        object Line75: TfrxLineView
          Left = 154.960730000000000000
          Top = 176.417439999999900000
          Height = 26.456710000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line76: TfrxLineView
          Left = 341.157700000000000000
          Top = 176.417439999999900000
          Height = 26.456710000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line77: TfrxLineView
          Left = 529.134200000000000000
          Top = 176.417439999999900000
          Height = 26.456710000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line91: TfrxLineView
          Left = 52.913420000000000000
          Top = 219.212739999999900000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Shape2: TfrxShapeView
          Left = -0.518552859999999800
          Top = 15.325911430000020000
          Width = 718.110700000000000000
          Height = 52.913420000000000000
          ShowHint = False
        end
        object Memo58: TfrxMemoView
          Left = 3.260977139999999000
          Top = 42.223561430000020000
          Width = 92.590600000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR DO FRETE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 3.260977139999999000
          Top = 51.562151429999970000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorFrete"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 105.764997140000000000
          Top = 42.223561430000020000
          Width = 100.149660000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR DO SEGURO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 105.764997140000000000
          Top = 51.562151429999970000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorSeguro"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 212.930427140000000000
          Top = 42.223561430000020000
          Width = 96.370130000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DESCONTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 212.930427140000000000
          Top = 51.562151429999970000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."Desconto"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 316.875387140000000000
          Top = 42.223561430000020000
          Width = 111.488250000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'OUTRAS DESP. ACESS'#211'RIAS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 316.875387140000000000
          Top = 51.562151429999970000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."OutrasDesp"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 435.820347140000000000
          Top = 42.223561430000020000
          Width = 77.472480000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR DO IPI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 435.820347140000000000
          Top = 51.562151430000030000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorIPI"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 605.985777140000000000
          Top = 42.223561430000020000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR TOTAL DA NOTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 605.985777140000000000
          Top = 51.562151429999970000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorTotNota"]')
          ParentFont = False
        end
        object Line28: TfrxLineView
          Left = 102.646877140000000000
          Top = 42.223561430000020000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line29: TfrxLineView
          Left = 210.591837140000000000
          Top = 42.223561430000020000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line30: TfrxLineView
          Left = 314.757267140000000000
          Top = 42.223561430000020000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line31: TfrxLineView
          Left = 433.481757140000000000
          Top = 42.223561430000020000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line32: TfrxLineView
          Left = 604.206247140000000000
          Top = 42.223561430000020000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line78: TfrxLineView
          Left = 516.410947139999900000
          Top = 42.223561430000020000
          Height = 26.456692910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo151: TfrxMemoView
          Left = 517.277057140000000000
          Top = 42.223561430000020000
          Width = 88.811070000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'TOTAL DE  IMPOSTOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object NFEvTotTrib: TfrxMemoView
          Left = 517.277057140000000000
          Top = 51.672353480000030000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'vTotTrib'
          DataSet = frxDBDataset1
          DataSetName = 'NFE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."vTotTrib"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 408.189240000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Child = RelDanfe.Child3
        Condition = 'NFE."nNF"'
        KeepTogether = True
        ReprintOnNewPage = True
        ResetPageNumbers = True
        StartNewPage = True
        Stretched = True
        object memDemonst: TfrxMemoView
          Left = 41.574830000000000000
          Top = 269.126160000000000000
          Width = 616.063390000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -64
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DEMONSTRA'#199#195'O')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          Top = 74.543290000000000000
          Width = 717.732283460000000000
          Height = 189.590600000000000000
          ShowHint = False
        end
        object picLogo: TfrxPictureView
          Left = 7.559060000000000000
          Top = 84.708720000000000000
          Width = 113.385900000000000000
          Height = 120.944960000000000000
          ShowHint = False
          DataField = 'IMG_LOGO'
          DataSet = frxDBDataset4
          DataSetName = 'NFE_logo'
          Picture.Data = {
            07544269746D6170B6140000424DB61400000000000036000000280000002A00
            000029000000010018000000000080140000C40E0000C40E0000000000000000
            0000FFFDFFFFFDFFFFFDFFFFFEFFFDFFFFFDFFFFFBFFFFFBFFFEFBFFFFFBFFFF
            FDFFFFFFFEFFFFFEFFFFFDFFFFFBFFFFFBFFF7FAFEFBFFFFFFFDFCFFFDF9FFFF
            F8FFF6EBFFEBDFFFF0E3FFFFF1FFFFF3FFFFF7FFFFFBFBFFFEFBFFFFFBFEFFFA
            FDFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000FFFBFFFFFCFFFFFDFFFEF9FBFFFEFEFFFFFEFCFFFDFDFFFCFDFFFEFCFFFD
            FBFCFAFCFCFCFFFEFFFFFDFFFFF7FEF7F1F6FDFEFFF6F6F6FFFFFCFFF6F1FFF0
            E6F8DBCDCAA99AE7C9B8FFF8E6FFFFEFFFFFF2FFFEF5FFFFFCFFFEFFFBF9FFFD
            FDFFFDFCFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFBFFFFF8FEFFF9FCFFFEFFFFFFFEFBFCF8F7FBF5FBFFFBF9FFF9F9FFF9
            FDFFFCFDFFFEFFFFFFFFFEFFFFFDFFFFFDFFFDFCFEFFFDFCFFFEFAF4DED8F1D3
            C8ECC8B8CBA390D3AE9AFFE2CDFFFAE6FFFFF2FFFFF6FFFFFAFFFEFFFEFAFFFE
            FAFFFDFCFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFBFFFFF5FBFFF9FBFFFEFEFCFCF6F2F7EEF7FFF4F8FFF8F3FFF3E9F7EB
            E7F2E8E9F1EAE9F0EDEAEFEEF3F4F8FDFEFFFBFDFDFFFFFCFFF4EEF0DACFF9D8
            C9F9D1BED8AC95B98D75E2BDA3FFE1CAFFFFEDFFFFF4FFFCF6FFFEFEFFFDFFFF
            FAFFFFFCFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFCFFFFFBFFFFFEFEFFFEFAF6F9F0FAFFF8F6FFF7EDFFEFD4EAD8C3D8C9
            B4C8BBB0C4B8B2C2BBB4C2BEBDC7C7C6D0D0E9F2EFFBFDF7F0E7DEE6D3C4EFCF
            BCFAD1BAFACEB1E3B596C9A184E0BEA1FFE6CEFFFDECFFFEF4FFFCF9FFFEFFFF
            FBFDFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFF7FAFFFEFFFFFFFCFAFCF6FAFFF8F4FFF7DBF4E0A0BCA85C7D685D7E69
            5E7E6D5F7E6F637E7468837A768D89829794899A96B1B9B2D1D0C2EADCCAF1D5
            BDF7D0B4FFDDBCFFDAB5D6AE8BCFAE8DEBD3B7FFFDE8FFFFF5FFF8F1FDF7F8FB
            F8FAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFBFCFFFFFEFCFDF9F5FEF4F4FFF7DBF3E185A58D3B6248426C53517E64
            5B8671517B69416A5B3D63573C61593F60594F675F5E6E638E9483C3BAA6E8D0
            B4FFDDBCFFDFBAFFDBB1FCD5AED9B995E8D0B2FFFFEBFFFFF2FFFCF3FFFBFAFC
            FBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFFFEFDFFFCF2FAF3F4FFF8EBFFF194B5A0466F54407053A4D7BBA8DEC1
            9BD2B981B7A072A6946C9D8F55847B3D665E628479445D4F5E685779755DA894
            75E6C9A4F8D5AAFFDCB0FFE1B6D6BA91DBC7A4FEF2D6FFFAE7FBFBEFFFFFFCFA
            FCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FAFFFEF8FFFAF0FBF3F3FFF8DBF9E66990774A72599DCCB2ADE4C9A1DBC2
            8FC4B08BBDABAADBCDCAFAEEBBE5DA91B6AC507365435E4E708370757B64807A
            5DB6A682C3A981D8B88FEACAA1C3A47DCAAE8BE8D3B4EEDFC5F9F0DCFFFFF2FC
            F8EDFFFEF7FFFEF9FFFEFAFFFDFCFDFCFEFDFCFEFDFCFEFDFDFDFFFEFDFFFEFD
            0000F1FFFEE9F7F1F8FFF7F4FFF7BFE3CD3C634D97B39F99BBAAA7DDCC9BD4C5
            A3C8C0BEDCD7D3F7F1DDFEF7E9FBF4F3FFFBE8FFF393AE9E46604E4156407B89
            71888C6FA9A183D6C1A1F1CFB1D6AD8DE1B493B68B6ADCB795EED0ADFFEAC7FF
            F0D1FFF5E0FFF7EAFFF6EEFFFFFCFFFEFFF9F9FFFDFCFFFCF9FBFFFDFAFFFFF8
            0000F1FFFFF4FFFEF8FFF8F6FFF7B6D9C53A604AA5BAAB99B3A59DD2C59ED3CA
            9BB7B7B4C7CAE8FFFFEDFFFFEEF4EFEEF0EAE7F8EBC3DACBCBE5D3738C78263B
            25919F8788896FAC9E82B9987EFFDABDF4C1A1F6C29EE0B18BE2BA90F0D0A5D4
            BA92ECD2B4FFE7D3FFF7EBFFFBF7FCF9FBF9F9FFFFFDFFFFFCFEFFFDFAFFFFF8
            0000F0FAFAF8FFFFFAFBF7FAFFF8B9D6C6365945B0C3B495ADA19BCDC37BAEA7
            9CB5B7CEDFE2E8FDFEE6F6F5D2D0CFA4A09B636D61516254425544768A7794A5
            903441295F5F4764573DA4876CE3BB9EFFDDBEDEAE8CE2B590E0B88EE4C499E3
            C69FCCB08EF3D9C1FFFDEEFFFEF6FBF5F6FBF9FFFFFDFFFFFDFFFFFDFCFFFEFB
            0000F4F8FDFDFFFFFFFBFAFAFEF8CBE4D6365343AFC1B494AEA182B1A87BABA5
            97AEB0C7D5DBEFFFFFC7D0D3ACA4A5C2B6B4DADBD1CDD6C9C2CDBD8492808894
            80AAB49D5151394F4429765E42967456EAC1A1D7AA89FFDFBAF8D1AAE6C39BF0
            D0A7C8A682EACCAFFFFCE8FFFFF5FFFDFDFFFBFFF9F6FFFEFCFFFFFCFEFFFDFE
            0000FEFBFFFFFDFFFFFAFDF8F9F5E7FBEF4761539DB1A49AB3A985B4AC5A8784
            97ADB2CFDBE1DEEAF0D9DCE1FFFAFEFFFCFDFFFEF7FFFFF7F2F5E6FFFFF4F8FF
            EDF3F9E2BBBBA34D462B503D22886C4E957153DBB593FED6B3F9D4AEFBD7B1EE
            CBA3CCA57ED9B591FFE5CCFFFCEDFFFFFBFFFDFFF3F0F9FDFCFFFDFBFFFEFDFF
            0000FFFAFFFFF7FFFFFAFFF9FAF8F3FFFB758E807D93879DBBB06E9A93729D9A
            94ADB1AAB7BFF4FEFFFDFDFFFFFBFFFFFBFDFFF2ECFFF6EAFCF7E8EAEAD8FFFF
            F2FFFFF0FFFFEAB2AD94685C40796448937758B29170DCB997F3CFABFFE4C0FD
            D8B2D8AD82CCA17AE8C6A8FBE2CEFFF9F0FFFEFEF2F0F6FBFDFFF9FBFFFAFCFF
            0000FFF9FFFFFAFFFEF7FEFCFEFEF4FFFBB5CBBF5B75689FBFB4739D965F8785
            95B2B6B4C6CDEFF9FFFFFDFFFFEFF6A79094DDC7C1FFEEE3E8DBCDEFE7D6DEDA
            C8E9E8D3E4E2CAFFFFEDA39A7F6C5E42AC977B9F8567D5B697E4C3A2F6D3B2F8
            D1ABF2C599D5A87CE0BA97E4C6ADF9E6D7FFFFFBF8F3F5FDFCFFF8FAFFF9FBFF
            0000FCF4FFFFFAFFF8F6FCFBFFFFF2FFF7E3FAEC4562539DC0B2729B935E8681
            89A7A8ACC0C5F4FEFFF5F3F9D2C4CA7D686AEBD3CDE1CBBFD8C5B8E1D2C2D6CF
            BCC1BBA8F1ECD7E8E4CCEEE9D09D94797163479E896DA78D6FB5977AEECFB0FB
            D5B2FFE1B5EFBE90EAC19ADAB89AF0D8C4FFFFF7FCF4F4FCFAFFF8FAFFF7FBFF
            0000FDFAFFFBF9FFF7FAFFF9FFFEF8FFF9E6F9EA9DBAAA53776794B8AC5A7C75
            799998AEC5C7F1FCFFFDFEFFA69DA07B6C6AB19A92F0D8CCDFC9BDDFCCBDEDDF
            CDD0C6B4D1CAB6E4E0C8D9D5BDEAE5CC6D64498B7F63B09D82AC9478CBAE93EA
            C7A6FFD7ABE7B688FFD4ABC09B79EED2BAFFFFF2F8ECE8FFFEFFF9FBFFF6FBFF
            0000FBFAFFF4F6FFF8FFFFF8FFFCF5FDF2F8FFF5CCE7D3486855AFCCBD8AA59B
            53716C97AFADD1DBDBFDFFFFD2CDCC4237338D7A72B49C90B7A091A48F80C1AF
            9ED2C4B2B9B09CBBB6A1BBB8A3CBC9B1D6D2B969624791846A9C886FAF977FFA
            DBBCF5C9A0EBBA8EFFD9B0B8906DEDCDB0FFFEEAFFF8ECFFFBF8FBFAFEF7FAFF
            0000F9FAFFEFF4FDF8FFFFF3FBF4EDEDDFFFFFF2F1FFEF92AC94627260BDCEC0
            445D538CA39BC6CDC8FFFFFCF2EFEA635D565143374B3829665142685344533F
            2E5E4C3B685A4859503C726F5A62624A7F7F67C8C7AD4D482FB3A78F827059B8
            9D82F8D0ADFFD5ACFFE7C1BB916CE4BE9EFFE8CFFFFFF1FFFFF6FEF9F8FCFBFD
            0000F8FAFFFAFEFFF8FFFEFCFFF5FFFFF2FFFFEEF3FFE3EDFCE16C6E5AA2A595
            8295865C6D62A2A59CF2EFE7FFFFF8EAE8DDFFFFF2FFF6E6F6E6D6FDE8D9EDD6
            C6DBC4B4D7C5B4AEA29096917C8688724E513B81856C9E9D888D8770958774AF
            9980DDB99BFED1AFFFD5B0BC906BBB9370DCB89AFFEBD3FFF7E8FFFDF6FFFFFC
            0000FBFDFFFBFEFFF6FCF7FFFFF5FFFFF0FFF2D9D9D7B9DCDCBED2C2AB6B5D4A
            B8C1AD616C5C959186E1D8CEFFFFF5FFFFF4DEDECCFFFFEEFFFFF1FFF9E8FFFF
            F1FFFFF1FFEADAFFF4E3FFFFF1FFFFF1E4E9D42A321BBCBEAA57564197917E89
            7863C6A78EFAD2B6FFDAB9F6C9A7C89C77DFB794F7D8B9FFF7E1FFFBEFFFFFF8
            0000FFFDFFF7F7F7FFFFF9FFF8E9F2D3BEEACCB1DACDADC4B797D7B89FAE937E
            74715CA0A491A19688C1B4A6F5F1DFFCFEEB93988352533FA7A08DD4C4B3E8CF
            BFFFF3E4FCE3D3FFFFF1FAF0DEFAF9E5FFFFF15D66515F6651ACB19C7E7D69A4
            9985A58A76DAB69EF7CFB2FFEAC7D2A57FDFB48DCFAB87E3C6ABFDEBDAFFF7EB
            0000FFFDFFFFFFFEFFFFF8F7E9D7E8C1ABF3C8ADF4DBB9E7CEACD7AA8FFFE0C9
            60533D95907B988877938170CDC6B3FDFEEAF9FFED6168535F5946A19180C0A7
            97E7CABBEED3C5D6C1B2ECE2D1FFFFF2FFFFF2919C8838432FC1C7B44E503DA4
            9D8AA68F7FC4A38FEEC7ABFFEAC7ECBE95FFD4A9E0B992E3C4A3F6E1CCFFF0E0
            0000FBF6F7FFFFFCECE8DDDBCBBAFFDBC5FFD8BDE2C3A2E9C9A6FFD3B4E4B79C
            E0CDB26E6348AB9B84887A63A09C84D3D7BEFFFFF0FEFFED6B6453534636816C
            5D866F60BFA99DB8A79AC3BAACFCFAE8FFFFF0E6EFDA2D3621A4AD989DA38C75
            725D9E8672A28069CAA387E6BE9BE4B992FFE7BDFBD5B2F8D9BAFAE5D0FFF6E5
            0000FFFFFBFBF9F1F3EDE0F0E0CFEACAB7FFDAC2F5CFB1FAD3B3FFE0BFEEC8A6
            EDD4B4D0C1A06D64439290717B83648D9277CAC3B0FFF8EAFFFFF4BBB2A46F66
            595E56495C56495953467D776AFFFFF2FFFFF1FCFFE9484C33ADB69BCED8BA5C
            5D3DC4AD8D987554CEA888E2BD9BF0CBA9D9B695DABCA1F8DEC6FDE7D5FFF5E6
            0000F9FBF5FFFFF9FFF8EEE1D2C2E8D0BEEACAB3FCD7BDFBD3B6F4CDADFFE8C6
            F0D5B3FFF0CCA19A79565A379FAA8A83886DAEA08ED2BFB0FFF6E9FFF9EBFFFA
            EDE4E3D5ABAA9CC5C2B4F2EADDFFFFF2FFFFF0DFD9C28D8A6ED0D2B4D9E0BD77
            7753A6906CB1916EC9AA89E3C4A5C9AB8ECBB096C3AB95E2CCBAFEEBDCFFF9EC
            0000FEFDF9FFFFFBFFFDF4C5B7ABE5D0C1E7CCB8FFDFC8F0CDB3ECCAADDDC0A1
            F5DDBFDBCCACE2DABD8D8D6F494E33A7A78F827461A79584CFC0B0FFF9E8FFFF
            F4FFFAEBFFFFF4FFFEEEFFFFF2FFF8E7FFEED9CDBBA4CCBEA2E4DABCE4E2C097
            916E7C6B4AA79272B5A081DEC8ACCEB99ED1BCA6DCC9B4FDEBDAFFF3E6FFFDF1
            0000FEFCFBFCF9F5E4DED992877FB7A699E0CCBBE2C9B5CFB59DA4896F9B8268
            C9B499B5A68C9E947C8F8B737F7E695E5B46A89D896B5E489E937FC6BBA7DDD3
            C1FDF1DFF2E2D1FFFFF1FFE8D7FFF6E3DDBEA9EDD1B9ECD6BAE7D5B6F0E6C4B4
            AE8B776F519D9479A89E86CFC5ADE0D3BDB9AE9AE1D4C4FFF7E9FFFBF1FFFFF8
            0000FFFEFFF2EDEEDFD7D790858184776FE4D6CAD6C6B6D8C7B49C897467543F
            A4937ED8CBB5AA9F8B4E4734ACA5947F7865665E47AFA58D99917A8C816BB8AB
            95DFCEB9F5DDC9EACCB9F2CDB9FFF0DAE5BCA5FFDEC4EED2B4E4CFAFE7DBB7BD
            B8975C5F459398839C9E8BBEC0ADBEBEAEA09F91D5D3C8FCFAF0FFFFF8FFFFFB
            0000FFFCFFFDF7FCF9F3F4C1B9B9685F5BDFD6CDECE4D7FFFAECFFF7E63C301E
            A59888FFFAEAFFFFF452463A74685EDCD1C3B7B19A474327868266AFA88D8A7C
            65A6957BCFB49FEECEB7F9D2BCFAD0B9FCD4BBF2D0B3E9D0B0EEDDBCE2DCB7BF
            C2A23E4A369AAB9D9DAB9FC0CCC08D978BA8B0A6D8DCD6FDFFFCFFFFFCFFFFFE
            0000FFF8FFFDF6FDFFFBFFEBE6E754504FB3B0ABFBF9F1FFFFF7FFFFF75B5548
            857C72FFFEF4FFFFF77E6E677B68638D7F73ACA89088886A5654366B674AA69B
            80A99B7FA89078C3A58CD8B49CCBA88EE4C6ABEBD3B5E1D5B3E6E4C1E2EBC3A6
            B9984A64549AB7AEA4BFB6C1D8D080958DAEBDB9D4DFDCF4FCFBF8FEFDF8FDFC
            0000FFFBFFFFFBFFFFFDFFFFFEFF575757969997FDFFFCF7FBF5F6F9F0A5A39B
            5E5B53E3DBD4FFFFFBB1A09D36232061514A59564161634699987C8482645C58
            3C8D82669D8C7175604581684E937B5F99876ADAD2B4B9BD9AADBE99BAD8AF61
            8364426658678A8689AAA6AAC7C495B0ADB2C8C6E4F4F3F4FFFFF5FDFDF4FCFC
            0000FFFBFFFFFBFFFDF9FFFDFCFF797C80B7BCBDFAFFFFB1B8B5F7FDF8C6CAC5
            575450CFC8C5FFFEFCFFF7F5FFFDFCFFFFF9FFFFF17E8167ADB096BFC3A6B3B4
            9A6663475E573C968B7064593E60583B6767497A85657C9573668C68477A5438
            6C4E3964595F868489AEACA4C4C3B9D5D5D4ECECEBFDFEF3FFFFF4FDFFF4FDFF
            0000FCF4FFFFFCFFFFFDFFFAFBFFBFC2C6FAFFFFE4ECEC808887FAFFFFF7FCFA
            424341A19C9BFFF8F8FFFDFEC0AEAFBFB0ADCCC9BA9C9F899EA48DC0C6ADD9DF
            C6D5D9C0A3A48A5C5D435B5A4054573D5460445971535177593D6F4F29694628
            654B67968D8CB2B2B1D3D3C5E4E5D3EFF0E3FAFCEFFFFFF2FEFFF4FDFFF4FDFF
            0000FFFCFFF9F5FBFFFDFFFDFEFFF1F4F8FAFFFFB4BCBCAEB6B5F2F8F7FBFFFF
            797979B2ADAEFFFEFEFFF7F76D5F60493E3A474338707363686E5DB1BAA6C7D0
            BBE6EFDAE9F3DCC4CEB7A8B0998C9981687C65506E55426F5549836767AA8F89
            C8B4ACD6CFC7E6E7DCF8F9E3FCFEEAFFFFEFFFFFF3FFFFF3FCFFF6FDFFF6FDFF
            0000FFFDFFFBFAFEFFFEFFFDFFFFF5F9FAF0F5F6BDC2C3F3F8F9FBFFFFF5FAF9
            C2C4C4C4C2C1F7F3F2FFFEFEFFF8F8F4EBE8FFFCF7E7E8DE94988DD0D9CCF9FF
            F4F8FFF4F7FFF1DAE6D2E4F0DEE6F4E2EAFEEBEAFFF3DDFFF3CEFFEEC9FFF1D2
            FFFBDEFFFBEAFFFFEDFFFFEBFDFEEEFBFDF2FEFFF7FEFFF6FBFCFAFDFFFAFEFF
            0000F9F9F9FFFFFFFFFFFFFAFAFAF5F7F7FDFFFFF2F4F4EEF3F2F8FAFAEDEFEF
            FFFFFEFCFDFBF6F4F3F6F3EFFFFFFCFBF6F3FFFEFDFFFFFEF0F1EDE8EFE8F0FB
            F1F0FEF2EFFBEFF8FFF7FAFFF8FAFFF8F6FFF7F0FFF8E7FFF7DDFEF7DCFFFCE1
            FFFFEDFFFFF4FFFFF4FEFEF1F9F9F3F8F9F8FCFDFBFDFEFBFBFBFEFDFFFEFEFE
            0000FCFDFBFFFFFEFAFBF9FFFFFEFCFCFCFEFEFEFFFFFFF3F3F3FDFDFDFFFFFE
            F8F9F7FFFFFCFFFFFCFFFFFCFEFFFBFFFFFEFBF6F8FDF8FAFFFEFFEDF2F0F8FF
            FEF3FFF9E8F5EDF8FFFBF8FCF6F9FAF6FAFBF9F8FDFCF6FEFEF0FDFFEAFBFEE8
            FAFBF4FCFBFAFDFBFBFDFDFEFFFDFFFFFFFFFFFEFFFDFEFFFBFCFFFEFFFFFEFF
            0000FFFFFCFDFEFAF9F8F4FFFFFCFFFFFEF1EDECFFFFFEFFFFFEFFFDFCFFFFFE
            F2F3F1FFFFFCFDFFFCFBFFF9F7FEF7F9FDF8FFFDFFFCF4FBFFFDFFF5F9FAF8FF
            FFF4FFFDEDF6F3FBFFFEFDFBFAFFFCFDFFFCFFFFFCFFFFFBFFFFFBFFFFFBFFFF
            FCFFFFFAFBFFFCF9FFFEFDFFFFFCFFFEFEFFFFFCFFFEFEFFFDFDFFFEFEFFFFFE
            0000FEFFFAFFFFFBFFFEFAF8F7F3FFFFFCFFFFFCFFFFFEFFFCFBFFFEFDFDFBFA
            FFFFFCF7FBF6FDFFFBE1E8E1FAFFF9F8FCF7FFF9FFFFFBFFFFFCFFF4F7FBF5FC
            FFF6FFFFFAFFFFF8FAFAFFFCFDFFFDFFFFFBFFFFFAFFFFF7FFFFF7FFFFF7FFFF
            FAFFFFFDFFFFFFFCFFFDFAFFFDFAFFFAF8FFFAF8FFFDFBFFFFFCFFFEFEFFFEFE
            0000}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Shape5: TfrxShapeView
          Top = 278.700990000000000000
          Width = 718.110236220000000000
          Height = 76.204700000000000000
          ShowHint = False
        end
        object Memo43: TfrxMemoView
          Left = 2.779530000000000000
          Top = 339.614410000000000000
          Width = 359.055350000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestMun"]')
          ParentFont = False
        end
        object memHomolog: TfrxMemoView
          Left = 11.338590000000000000
          Top = 95.267780000000000000
          Width = 532.913730000000000000
          Height = 132.283550000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -64
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEM '
            'VALOR FISCAL')
          ParentFont = False
        end
        object Memo134: TfrxMemoView
          Left = 430.866420000000000000
          Top = 173.417440000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'www.nfe.fazenda.gov.br/portal')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          ShiftMode = smDontShift
          Top = 0.779530000000001200
          Width = 718.110236220000000000
          Height = 56.692950000000000000
          ShowHint = False
        end
        object Line1: TfrxLineView
          Left = 582.047620000000000000
          Top = 2.338590000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 585.827150000000000000
          Top = 6.338590000000000000
          Width = 128.504020000000000000
          Height = 49.133890000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%g'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NF-e'
            'N'#186'.: [NFE."nNF"]'
            'S'#233'rie: [NFE."Serie"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 29.102350000000000000
          Width = 580.661410000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo3: TfrxMemoView
          Left = 3.000000000000000000
          Top = 30.102350000000000000
          Width = 134.165430000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DATA DO RECEBIMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Left = 159.000000000000000000
          Top = 29.102350000000000000
          Height = 28.346456690000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo4: TfrxMemoView
          Left = 162.000000000000000000
          Top = 30.102350000000000000
          Width = 226.299320000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O E ASSINATURA DO RECEBEDOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 4.000000000000000000
          Top = 3.881879999999999000
          Width = 572.149660000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TextoCanhoto"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 2.000000000000000000
          Top = 66.984230000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Frame.Style = fsDash
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 426.661720000000000000
          Top = 76.149660000000000000
          Height = 161.385826770000000000
          ShowHint = False
          Diagonal = True
        end
        object Line6: TfrxLineView
          Left = 426.527830000000000000
          Top = 125.842610000000000000
          Width = 291.023810000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          Left = 428.086890000000000000
          Top = 127.842610000000000000
          Width = 81.252010000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CHAVE DE ACESSO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 429.086890000000000000
          Top = 138.960730000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '0000.0000.0000.0000.0000.0000.0000.0000.0000.0000.0000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."CodBarra"]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 426.527830000000000000
          Top = 159.078850000000000000
          Width = 291.023810000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line8: TfrxLineView
          Top = 208.330860000000000000
          Width = 717.732283460000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo10: TfrxMemoView
          Left = 428.086890000000000000
          Top = 210.212740000000000000
          Width = 281.567100000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DADOS DA NFe')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 2.000000000000000000
          Top = 208.433210000000000000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'NATUREZA DA OPERA'#199#195'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 2.000000000000000000
          Top = 217.771800000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."NatOper"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 101.118120000000000000
          Top = 75.929190000000000000
          Width = 130.826840000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O DO EMITENTE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line9: TfrxLineView
          Left = 321.700990000000000000
          Top = 76.149660000000000000
          Height = 132.283550000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo14: TfrxMemoView
          Left = 322.480520000000000000
          Top = 75.929190000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DANFE')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 322.480520000000000000
          Top = 96.826840000000000000
          Width = 102.047310000000000000
          Height = 34.015770000000010000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DOCUMENTO AUXILIAR DA NOTA FISCAL ELETR'#212'NICA')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 323.480520000000000000
          Top = 134.622140000000000000
          Width = 52.913420000000000000
          Height = 22.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '0 - ENTRADA'
            '1 - SA'#205'DA')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 386.732530000000000000
          Top = 134.622140000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."nTpNF"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 326.260050000000000000
          Top = 161.078850000000000000
          Width = 94.488250000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186': [NFE."nNF"]'
            'S'#201'RIE: [NFE."Serie"]'
            'FOLHA: [Page] / [TotalPages]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line10: TfrxLineView
          Top = 236.669450000000000000
          Width = 717.732283460000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo19: TfrxMemoView
          Left = 2.000000000000000000
          Top = 238.228510000000000000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 2.000000000000000000
          Top = 246.008040000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitIE"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 257.008040000000000000
          Top = 236.669450000000000000
          Width = 168.181200000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL DO SUBT. TRIBUT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 257.008040000000000000
          Top = 246.008040000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitIEST"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 490.118430000000000000
          Top = 236.669450000000000000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 490.118430000000000000
          Top = 246.008040000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitCNPJ"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 253.228510000000000000
          Top = 236.669450000000000000
          Height = 27.212598430000000000
          ShowHint = False
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 483.779840000000000000
          Top = 236.669450000000000000
          Height = 28.346456690000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo25: TfrxMemoView
          Left = 0.779530000000000000
          Top = 264.141930000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DESTINAT'#193'RIO / REMETENTE')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 2.779530000000000000
          Top = 278.700990000000000000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'NOME / RAZ'#195'O SOCIAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 2.779530000000000000
          Top = 288.039580000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestNome"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 471.441250000000000000
          Top = 278.700990000000000000
          Width = 43.456710000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 471.441250000000000000
          Top = 288.039580000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestCNPJ"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 626.401980000000000000
          Top = 278.700990000000000000
          Width = 88.811070000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DATA DA EMISS'#195'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 626.401980000000000000
          Top = 288.039580000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DtEmissao"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          Left = 621.842920000000000000
          Top = 278.700990000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line14: TfrxLineView
          Top = 304.716760000000000000
          Width = 717.354330710000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo32: TfrxMemoView
          Left = 626.401980000000000000
          Top = 304.937230000000000000
          Width = 88.811070000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DATA DA SA'#205'DA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 626.401980000000000000
          Top = 314.275820000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HideZeros = True
          Memo.UTF8W = (
            '[NFE."DtSaida"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          Top = 330.173470000000000000
          Width = 717.354330710000000000
          ShowHint = False
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 467.661720000000000000
          Top = 278.700990000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo34: TfrxMemoView
          Left = 2.779530000000000000
          Top = 305.157700000000000000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 2.779530000000000000
          Top = 314.496290000000000000
          Width = 355.275820000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestEnd"]')
          ParentFont = False
        end
        object Line17: TfrxLineView
          Left = 550.811380000000000000
          Top = 305.157700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo36: TfrxMemoView
          Left = 551.811380000000000000
          Top = 305.157700000000000000
          Width = 20.779530000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 551.811380000000000000
          Top = 314.496290000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestCEP"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 365.614410000000000000
          Top = 305.157700000000000000
          Width = 88.811070000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'BAIRRO / DISTRITO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 365.614410000000000000
          Top = 314.496290000000000000
          Width = 185.196970000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestBairro"]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          Left = 361.834880000000000000
          Top = 305.157700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo40: TfrxMemoView
          Left = 626.401980000000000000
          Top = 330.055350000000000000
          Width = 88.811070000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'HORA DA SA'#205'DA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 2.779530000000000000
          Top = 330.275820000000000000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'MUN'#205'C'#205'PIO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line19: TfrxLineView
          Left = 393.850650000000000000
          Top = 330.275820000000000000
          Height = 23.811023620000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo44: TfrxMemoView
          Left = 396.850650000000000000
          Top = 330.275820000000000000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'FONE / FAX')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 396.850650000000000000
          Top = 339.614410000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestFoneFax"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 365.614410000000000000
          Top = 330.275820000000000000
          Width = 20.779530000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 365.614410000000000000
          Top = 339.614410000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestUF"]')
          ParentFont = False
        end
        object Line20: TfrxLineView
          Left = 361.834880000000000000
          Top = 330.275820000000000000
          Height = 24.944881890000000000
          ShowHint = False
          Diagonal = True
        end
        object Line21: TfrxLineView
          Left = 482.779840000000000000
          Top = 330.055350000000000000
          Height = 24.188976380000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo41: TfrxMemoView
          Left = 485.779840000000000000
          Top = 330.055350000000000000
          Width = 100.149660000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 485.779840000000000000
          Top = 339.393940000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestIE"]')
          ParentFont = False
        end
        object Memo133: TfrxMemoView
          Left = 430.866420000000000000
          Top = 159.519790000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulta de autenticidade no portal nacional da NF-e')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Left = 430.866420000000000000
          Top = 189.756030000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ou no site da SEFAZ Autorizadora.')
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 427.086890000000000000
          Top = 217.771800000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."NumProtocolo"]')
          ParentFont = False
        end
        object memHora: TfrxMemoView
          Left = 627.401980000000000000
          Top = 339.393940000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[(<Time>)]')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 120.944960000000000000
          Top = 85.488250000000000000
          Width = 196.535560000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitNome"]')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 121.724490000000000000
          Top = 125.504020000000000000
          Width = 196.535560000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitEnd"]'
            '[NFE."EmitBairro"]'
            '[NFE."EmitMun"] - [NFE."EmitUF"]'
            '[NFE."EmitCEP"]'
            'Fone / FAX: [NFE."EmitFone"]')
          ParentFont = False
        end
        object Subreport1: TfrxSubreport
          Top = 374.732530000000000000
          Width = 718.110236220000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = RelDanfe.Page2
        end
        object memFatura: TfrxMemoView
          ShiftMode = smDontShift
          Left = 0.779530000000000000
          Top = 357.055350000000000000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'FATURA / DUPLICATA')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          Left = 430.110700000000000000
          Top = 79.149660000000000000
          Width = 79.000000000000000000
          Height = 34.015748030000000000
          ShowHint = False
          BarType = bcCode128C
          Expression = '<NFE."CodBarra">'
          Rotation = 0
          ShowText = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object BarCode2: TfrxBarCodeView
          Left = 509.110699999999900000
          Top = 79.149660000000000000
          Width = 79.000000000000000000
          Height = 34.015770000000010000
          ShowHint = False
          BarType = bcCode128C
          Expression = '<NFE."NumProtocolo">'
          Rotation = 0
          ShowText = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 120.944960000000000000
        Top = 752.126470000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        object NFEObsContribuinte: TfrxMemoView
          ShiftMode = smDontShift
          Left = 3.779530000000000000
          Top = 28.897650000000000000
          Width = 419.527830000000000000
          Height = 79.370098270000000000
          ShowHint = False
          DataField = 'ObsContribuinte'
          DataSet = frxDBDataset1
          DataSetName = 'NFE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."ObsContribuinte"]')
          ParentFont = False
        end
        object Memo131: TfrxMemoView
          Left = 3.779530000000000000
          Top = 17.559060000000040000
          Width = 141.724490000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES COMPLEMENTARES')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 430.866420000000000000
          Top = 17.559060000000040000
          Width = 92.590600000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'RESERVADO AO FISCO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line73: TfrxLineView
          Left = 427.086890000000000000
          Top = 27.897650000000000000
          Height = 79.370130000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Width = 0.500000000000000000
          Diagonal = True
        end
        object Line74: TfrxLineView
          Top = 27.897650000000000000
          Width = 718.110236220000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo137: TfrxMemoView
          ShiftMode = smDontShift
          Left = 430.866420000000000000
          Top = 28.897650000000000000
          Width = 283.464750000000000000
          Height = 79.370098270000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'NFE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."ObsFisco"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DADOS ADICIONAIS')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      ColumnWidth = 27.142857142857100000
      object MasterData2: TfrxMasterData
        Height = 60.590600000000000000
        Restrictions = [rfDontSize]
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Columns = 9
        ColumnWidth = 75.590551181102400000
        DataSet = frxDBDataset3
        DataSetName = 'NFE_Cob'
        RowCount = 0
        Stretched = True
        object Memo148: TfrxMemoView
          Left = 2.559060000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Cob."NumDuplicata"]')
          ParentFont = False
        end
        object Memo149: TfrxMemoView
          Left = 2.559060000000000000
          Top = 20.015770000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DtVencimento'
          DataSet = frxDBDataset3
          DataSetName = 'NFE_Cob'
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Cob."DtVencimento"]')
          ParentFont = False
        end
        object Memo150: TfrxMemoView
          Left = 2.559060000000000000
          Top = 37.913420000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ValorDuplicata'
          DataSet = frxDBDataset3
          DataSetName = 'NFE_Cob'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Cob."ValorDuplicata"]')
          ParentFont = False
        end
      end
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 208
    Top = 400
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'NFE'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CodBarra=CodBarra'
      'NatOper=NatOper'
      'Serie=Serie'
      'DtEmissao=DtEmissao'
      'DtSaida=DtSaida'
      'nNF=nNF'
      'nTpNF=nTpNF'
      'EmitNome=EmitNome'
      'EmitCNPJ=EmitCNPJ'
      'EmitIE=EmitIE'
      'EmitIEST=EmitIEST'
      'EmitEnd=EmitEnd'
      'EmitBairro=EmitBairro'
      'EmitMun=EmitMun'
      'EmitUF=EmitUF'
      'EmitCEP=EmitCEP'
      'EmitIM=EmitIM'
      'EmitFone=EmitFone'
      'EmitMunUF=EmitMunUF'
      'EmitFoneStr=EmitFoneStr'
      'LogotipoEmitente=LogotipoEmitente'
      'DestNome=DestNome'
      'DestCNPJ=DestCNPJ'
      'DestIE=DestIE'
      'DestEnd=DestEnd'
      'DestBairro=DestBairro'
      'DestMun=DestMun'
      'DestUF=DestUF'
      'DestCEP=DestCEP'
      'DestFoneFax=DestFoneFax'
      'QtdeItem=QtdeItem'
      'Item=Item'
      'BaseCalcICMS=BaseCalcICMS'
      'ValorICMS=ValorICMS'
      'BaseCalcICMSSubs=BaseCalcICMSSubs'
      'ValorICMSSubs=ValorICMSSubs'
      'ValorTotProd=ValorTotProd'
      'ValorFrete=ValorFrete'
      'ValorSeguro=ValorSeguro'
      'Desconto=Desconto'
      'OutrasDesp=OutrasDesp'
      'ValorIPI=ValorIPI'
      'ValorTotNota=ValorTotNota'
      'BaseCalcISSQN=BaseCalcISSQN'
      'ValorTotServ=ValorTotServ'
      'ValorTotISSQN=ValorTotISSQN'
      'TraModFrete=TraModFrete'
      'TraCNPJ=TraCNPJ'
      'TraNome=TraNome'
      'TraIE=TraIE'
      'TraEnd=TraEnd'
      'TraMun=TraMun'
      'TraUF=TraUF'
      'VeiCodigoANTT=VeiCodigoANTT'
      'VeiPlaca=VeiPlaca'
      'VeiUF=VeiUF'
      'VolQuantidade=VolQuantidade'
      'VolEspecie=VolEspecie'
      'VolMarca=VolMarca'
      'VolNumeracao=VolNumeracao'
      'VolPesoBruto=VolPesoBruto'
      'VolPesoLiquido=VolPesoLiquido'
      'ObsFisco=ObsFisco'
      'ObsContribuinte=ObsContribuinte'
      'tpAmb=tpAmb'
      'tpEmis=tpEmis'
      'TextoCanhoto=TextoCanhoto'
      'NumProtocolo=NumProtocolo'
      'cUF=cUF'
      'vTotTrib=vTotTrib')
    DataSet = cdsNFE
    BCDToCurrency = False
    Left = 32
    Top = 304
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'NFE_Itens'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nNF=nNF'
      'ItemCodigo=ItemCodigo'
      'ItemNCM=ItemNCM'
      'ItemDescricao=ItemDescricao'
      'ItemCST=ItemCST'
      'ItemCFOP=ItemCFOP'
      'ItemUnidade=ItemUnidade'
      'ItemQuantidade=ItemQuantidade'
      'ItemVUnit=ItemVUnit'
      'ItemVTotal=ItemVTotal'
      'ItemBCalcIcms=ItemBCalcIcms'
      'ItemVICMS=ItemVICMS'
      'ItemVIPI=ItemVIPI'
      'ItemAliqICMS=ItemAliqICMS'
      'ItemAliqIPI=ItemAliqIPI'
      'infAdProd=infAdProd')
    DataSet = cdsNFE_Itens
    BCDToCurrency = False
    Left = 120
    Top = 304
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'NFE_Cob'
    CloseDataSource = False
    DataSet = cdsCobranca
    BCDToCurrency = False
    Left = 216
    Top = 304
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 208
    Top = 444
  end
  object RelDanfePais: TfrxReport
    Version = '4.12'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40074.348425925900000000
    ReportOptions.LastChange = 41571.677610266200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ChildFaturaOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  ChildFatura.Visible := (<Page#> < 2) ;'
      'end;'
      ''
      'procedure GroupHeader1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <NFE."tpEmis"> = '#39'1'#39' then'
      '  begin'
      '     Memo10.Text := '#39'PROTOCOLO DE AUTORIZA'#199#195'O DE USO'#39';'
      
        '     Memo133.Visible := True;                                   ' +
        '                      '
      
        '     Memo134.Visible := True;                                   ' +
        '                      '
      
        '     Memo135.Visible := True;                                   ' +
        '                      '
      
        '     Memo136.Visible := True;                                   ' +
        '                      '
      '     BarCode2.Visible := False;    '
      '  end'
      '  else  '
      '  if <NFE."tpEmis"> = '#39'4'#39' then'
      '  begin'
      '     Memo10.Text := '#39'N'#218'MERO DE REGISTRO DPEC'#39';'
      
        '     Memo133.Visible := True;                                   ' +
        '                      '
      
        '     Memo134.Visible := True;                                   ' +
        '                      '
      
        '     Memo135.Visible := False;                                  ' +
        '                       '
      
        '     Memo136.Visible := True;                                   ' +
        '                      '
      '     BarCode2.Visible := False;    '
      '  end'
      '  else              '
      '  begin'
      '     Memo10.Text := '#39'DADOS DA NFe'#39';'
      
        '     Memo133.Visible := False;                                  ' +
        '                       '
      
        '     Memo134.Visible := False;                                  ' +
        '                       '
      
        '     Memo135.Visible := False;                                  ' +
        '                       '
      
        '     Memo136.Visible := True;                                   ' +
        '                      '
      '     BarCode2.Visible := True;    '
      '  end;'
      ''
      
        '  memHomolog.Visible := (<NFE."tpAmb"> = '#39'2'#39');                  ' +
        '                                                            '
      'end;'
      ''
      'procedure memFaturaOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo137.Visible := (<Page#> < 2);  '
      'end;'
      ''
      'procedure Child1OnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      
        '   GroupFooter1.Height := Engine.FreeSpace - Child1.Height + Gro' +
        'upFooter1.Height - 0.70;'
      
        '   Line78.Height := GroupFooter1.Height;                        ' +
        '                           '
      'end;'
      ''
      'procedure ChildFaturaOnAfterCalcHeight(Sender: TfrxComponent);'
      'begin'
      
        '  Memo137.Visible := (<Page#> < 2) and  (ChildFatura.Height > 0)' +
        ';  '
      'end;'
      ''
      'begin'
      'end.')
    OnBeforePrint = RelDanfePaisBeforePrint
    Left = 176
    Top = 216
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'NFE'
      end
      item
        DataSet = frxDBDataset3
        DataSetName = 'NFE_Cob'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'NFE_Itens'
      end
      item
        DataSet = frxDBDataset4
        DataSetName = 'NFE_logo'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = 14211288
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
      OnBeforePrint = 'Page1OnBeforePrint'
      object GroupHeader1: TfrxGroupHeader
        Height = 279.315090000000000000
        Top = 18.897650000000000000
        Width = 1084.725110000000000000
        OnBeforePrint = 'GroupHeader1OnBeforePrint'
        Child = RelDanfePais.ChildFatura
        Condition = 'NFE."nNF"'
        ReprintOnNewPage = True
        ResetPageNumbers = True
        StartNewPage = True
        Stretched = True
        object memDemonst: TfrxMemoView
          Left = 192.756030000000000000
          Top = 207.874150000000000000
          Width = 616.063390000000000000
          Height = 64.252010000000000000
          Visible = False
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -64
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DEMONSTRA'#199#195'O')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          Left = 58.472480000000000000
          Top = 58.645640000000000000
          Width = 1025.763779530000000000
          Height = 159.354360000000000000
          ShowHint = False
        end
        object picLogo: TfrxPictureView
          Left = 60.472480000000000000
          Top = 61.252010000000000000
          Width = 128.504020000000000000
          Height = 113.385900000000000000
          ShowHint = False
          DataField = 'IMG_LOGO'
          DataSet = frxDBDataset4
          DataSetName = 'NFE_logo'
          Picture.Data = {
            07544269746D6170B6140000424DB61400000000000036000000280000002A00
            000029000000010018000000000080140000C40E0000C40E0000000000000000
            0000FFFDFFFFFDFFFFFDFFFFFEFFFDFFFFFDFFFFFBFFFFFBFFFEFBFFFFFBFFFF
            FDFFFFFFFEFFFFFEFFFFFDFFFFFBFFFFFBFFF7FAFEFBFFFFFFFDFCFFFDF9FFFF
            F8FFF6EBFFEBDFFFF0E3FFFFF1FFFFF3FFFFF7FFFFFBFBFFFEFBFFFFFBFEFFFA
            FDFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            0000FFFBFFFFFCFFFFFDFFFEF9FBFFFEFEFFFFFEFCFFFDFDFFFCFDFFFEFCFFFD
            FBFCFAFCFCFCFFFEFFFFFDFFFFF7FEF7F1F6FDFEFFF6F6F6FFFFFCFFF6F1FFF0
            E6F8DBCDCAA99AE7C9B8FFF8E6FFFFEFFFFFF2FFFEF5FFFFFCFFFEFFFBF9FFFD
            FDFFFDFCFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFBFFFFF8FEFFF9FCFFFEFFFFFFFEFBFCF8F7FBF5FBFFFBF9FFF9F9FFF9
            FDFFFCFDFFFEFFFFFFFFFEFFFFFDFFFFFDFFFDFCFEFFFDFCFFFEFAF4DED8F1D3
            C8ECC8B8CBA390D3AE9AFFE2CDFFFAE6FFFFF2FFFFF6FFFFFAFFFEFFFEFAFFFE
            FAFFFDFCFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFBFFFFF5FBFFF9FBFFFEFEFCFCF6F2F7EEF7FFF4F8FFF8F3FFF3E9F7EB
            E7F2E8E9F1EAE9F0EDEAEFEEF3F4F8FDFEFFFBFDFDFFFFFCFFF4EEF0DACFF9D8
            C9F9D1BED8AC95B98D75E2BDA3FFE1CAFFFFEDFFFFF4FFFCF6FFFEFEFFFDFFFF
            FAFFFFFCFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFCFFFFFBFFFFFEFEFFFEFAF6F9F0FAFFF8F6FFF7EDFFEFD4EAD8C3D8C9
            B4C8BBB0C4B8B2C2BBB4C2BEBDC7C7C6D0D0E9F2EFFBFDF7F0E7DEE6D3C4EFCF
            BCFAD1BAFACEB1E3B596C9A184E0BEA1FFE6CEFFFDECFFFEF4FFFCF9FFFEFFFF
            FBFDFFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFF7FAFFFEFFFFFFFCFAFCF6FAFFF8F4FFF7DBF4E0A0BCA85C7D685D7E69
            5E7E6D5F7E6F637E7468837A768D89829794899A96B1B9B2D1D0C2EADCCAF1D5
            BDF7D0B4FFDDBCFFDAB5D6AE8BCFAE8DEBD3B7FFFDE8FFFFF5FFF8F1FDF7F8FB
            F8FAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFBFCFFFFFEFCFDF9F5FEF4F4FFF7DBF3E185A58D3B6248426C53517E64
            5B8671517B69416A5B3D63573C61593F60594F675F5E6E638E9483C3BAA6E8D0
            B4FFDDBCFFDFBAFFDBB1FCD5AED9B995E8D0B2FFFFEBFFFFF2FFFCF3FFFBFAFC
            FBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FFFFFEFDFFFCF2FAF3F4FFF8EBFFF194B5A0466F54407053A4D7BBA8DEC1
            9BD2B981B7A072A6946C9D8F55847B3D665E628479445D4F5E685779755DA894
            75E6C9A4F8D5AAFFDCB0FFE1B6D6BA91DBC7A4FEF2D6FFFAE7FBFBEFFFFFFCFA
            FCFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFE
            0000FAFFFEF8FFFAF0FBF3F3FFF8DBF9E66990774A72599DCCB2ADE4C9A1DBC2
            8FC4B08BBDABAADBCDCAFAEEBBE5DA91B6AC507365435E4E708370757B64807A
            5DB6A682C3A981D8B88FEACAA1C3A47DCAAE8BE8D3B4EEDFC5F9F0DCFFFFF2FC
            F8EDFFFEF7FFFEF9FFFEFAFFFDFCFDFCFEFDFCFEFDFCFEFDFDFDFFFEFDFFFEFD
            0000F1FFFEE9F7F1F8FFF7F4FFF7BFE3CD3C634D97B39F99BBAAA7DDCC9BD4C5
            A3C8C0BEDCD7D3F7F1DDFEF7E9FBF4F3FFFBE8FFF393AE9E46604E4156407B89
            71888C6FA9A183D6C1A1F1CFB1D6AD8DE1B493B68B6ADCB795EED0ADFFEAC7FF
            F0D1FFF5E0FFF7EAFFF6EEFFFFFCFFFEFFF9F9FFFDFCFFFCF9FBFFFDFAFFFFF8
            0000F1FFFFF4FFFEF8FFF8F6FFF7B6D9C53A604AA5BAAB99B3A59DD2C59ED3CA
            9BB7B7B4C7CAE8FFFFEDFFFFEEF4EFEEF0EAE7F8EBC3DACBCBE5D3738C78263B
            25919F8788896FAC9E82B9987EFFDABDF4C1A1F6C29EE0B18BE2BA90F0D0A5D4
            BA92ECD2B4FFE7D3FFF7EBFFFBF7FCF9FBF9F9FFFFFDFFFFFCFEFFFDFAFFFFF8
            0000F0FAFAF8FFFFFAFBF7FAFFF8B9D6C6365945B0C3B495ADA19BCDC37BAEA7
            9CB5B7CEDFE2E8FDFEE6F6F5D2D0CFA4A09B636D61516254425544768A7794A5
            903441295F5F4764573DA4876CE3BB9EFFDDBEDEAE8CE2B590E0B88EE4C499E3
            C69FCCB08EF3D9C1FFFDEEFFFEF6FBF5F6FBF9FFFFFDFFFFFDFFFFFDFCFFFEFB
            0000F4F8FDFDFFFFFFFBFAFAFEF8CBE4D6365343AFC1B494AEA182B1A87BABA5
            97AEB0C7D5DBEFFFFFC7D0D3ACA4A5C2B6B4DADBD1CDD6C9C2CDBD8492808894
            80AAB49D5151394F4429765E42967456EAC1A1D7AA89FFDFBAF8D1AAE6C39BF0
            D0A7C8A682EACCAFFFFCE8FFFFF5FFFDFDFFFBFFF9F6FFFEFCFFFFFCFEFFFDFE
            0000FEFBFFFFFDFFFFFAFDF8F9F5E7FBEF4761539DB1A49AB3A985B4AC5A8784
            97ADB2CFDBE1DEEAF0D9DCE1FFFAFEFFFCFDFFFEF7FFFFF7F2F5E6FFFFF4F8FF
            EDF3F9E2BBBBA34D462B503D22886C4E957153DBB593FED6B3F9D4AEFBD7B1EE
            CBA3CCA57ED9B591FFE5CCFFFCEDFFFFFBFFFDFFF3F0F9FDFCFFFDFBFFFEFDFF
            0000FFFAFFFFF7FFFFFAFFF9FAF8F3FFFB758E807D93879DBBB06E9A93729D9A
            94ADB1AAB7BFF4FEFFFDFDFFFFFBFFFFFBFDFFF2ECFFF6EAFCF7E8EAEAD8FFFF
            F2FFFFF0FFFFEAB2AD94685C40796448937758B29170DCB997F3CFABFFE4C0FD
            D8B2D8AD82CCA17AE8C6A8FBE2CEFFF9F0FFFEFEF2F0F6FBFDFFF9FBFFFAFCFF
            0000FFF9FFFFFAFFFEF7FEFCFEFEF4FFFBB5CBBF5B75689FBFB4739D965F8785
            95B2B6B4C6CDEFF9FFFFFDFFFFEFF6A79094DDC7C1FFEEE3E8DBCDEFE7D6DEDA
            C8E9E8D3E4E2CAFFFFEDA39A7F6C5E42AC977B9F8567D5B697E4C3A2F6D3B2F8
            D1ABF2C599D5A87CE0BA97E4C6ADF9E6D7FFFFFBF8F3F5FDFCFFF8FAFFF9FBFF
            0000FCF4FFFFFAFFF8F6FCFBFFFFF2FFF7E3FAEC4562539DC0B2729B935E8681
            89A7A8ACC0C5F4FEFFF5F3F9D2C4CA7D686AEBD3CDE1CBBFD8C5B8E1D2C2D6CF
            BCC1BBA8F1ECD7E8E4CCEEE9D09D94797163479E896DA78D6FB5977AEECFB0FB
            D5B2FFE1B5EFBE90EAC19ADAB89AF0D8C4FFFFF7FCF4F4FCFAFFF8FAFFF7FBFF
            0000FDFAFFFBF9FFF7FAFFF9FFFEF8FFF9E6F9EA9DBAAA53776794B8AC5A7C75
            799998AEC5C7F1FCFFFDFEFFA69DA07B6C6AB19A92F0D8CCDFC9BDDFCCBDEDDF
            CDD0C6B4D1CAB6E4E0C8D9D5BDEAE5CC6D64498B7F63B09D82AC9478CBAE93EA
            C7A6FFD7ABE7B688FFD4ABC09B79EED2BAFFFFF2F8ECE8FFFEFFF9FBFFF6FBFF
            0000FBFAFFF4F6FFF8FFFFF8FFFCF5FDF2F8FFF5CCE7D3486855AFCCBD8AA59B
            53716C97AFADD1DBDBFDFFFFD2CDCC4237338D7A72B49C90B7A091A48F80C1AF
            9ED2C4B2B9B09CBBB6A1BBB8A3CBC9B1D6D2B969624791846A9C886FAF977FFA
            DBBCF5C9A0EBBA8EFFD9B0B8906DEDCDB0FFFEEAFFF8ECFFFBF8FBFAFEF7FAFF
            0000F9FAFFEFF4FDF8FFFFF3FBF4EDEDDFFFFFF2F1FFEF92AC94627260BDCEC0
            445D538CA39BC6CDC8FFFFFCF2EFEA635D565143374B3829665142685344533F
            2E5E4C3B685A4859503C726F5A62624A7F7F67C8C7AD4D482FB3A78F827059B8
            9D82F8D0ADFFD5ACFFE7C1BB916CE4BE9EFFE8CFFFFFF1FFFFF6FEF9F8FCFBFD
            0000F8FAFFFAFEFFF8FFFEFCFFF5FFFFF2FFFFEEF3FFE3EDFCE16C6E5AA2A595
            8295865C6D62A2A59CF2EFE7FFFFF8EAE8DDFFFFF2FFF6E6F6E6D6FDE8D9EDD6
            C6DBC4B4D7C5B4AEA29096917C8688724E513B81856C9E9D888D8770958774AF
            9980DDB99BFED1AFFFD5B0BC906BBB9370DCB89AFFEBD3FFF7E8FFFDF6FFFFFC
            0000FBFDFFFBFEFFF6FCF7FFFFF5FFFFF0FFF2D9D9D7B9DCDCBED2C2AB6B5D4A
            B8C1AD616C5C959186E1D8CEFFFFF5FFFFF4DEDECCFFFFEEFFFFF1FFF9E8FFFF
            F1FFFFF1FFEADAFFF4E3FFFFF1FFFFF1E4E9D42A321BBCBEAA57564197917E89
            7863C6A78EFAD2B6FFDAB9F6C9A7C89C77DFB794F7D8B9FFF7E1FFFBEFFFFFF8
            0000FFFDFFF7F7F7FFFFF9FFF8E9F2D3BEEACCB1DACDADC4B797D7B89FAE937E
            74715CA0A491A19688C1B4A6F5F1DFFCFEEB93988352533FA7A08DD4C4B3E8CF
            BFFFF3E4FCE3D3FFFFF1FAF0DEFAF9E5FFFFF15D66515F6651ACB19C7E7D69A4
            9985A58A76DAB69EF7CFB2FFEAC7D2A57FDFB48DCFAB87E3C6ABFDEBDAFFF7EB
            0000FFFDFFFFFFFEFFFFF8F7E9D7E8C1ABF3C8ADF4DBB9E7CEACD7AA8FFFE0C9
            60533D95907B988877938170CDC6B3FDFEEAF9FFED6168535F5946A19180C0A7
            97E7CABBEED3C5D6C1B2ECE2D1FFFFF2FFFFF2919C8838432FC1C7B44E503DA4
            9D8AA68F7FC4A38FEEC7ABFFEAC7ECBE95FFD4A9E0B992E3C4A3F6E1CCFFF0E0
            0000FBF6F7FFFFFCECE8DDDBCBBAFFDBC5FFD8BDE2C3A2E9C9A6FFD3B4E4B79C
            E0CDB26E6348AB9B84887A63A09C84D3D7BEFFFFF0FEFFED6B6453534636816C
            5D866F60BFA99DB8A79AC3BAACFCFAE8FFFFF0E6EFDA2D3621A4AD989DA38C75
            725D9E8672A28069CAA387E6BE9BE4B992FFE7BDFBD5B2F8D9BAFAE5D0FFF6E5
            0000FFFFFBFBF9F1F3EDE0F0E0CFEACAB7FFDAC2F5CFB1FAD3B3FFE0BFEEC8A6
            EDD4B4D0C1A06D64439290717B83648D9277CAC3B0FFF8EAFFFFF4BBB2A46F66
            595E56495C56495953467D776AFFFFF2FFFFF1FCFFE9484C33ADB69BCED8BA5C
            5D3DC4AD8D987554CEA888E2BD9BF0CBA9D9B695DABCA1F8DEC6FDE7D5FFF5E6
            0000F9FBF5FFFFF9FFF8EEE1D2C2E8D0BEEACAB3FCD7BDFBD3B6F4CDADFFE8C6
            F0D5B3FFF0CCA19A79565A379FAA8A83886DAEA08ED2BFB0FFF6E9FFF9EBFFFA
            EDE4E3D5ABAA9CC5C2B4F2EADDFFFFF2FFFFF0DFD9C28D8A6ED0D2B4D9E0BD77
            7753A6906CB1916EC9AA89E3C4A5C9AB8ECBB096C3AB95E2CCBAFEEBDCFFF9EC
            0000FEFDF9FFFFFBFFFDF4C5B7ABE5D0C1E7CCB8FFDFC8F0CDB3ECCAADDDC0A1
            F5DDBFDBCCACE2DABD8D8D6F494E33A7A78F827461A79584CFC0B0FFF9E8FFFF
            F4FFFAEBFFFFF4FFFEEEFFFFF2FFF8E7FFEED9CDBBA4CCBEA2E4DABCE4E2C097
            916E7C6B4AA79272B5A081DEC8ACCEB99ED1BCA6DCC9B4FDEBDAFFF3E6FFFDF1
            0000FEFCFBFCF9F5E4DED992877FB7A699E0CCBBE2C9B5CFB59DA4896F9B8268
            C9B499B5A68C9E947C8F8B737F7E695E5B46A89D896B5E489E937FC6BBA7DDD3
            C1FDF1DFF2E2D1FFFFF1FFE8D7FFF6E3DDBEA9EDD1B9ECD6BAE7D5B6F0E6C4B4
            AE8B776F519D9479A89E86CFC5ADE0D3BDB9AE9AE1D4C4FFF7E9FFFBF1FFFFF8
            0000FFFEFFF2EDEEDFD7D790858184776FE4D6CAD6C6B6D8C7B49C897467543F
            A4937ED8CBB5AA9F8B4E4734ACA5947F7865665E47AFA58D99917A8C816BB8AB
            95DFCEB9F5DDC9EACCB9F2CDB9FFF0DAE5BCA5FFDEC4EED2B4E4CFAFE7DBB7BD
            B8975C5F459398839C9E8BBEC0ADBEBEAEA09F91D5D3C8FCFAF0FFFFF8FFFFFB
            0000FFFCFFFDF7FCF9F3F4C1B9B9685F5BDFD6CDECE4D7FFFAECFFF7E63C301E
            A59888FFFAEAFFFFF452463A74685EDCD1C3B7B19A474327868266AFA88D8A7C
            65A6957BCFB49FEECEB7F9D2BCFAD0B9FCD4BBF2D0B3E9D0B0EEDDBCE2DCB7BF
            C2A23E4A369AAB9D9DAB9FC0CCC08D978BA8B0A6D8DCD6FDFFFCFFFFFCFFFFFE
            0000FFF8FFFDF6FDFFFBFFEBE6E754504FB3B0ABFBF9F1FFFFF7FFFFF75B5548
            857C72FFFEF4FFFFF77E6E677B68638D7F73ACA89088886A5654366B674AA69B
            80A99B7FA89078C3A58CD8B49CCBA88EE4C6ABEBD3B5E1D5B3E6E4C1E2EBC3A6
            B9984A64549AB7AEA4BFB6C1D8D080958DAEBDB9D4DFDCF4FCFBF8FEFDF8FDFC
            0000FFFBFFFFFBFFFFFDFFFFFEFF575757969997FDFFFCF7FBF5F6F9F0A5A39B
            5E5B53E3DBD4FFFFFBB1A09D36232061514A59564161634699987C8482645C58
            3C8D82669D8C7175604581684E937B5F99876ADAD2B4B9BD9AADBE99BAD8AF61
            8364426658678A8689AAA6AAC7C495B0ADB2C8C6E4F4F3F4FFFFF5FDFDF4FCFC
            0000FFFBFFFFFBFFFDF9FFFDFCFF797C80B7BCBDFAFFFFB1B8B5F7FDF8C6CAC5
            575450CFC8C5FFFEFCFFF7F5FFFDFCFFFFF9FFFFF17E8167ADB096BFC3A6B3B4
            9A6663475E573C968B7064593E60583B6767497A85657C9573668C68477A5438
            6C4E3964595F868489AEACA4C4C3B9D5D5D4ECECEBFDFEF3FFFFF4FDFFF4FDFF
            0000FCF4FFFFFCFFFFFDFFFAFBFFBFC2C6FAFFFFE4ECEC808887FAFFFFF7FCFA
            424341A19C9BFFF8F8FFFDFEC0AEAFBFB0ADCCC9BA9C9F899EA48DC0C6ADD9DF
            C6D5D9C0A3A48A5C5D435B5A4054573D5460445971535177593D6F4F29694628
            654B67968D8CB2B2B1D3D3C5E4E5D3EFF0E3FAFCEFFFFFF2FEFFF4FDFFF4FDFF
            0000FFFCFFF9F5FBFFFDFFFDFEFFF1F4F8FAFFFFB4BCBCAEB6B5F2F8F7FBFFFF
            797979B2ADAEFFFEFEFFF7F76D5F60493E3A474338707363686E5DB1BAA6C7D0
            BBE6EFDAE9F3DCC4CEB7A8B0998C9981687C65506E55426F5549836767AA8F89
            C8B4ACD6CFC7E6E7DCF8F9E3FCFEEAFFFFEFFFFFF3FFFFF3FCFFF6FDFFF6FDFF
            0000FFFDFFFBFAFEFFFEFFFDFFFFF5F9FAF0F5F6BDC2C3F3F8F9FBFFFFF5FAF9
            C2C4C4C4C2C1F7F3F2FFFEFEFFF8F8F4EBE8FFFCF7E7E8DE94988DD0D9CCF9FF
            F4F8FFF4F7FFF1DAE6D2E4F0DEE6F4E2EAFEEBEAFFF3DDFFF3CEFFEEC9FFF1D2
            FFFBDEFFFBEAFFFFEDFFFFEBFDFEEEFBFDF2FEFFF7FEFFF6FBFCFAFDFFFAFEFF
            0000F9F9F9FFFFFFFFFFFFFAFAFAF5F7F7FDFFFFF2F4F4EEF3F2F8FAFAEDEFEF
            FFFFFEFCFDFBF6F4F3F6F3EFFFFFFCFBF6F3FFFEFDFFFFFEF0F1EDE8EFE8F0FB
            F1F0FEF2EFFBEFF8FFF7FAFFF8FAFFF8F6FFF7F0FFF8E7FFF7DDFEF7DCFFFCE1
            FFFFEDFFFFF4FFFFF4FEFEF1F9F9F3F8F9F8FCFDFBFDFEFBFBFBFEFDFFFEFEFE
            0000FCFDFBFFFFFEFAFBF9FFFFFEFCFCFCFEFEFEFFFFFFF3F3F3FDFDFDFFFFFE
            F8F9F7FFFFFCFFFFFCFFFFFCFEFFFBFFFFFEFBF6F8FDF8FAFFFEFFEDF2F0F8FF
            FEF3FFF9E8F5EDF8FFFBF8FCF6F9FAF6FAFBF9F8FDFCF6FEFEF0FDFFEAFBFEE8
            FAFBF4FCFBFAFDFBFBFDFDFEFFFDFFFFFFFFFFFEFFFDFEFFFBFCFFFEFFFFFEFF
            0000FFFFFCFDFEFAF9F8F4FFFFFCFFFFFEF1EDECFFFFFEFFFFFEFFFDFCFFFFFE
            F2F3F1FFFFFCFDFFFCFBFFF9F7FEF7F9FDF8FFFDFFFCF4FBFFFDFFF5F9FAF8FF
            FFF4FFFDEDF6F3FBFFFEFDFBFAFFFCFDFFFCFFFFFCFFFFFBFFFFFBFFFFFBFFFF
            FCFFFFFAFBFFFCF9FFFEFDFFFFFCFFFEFEFFFFFCFFFEFEFFFDFDFFFEFEFFFFFE
            0000FEFFFAFFFFFBFFFEFAF8F7F3FFFFFCFFFFFCFFFFFEFFFCFBFFFEFDFDFBFA
            FFFFFCF7FBF6FDFFFBE1E8E1FAFFF9F8FCF7FFF9FFFFFBFFFFFCFFF4F7FBF5FC
            FFF6FFFFFAFFFFF8FAFAFFFCFDFFFDFFFFFBFFFFFAFFFFF7FFFFF7FFFFF7FFFF
            FAFFFFFDFFFFFFFCFFFDFAFFFDFAFFFAF8FFFAF8FFFDFBFFFFFCFFFEFEFFFEFE
            0000}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Shape5: TfrxShapeView
          Left = 58.472480000000000000
          Top = 222.008040000000000000
          Width = 1025.763779530000000000
          Height = 57.307050000000000000
          ShowHint = False
        end
        object Memo43: TfrxMemoView
          Left = 112.385900000000000000
          Top = 262.244280000000000000
          Width = 306.141930000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestMun"]')
          ParentFont = False
        end
        object memHomolog: TfrxMemoView
          Left = 272.905690000000000000
          Top = 71.811070000000000000
          Width = 532.913730000000000000
          Height = 132.283550000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 14211288
          Font.Height = -64
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'SEM '
            'VALOR FISCAL')
          ParentFont = False
        end
        object Memo134: TfrxMemoView
          Left = 790.701300000000000000
          Top = 142.401670000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'www.nfe.fazenda.gov.br/portal')
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          ShiftMode = smDontShift
          Width = 1084.724409448819000000
          Height = 45.354360000000000000
          ShowHint = False
        end
        object Line1: TfrxLineView
          Left = 835.276130000000000000
          Top = 0.559059999999998800
          Height = 41.574830000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo1: TfrxMemoView
          ShiftMode = smDontShift
          Left = 839.055660000000000000
          Width = 260.787570000000000000
          Height = 41.574830000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%g'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'NF-e:    N'#186'.: [NFE."nNF"]     S'#233'rie: [NFE."Serie"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 23.322820000000000000
          Width = 835.275414800000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo3: TfrxMemoView
          Left = 4.779530000000000000
          Top = 25.322820000000000000
          Width = 134.165430000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DATA DO RECEBIMENTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Left = 219.472480000000000000
          Top = 23.322820000000000000
          Height = 20.787396690000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo4: TfrxMemoView
          Left = 224.252010000000000000
          Top = 25.322820000000000000
          Width = 226.299320000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O E ASSINATURA DO RECEBEDOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 4.000000000000000000
          Width = 761.126160000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TextoCanhoto"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Top = 51.086580000000000000
          Width = 1084.724409448819000000
          ShowHint = False
          Frame.Style = fsDash
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 786.496600000000000000
          Top = 60.252010000000000000
          Height = 116.031466770000000000
          ShowHint = False
          Diagonal = True
        end
        object BarCode1: TfrxBarCodeView
          Left = 790.236860000000000000
          Top = 62.031540000000010000
          Width = 79.000000000000000000
          Height = 30.236240000000000000
          ShowHint = False
          BarType = bcCode128C
          Expression = '<NFE."CodBarra">'
          Rotation = 0
          ShowText = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Line6: TfrxLineView
          Left = 786.362710000000000000
          Top = 95.826840000000000000
          Width = 298.582870000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          Left = 787.921770000000000000
          Top = 97.826840000000000000
          Width = 81.252010000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CHAVE DE ACESSO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 788.921770000000000000
          Top = 108.944960000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '0000.0000.0000.0000.0000.0000.0000.0000.0000.0000.0000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."CodBarra"]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Left = 786.362710000000000000
          Top = 129.181200000000000000
          Width = 298.582870000000000000
          ShowHint = False
          Diagonal = True
        end
        object BarCode2: TfrxBarCodeView
          Left = 869.236860000000000000
          Top = 62.031540000000010000
          Width = 79.000000000000000000
          Height = 30.236220470000000000
          ShowHint = False
          BarType = bcCode128C
          Expression = '<NFE."NumProtocolo">'
          Rotation = 0
          ShowText = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Line8: TfrxLineView
          Left = 58.472480000000000000
          Top = 175.315090000000000000
          Width = 1025.763779527559000000
          ShowHint = False
          Diagonal = True
        end
        object Memo10: TfrxMemoView
          Left = 598.165740000000000000
          Top = 175.637910000000000000
          Width = 281.567100000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DADOS DA NFe')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 62.472480000000000000
          Top = 180.578850000000000000
          Width = 107.708720000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'NATUREZA DA OPERA'#199#195'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 168.299320000000000000
          Top = 175.637910000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."NatOper"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 4.850340000000000000
          Top = 58.645640000000000000
          Width = 47.677180000000000000
          Height = 160.196970000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'IDENTIFICA'#199#195'O DO EMITENTE')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Line9: TfrxLineView
          Left = 654.079160000000000000
          Top = 60.252010000000000000
          Height = 117.165430000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo14: TfrxMemoView
          Left = 659.638220000000000000
          Top = 60.031540000000010000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DANFE')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 659.638220000000000000
          Top = 80.929190000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DOCUMENTO AUXILIAR DA NOTA FISCAL ELETR'#212'NICA')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 683.315400000000000000
          Top = 106.385900000000000000
          Width = 52.913420000000000000
          Height = 22.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '1 - ENTRADA'
            '2 - SA'#205'DA')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 746.567410000000000000
          Top = 106.385900000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."nTpNF"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 659.638220000000000000
          Top = 131.842610000000000000
          Width = 120.944960000000000000
          Height = 41.574830000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#186': [NFE."nNF"]'
            'S'#201'RIE: [NFE."Serie"]'
            'FOLHA: [Page] / [TotalPages#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line10: TfrxLineView
          Left = 58.472480000000000000
          Top = 196.094620000000000000
          Width = 1026.897637795276000000
          ShowHint = False
          Diagonal = True
        end
        object Memo19: TfrxMemoView
          Left = 62.472480000000000000
          Top = 203.374150000000000000
          Width = 92.590600000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 156.960730000000000000
          Top = 198.433210000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitIE"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 430.866420000000000000
          Top = 198.433210000000000000
          Width = 168.181200000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL DO SUBT. TRIBUT.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 600.945270000000000000
          Top = 198.433210000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitIEST"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 834.055660000000000000
          Top = 198.433210000000000000
          Width = 24.559060000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 864.291900000000000000
          Top = 198.433210000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitCNPJ"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 427.086890000000000000
          Top = 197.433210000000000000
          Height = 19.653538430000000000
          ShowHint = False
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 827.717070000000000000
          Top = 197.433210000000000000
          Height = 20.787396690000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo25: TfrxMemoView
          Left = 4.850340000000000000
          Top = 222.008040000000000000
          Width = 47.677180000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DESTINAT'#193'RIO '
            'REMETENTE')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 62.472480000000000000
          Top = 226.948980000000000000
          Width = 92.590600000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'NOME / RAZ'#195'O SOCIAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 156.740260000000000000
          Top = 222.008040000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestNome"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 720.890230000000000000
          Top = 226.948980000000000000
          Width = 43.456710000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 770.024120000000000000
          Top = 222.008040000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestCNPJ"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 918.425790000000000000
          Top = 226.948980000000000000
          Width = 77.472480000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DATA DA EMISS'#195'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 994.016390000000000000
          Top = 222.008040000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DtEmissao"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          Left = 913.866730000000000000
          Top = 222.008040000000000000
          Height = 56.692950000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line14: TfrxLineView
          Left = 58.472480000000000000
          Top = 239.464750000000000000
          Width = 1026.141717640000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo32: TfrxMemoView
          Left = 918.425790000000000000
          Top = 243.736395000000000000
          Width = 66.133890000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DATA DA SA'#205'DA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 994.016390000000000000
          Top = 240.685220000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HideZeros = True
          Memo.UTF8W = (
            '[NFE."DtSaida"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          Left = 58.472480000000000000
          Top = 260.141930000000000000
          Width = 1026.141717640000000000
          ShowHint = False
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 717.110700000000000000
          Top = 222.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo34: TfrxMemoView
          Left = 62.472480000000000000
          Top = 245.736395000000000000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 112.385900000000000000
          Top = 242.685220000000000000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestEnd"]')
          ParentFont = False
        end
        object Line17: TfrxLineView
          Left = 819.378480000000000000
          Top = 239.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo36: TfrxMemoView
          Left = 820.378480000000000000
          Top = 243.736395000000000000
          Width = 20.779530000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CEP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 843.055660000000000000
          Top = 240.685220000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestCEP"]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 562.149970000000000000
          Top = 243.736395000000000000
          Width = 77.472480000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'BAIRRO / DISTRITO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 641.520100000000000000
          Top = 240.685220000000000000
          Width = 173.858380000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestBairro"]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          Left = 558.370440000000000000
          Top = 239.464750000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo40: TfrxMemoView
          Left = 918.425790000000000000
          Top = 266.074985000000000000
          Width = 69.913420000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'HORA DA SA'#205'DA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 62.472480000000000000
          Top = 265.295455000000000000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'MUN'#205'C'#205'PIO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line19: TfrxLineView
          Left = 469.441250000000000000
          Top = 260.141930000000000000
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo44: TfrxMemoView
          Left = 472.441250000000000000
          Top = 265.295455000000000000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'FONE / FAX')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 521.575140000000000000
          Top = 262.244280000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestFoneFax"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 425.086890000000000000
          Top = 265.295455000000000000
          Width = 17.000000000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 440.205010000000000000
          Top = 262.244280000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestUF"]')
          ParentFont = False
        end
        object Line20: TfrxLineView
          Left = 421.307360000000000000
          Top = 260.141930000000000000
          Height = 17.385821890000000000
          ShowHint = False
          Diagonal = True
        end
        object Line21: TfrxLineView
          Left = 649.079160000000000000
          Top = 261.023810000000000000
          Height = 16.629916380000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo41: TfrxMemoView
          Left = 652.079160000000000000
          Top = 266.074985000000000000
          Width = 100.149660000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O ESTADUAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 750.346940000000000000
          Top = 263.023810000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."DestIE"]')
          ParentFont = False
        end
        object memPageAtu: TfrxSysMemoView
          Align = baRight
          Left = 990.236860000000100000
          Top = 60.472479999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Visible = False
          OnAfterData = 'memPageAtuOnAfterData'
          ShowHint = False
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#]')
        end
        object Memo133: TfrxMemoView
          Left = 790.701300000000000000
          Top = 130.504020000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Consulta de autenticidade no portal nacional da NF-e')
          ParentFont = False
        end
        object Memo135: TfrxMemoView
          Left = 790.701300000000000000
          Top = 155.740260000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ou no site da SEFAZ Autorizadora.')
          ParentFont = False
        end
        object Memo136: TfrxMemoView
          Left = 808.819420000000000000
          Top = 175.637910000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."NumProtocolo"]')
          ParentFont = False
        end
        object memHora: TfrxMemoView
          Left = 995.016390000000000000
          Top = 263.023810000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[(<Time>)]')
          ParentFont = False
        end
        object Memo140: TfrxMemoView
          Left = 192.756030000000000000
          Top = 60.472480000000000000
          Width = 457.323130000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitNome"]')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 193.535560000000000000
          Top = 96.488250000000000000
          Width = 457.323130000000000000
          Height = 75.590600000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."EmitEnd"]'
            '[NFE."EmitBairro"]'
            '[NFE."EmitMun"] - [NFE."EmitUF"]'
            '[NFE."EmitCEP"]'
            'Fone / FAX: [NFE."EmitFone"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 593.386210000000000000
        Width = 1084.725110000000000000
        DataSet = frxDBDataset2
        DataSetName = 'NFE_Itens'
        RowCount = 0
        Stretched = True
        object Shape9: TfrxShapeView
          Left = 58.472480000000000000
          Width = 1025.763779530000000000
          Height = 22.677180000000000000
          ShowHint = False
          Frame.TopLine.Color = clWhite
        end
        object NFE_ItensItemDescricao: TfrxMemoView
          Left = 168.078850000000000000
          Width = 427.086890000000000000
          Height = 11.338590000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'ItemDescricao'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemDescricao"]')
          ParentFont = False
        end
        object NFE_ItensItemCodigo: TfrxMemoView
          Left = 63.252010000000000000
          Width = 98.267780000000000000
          Height = 11.338590000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'ItemCodigo'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemCodigo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo119: TfrxMemoView
          Left = 627.181510000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemNCM"]')
          ParentFont = False
        end
        object Memo120: TfrxMemoView
          Left = 671.866378500000000000
          Width = 22.677180000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemCST"]')
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 697.189213150000000000
          Width = 22.677180000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemCFOP'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemCFOP"]')
          ParentFont = False
        end
        object Memo122: TfrxMemoView
          Left = 724.779764330000000000
          Width = 20.409448820000000000
          Height = 11.338582680000000000
          ShowHint = False
          DataField = 'ItemUnidade'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE_Itens."ItemUnidade"]')
          ParentFont = False
        end
        object Memo123: TfrxMemoView
          Left = 749.346940000000000000
          Width = 56.692950000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemQuantidade'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%4.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemQuantidade"]')
          ParentFont = False
        end
        object Memo124: TfrxMemoView
          Left = 809.819420000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVUnit'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVUnit"]')
          ParentFont = False
        end
        object Memo125: TfrxMemoView
          Left = 855.173780000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVTotal'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVTotal"]')
          ParentFont = False
        end
        object Memo126: TfrxMemoView
          Left = 900.528140000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemBCalcIcms'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemBCalcIcms"]')
          ParentFont = False
        end
        object Memo127: TfrxMemoView
          Left = 945.882500000000000000
          Width = 41.574830000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVICMS'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVICMS"]')
          ParentFont = False
        end
        object Memo128: TfrxMemoView
          Left = 991.236860000000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemVIPI'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE_Itens."ItemVIPI"]')
          ParentFont = False
        end
        object Memo129: TfrxMemoView
          Left = 1031.811690000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemAliqICMS'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE_Itens."ItemAliqICMS"]')
          ParentFont = False
        end
        object Memo130: TfrxMemoView
          Left = 1059.268400000000000000
          Width = 26.456710000000000000
          Height = 11.338590000000000000
          ShowHint = False
          DataField = 'ItemAliqIPI'
          DataSet = frxDBDataset2
          DataSetName = 'NFE_Itens'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE_Itens."ItemAliqIPI"]')
          ParentFont = False
        end
        object Line60: TfrxLineView
          Left = 670.315400000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line61: TfrxLineView
          Left = 695.433520000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line62: TfrxLineView
          Left = 723.669760000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line63: TfrxLineView
          Left = 747.346940000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line64: TfrxLineView
          Left = 624.622450000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line65: TfrxLineView
          Left = 163.519790000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line66: TfrxLineView
          Left = 806.039890000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line67: TfrxLineView
          Left = 855.173780000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line68: TfrxLineView
          Left = 900.528140000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line69: TfrxLineView
          Left = 945.882500000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line70: TfrxLineView
          Left = 987.457330000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line71: TfrxLineView
          Left = 1029.032160000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line72: TfrxLineView
          Left = 1057.488870000000000000
          Height = 15.118110240000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 22.677180000000000000
        Top = 638.740570000000000000
        Width = 1084.725110000000000000
        Child = RelDanfePais.Child1
        KeepChild = True
        object Shape1: TfrxShapeView
          Align = baClient
          ShiftMode = smDontShift
          Width = 1084.725110000000000000
          Height = 22.677180000000000000
          ShowHint = False
        end
        object Line78: TfrxLineView
          Left = 162.519790000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line79: TfrxLineView
          Left = 625.401980000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line80: TfrxLineView
          Left = 671.094930000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line81: TfrxLineView
          Left = 696.213050000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line82: TfrxLineView
          Left = 724.449290000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line83: TfrxLineView
          Left = 748.126470000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line84: TfrxLineView
          Left = 806.819420000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line85: TfrxLineView
          Left = 855.953310000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line86: TfrxLineView
          Left = 901.307670000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line87: TfrxLineView
          Left = 946.662030000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line88: TfrxLineView
          Left = 988.236860000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line89: TfrxLineView
          Left = 1029.811690000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line90: TfrxLineView
          Left = 1058.268400000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line92: TfrxLineView
          Left = 58.472480000000000000
          Height = 22.677180000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Shape10: TfrxShapeView
          Left = 2.000000000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clWhite
          Frame.Color = clWhite
          Frame.Width = 3.000000000000000000
        end
      end
      object ChildFatura: TfrxChild
        Height = 61.000000000000000000
        Top = 321.260050000000000000
        Width = 1084.725110000000000000
        OnAfterCalcHeight = 'ChildFaturaOnAfterCalcHeight'
        OnBeforePrint = 'ChildFaturaOnBeforePrint'
        Child = RelDanfePais.Child3
        Stretched = True
        object Cross1: TfrxCrossView
          Description = 'dfgdfg'
          ShiftMode = smDontShift
          Left = 66.031540000000000000
          Width = 100.000000000000000000
          Height = 62.000000000000000000
          ShowHint = False
          DownThenAcross = False
          KeepTogether = True
          MinWidth = 30
          ShowColumnHeader = False
          ShowColumnTotal = False
          ShowCorner = False
          ShowRowHeader = False
          ShowRowTotal = False
          ShowTitle = False
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F56696577204C6566743D2238362C30
            333135342220546F703D223334312C3236303035222057696474683D22363022
            204865696768743D22323222205265737472696374696F6E733D223234222053
            686F7748696E743D2246616C73652220416C6C6F7745787072657373696F6E73
            3D2246616C73652220436F6C6F723D2231363737373231352220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D392220466F6E742E4E616D653D2254696D6573204E657720
            526F6D616E2220466F6E742E5374796C653D223022204672616D652E5479703D
            2231352220476170583D22332220476170593D2233222048416C69676E3D2268
            6143656E7465722220506172656E74466F6E743D2246616C73652220576F7264
            577261703D2246616C7365222056416C69676E3D22766143656E746572222054
            6578743D2230222F3E3C546672784D656D6F56696577205461673D223122204C
            6566743D22302220546F703D2230222057696474683D22302220486569676874
            3D223022205265737472696374696F6E733D2238222053686F7748696E743D22
            46616C73652220416C6C6F7745787072657373696F6E733D2246616C73652220
            436F6C6F723D2231363737373231352220466F6E742E436861727365743D2231
            2220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31
            332220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D
            223022204672616D652E5479703D2231352220476170583D2233222047617059
            3D2233222048416C69676E3D22686152696768742220506172656E74466F6E74
            3D2246616C736522205374796C653D2263656C6C222056416C69676E3D227661
            43656E7465722220546578743D22222F3E3C546672784D656D6F566965772054
            61673D223222204C6566743D2236372220546F703D2230222057696474683D22
            31333322204865696768743D22323122205265737472696374696F6E733D2232
            34222053686F7748696E743D2246616C73652220416C6C6F7745787072657373
            696F6E733D2246616C73652220436F6C6F723D2231363737373231352220466F
            6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F
            6E742E4865696768743D222D31332220466F6E742E4E616D653D22417269616C
            2220466F6E742E5374796C653D223022204672616D652E5479703D2231352220
            476170583D22332220476170593D2233222048416C69676E3D22686152696768
            742220506172656E74466F6E743D2246616C736522205374796C653D2263656C
            6C222056416C69676E3D22766143656E7465722220546578743D22222F3E3C54
            6672784D656D6F56696577205461673D223322204C6566743D22302220546F70
            3D2230222057696474683D223022204865696768743D22302220526573747269
            6374696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F
            7745787072657373696F6E733D2246616C73652220436F6C6F723D2231363737
            373231352220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D
            653D22417269616C2220466F6E742E5374796C653D223022204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222048416C69676E
            3D22686152696768742220506172656E74466F6E743D2246616C736522205374
            796C653D2263656C6C222056416C69676E3D22766143656E7465722220546578
            743D22222F3E3C2F63656C6C6D656D6F733E3C63656C6C6865616465726D656D
            6F733E3C546672784D656D6F56696577204C6566743D22302220546F703D2230
            222057696474683D223022204865696768743D22302220526573747269637469
            6F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F774578
            7072657373696F6E733D2246616C73652220436F6C6F723D2231363737373231
            352220466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22
            302220466F6E742E4865696768743D222D31332220466F6E742E4E616D653D22
            417269616C2220466F6E742E5374796C653D223022204672616D652E5479703D
            2231352220476170583D22332220476170593D22332220506172656E74466F6E
            743D2246616C7365222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C546672784D656D6F56696577204C6566743D22302220546F703D
            2230222057696474683D223022204865696768743D2230222052657374726963
            74696F6E733D2238222053686F7748696E743D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C73652220436F6C6F723D223136373737
            3231352220466F6E742E436861727365743D22312220466F6E742E436F6C6F72
            3D22302220466F6E742E4865696768743D222D31332220466F6E742E4E616D65
            3D22417269616C2220466F6E742E5374796C653D223022204672616D652E5479
            703D2231352220476170583D22332220476170593D22332220506172656E7446
            6F6E743D2246616C7365222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C2F63656C6C6865616465726D656D6F733E3C636F6C756D6E
            6D656D6F733E3C546672784D656D6F56696577205461673D2231303022204C65
            66743D22302220546F703D223231222057696474683D22323030222048656967
            68743D22323122205265737472696374696F6E733D223234222053686F774869
            6E743D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C
            73652220436F6C6F723D2231363737373231352220466F6E742E436861727365
            743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569676874
            3D222D31332220466F6E742E4E616D653D22417269616C2220466F6E742E5374
            796C653D223022204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E7465722220506172656E
            74466F6E743D2246616C736522205374796C653D22636F6C756D6E222056416C
            69676E3D22766143656E7465722220546578743D22222F3E3C2F636F6C756D6E
            6D656D6F733E3C636F6C756D6E746F74616C6D656D6F733E3C546672784D656D
            6F56696577205461673D2233303022204C6566743D22302220546F703D223022
            2057696474683D22333222204865696768743D22313030303022205265737472
            696374696F6E733D2238222056697369626C653D2246616C7365222053686F77
            48696E743D2246616C73652220416C6C6F7745787072657373696F6E733D2246
            616C73652220436F6C6F723D2231363737373231352220466F6E742E43686172
            7365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48656967
            68743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E742E
            5374796C653D223122204672616D652E5479703D2231352220476170583D2233
            2220476170593D2233222048416C69676E3D22686143656E7465722220506172
            656E74466F6E743D2246616C736522205374796C653D22636F6C6772616E6422
            2056416C69676E3D22766143656E7465722220546578743D224772616E642054
            6F74616C222F3E3C2F636F6C756D6E746F74616C6D656D6F733E3C636F726E65
            726D656D6F733E3C546672784D656D6F56696577204C6566743D22302220546F
            703D2230222057696474683D2232303022204865696768743D22302220526573
            7472696374696F6E733D2238222056697369626C653D2246616C736522205368
            6F7748696E743D2246616C73652220416C6C6F7745787072657373696F6E733D
            2246616C73652220436F6C6F723D2231363737373231352220466F6E742E4368
            61727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E
            742E5374796C653D223022204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D22686143656E746572222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D22222F3E3C546672784D656D6F56696577204C6566743D
            22302220546F703D2230222057696474683D2232303022204865696768743D22
            323122205265737472696374696F6E733D2238222056697369626C653D224661
            6C7365222053686F7748696E743D2246616C73652220416C6C6F774578707265
            7373696F6E733D2246616C73652220436F6C6F723D2231363737373231352220
            466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220
            466F6E742E4865696768743D222D31332220466F6E742E4E616D653D22417269
            616C2220466F6E742E5374796C653D223022204672616D652E5479703D223135
            2220476170583D22332220476170593D2233222048416C69676E3D2268614365
            6E7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D
            22766143656E7465722220546578743D22436F6C756D6E222F3E3C546672784D
            656D6F56696577204C6566743D22302220546F703D2230222057696474683D22
            3022204865696768743D223022205265737472696374696F6E733D2238222056
            697369626C653D2246616C7365222053686F7748696E743D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C73652220436F6C6F723D22
            31363737373231352220466F6E742E436861727365743D22312220466F6E742E
            436F6C6F723D22302220466F6E742E4865696768743D222D31332220466F6E74
            2E4E616D653D22417269616C2220466F6E742E5374796C653D22302220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322204841
            6C69676E3D22686143656E7465722220506172656E74466F6E743D2246616C73
            65222056416C69676E3D22766143656E7465722220546578743D22222F3E3C54
            6672784D656D6F56696577204C6566743D22302220546F703D22302220576964
            74683D2232303022204865696768743D223022205265737472696374696F6E73
            3D2238222053686F7748696E743D2246616C73652220416C6C6F774578707265
            7373696F6E733D2246616C73652220436F6C6F723D2231363737373231352220
            466F6E742E436861727365743D22312220466F6E742E436F6C6F723D22302220
            466F6E742E4865696768743D222D31332220466F6E742E4E616D653D22417269
            616C2220466F6E742E5374796C653D223022204672616D652E5479703D223135
            2220476170583D22332220476170593D2233222048416C69676E3D2268614365
            6E7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D
            22766143656E7465722220546578743D22222F3E3C2F636F726E65726D656D6F
            733E3C726F776D656D6F733E3C546672784D656D6F56696577205461673D2232
            303022204C6566743D22302220546F703D2230222057696474683D2232303022
            204865696768743D22323122205265737472696374696F6E733D223234222053
            686F7748696E743D2246616C73652220416C6C6F7745787072657373696F6E73
            3D2246616C73652220436F6C6F723D2231363737373231352220466F6E742E43
            6861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E48
            65696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F
            6E742E5374796C653D223022204672616D652E5479703D223135222047617058
            3D22332220476170593D2233222048416C69676E3D22686143656E7465722220
            506172656E74466F6E743D2246616C736522205374796C653D22726F77222056
            416C69676E3D22766143656E7465722220546578743D22222F3E3C2F726F776D
            656D6F733E3C726F77746F74616C6D656D6F733E3C546672784D656D6F566965
            77205461673D2234303022204C6566743D22302220546F703D22302220576964
            74683D22333222204865696768743D2231303030302220526573747269637469
            6F6E733D2238222056697369626C653D2246616C7365222053686F7748696E74
            3D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C7365
            2220436F6C6F723D2231363737373231352220466F6E742E436861727365743D
            22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D22
            2D31332220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C
            653D223122204672616D652E5479703D2231352220476170583D223322204761
            70593D2233222048416C69676E3D22686143656E7465722220506172656E7446
            6F6E743D2246616C736522205374796C653D22726F776772616E64222056416C
            69676E3D22766143656E7465722220546578743D224772616E6420546F74616C
            222F3E3C2F726F77746F74616C6D656D6F733E3C63656C6C66756E6374696F6E
            733E3C6974656D20302F3E3C2F63656C6C66756E6374696F6E733E3C636F6C75
            6D6E736F72743E3C6974656D20322F3E3C2F636F6C756D6E736F72743E3C726F
            77736F72743E3C6974656D20322F3E3C2F726F77736F72743E3C2F63726F7373
            3E}
        end
        object Memo137: TfrxMemoView
          Left = 4.850340000000000000
          Width = 47.677180000000000000
          Height = 56.692950000000000000
          ShowHint = False
          StretchMode = smActualHeight
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'FATURAS')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
      end
      object Child3: TfrxChild
        Height = 167.078850000000000000
        Top = 404.409710000000000000
        Width = 1084.725110000000000000
        object Shape2: TfrxShapeView
          Left = 58.472480000000000000
          Top = 0.338590000000010600
          Width = 1025.763779527559000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Memo7: TfrxMemoView
          Left = 4.850340000000000000
          Top = 0.338590000000010600
          Width = 47.677180000000000000
          Height = 37.795300000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#193'LC.'
            'IMPOSTO')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 63.252010000000000000
          Top = 1.559059999999988000
          Width = 54.795300000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'B.C. DO ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 127.504020000000000000
          Top = 1.559059999999988000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."BaseCalcICMS"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 274.126160000000000000
          Top = 1.559059999999988000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VLR DO ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 338.378170000000000000
          Top = 1.559059999999988000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorICMS"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 463.543600000000000000
          Top = 1.559059999999988000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'B.C. ICMS S.T.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 524.016080000000000000
          Top = 1.559059999999988000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."BaseCalcICMSSubs"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 650.401980000000000000
          Top = 1.559059999999988000
          Width = 69.913420000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VLR DO ICMS S.T.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 723.992580000000000000
          Top = 1.559059999999988000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorICMSSubs"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 848.614720000000000000
          Top = 1.559059999999988000
          Width = 111.488250000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VLR TOTAL DOS PRODUTOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 963.780150000000000000
          Top = 1.559059999999988000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorTotProd"]')
          ParentFont = False
        end
        object Line22: TfrxLineView
          Left = 58.472480000000000000
          Top = 19.236240000000010000
          Width = 1048.818897640000000000
          ShowHint = False
          Diagonal = True
        end
        object Line24: TfrxLineView
          Left = 58.472480000000000000
          Top = 0.779530000000022500
          Height = 27.590553620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line25: TfrxLineView
          Left = 461.102660000000000000
          Top = 0.779530000000022500
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line26: TfrxLineView
          Left = 646.299630000000000000
          Top = 0.779530000000022500
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line27: TfrxLineView
          Left = 845.835190000000000000
          Top = 0.779530000000022500
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Shape7: TfrxShapeView
          Left = 58.472480000000000000
          Top = 42.913419999999970000
          Width = 1025.763779530000000000
          Height = 60.472480000000000000
          ShowHint = False
        end
        object Memo70: TfrxMemoView
          Left = 4.850340000000000000
          Top = 42.913419999999970000
          Width = 47.677180000000000000
          Height = 60.472480000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TRANSPORT.'
            ' VOLUMES')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 62.031540000000000000
          Top = 44.133890000000010000
          Width = 96.370130000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'NOME / RAZ'#195'O SOCIAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 157.078850000000000000
          Top = 44.133890000000010000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TraNome"]')
          ParentFont = False
        end
        object Memo75: TfrxMemoView
          Left = 364.716760000000000000
          Top = 43.354359999999990000
          Width = 77.472480000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'FRETE POR CONTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 507.897960000000000000
          Top = 42.354359999999990000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraModFrete"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 542.795610000000000000
          Top = 43.354359999999990000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'C'#211'D. ANTT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 592.709030000000000000
          Top = 43.354359999999990000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."VeiCodigoANTT"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 716.331170000000000000
          Top = 43.354359999999990000
          Width = 69.913420000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'PLACA VE'#205'CULO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 785.142240000000000000
          Top = 43.354359999999990000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."VeiPlaca"]')
          ParentFont = False
        end
        object Line23: TfrxLineView
          Left = 59.252010000000000000
          Top = 62.031540000000010000
          Width = 1025.763779530000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo81: TfrxMemoView
          Left = 63.031540000000000000
          Top = 65.031540000000010000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 112.165430000000000000
          Top = 65.031540000000010000
          Width = 434.645950000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TraEnd"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 559.488560000000000000
          Top = 65.031540000000010000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'MUNIC'#205'PIO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 612.401980000000000000
          Top = 65.031540000000010000
          Width = 222.992270000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."TraMun"]')
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 841.276130000000000000
          Top = 65.031540000000010000
          Width = 17.000000000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 860.953310000000000000
          Top = 65.031540000000010000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraUF"]')
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 893.410020000000000000
          Top = 65.031540000000010000
          Width = 69.913420000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSC. ESTADUAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo88: TfrxMemoView
          Left = 964.221090000000000000
          Top = 65.031540000000010000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraIE"]')
          ParentFont = False
        end
        object Line34: TfrxLineView
          Left = 361.055350000000000000
          Top = 43.354359999999990000
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line35: TfrxLineView
          Left = 537.693260000000000000
          Top = 43.354359999999990000
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line36: TfrxLineView
          Left = 714.110700000000000000
          Top = 43.354359999999990000
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line37: TfrxLineView
          Left = 554.370440000000000000
          Top = 64.031540000000010000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line38: TfrxLineView
          Left = 839.055660000000000000
          Top = 62.031540000000010000
          Height = 22.677162910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line39: TfrxLineView
          Left = 891.189550000000000000
          Top = 62.031540000000010000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo74: TfrxMemoView
          Left = 862.173780000000000000
          Top = 43.354359999999990000
          Width = 20.779530000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'UF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo93: TfrxMemoView
          Left = 878.071430000000000000
          Top = 43.354359999999990000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VeiUF"]')
          ParentFont = False
        end
        object Line33: TfrxLineView
          Left = 859.953310000000000000
          Top = 43.354359999999990000
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo94: TfrxMemoView
          Left = 909.528140000000000000
          Top = 43.354359999999990000
          Width = 43.456710000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'CNPJ / CPF')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo95: TfrxMemoView
          Left = 959.441560000000000000
          Top = 44.133890000000010000
          Width = 120.944960000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."TraCNPJ"]')
          ParentFont = False
        end
        object Line42: TfrxLineView
          Left = 907.307670000000000000
          Top = 43.354359999999990000
          Height = 16.251963620000000000
          ShowHint = False
          Diagonal = True
        end
        object Line40: TfrxLineView
          Left = 59.252010000000000000
          Top = 82.929190000000000000
          Width = 1025.763779527559000000
          ShowHint = False
          Diagonal = True
        end
        object Memo89: TfrxMemoView
          Left = 63.811070000000000000
          Top = 84.708720000000030000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'QUANTIDADE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo90: TfrxMemoView
          Left = 128.063080000000000000
          Top = 84.708720000000030000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."VolQuantidade"]')
          ParentFont = False
        end
        object Line41: TfrxLineView
          Left = 217.992270000000000000
          Top = 82.929190000000000000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo91: TfrxMemoView
          Left = 221.771800000000000000
          Top = 84.708720000000030000
          Width = 35.897650000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'ESP'#201'CIE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo92: TfrxMemoView
          Left = 262.346630000000000000
          Top = 84.708720000000030000
          Width = 132.283550000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VolEspecie"]')
          ParentFont = False
        end
        object Line43: TfrxLineView
          Left = 399.409710000000000000
          Top = 82.929190000000000000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo96: TfrxMemoView
          Left = 403.189240000000000000
          Top = 84.708720000000030000
          Width = 35.897650000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'MARCA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo97: TfrxMemoView
          Left = 440.984540000000000000
          Top = 84.708720000000030000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VolMarca"]')
          ParentFont = False
        end
        object Line44: TfrxLineView
          Left = 595.945270000000000000
          Top = 82.929190000000000000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo98: TfrxMemoView
          Left = 599.724800000000000000
          Top = 84.708720000000030000
          Width = 39.677180000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'N'#218'MERO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 641.299630000000000000
          Top = 84.708720000000030000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '00000-000;0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."VolNumeracao"]')
          ParentFont = False
        end
        object Line45: TfrxLineView
          Left = 724.449290000000000000
          Top = 82.929190000000000000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo100: TfrxMemoView
          Left = 728.228820000000000000
          Top = 84.708720000000030000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'PESO BRUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 781.142240000000000000
          Top = 84.708720000000030000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%3.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."VolPesoBruto"]')
          ParentFont = False
        end
        object Line46: TfrxLineView
          Left = 891.410020000000000000
          Top = 82.929190000000000000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo102: TfrxMemoView
          Left = 896.748610000000000000
          Top = 84.708720000000030000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'PESO L'#205'QUIDO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo103: TfrxMemoView
          Left = 962.780150000000000000
          Top = 84.708720000000030000
          Width = 117.165430000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%3.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."VolPesoLiquido"]')
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 4.850340000000000000
          Top = 129.283550000000000000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'DADOS DOS PRODUTOS / SERVI'#199'OS')
          ParentFont = False
        end
        object Shape8: TfrxShapeView
          Left = 58.472480000000000000
          Top = 144.401670000000000000
          Width = 1025.763779527559000000
          Height = 22.677180000000000000
          ShowHint = False
        end
        object Memo105: TfrxMemoView
          Left = 68.031540000000000000
          Top = 144.401670000000000000
          Width = 92.590600000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#211'DIGO'
            'PRODUTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo106: TfrxMemoView
          Left = 167.078850000000000000
          Top = 144.401670000000000000
          Width = 383.614410000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DESCRI'#199#195'O DO PRODUTO / SERVI'#199'O')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo107: TfrxMemoView
          Left = 626.181510000000000000
          Top = 144.401670000000000000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NCM/SH')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 670.866378500000000000
          Top = 144.401670000000000000
          Width = 20.779530000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CST')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo109: TfrxMemoView
          Left = 696.189213150000000000
          Top = 144.401670000000000000
          Width = 24.559060000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CFOP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 723.779764330000000000
          Top = 144.401670000000000000
          Width = 20.779530000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'UN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 757.906000000000000000
          Top = 144.401670000000000000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'QUANT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo112: TfrxMemoView
          Left = 812.598950000000000000
          Top = 144.401670000000000000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'UNIT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 857.953310000000000000
          Top = 144.401670000000000000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 904.307670000000000000
          Top = 144.401670000000000000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'B.C'#193'LC'
            'ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo115: TfrxMemoView
          Left = 948.662030000000000000
          Top = 144.401670000000000000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 990.236860000000000000
          Top = 144.401670000000000000
          Width = 35.897650000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR'
            'IPI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo117: TfrxMemoView
          Left = 1029.032160000000000000
          Top = 144.401670000000000000
          Width = 24.559060000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'AL'#205'Q.'
            'ICMS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo118: TfrxMemoView
          Left = 1058.268400000000000000
          Top = 144.401670000000000000
          Width = 24.559060000000000000
          Height = 20.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'AL'#205'Q.'
            'IPI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line47: TfrxLineView
          Left = 1056.488870000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line48: TfrxLineView
          Left = 1028.032160000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line49: TfrxLineView
          Left = 986.457330000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line50: TfrxLineView
          Left = 944.882500000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line51: TfrxLineView
          Left = 899.528140000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line52: TfrxLineView
          Left = 854.173780000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line53: TfrxLineView
          Left = 805.039890000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line54: TfrxLineView
          Left = 746.346940000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line55: TfrxLineView
          Left = 722.669760000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line56: TfrxLineView
          Left = 694.433520000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line57: TfrxLineView
          Left = 669.315400000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line58: TfrxLineView
          Left = 623.622450000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Line59: TfrxLineView
          Left = 162.519790000000000000
          Top = 144.401670000000000000
          Height = 22.677165350000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo138: TfrxMemoView
          Left = 4.850340000000000000
          Top = 108.385900000000000000
          Width = 47.677180000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'ISSQN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape6: TfrxShapeView
          Left = 58.472480000000000000
          Top = 108.385900000000000000
          Width = 1025.763779527559000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo139: TfrxMemoView
          Left = 65.031540000000000000
          Top = 109.606370000000000000
          Width = 100.149660000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'INSCRI'#199#195'O MUNICIPAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 219.992270000000000000
          Top = 109.606370000000000000
          Width = 122.826840000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR TOTAL DOS SERVI'#199'OS')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 344.716760000000000000
          Top = 109.606370000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."ValorTotServ"]')
          ParentFont = False
        end
        object Memo143: TfrxMemoView
          Left = 575.488560000000000000
          Top = 109.606370000000000000
          Width = 115.267780000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'BASE DE C'#193'LCULO DO ISSQN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo144: TfrxMemoView
          Left = 692.653990000000000000
          Top = 109.606370000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."BaseCalcISSQN"]')
          ParentFont = False
        end
        object Memo145: TfrxMemoView
          Left = 851.614720000000000000
          Top = 109.606370000000000000
          Width = 73.692950000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VALOR DO ISSQN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo146: TfrxMemoView
          Left = 934.764380000000000000
          Top = 109.606370000000000000
          Width = 147.401670000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[NFE."ValorTotISSQN"]')
          ParentFont = False
        end
        object Line75: TfrxLineView
          Left = 216.212740000000000000
          Top = 108.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line76: TfrxLineView
          Left = 572.488560000000000000
          Top = 108.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line77: TfrxLineView
          Left = 847.394250000000000000
          Top = 108.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Diagonal = True
        end
        object Line91: TfrxLineView
          Left = 272.126160000000000000
          Top = 0.779530000000022500
          Height = 20.031493620000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo58: TfrxMemoView
          Left = 64.252010000000000000
          Top = 21.236240000000010000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VLR FRETE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 112.826840000000000000
          Top = 21.236240000000010000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorFrete"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 170.653680000000000000
          Top = 21.236240000000010000
          Width = 54.795300000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VLR SEGURO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 226.126160000000000000
          Top = 21.236240000000010000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorSeguro"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 307.393940000000000000
          Top = 21.236240000000010000
          Width = 47.236240000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'DESCONTO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 356.527830000000000000
          Top = 21.236240000000010000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."Desconto"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 455.472790000000000000
          Top = 21.236240000000010000
          Width = 69.913420000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'OUT. DESP. ACES.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 526.283860000000000000
          Top = 21.236240000000010000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."OutrasDesp"]')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 610.228820000000000000
          Top = 21.236240000000010000
          Width = 58.574830000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VLR TOTAL IPI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 670.480830000000000000
          Top = 21.236240000000010000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorIPI"]')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          Left = 908.866730000000000000
          Top = 21.236240000000010000
          Width = 85.031540000000010000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'VLR TOTAL DA NOTA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 995.795920000000000000
          Top = 21.236240000000010000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."ValorTotNota"]')
          ParentFont = False
        end
        object Line28: TfrxLineView
          Left = 168.535560000000000000
          Top = 19.456709999999990000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line29: TfrxLineView
          Left = 304.055350000000000000
          Top = 19.456709999999990000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line30: TfrxLineView
          Left = 453.354670000000000000
          Top = 19.456709999999990000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line31: TfrxLineView
          Left = 607.890230000000000000
          Top = 19.456709999999990000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Line32: TfrxLineView
          Left = 907.087200000000000000
          Top = 19.456709999999990000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo151: TfrxMemoView
          Left = 762.055660000000000000
          Top = 21.165354329999960000
          Width = 73.692950000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'TOTAL IMPOSTOS')
          ParentFont = False
          VAlign = vaCenter
        end
        object NFEvTotTrib: TfrxMemoView
          Left = 836.937540000000000000
          Top = 21.165354330000010000
          Width = 68.031540000000010000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'vTotTrib'
          DataSet = frxDBDataset1
          DataSetName = 'NFE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[NFE."vTotTrib"]')
          ParentFont = False
        end
        object Line94: TfrxLineView
          Left = 759.496600000000000000
          Top = 18.897650000000000000
          Height = 18.897632910000000000
          ShowHint = False
          Diagonal = True
        end
        object Memo148: TfrxMemoView
          Left = 443.984540000000000000
          Top = 44.354359999999990000
          Width = 62.354360000000000000
          Height = 16.574830000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '0: Emit  -  1: Dest '
            '2:Terc   -  9: S/Frete')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Child1: TfrxChild
        Height = 86.929190000000000000
        Top = 684.094930000000000000
        Width = 1084.725110000000000000
        OnAfterCalcHeight = 'Child1OnAfterCalcHeight'
        AllowSplit = True
        PrintChildIfInvisible = True
        Stretched = True
        object NFEObsContribuinte: TfrxMemoView
          Left = 64.252010000000000000
          Top = 14.118119999999980000
          Width = 744.567410000000000000
          Height = 49.133858270000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'ObsContribuinte'
          DataSet = frxDBDataset1
          DataSetName = 'NFE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            '[NFE."ObsContribuinte"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 4.850340000000000000
          Width = 47.677180000000000000
          Height = 68.031540000000000000
          ShowHint = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'DADOS ADICIONAIS')
          ParentFont = False
          Rotation = 90
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 64.252010000000000000
          Top = 1.000000000000000000
          Width = 141.724490000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'INFORMA'#199#213'ES COMPLEMENTARES')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 816.378480000000000000
          Top = 1.000000000000000000
          Width = 92.590600000000000000
          Height = 9.015770000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Times New Roman'
          Font.Style = []
          Memo.UTF8W = (
            'RESERVADO AO FISCO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line73: TfrxLineView
          Left = 812.598950000000000000
          Top = 14.118119999999980000
          Height = 52.913420000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
        object Line74: TfrxLineView
          Left = 58.472480000000000000
          Top = 13.118119999999980000
          Width = 1025.763779530000000000
          ShowHint = False
          Diagonal = True
        end
        object Line93: TfrxLineView
          Left = 58.472480000000000000
          Height = 68.031540000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Diagonal = True
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    ExportNotPrintable = True
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = True
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'DANFE'
    Creator = 'Gerador Autom'#225'tico DANFE'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 32
    Top = 384
  end
  object Designer1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = ANSI_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Times New Roman'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 120
    Top = 152
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'NFE_logo'
    CloseDataSource = False
    DataSource = dsGeral
    BCDToCurrency = False
    Left = 312
    Top = 304
  end
  object qryGeral: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT IMG_LOGO FROM TB_NFE_CONF')
    SQLConnection = dm_Princial.SQLConnect
    Left = 424
    Top = 152
  end
  object dspGeral: TDataSetProvider
    DataSet = qryGeral
    Constraints = False
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 424
    Top = 205
  end
  object cdsGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGeral'
    Left = 424
    Top = 256
    object cdsGeralIMG_LOGO: TBlobField
      FieldName = 'IMG_LOGO'
      Size = 1
    end
  end
  object dsGeral: TDataSource
    DataSet = cdsGeral
    Left = 424
    Top = 312
  end
end
