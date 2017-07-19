object dm_nfe: Tdm_nfe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 715
  Width = 1227
  object nfdDPEC2: TnfdDPEC2
    NFe = nfdNFe2
    Left = 152
    Top = 40
  end
  object nfdNFe2: TnfdNFe2
    Versao = '4.0.1.0'
    Ambiente = taHomologacao
    TipoCertificado = ckA1
    UF = 'SP'
    DiretorioLog = 'Log\'
    UFsAmbNac.Strings = (
      'CE'
      'MA'
      'PA'
      'PI'
      'RN')
    LogotipoEmitente = 'logo.jpg'
    Servidores = nfdNFeServidores2
    Templates = nfdNFeTemplates2
    SimplesNacional = False
    VerificaDataCertificado = True
    MensagemCertificadoExpirado = 'Prazo de validade do certificado esgotado.'
    Left = 64
    Top = 32
  end
  object nfdNFeDataSets: TnfdNFeDataSets2
    NFe = nfdNFe2
    UsaICMS_Part = False
    UsaICMS_ST = False
    Validador.Regras.Strings = (
      'CFOP_I08;CFOP;C'#243'digo fiscal do produto incorreto.'
      'CFOP_I08;Empty;C'#243'digo fiscal do produto n'#227'o informado.'
      'CFOP_I08;Length;C'#243'digo fiscal do produto incorreto.;4'
      'CST_N12;CST;C'#243'digo Tributario inv'#225'lido para o produto.'
      'CST_N12;Empty;C'#243'digo tribut'#225'rio n'#227'o informado no produto.'
      'NCM_I05;Genero;Classifica'#231#227'o fiscal inv'#225'lida para o produto.'
      'NCM_I05;Length;Classifica'#231#227'o fiscal do produto incorreto.;8')
    Left = 392
    Top = 40
  end
  object nfdNFeTemplates2: TnfdNFeTemplates2
    DataSet_Template.Strings = (
      '<infNFe Id="@a(Id_A03)" versao="@a(versao_A02)">'
      #9'<ide>'
      
        #9#9'<%cUF_B02%><%cNF_B03%><%natOp_B04%><%indPag_B05%><%mod_B06%><%' +
        'serie_B07%><%nNF_B08%><%dEmi_B09%><%dSaiEnt_B10%><%hSaiEnt_B10a%' +
        '><%tpNF_B11%><%cMunFG_B12%>   <NFref>       <%refNfe_B13%>      ' +
        ' <refNF>           <%cUF_B15%><%AAMM_B16%><%CNPJ_B17%><%mod_B18%' +
        '><%serie_B19%><%nNF_B20%>       </refNF>       <refNFP>         ' +
        '  <%cUF_B20b%><%AAMM_B20c%><%CNPJ_B20d%><%CPF_B20e%><%IE_B20f%><' +
        '%mod_B20f%><%serie_B20g%><%nNF_B20h%>       </refNFP>'#9#9#9#9'<%refCT' +
        'E_B20i%>       <refECF>           <%mod_B20k%><%nECF_B20l%><%nCO' +
        'O_B20m%>       </refECF>   </NFref>   <%tpImp_B21%><%tpEmis_B22%' +
        '><%cDV_B23%><%tpAmb_B24%><%finNFe_B25%><%procEmi_B26%><%verProc_' +
        'B27%><%dhCont_B28%><%xJust_B29%>'
      #9'</ide>'
      #9'<emit>'
      #9#9'<%CNPJ_C02%><%CPF_C02a%><%xNome_C03%><%xFant_C04%>'
      #9#9'<enderEmit>'
      
        #9#9#9'<%xLgr_C06%><%nro_C07%><%xCpl_C08%><%xBairro_C09%><%cMun_C10%' +
        '><%xMun_C11%><%UF_C12%><%CEP_C13%><%cPais_C14%><%xPais_C15%><%fo' +
        'ne_C16%>'
      #9#9'</enderEmit>'
      #9#9'<%IE_C17%><%IEST_C18%><%IM_C19%><%CNAE_C20%><%CRT_C21%>'
      #9'</emit>'
      #9'<dest>'
      #9#9'<%CNPJ_E02%><%CPF_E03%><%xNome_E04%>'
      #9#9'<enderDest>'
      
        #9#9#9'<%xLgr_E06%><%nro_E07%><%xCpl_E08%><%xBairro_E09%><%cMun_E10%' +
        '><%xMun_E11%><%UF_E12%><%CEP_E13%><%cPais_E14%><%xPais_E15%><%fo' +
        'ne_E16%>'
      #9#9'</enderDest>'
      #9#9'<%IE_E17%><%ISUF_E18%><%email_E19%>'
      #9'</dest>'
      #9'<retirada>'
      
        #9#9'<%CNPJ_F02%><%CPF_F20a%><%xLgr_F03%><%nro_F04%><%xCpl_F05%><%x' +
        'Bairro_F06%><%cMun_F07%><%xMun_F08%><%UF_F09%>'
      #9'</retirada>'
      #9'<entrega>'
      
        #9#9'<%CNPJ_G02%><%CPF_G20a%><%xLgr_G03%><%nro_G04%><%xCpl_G05%><%x' +
        'Bairro_G06%><%cMun_G07%><%xMun_G08%><%UF_G09%>'
      #9'</entrega>'
      #9'<det nItem="@nItem">'
      #9#9'<prod>'
      
        #9#9#9'<%cProd_I02%><%cEAN_I03%><%xProd_I04%><%NCM_I05%><%EXTIPI_I06' +
        '%><%genero_I07%><%CFOP_I08%><%uCom_I09%><%qCom_I10%><%vUnCom_I10' +
        'a%><%vProd_I11%>     <%cEANTrib_I12%><%uTrib_I13%><%qTrib_I14%><' +
        '%vUnTrib_I14a%><%vFrete_I15%><%vSeg_I16%><%vDesc_I17%><%vOutro_I' +
        '17a%><%indTot_I17b%><%xPed_I18%><%nItemPed_I19%><%nFCI_I70%>'
      #9#9#9'<DI>'
      
        #9#9#9#9'<%nDI_I19%><%dDi_I20%><%xLocDesemb_I21%><%UFDesemb_I22%><%dD' +
        'esemb_I23%><%cExportador_I24%>'
      #9#9#9#9'<adi>'
      
        #9#9#9#9#9'<%nAdicao_I26%><%nSeqAdic_I27%><%cFabricante_I28%><%vDescDI' +
        '_I29%>'
      #9#9#9#9'</adi>'
      #9#9#9'</DI>'#9
      '     <%xPed_I30%><%nItemPed_I31%>'
      #9#9#9'<veicProd>'
      
        #9#9#9#9'  <%tpOp_J02%><%chassi_J03%><%cCor_J04%><%xCor_J05%><%pot_J0' +
        '6%><%cilin_J07%><%pesoL_J08%><%pesoB_J09%><%nSerie_J10%><%tpComb' +
        '_J11%>         <%nMotor_J12%><%CMT_J13%><%dist_J14%><%RENAVAM_J1' +
        '5%><%anoMod_J16%><%anoFab_J17%><%tpPint_J18%><%tpVeic_J19%><%esp' +
        'Veic_J20%><%VIN_J21%>         <%condVeic_J22%><%cMod_J23%><%cCor' +
        'DEN_J24%><%lota_J25%><%tpRest_J26%>'
      #9#9#9'</veicProd>'
      #9#9#9'<med>'
      
        #9#9#9#9'<%nLote_K02%><%qLote_K03%><%dFab_K04%><%dVal_K05%><%vPMC_K06' +
        '%>'
      #9#9#9'</med>'
      #9#9#9'<arma>'
      #9#9#9#9'<%tpArma_L02%><%nSerie_L03%><%nCano_L04%><%descr_L05%>'
      #9#9#9'</arma>'
      '     <comb>'
      
        '         <%cProdANP_L102%><%CODIF_L103%><%qTemp_L104%><%UFCons_L' +
        '120%>         <CIDE>            <%qBCprod_L106%><%vAliqProd_L107' +
        '%><%vCIDE_L108%>         </CIDE>     </comb>'
      #9#9'</prod>'
      #9#9'<imposto>'
      '                   <%vTotTrib_M02%>'
      #9#9#9'<ICMS>'
      #9#9#9#9'<ICMS00>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%vBC_N15%><%pICMS_N16%' +
        '><%vICMS_N17%>'
      #9#9#9#9'</ICMS00>'
      #9#9#9#9'<ICMS10>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%vBC_N15%><%pICMS_N16%' +
        '><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pRedBCST_N20%><%vBC' +
        'ST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS10>'
      #9#9#9#9'<ICMS20>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%>'
      #9#9#9#9'</ICMS20>'
      #9#9#9#9'<ICMS30>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBCST_N18%><%pMVAST_N19%><%pRedB' +
        'CST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS30>'
      #9#9#9#9'<ICMS40>'
      #9#9#9#9#9'<%orig_N11%><%CST_N12%><%vICMS_N17%><%motDesICMS_N28%>'
      #9#9#9#9'</ICMS40>'
      #9#9#9#9'<ICMS51>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%>'
      #9#9#9#9'</ICMS51>'
      #9#9#9#9'<ICMS60>'
      #9#9#9#9#9'<%orig_N11%><%CST_N12%><%vBCSTRet_N26%><%vICMSSTRet_N27%>'
      #9#9#9#9'</ICMS60>'
      #9#9#9#9'<ICMS70>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pRedB' +
        'CST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS70>'
      #9#9#9#9'<ICMS90>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pRedB' +
        'CST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS90>'
      #9#9#9#9'<ICMSPart>'
      
        #9#9#9#9'    <%orig_N11%><%CST_N12%><%modBC_N13%><%vBC_N15%><%pRedBC_' +
        'N14%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pR' +
        'edBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%><%pBCOp_N' +
        '25%><%UFST_N24%>'
      #9#9#9#9'</ICMSPart>'
      #9#9#9#9'<ICMSST>'
      
        #9#9#9#9'    <%orig_N11%><%CST_N12%><%vBCSTRet_N26%><%vICMSSTRet_N27%' +
        '><%vBCSTDest_N31%><%vICMSSTDest_N32%>'
      #9#9#9#9'</ICMSST>'
      #9#9#9#9'<ICMSSN101>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%pCredSN_N29%><%vCredICMSSN_N' +
        '30%>'
      #9#9#9#9'</ICMSSN101>'
      #9#9#9#9'<ICMSSN102>'
      #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%>'
      #9#9#9#9'</ICMSSN102>'
      #9#9#9#9'<ICMSSN201>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%modBCST_N18%><%pMVAST_N19%><' +
        '%pRedBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%><%pCre' +
        'dSN_N29%><%vCredICMSSN_N30%>'
      #9#9#9#9'</ICMSSN201>'
      #9#9#9#9'<ICMSSN202>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%modBCST_N18%><%pMVAST_N19%><' +
        '%pRedBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMSSN202>'
      #9#9#9#9'<ICMSSN500>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%vBCSTRet_N26%><%vICMSSTRet_N' +
        '27%>'
      #9#9#9#9'</ICMSSN500>'
      #9#9#9#9'<ICMSSN900>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%modBC_N13%><%vBC_N15%><%pRed' +
        'BC_N14%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><' +
        '%pRedBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%><%pCre' +
        'dSN_N29%><%vCredICMSSN_N30%>'
      #9#9#9#9'</ICMSSN900>'
      #9#9#9'</ICMS>'
      #9#9#9'<IPI>'
      
        #9#9#9#9'<%clEnq_O02%><%CNPJProd_O03%><%cSelo_O04%><%qSelo_O05%><%cEn' +
        'q_O06%>'
      #9#9#9#9'<IPITrib>'
      
        #9#9#9#9#9'<%CST_O09%><%vBC_O10%><%qUnid_O11%><%vUnid_O12%><%pIPI_O13%' +
        '><%vIPI_O14%>'
      #9#9#9#9'</IPITrib>'
      #9#9#9#9'<IPINT>'
      #9#9#9#9#9'<%CST_O09%>'
      #9#9#9#9'</IPINT>'
      #9#9#9'</IPI>'
      #9#9#9'<II>'
      #9#9#9#9'<%vBC_P02%><%vDespAdu_P03%><%vII_P04%><%vIOF_P05%>'
      #9#9#9'</II>'
      #9#9#9'<ISSQN>'
      
        #9#9#9#9'<%vBC_U02%><%vAliq_U03%><%vISSQN_U04%><%cMunFG_U05%><%cListS' +
        'erv_U06%><%cSitTrib_U07%>'
      #9#9#9'</ISSQN>'
      #9#9#9'<PIS>'
      #9#9#9#9'<PISAliq>'
      #9#9#9#9#9'<%CST_Q06%><%vBC_Q07%><%pPIS_Q08%><%vPIS_Q09%>'
      #9#9#9#9'</PISAliq>'
      #9#9#9#9'<PISQtde>'
      #9#9#9#9#9'<%CST_Q06%><%qBCProd_Q10%><%vAliqProd_Q11%><%vPIS_Q09%>'
      #9#9#9#9'</PISQtde>'
      #9#9#9#9'<PISNT>'
      #9#9#9#9#9'<%CST_Q06%>'
      #9#9#9#9'</PISNT>'
      #9#9#9#9'<PISOutr>'
      
        #9#9#9#9#9'<%CST_Q06%><%vBC_Q07%><%pPIS_Q08%><%qBCProd_Q10%><%vAliqPro' +
        'd_Q11%><%vPIS_Q09%>'
      #9#9#9#9'</PISOutr>'
      #9#9#9'</PIS>'
      #9#9#9'<PISST>'
      
        #9#9#9#9'<%vBC_R02%><%pPIS_R03%><%qBCProd_R04%><%vAliqProd_R05%><%vPI' +
        'S_R06%>'
      #9#9#9'</PISST>'
      #9#9#9'<COFINS>'
      #9#9#9#9'<COFINSAliq>'
      #9#9#9#9#9'<%CST_S06%><%vBC_S07%><%pCOFINS_S08%><%vCOFINS_S11%>'
      #9#9#9#9'</COFINSAliq>'
      #9#9#9#9'<COFINSQtde>'
      #9#9#9#9#9'<%CST_S06%><%qBCProd_S09%><%vAliqProd_S10%><%vCOFINS_S11%>'
      #9#9#9#9'</COFINSQtde>'
      #9#9#9#9'<COFINSNT>'
      #9#9#9#9#9'<%CST_S06%>'
      #9#9#9#9'</COFINSNT>'
      #9#9#9#9'<COFINSOutr>'
      
        #9#9#9#9#9'<%CST_S06%><%vBC_S07%><%pCOFINS_S08%><%qBCProd_S09%><%vAliq' +
        'Prod_S10%><%vCOFINS_S11%>'
      #9#9#9#9'</COFINSOutr>'
      #9#9#9'</COFINS>'
      #9#9#9'<COFINSST>'
      
        #9#9#9#9'<%vBC_T02%><%pCOFINS_T03%><%qBCProd_T04%><%vAliqProd_T05%><%' +
        'vCOFINS_T06%>'
      #9#9#9'</COFINSST>'
      #9#9'</imposto>'
      #9#9'<%infAdProd_V01%>'
      #9'</det>'
      '<total>'
      #9'<ICMSTot>'
      
        #9#9'<%vBC_W03%><%vICMS_W04%><%vBCST_W05%><%vST_W06%><%vProd_W07%><' +
        '%vFrete_W08%><%vSeg_W09%><%vDesc_W10%><%vII_W11%><%vIPI_W12%><%v' +
        'PIS_W13%><%vCOFINS_W14%><%vOutro_W15%><%vNF_W16%><%vTotTrib_W16a' +
        '%>'
      #9'</ICMSTot>'
      #9'<ISSQNtot>'
      
        #9#9'<%vServ_W18%><%vBC_W19%><%vISS_W20%><%vPIS_W21%><%vCOFINS_W22%' +
        '>'
      #9'</ISSQNtot>'
      #9'<retTrib>'
      
        #9#9'<%vRetPIS_W24%><%vRetCOFINS_W25%><%vRetCSLL_W26%><%vBCIRRF_W27' +
        '%><%vIRRF_W28%><%vBCRetPrev_W29%><%vRetPrev_W30%>'
      #9'</retTrib>'
      '</total>'
      '<transp>'
      #9'<%modFrete_X02%>'
      #9'<transporta>'
      
        #9#9'<%CNPJ_X04%><%CPF_X05%><%xNome_X06%><%IE_X07%><%xEnder_X08%><%' +
        'xMun_X09%><%UF_X10%>'
      #9'</transporta>'
      #9'<retTransp>'
      
        #9#9'<%vServ_X12%><%vBCRet_X13%><%pICMSRet_X14%><%vICMSRet_X15%><%C' +
        'FOP_X16%><%cMunFG_X17%>'
      #9'</retTransp>'
      #9'<veicTransp>'
      #9#9'<%placa_X19%><%UF_X20%><%RNTC_X21%>'
      #9'</veicTransp>'
      #9'<reboque>'
      
        #9#9'<%placa_X23%><%UF_X24%><%RNTC_X25%><%vagao_x25a%><%balsa_x25b%' +
        '>'
      #9'</reboque>'
      #9'<vol>'
      
        #9#9'<%qVol_X27%><%esp_X28%><%marca_X29%><%nVol_X30%><%pesoL_X31%><' +
        '%pesoB_X32%>'
      #9'  <lacres>'
      #9#9'  <%nLacre_X34%>'
      #9'  </lacres>'
      #9'</vol>'
      '</transp>'
      '<cobr>'
      #9'<fat>'
      #9#9'<%nFat_Y03%><%vOrig_Y04%><%vDesc_Y05%><%vLiq_Y06%>'
      #9'</fat>'
      #9'<dup>'
      #9#9'<%nDup_Y08%><%dVenc_Y09%><%vDup_Y10%>'
      #9'</dup>'
      '</cobr>'
      '<infAdic>'
      
        #9' <%infAdFisco_Z02%><%infCpl_Z03%>  <obsCont>    <%xCampo_Z05%><' +
        '%xTexto_Z06%>  </obsCont></infAdic>'
      '<exporta><%UFEmbarq_ZA02%><%xLocEmbarq_ZA03%></exporta>'
      '<compra><%xNEmp_ZB02%><%xPed_ZB03%><%xCont_ZB04%></compra>'
      '<cana>'
      '  <%cana_ZC01%><%safra_ZC02%>  <forDia>'
      
        '    <%ref_ZC03%><%dia_ZC05%><%qtde_ZC06%><%qTotMes_ZC07%><%qTotA' +
        'nt_ZC08%><%qTotGer_ZC09%>  </forDia>'
      '  <deduc>'
      
        '    <%xDed_ZC11%><%vDed_ZC12%><%vFor_ZC13%><%vTotDed_ZC14%><%vLi' +
        'qFor_ZC15%>  </deduc>'
      '</cana>'
      '</infNFe>')
    DataSet_Campos.Strings = (
      '<A>'
      
        '<campo1 nome="infNFe_A01" tamanho="4"  requerido="n" tpnode="gru' +
        'po"/>'
      
        '<campo2 nome="versao_A02" tamanho="4"  requerido="n" tpnode="atr' +
        'ibuto"/>'
      
        '<campo3 nome="Id_A03"     tamanho="47" requerido="n" tpnode="atr' +
        'ibuto"/>'
      '</A>'
      '<B>'
      
        '<campo1  nome="ide_B01"      tamanho="2"  requerido="s" tpnode="' +
        'grupo" />'
      
        '<campo2  nome="cUF_B02"      tamanho="2"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo3  nome="cNF_B03"      tamanho="8"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo4  nome="natOp_B04"    tamanho="60" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo5  nome="indPag_B05"   tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo6  nome="mod_B06"      tamanho="2"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo7  nome="serie_B07"    tamanho="3"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo8  nome="nNF_B08"      tamanho="9"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo9  nome="dEmi_B09"     tamanho="10" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo10 nome="dSaiEnt_B10"  tamanho="10" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo11 nome="hSaiEnt_B10a" tamanho="10" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo12 nome="tpNF_B11"     tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo13 nome="cMunFG_B12"   tamanho="7"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo14 nome="tpImp_B21"    tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo15 nome="tpEmis_B22"   tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo16 nome="cDV_B23"      tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo17 nome="tpAmb_B24"    tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo18 nome="finNFe_B25"   tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo19 nome="procEmi_B26"  tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo20 nome="verProc_B27"  tamanho="20" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo21 nome="dhCont_B28"   tamanho="20" requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo22 nome="xJust_B29"    tamanho="20" requerido="n" tpnode="' +
        'elemento" />'
      '</B>'
      '<NFref>'
      
        '<campo1 nome="refNFe_B13"   tamanho="44" requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo2 nome="cUF_B15"      tamanho="2"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo3 nome="AAMM_B16"     tamanho="4"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo4 nome="CNPJ_B17"     tamanho="14" requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo5 nome="mod_B18"      tamanho="2"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo6 nome="serie_B19"    tamanho="3"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo7 nome="nNF_B20"      tamanho="9"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo8 nome="cUF_B20b"     tamanho="2"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo9 nome="AAMM_B20c"    tamanho="4"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo10 nome="CNPJ_B20d"    tamanho="14" requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo11 nome="CPF_B20e"     tamanho="11" requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo12 nome="IE_B20f"      tamanho="14" requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo13 nome="mod_B20f"     tamanho="2"  requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo14 nome="serie_B20g"   tamanho="3"  requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo15 nome="nNF_B20h"     tamanho="9"  requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo16 nome="refCTe_B20i"  tamanho="44" requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo17 nome="mod_B20k"     tamanho="2"  requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo18 nome="nECF_B20l"    tamanho="3"  requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo19 nome="nCOO_B20m"    tamanho="6"  requerido="n" tpnode="' +
        'elemento" />'
      '</NFref>'
      '<C>'
      
        '<campo1  nome="emit_C01"        tamanho="14"  requerido="s" tpno' +
        'de="grupo"    />'
      
        '<campo2  nome="CNPJ_C02"        tamanho="14"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo3  nome="CPF_C02a"        tamanho="11"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo4  nome="xNome_C03"       tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo5  nome="xFant_C04"       tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo6  nome="enderEmit_C05"   tamanho="14"  requerido="s" tpno' +
        'de="grupo"    />'
      
        '<campo7  nome="xLgr_C06"        tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo8  nome="nro_C07"         tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo9  nome="xCpl_C08"        tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo10 nome="xBairro_C09"     tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo11 nome="cMun_C10"        tamanho="7"   requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo12 nome="xMun_C11"        tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo13 nome="UF_C12"          tamanho="2"   requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo14 nome="CEP_C13"         tamanho="8"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo15 nome="cPais_C14"       tamanho="4"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo16 nome="xPais_C15"       tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo17 nome="fone_C16"        tamanho="14"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo18 nome="IE_C17"          tamanho="14"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo19 nome="IEST_C18"        tamanho="14"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo20 nome="IM_C19"          tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo21 nome="CNAE_C20"        tamanho="7"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo22 nome="CRT_C21"         tamanho="1"   requerido="s" tpno' +
        'de="elemento" />'
      '</C>'
      '<D>'
      
        '<campo1  nome="CNPJ_D02"        tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo2  nome="xOrgao_D03"      tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo3  nome="matr_D04"        tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo4  nome="xAgente_D05"     tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo5  nome="fone_D06"        tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo6  nome="UF_D07"          tamanho="2"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7  nome="nDAR_D08"        tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8  nome="dEmi_D09"        tamanho="8"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9  nome="vDAR_D10"        tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="repEmi_D11"      tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="dPag_D12"        tamanho="8"  requerido="n" tpnod' +
        'e="elemento" />'
      '</D>'
      '<E>'
      
        '<campo1 nome="dest_E01"        tamanho="14"  requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="CNPJ_E02"        tamanho="14"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo3 nome="CPF_E03"         tamanho="11"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo4 nome="xNome_E04"       tamanho="60"  requerido="s" tpnod' +
        'e="elemento" />'
      
        '<campo5 nome="enderDest_E05"   tamanho="60"  requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo6 nome="xLgr_E06"        tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7 nome="nro_E07"         tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8 nome="xCpl_E08"        tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9 nome="xBairro_E09"     tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="cMun_E10"       tamanho="7"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="xMun_E11"       tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo12 nome="UF_E12"         tamanho="2"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo13 nome="CEP_E13"        tamanho="8"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo14 nome="cPais_E14"      tamanho="4"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo15 nome="xPais_E15"      tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo16 nome="fone_E16"       tamanho="14"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo17 nome="IE_E17"         tamanho="14"  requerido="s" tpnod' +
        'e="elemento" />'
      
        '<campo18 nome="ISUF_E18"       tamanho="9"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo19 nome="email_E19"      tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      '</E>'
      '<F>'
      
        '<campo1  nome="retirada_F01"  tamanho="14"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="CNPJ_F02"      tamanho="14"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3  nome="CPF_F02a"      tamanho="11"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="xLgr_F03"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="nro_F04"       tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="xCpl_F05"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="xBairro_F06"   tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8  nome="cMun_F07"      tamanho="7"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9  nome="xMun_F08"      tamanho="60"   requerido="n" tpnod' +
        'e="elemento"/>'
      
        '<campo10 nome="UF_F09"        tamanho="2"   requerido="n" tpnode' +
        '="elemento" />'
      '</F>'
      '<G>'
      
        '<campo1  nome="entrega_G01"   tamanho="14"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="CNPJ_G02"      tamanho="14"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3  nome="CPF_G02a"      tamanho="11"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="xLgr_G03"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="nro_G04"       tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="xCpl_G05"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="xBairro_G06"   tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8  nome="cMun_G07"      tamanho="7"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9  nome="xMun_G08"      tamanho="60"   requerido="n" tpnod' +
        'e="elemento"/>'
      
        '<campo10 nome="UF_G09"        tamanho="2"   requerido="n" tpnode' +
        '="elemento" />'
      '</G>'
      '<H>'
      
        '<campo1 nome="det_H01"        tamanho="14" requerido="n" tpnode=' +
        '"grupo"     />'
      
        '<campo2 nome="nItem_H02"      tamanho="14" requerido="n" tpnode=' +
        '"atributo"  />'
      '</H>'
      '<I>'
      
        '<campo1 nome="prod_I01"          tamanho="60"  requerido="n" tpn' +
        'ode="grupo"    />'
      
        '<campo2  nome="cProd_I02"        tamanho="60"  requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo3  nome="cEAN_I03"         tamanho="14"  requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo4  nome="xProd_I04"        tamanho="120" requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo5  nome="NCM_I05"          tamanho="8"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo6  nome="EXTIPI_I06"       tamanho="3"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo7  nome="genero_I07"       tamanho="2"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo8  nome="CFOP_I08"         tamanho="4"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo9  nome="uCom_I09"         tamanho="6"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo10 nome="qCom_I10"         tamanho="14"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo11 nome="vUnCom_I10a"      tamanho="16"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo12 nome="vProd_I11"        tamanho="16"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo13 nome="cEANTrib_I12"     tamanho="14"  requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo14 nome="uTrib_I13"        tamanho="6"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo15 nome="qTrib_I14"        tamanho="12"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo16 nome="vUnTrib_I14a"     tamanho="16"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo17 nome="vFrete_I15"       tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo18 nome="vSeg_I16"         tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo19 nome="vDesc_I17"        tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo20 nome="vOutro_I17a"      tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo21 nome="indTot_I17b"      tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo22 nome="xPed_I18"         tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo23 nome="nItemPed_I19"     tamanho="6"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo24 nome="nFCI_I70"          tamanho="36"  requerido="n" tp' +
        'node="elemento" />'
      '</I>'
      '<DI>'
      
        '<campo1 nome="nDI_I19"          tamanho="12"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo2 nome="dDI_I20"          tamanho="10"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo3 nome="xLocDesemb_I21"   tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo4 nome="UFDesemb_I22"     tamanho="2"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo5 nome="dDesemb_I23"      tamanho="10"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo6 nome="cExportador_I24"  tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      '</DI>'
      '<ADI>'
      
        '<campo1 nome="nAdicao_I26"      tamanho="3"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo2 nome="nSeqAdic_I27"     tamanho="3"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo3 nome="cFabricante_I28"  tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo4 nome="vDescDI_I29"      tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo5 nome="xPed_I30"         tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo6 nome="nItemPed_I31"     tamanho="6"   requerido="n" tpno' +
        'de="elemento" />'
      '</ADI>'
      '<J>'
      
        '<campo1  nome="tpOp_J02"         tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo2  nome="chassi_J03"       tamanho="17"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo3  nome="cCor_J04"         tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo4  nome="xCor_J05"         tamanho="40"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo5  nome="pot_J06"          tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo6  nome="cilin_J07"        tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo7  nome="pesoL_J08"        tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo8  nome="pesoB_J09"        tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo9  nome="nSerie_J10"       tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo10 nome="tpComb_J11"       tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo11 nome="nMotor_J12"       tamanho="21"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo12 nome="CMT_J13"          tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo13 nome="dist_J14"         tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo14 nome="anoMod_J16"       tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo15 nome="anoFab_J17"       tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo16 nome="tpPint_J18"       tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo17 nome="tpVeic_J19"       tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo18 nome="espVeic_J20"      tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo19 nome="VIN_J21"          tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo20 nome="condVeic_J22"     tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo21 nome="cMod_J23"         tamanho="6"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo22 nome="cCorDENATRAN_J24" tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo23 nome="lota_J25"         tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo24 nome="tpRest_J26"       tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      '</J>'
      '<K>'
      
        '<campo1  nome="nLote_K02"        tamanho="20"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo2  nome="qLote_K03"        tamanho="11"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo3  nome="dFab_K04"         tamanho="11"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo4  nome="dVal_K05"         tamanho="11"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo5  nome="vPMC_K06"         tamanho="15"  requerido="n" tpn' +
        'ode="elemento"/>'
      '</K>'
      '<L>'
      
        '<campo1  nome="tpArma_L02"      tamanho="1"   requerido="n" tpno' +
        'de="elemento"/>'
      
        '<campo1  nome="nSerie_L03"      tamanho="9"   requerido="n" tpno' +
        'de="elemento"/>'
      
        '<campo1  nome="nCano_L04"       tamanho="9"   requerido="n" tpno' +
        'de="elemento"/>'
      
        '<campo1  nome="descr_L05"       tamanho="256" requerido="n" tpno' +
        'de="elemento"/>'
      '</L>'
      '<M>'
      
        '<campo1  nome="imposto_M01"    tamanho="60" requerido="n" tpnode' +
        '="grupo" />'
      
        '<campo2  nome="TIPO_M02"       tamanho="1"  requerido="s" tpnode' +
        '="elemento" />'
      
        '<campo3  nome="vTotTrib_M02"   tamanho="15" requerido="n" tpnode' +
        '="elemento" />'
      '</M>'
      '<N>'
      
        '<campo1  nome="ICMS_N01"            tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo2  nome="ICMS00_N02"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo3  nome="ICMS10_N03"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo4  nome="ICMS20_N04"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo5  nome="ICMS30_N05"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo6  nome="ICMS40_N06"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo7  nome="ICMS51_N07"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo8  nome="ICMS60_N08"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo9  nome="ICMS70_N09"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo10 nome="ICMS90_N10"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo11 nome="orig_N11"            tamanho="1"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo12 nome="CST_N12"             tamanho="2"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo13 nome="CSOSN_N12a"          tamanho="3"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo14 nome="modBC_N13"           tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo15 nome="pRedBC_N14"          tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo16 nome="vBC_N15"             tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo17 nome="pICMS_N16"           tamanho="5"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo18 nome="vICMS_N17"           tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo19 nome="modBCST_N18"         tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo20 nome="pMVAST_N19"          tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo21 nome="pRedBCST_N20"        tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo22 nome="vBCST_N21"           tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo23 nome="pICMSST_N22"         tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo24 nome="vICMSST_N23"         tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo25 nome="UFST_N24"            tamanho="2"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo26 nome="pBCOp_N25"           tamanho="5"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo27 nome="vBCSTRet_N26"        tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo28 nome="vICMSSTRet_N27"      tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo29 nome="motDesICMS_N28"      tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo30 nome="pCredSN_N29"         tamanho="5"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo31 nome="vCredICMSSN_N30"     tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo32 nome="vBCSTDest_N31"       tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo33 nome="vICMSSTDest_N32"     tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      '</N>'
      '<O>'
      
        '<campo1  nome="IPI_O01"       tamanho="5"   requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="clEnq_O02"     tamanho="5"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3  nome="CNPJProd_O03"  tamanho="14"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="cSelo_O04"     tamanho="50"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="qSelo_O05"     tamanho="12"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="cEnq_O06"      tamanho="3"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="IPITrib_O07"   tamanho="5"   requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo8  nome="IPINT_O08"     tamanho="5"   requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo9  nome="CST_O09"       tamanho="2"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo10 nome="vBC_O10"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo11 nome="qUnid_O11"     tamanho="16"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo12 nome="vUnid_O12"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo13 nome="pIPI_O13"      tamanho="5"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo14 nome="vIPI_O14"      tamanho="16"  requerido="n" tpnode' +
        '="elemento" />'
      '</O>'
      '<P>'
      
        '<campo1 nome="II_P01"         tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="vBC_P02"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="vDespAdu_P03"   tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="vII_P04"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="vIOF_P05"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      '</P>'
      '<Q>'
      
        '<campo1 nome="PIS_Q01"         tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="PISAliq_Q02"     tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo3 nome="PISQtde_Q03"     tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo4 nome="PISNT_Q04"       tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo5 nome="PISOutr_Q05"     tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo6 nome="CST_Q06"         tamanho="2"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7 nome="vBC_Q07"         tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8 nome="pPIS_Q08"        tamanho="6"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9 nome="vPIS_Q09"        tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="qBCProd_Q10"    tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="vAliqProd_Q11"  tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      '</Q>'
      '<R>'
      
        '<campo1 nome="PISST_R01"      tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="vBC_R02"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="pPIS_R03"       tamanho="6"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="qBCProd_R04"    tamanho="16"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="vAliqProd_R05"  tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="vPIS_R06"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      '</R>'
      '<S>'
      
        '<campo1  nome="COFINS_S01"       tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo2  nome="COFINSAliq_S01"   tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo3  nome="COFINSQtde_S01"   tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo4  nome="COFINSNT_S01"     tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo5  nome="COFINSOutr_S01"   tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo6  nome="CST_S06"          tamanho="2"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo7  nome="vBC_S07"          tamanho="15" requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo8  nome="pCOFINS_S08"      tamanho="5"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo9  nome="qBCProd_S09"      tamanho="16" requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo10 nome="vAliqProd_S10"    tamanho="15" requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo11 nome="vCOFINS_S11"      tamanho="15" requerido="n" tpno' +
        'de="elemento" />'
      '</S>'
      '<T>'
      
        '<campo1 nome="COFINSST_T01"    tamanho="15"  requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="vBC_T02"         tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo3 nome="pCOFINS_T03"     tamanho="5"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo4 nome="qBCProd_T04"     tamanho="16"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo5 nome="vAliqProd_T05"   tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo6 nome="vCOFINS_T06"     tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      '</T>'
      '<U>'
      
        '<campo1 nome="ISSQN_U01"      tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="vBC_U02"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="vAliq_U03"      tamanho="6"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="vISSQN_U04"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="cMunFG_U05"     tamanho="7"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="cListServ_U06"  tamanho="4"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7 nome="cSitTrib_U07"   tamanho="1"   requerido="n" tpnode' +
        '="elemento" />'
      '</U>'
      '<V>'
      
        '<campo1 nome="infAdProd_V01"  tamanho="500"  requerido="n" tpnod' +
        'e="elemento" />'
      '</V>'
      '<W>'
      
        '<campo1  nome="total_W01"     tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="ICMSTot_W02"   tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo3  nome="vBC_W03"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="vICMS_W04"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="vBCST_W05"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="vST_W06"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="vProd_W07"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8  nome="vFrete_W08"    tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9  nome="vSeg_W09"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo10 nome="vDesc_W10"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo11 nome="vII_W11"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo12 nome="vIPI_W12"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo13 nome="vPIS_W13"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo14 nome="vCOFINS_W14"   tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo15 nome="vOutro_W15"    tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo16 nome="vNF_W16"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo17 nome="ISSQNtot_W17"  tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo18 nome="vServ_W18"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo19 nome="vBC_W19"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo20 nome="vISS_W20"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo21 nome="vPIS_W21"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo22 nome="vCOFINS_W22"   tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo23 nome="retTrib_W23"     tamanho="15"  requerido="n" tpno' +
        'de="grupo"  />'
      
        '<campo24 nome="vRetPIS_W24"     tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo25 nome="vRetCOFINS_W25"  tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo26 nome="vRetCSLL_W26"    tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo27 nome="vBCIRRF_W27"     tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo28 nome="vIRRF_W28"       tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo29 nome="vBCRetPrev_W29"  tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo30 nome="vRetPrev_W30"    tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo31 nome="vTotTrib_W16a"   tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      '</W>'
      '<X>'
      
        '<campo1 nome="transp_X01"       tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="modFrete_X02"     tamanho="1"  requerido="s" tpnod' +
        'e="elemento" />'
      
        '<campo3 nome="transporta_X03"   tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo4 nome="CNPJ_X04"         tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo5 nome="CPF_X05"          tamanho="11" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo6 nome="xNome_X06"        tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7 nome="IE_X07"           tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8 nome="xEnder_X08"       tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9 nome="xMun_X09"         tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="UF_X10"          tamanho="2"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="retTransp_X13"   tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo12 nome="vServ_X12"       tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo13 nome="vBCRet_X13"      tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo14 nome="pICMSRet_X14"    tamanho="6"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo15 nome="vICMSRet_X15"    tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo16 nome="CFOP_X16"        tamanho="4"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo17 nome="cMunFG_X17"      tamanho="7"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo18 nome="veicTransp_X18"  tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo19 nome="placa_X19"       tamanho="8"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo20 nome="UF_X20"          tamanho="2"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo21 nome="RNTC_X21"        tamanho="20" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo22 nome="vagao_x25a"      tamanho="20" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo23 nome="balsa_x25b"      tamanho="20" requerido="n" tpnod' +
        'e="elemento" />'
      '</X>'
      '<XREBOQUE>'
      
        '<campo1 nome="placa_X23"       tamanho="8"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo2 nome="UF_X24"          tamanho="2"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="RNTC_X25"        tamanho="20" requerido="n" tpnode' +
        '="elemento" />'
      '</XREBOQUE>'
      '<XVOLUME>'
      
        '<campo1 nome="qVol_X27"        tamanho="15" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo2 nome="esp_X28"         tamanho="60" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="marca_X29"       tamanho="60" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="nVol_X30"        tamanho="60" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="pesoL_X31"       tamanho="15" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="pesoB_X32"       tamanho="15" requerido="n" tpnode' +
        '="elemento" />'
      '</XVOLUME>'
      '<XLACRE>'
      
        '<campo1 nome="nLacre_X34"      tamanho="60" requerido="n" tpnode' +
        '="elemento" />'
      '</XLACRE>'
      '<Y>'
      
        '<campo1 nome="cobr_Y01"    tamanho="60"  requerido="n" tpnode="g' +
        'rupo"    />'
      
        '<campo2 nome="fat_Y02"     tamanho="60"  requerido="n" tpnode="g' +
        'rupo"    />'
      
        '<campo3 nome="nFat_Y03"    tamanho="60"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo4 nome="vOrig_Y04"   tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo5 nome="vDesc_Y05"   tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo6 nome="vLiq_Y06"    tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo7  nome="dup_Y07"    tamanho="60"  requerido="n" tpnode="g' +
        'rupo"    />'
      
        '<campo8  nome="nDup_Y08"   tamanho="60"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo9  nome="dVenc_Y09"  tamanho="10"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo10 nome="vDup_Y10"   tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      '</Y>'
      '<Z>'
      
        '<campo1 nome="infAdic_Z01"     tamanho="200"   requerido="n" tpn' +
        'ode="grupo"    />'
      
        '<campo2 nome="infAdFisco_Z02"  tamanho="256"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo3 nome="infCpl_Z03"      tamanho="5000"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo4 nome="obsCont_Z04"     tamanho="2"     requerido="n" tpn' +
        'ode="grupo"    />'
      
        '<campo5 nome="xCampo_Z05"      tamanho="20"    requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo6 nome="xTexto_Z06"      tamanho="60"    requerido="n" tpn' +
        'ode="elemento" />'
      '</Z>'
      '<ZA>'
      
        '<campo1 nome="exporta_ZA01"    tamanho="200"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo2 nome="UFEmbarq_ZA02"   tamanho="2"    requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo3 nome="xLocEmbarq_ZA03"  tamanho="60"   requerido="n" tpn' +
        'ode="elemento" />'
      '</ZA>'
      '<ZB>'
      
        '<campo1 nome="compra_ZB01"  tamanho="200"  requerido="n" tpnode=' +
        '"grupo"    />'
      
        '<campo2 nome="xNEmp_ZB02"   tamanho="22"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="xPed_ZB03"    tamanho="60"   requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo4 nome="xCont_ZB04"   tamanho="60"   requerido="n" tpnode=' +
        '"elemento" />'
      '</ZB>'
      '<ZC>'
      
        '<campo1 nome="cana_ZC01"     tamanho="200"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="safra_ZC02"    tamanho="9"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="ref_ZC03"      tamanho="6"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="dia_ZC05"      tamanho="2"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="qtde_ZC06"     tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="qTotMes_ZC07"  tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7 nome="qTotAnt_ZC08"  tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8 nome="qTotGer_ZC09"  tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9 nome="xDed_ZC11"     tamanho="60"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo10 nome="vDed_ZC12"    tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo11 nome="vFor_ZC13"    tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo12 nome="vTotDed_ZC14" tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo13 nome="vLiqFor_ZC15" tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      '</ZC>')
    DPEC_Campos.Strings = (
      '<cabecalho>'
      
        '<campo1 nome="cUF_AP06"      tipo="string" tamanho="2"   requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo2 nome="tpAmb_AP07"    tipo="string" tamanho="1"   requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo3 nome="verProc_AP08"  tipo="string" tamanho="20"  requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo4 nome="CNPJ_AP09"     tipo="string" tamanho="14"  requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo5 nome="IE_AP10"       tipo="string" tamanho="14"  requeri' +
        'do="s" tpnode="elemento"/>'
      '</cabecalho>'
      '<notas>'
      
        '<campo1 nome="chNFe_AP12"  tipo="string" tamanho="44"  requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo2 nome="CNPJ_AP13"   tipo="string" tamanho="14"  requerido' +
        '="n" tpnode="elemento"/>'
      
        '<campo3 nome="CPF_AP14"    tipo="string" tamanho="11"  requerido' +
        '="n" tpnode="elemento"/>'
      
        '<campo4 nome="UF_AP15"     tipo="string" tamanho="2"   requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo5 nome="vNF_AP16"    tipo="string" tamanho="15"  requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo6 nome="vICMS_AP17"  tipo="string" tamanho="15"  requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo7 nome="vST_AP18"    tipo="string" tamanho="15"  requerido' +
        '="s" tpnode="elemento"/>'
      '</notas>')
    DPEC_Template.Strings = (
      '<infDPEC Id*>'
      '<ideDec>'
      
        '<%cUF_AP06%><%tpAmb_AP07%><%verProc_AP08%><%CNPJ_AP09%><%IE_AP10' +
        '%>'
      '</ideDec>'
      '<resNFe>'
      
        '<%chNFe_AP12%><%CNPJ_AP13%><%CPF_AP14%><%UF_AP15%><%vNF_AP16%><%' +
        'vICMS_AP17%><%vST_AP18%>'
      '</resNFe>'
      '</infDPEC>')
    CCe_Template.Strings = (
      '<envEvento versao="@a(versao_HP02)">'
      '   <%idLote_HP03%>'
      '   <evento versao="@a(versao_HP05)">'
      '       <infEvento Id="@a(Id_HP07)">'
      '           <%cOrgao_HP08%>'
      '           <%tpAmb_HP09%>'
      '           <%CNPJ_HP10%>'
      '           <%CPF_HP11%>'
      '           <%chNFe_HP12%>'
      '           <%dhEvento_HP13%>'
      '           <%tpEvento_HP14%>'
      '           <%nSeqEvento_HP15%>'
      '           <%verEvento_HP16%>'
      '           <detEvento versao="@a(versao_HP18)">'
      '               <%descEvento_HP19%>'
      '               <%xCorrecao_HP20%>'
      '               <%xCondUso_HP20a%>'
      '           </detEvento>'
      '       </infEvento>'
      '   </evento>'
      '</envEvento>')
    CCe_Campos.Strings = (
      '<envEvento>'
      
        '<campo1  nome="envEvento_HP01"     tamanho="4"     requerido="n"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP02"        tamanho="4"     requerido="n"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="idLote_HP03"        tamanho="15"    requerido="s"' +
        '   tpnode="elemento"/>'
      '</envEvento>'
      '<evento>'
      
        '<campo1  nome="evento_HP04"        tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP05"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="infEvento_HP06"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo4  nome="Id_HP07"            tamanho="54"    requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo5  nome="cOrgao_HP08"        tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo6  nome="tpAmb_HP09"         tamanho="1"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo7  nome="CNPJ_HP10"          tamanho="14"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo8  nome="CPF_HP11"           tamanho="11"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo9  nome="chNFe_HP12"         tamanho="44"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo10 nome="dhEvento_HP13"      tamanho="25"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo11 nome="tpEvento_HP14"      tamanho="6"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo12 nome="nSeqEvento_HP15"    tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo13 nome="verEvento_HP16"     tamanho="4"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo14 nome="detEvento_HP17"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo15 nome="versao_HP18"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo16 nome="descEvento_HP19"    tamanho="60"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo17 nome="xCorrecao_HP20"     tamanho="1000"  requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo18 nome="xCondUso_HP20a"     tamanho="1000"  requerido="s"' +
        '   tpnode="elemento"/>'
      '</evento>')
    CLe_Template.Strings = (
      '<enviCLe versao="@a(versao)">'
      ' <%tpAmb%>'
      ' <CLe>'
      '   <transportador>'
      '     <%CNPJ%>'
      '     <%CPF%>'
      '     <%xNome%>'
      '     <%xFant%>'
      '     <dadosTranspCLeAvulsa>'
      '       <%CPFCLeAvulsa%>'
      '       <%CNPJCLeAvulsa%>'
      '       <%xNomeCLeAvulsa%>'
      '     </dadosTranspCLeAvulsa>'
      '   </transportador>'
      '   <mdTransp>'
      '     <rodoviario>'
      '       <%pVeic%>'
      '       <%cUFVeic%>'
      '       <%pCarreta%>'
      '       <%cUFCarreta%>'
      '       <%pCarreta2%>'
      '       <%cUFCarreta2%>'
      '     </rodoviario>'
      '     <outro>'
      '       <%cMod%>'
      '       <%cUFTransporte%>'
      '       <%xIdent%>'
      '     </outro>'
      '   </mdTransp>'
      '   <%cUFOrigem%>'
      '   <%cUFDestino%>'
      '   <det>'
      '     <%chvAcesso%>'
      '   </det>'
      ' </CLe>'
      '</enviCLe>')
    CLe_Campos.Strings = (
      '<enviCLe>'
      
        '<campo1 nome="enviCLe" tamanho="4" requerido="n" tpnode="grupo"/' +
        '>'
      
        '<campo2 nome="versao" tamanho="4" requerido="n" tpnode="atributo' +
        '"/>'
      
        '<campo3 nome="tpAmb" tamanho="1" requerido="n" tpnode="elemento"' +
        '/>'
      '<campo4 nome="CLe" tamanho="4" requerido="n" tpnode="grupo"/>'
      
        '<campo5 nome="tranportador" tamanho="4" requerido="n" tpnode="gr' +
        'upo"/>'
      
        '<campo6 nome="CNPJ" tamanho="14" requerido="n" tpnode="elemento"' +
        '/>'
      
        '<campo7 nome="CPF" tamanho="11" requerido="n" tpnode="elemento"/' +
        '>'
      
        '<campo8 nome="xNome" tamanho="60" requerido="n" tpnode="elemento' +
        '"/>'
      
        '<campo9 nome="xFant" tamanho="60" requerido="n" tpnode="elemento' +
        '"/>'
      
        '<campo10 nome="dadosTranspCLeAvulsa" tamanho="4" requerido="n" t' +
        'pnode="grupo"/>'
      
        '<campo11 nome="CPFCLeAvulsa" tamanho="11" requerido="n" tpnode="' +
        'elemento"/>'
      
        '<campo12 nome="CNPJCLeAvulsa" tamanho="14" requerido="n" tpnode=' +
        '"elemento"/>'
      
        '<campo13 nome="xNomeCLeAvulsa" tamanho="60" requerido="n" tpnode' +
        '="elemento"/>'
      
        '<campo14 nome="mdTransp" tamanho="4" requerido="n" tpnode="grupo' +
        '"/>'
      
        '<campo15 nome="rodoviario" tamanho="4" requerido="n" tpnode="gru' +
        'po"/>'
      
        '<campo16 nome="pVeic" tamanho="8" requerido="n" tpnode="elemento' +
        '"/>'
      
        '<campo17 nome="cUFVeic" tamanho="2" requerido="n" tpnode="elemen' +
        'to"/>'
      
        '<campo18 nome="pCarreta" tamanho="8" requerido="n" tpnode="eleme' +
        'nto"/>'
      
        '<campo19 nome="cUFCarreta" tamanho="2" requerido="n" tpnode="ele' +
        'mento"/>'
      
        '<campo20 nome="pCarreta2" tamanho="8" requerido="n" tpnode="elem' +
        'ento"/>'
      
        '<campo21 nome="cUFCarreta2" tamanho="2" requerido="n" tpnode="el' +
        'emento"/>'
      '<campo22 nome="outro" tamanho="4" requerido="n" tpnode="grupo"/>'
      
        '<campo23 nome="cMod" tamanho="2" requerido="n" tpnode="elemento"' +
        '/>'
      
        '<campo24 nome="cUFTransporte" tamanho="2" requerido="n" tpnode="' +
        'elemento"/>'
      
        '<campo25 nome="xIdent" tamanho="255" requerido="n" tpnode="eleme' +
        'nto"/>'
      
        '<campo26 nome="cUFOrigem" tamanho="2" requerido="n" tpnode="elem' +
        'ento"/>'
      
        '<campo27 nome="cUFDestino" tamanho="2" requerido="n" tpnode="ele' +
        'mento"/>'
      '</enviCLe>'
      '<det>'
      '<campo1 nome="det" tamanho="4" requerido="n" tpnode="grupo"/>'
      
        '<campo2 nome="chvAcesso" tamanho="44" requerido="n" tpnode="elem' +
        'ento"/>'
      '</det>')
    CancelamentoEvt_Campos.Strings = (
      '<envEvento>'
      
        '<campo1  nome="envEvento_HP01"     tamanho="4"     requerido="n"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP02"        tamanho="4"     requerido="n"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="idLote_HP03"        tamanho="15"    requerido="s"' +
        '   tpnode="elemento"/>'
      '</envEvento>'
      '<evento>'
      
        '<campo1  nome="evento_HP04"        tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP05"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="infEvento_HP06"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo4  nome="Id_HP07"            tamanho="54"    requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo5  nome="cOrgao_HP08"        tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo6  nome="tpAmb_HP09"         tamanho="1"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo7  nome="CNPJ_HP10"          tamanho="14"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo8  nome="CPF_HP11"           tamanho="11"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo9  nome="chNFe_HP12"         tamanho="44"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo10 nome="dhEvento_HP13"      tamanho="25"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo11 nome="tpEvento_HP14"      tamanho="6"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo12 nome="nSeqEvento_HP15"    tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo13 nome="verEvento_HP16"     tamanho="4"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo14 nome="detEvento_HP17"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo15 nome="versao_HP18"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo16 nome="descEvento_HP19"    tamanho="60"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo17 nome="nProt_HP20"         tamanho="15"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo18 nome="xJust_HP21"         tamanho="255"   requerido="s"' +
        '   tpnode="elemento"/>'
      '</evento>')
    CancelamentoEvt_Template.Strings = (
      '<envEvento versao="@a(versao_HP02)">'
      '   <%idLote_HP03%>'
      '   <evento versao="@a(versao_HP05)">'
      '       <infEvento Id="@a(Id_HP07)">'
      '           <%cOrgao_HP08%>'
      '           <%tpAmb_HP09%>'
      '           <%CNPJ_HP10%>'
      '           <%CPF_HP11%>'
      '           <%chNFe_HP12%>'
      '           <%dhEvento_HP13%>'
      '           <%tpEvento_HP14%>'
      '           <%nSeqEvento_HP15%>'
      '           <%verEvento_HP16%>'
      '           <detEvento versao="@a(versao_HP18)">'
      '               <%descEvento_HP19%>'
      '               <%nProt_HP20%>'
      '               <%xJust_HP21%>'
      '           </detEvento>'
      '       </infEvento>'
      '   </evento>'
      '</envEvento>')
    Left = 264
    Top = 112
  end
  object ValidaEschemaAntesEnvio: TValidaEschemaAntesEnvio
    DiretorioSchema = 'C:\NF-e\PL_006j'
    NomeSchemaNfe = 'enviNFe_v2.00.xsd'
    NomeSchemaConsultaNfe = 'consSitNFe_v2.00.xsd'
    NomeSchemaConsultaProtocolo = 'consReciNFe_v2.00.xsd'
    NomeSchemaCancelaNfe = 'cancNFe_v2.00.xsd'
    NomeSchemaInutilizaNfe = 'inutNFe_v2.00.xsd'
    NomeSchemaCCe = 'envEvento_v1.00.xsd'
    Left = 264
    Top = 40
  end
  object qryConf: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  ID_NFE_CONF,'
      '  DIR_EXPORTACAO,'
      '  DIR_LOG,'
      '  FLG_ARQ_LOG,'
      '  IMG_LOGO,'
      '  NOME_CERTIFICADO,'
      '  PROXY,'
      '  PROXY_SENHA,'
      '  PROXY_USER,'
      '  TIPO_CERTIFICADO,'
      '  FLG_VALIDA,'
      '  FLG_AMBIENTE,'
      '  FLG_TP_IMP,'
      '  FLG_IMPRIME,'
      '  QTDE_IMP,'
      '  IMP_PADRAO,'
      '  DIR_TXTNFE,'
      '  FLG_MODOIMP,'
      '  FLG_MONITORA,'
      '  FLG_SIMPLESN,'
      '  HR_VERAO'
      'FROM '
      '  TB_NFE_CONF ')
    SQLConnection = dm_Princial.SQLConnect
    Left = 472
    Top = 24
  end
  object cdsConf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConf'
    AfterInsert = cdsConfAfterInsert
    Left = 472
    Top = 80
    object cdsConfID_NFE_CONF: TIntegerField
      FieldName = 'ID_NFE_CONF'
      Required = True
    end
    object cdsConfDIR_EXPORTACAO: TStringField
      FieldName = 'DIR_EXPORTACAO'
      Size = 100
    end
    object cdsConfDIR_LOG: TStringField
      FieldName = 'DIR_LOG'
      Size = 100
    end
    object cdsConfFLG_ARQ_LOG: TStringField
      FieldName = 'FLG_ARQ_LOG'
      FixedChar = True
      Size = 1
    end
    object cdsConfIMG_LOGO: TBlobField
      FieldName = 'IMG_LOGO'
      Size = 1
    end
    object cdsConfNOME_CERTIFICADO: TStringField
      FieldName = 'NOME_CERTIFICADO'
      Required = True
      Size = 255
    end
    object cdsConfPROXY: TStringField
      FieldName = 'PROXY'
      Size = 50
    end
    object cdsConfPROXY_SENHA: TStringField
      FieldName = 'PROXY_SENHA'
      Size = 50
    end
    object cdsConfPROXY_USER: TStringField
      FieldName = 'PROXY_USER'
      Size = 50
    end
    object cdsConfTIPO_CERTIFICADO: TStringField
      FieldName = 'TIPO_CERTIFICADO'
      Size = 5
    end
    object cdsConfFLG_VALIDA: TStringField
      FieldName = 'FLG_VALIDA'
      FixedChar = True
      Size = 1
    end
    object cdsConfFLG_AMBIENTE: TStringField
      FieldName = 'FLG_AMBIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsConfFLG_TP_IMP: TStringField
      FieldName = 'FLG_TP_IMP'
      FixedChar = True
      Size = 1
    end
    object cdsConfFLG_IMPRIME: TStringField
      FieldName = 'FLG_IMPRIME'
      FixedChar = True
      Size = 1
    end
    object cdsConfQTDE_IMP: TSmallintField
      FieldName = 'QTDE_IMP'
    end
    object cdsConfIMP_PADRAO: TStringField
      FieldName = 'IMP_PADRAO'
      Size = 50
    end
    object cdsConfDIR_TXTNFE: TStringField
      FieldName = 'DIR_TXTNFE'
      Size = 100
    end
    object cdsConfFLG_MODOIMP: TStringField
      FieldName = 'FLG_MODOIMP'
      FixedChar = True
      Size = 1
    end
    object cdsConfFLG_MONITORA: TStringField
      FieldName = 'FLG_MONITORA'
      FixedChar = True
      Size = 1
    end
    object cdsConfFLG_SIMPLESN: TStringField
      FieldName = 'FLG_SIMPLESN'
      FixedChar = True
      Size = 1
    end
    object cdsConfHR_VERAO: TStringField
      FieldName = 'HR_VERAO'
      FixedChar = True
      Size = 1
    end
  end
  object dspConf: TDataSetProvider
    DataSet = qryConf
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 528
    Top = 24
  end
  object dsConfi: TDataSource
    DataSet = cdsConf
    Left = 528
    Top = 80
  end
  object nfdNFeServidores2: TnfdNFeServidores
    WS_DPEC_Homologacao.Envio = 
      'https://hom.nfe.fazenda.gov.br/SCERecepcaoRFB/SCERecepcaoRFB.asm' +
      'x'
    WS_DPEC_Homologacao.Consulta = 
      'https://hom.nfe.fazenda.gov.br/SCEConsultaRFB/SCEConsultaRFB.asm' +
      'x'
    WS_DPEC_Producao.Envio = 
      'https://www.nfe.fazenda.gov.br/SCERecepcaoRFB/SCERecepcaoRFB.asm' +
      'xc'
    WS_DPEC_Producao.Consulta = 
      'https://www.nfe.fazenda.gov.br/SCEConsultaRFB/SCEConsultaRFB.asm' +
      'x'
    Left = 144
    Top = 120
  end
  object qryConf_Cont: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  ID_CONTINGENCIA,'
      '  FLG_TP_CONTI,'
      '  MOTIVO,'
      '  DTA_CONTI'
      'FROM '
      '  TB_NFE_CONTINGENCIA')
    SQLConnection = dm_Princial.SQLConnect
    Left = 472
    Top = 144
  end
  object cdsConf_Cont: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConf_Cont'
    AfterInsert = cdsConf_ContAfterInsert
    Left = 472
    Top = 200
    object cdsConf_ContID_CONTINGENCIA: TIntegerField
      FieldName = 'ID_CONTINGENCIA'
      Required = True
    end
    object cdsConf_ContFLG_TP_CONTI: TStringField
      FieldName = 'FLG_TP_CONTI'
      FixedChar = True
      Size = 1
    end
    object cdsConf_ContMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 100
    end
    object cdsConf_ContDTA_CONTI: TSQLTimeStampField
      FieldName = 'DTA_CONTI'
    end
  end
  object dspConf_Cont: TDataSetProvider
    DataSet = qryConf_Cont
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 552
    Top = 144
  end
  object dsConf_Cont: TDataSource
    DataSet = cdsConf_Cont
    Left = 552
    Top = 200
  end
  object cdsNfe_Cab: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 8
    object cdsNfe_CabcUF: TStringField
      FieldName = 'cUF'
      Size = 2
    end
    object cdsNfe_CabcNF: TStringField
      FieldName = 'cNF'
      Size = 8
    end
    object cdsNfe_CabnatOp: TStringField
      FieldName = 'natOp'
      Size = 60
    end
    object cdsNfe_CabindPag: TStringField
      FieldName = 'indPag'
      Size = 1
    end
    object cdsNfe_Cabmod: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object cdsNfe_Cabserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object cdsNfe_CabnNF: TStringField
      FieldName = 'nNF'
      Size = 9
    end
    object cdsNfe_CabdEmi: TStringField
      FieldName = 'dEmi'
      Size = 10
    end
    object cdsNfe_CabdSaiEnt: TStringField
      FieldName = 'dSaiEnt'
      Size = 10
    end
    object cdsNfe_CabhSaiEnt: TStringField
      FieldName = 'hSaiEnt'
      Size = 8
    end
    object cdsNfe_CabtpNF: TStringField
      FieldName = 'tpNF'
      Size = 1
    end
    object cdsNfe_CabcMunFG: TStringField
      FieldName = 'cMunFG'
      Size = 7
    end
    object cdsNfe_CabtpImp: TStringField
      FieldName = 'tpImp'
      Size = 1
    end
    object cdsNfe_CabtpEmis: TStringField
      FieldName = 'tpEmis'
      Size = 1
    end
    object cdsNfe_CabcDV: TStringField
      FieldName = 'cDV'
      Size = 1
    end
    object cdsNfe_CabtpAmb: TStringField
      FieldName = 'tpAmb'
      Size = 1
    end
    object cdsNfe_CabfinNFe: TStringField
      FieldName = 'finNFe'
      Size = 1
    end
    object cdsNfe_CabprocEmi: TStringField
      FieldName = 'procEmi'
      Size = 1
    end
    object cdsNfe_CabverProc: TStringField
      FieldName = 'verProc'
    end
    object cdsNfe_CabdhCont: TStringField
      FieldName = 'dhCont'
    end
    object cdsNfe_CabxJust: TStringField
      FieldName = 'xJust'
      Size = 256
    end
    object cdsNfe_CabCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsNfe_CabCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsNfe_CabxNome: TStringField
      FieldName = 'xNome'
      Size = 60
    end
    object cdsNfe_CabxFant: TStringField
      FieldName = 'xFant'
      Size = 60
    end
    object cdsNfe_CabxLgr: TStringField
      FieldName = 'xLgr'
      Size = 60
    end
    object cdsNfe_Cabnro: TStringField
      FieldName = 'nro'
      Size = 60
    end
    object cdsNfe_CabxCpl: TStringField
      FieldName = 'xCpl'
      Size = 60
    end
    object cdsNfe_CabxBairro: TStringField
      FieldName = 'xBairro'
      Size = 60
    end
    object cdsNfe_CabcMun: TStringField
      FieldName = 'cMun'
      Size = 7
    end
    object cdsNfe_CabxMun: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object cdsNfe_CabUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsNfe_CabCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsNfe_CabcPais: TStringField
      FieldName = 'cPais'
      Size = 4
    end
    object cdsNfe_CabxPais: TStringField
      FieldName = 'xPais'
      Size = 60
    end
    object cdsNfe_Cabfone: TStringField
      FieldName = 'fone'
      Size = 14
    end
    object cdsNfe_CabIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object cdsNfe_CabIEST: TStringField
      FieldName = 'IEST'
      Size = 14
    end
    object cdsNfe_CabIM: TStringField
      FieldName = 'IM'
      Size = 15
    end
    object cdsNfe_CabCNAE: TStringField
      FieldName = 'CNAE'
      Size = 7
    end
    object cdsNfe_CabCRT: TStringField
      FieldName = 'CRT'
      Size = 1
    end
    object cdsNfe_CabCNPJ_d: TStringField
      FieldName = 'CNPJ_d'
      Size = 14
    end
    object cdsNfe_CabCPF_d: TStringField
      FieldName = 'CPF_d'
      Size = 11
    end
    object cdsNfe_CabxNome_d: TStringField
      FieldName = 'xNome_d'
      Size = 60
    end
    object cdsNfe_CabxLgr_d: TStringField
      FieldName = 'xLgr_d'
      Size = 60
    end
    object cdsNfe_Cabnro_d: TStringField
      FieldName = 'nro_d'
      Size = 60
    end
    object cdsNfe_CabxCpl_d: TStringField
      FieldName = 'xCpl_d'
      Size = 60
    end
    object cdsNfe_CabxBairro_d: TStringField
      FieldName = 'xBairro_d'
      Size = 60
    end
    object cdsNfe_CabcMun_d: TStringField
      FieldName = 'cMun_d'
      Size = 7
    end
    object cdsNfe_CabxMun_d: TStringField
      FieldName = 'xMun_d'
      Size = 60
    end
    object cdsNfe_CabUF_d: TStringField
      FieldName = 'UF_d'
      Size = 2
    end
    object cdsNfe_CabCEP_d: TStringField
      FieldName = 'CEP_d'
      Size = 8
    end
    object cdsNfe_CabcPais_d: TStringField
      FieldName = 'cPais_d'
      Size = 4
    end
    object cdsNfe_CabxPais_d: TStringField
      FieldName = 'xPais_d'
      Size = 60
    end
    object cdsNfe_Cabfone_d: TStringField
      FieldName = 'fone_d'
      Size = 14
    end
    object cdsNfe_CabIE_d: TStringField
      FieldName = 'IE_d'
      Size = 14
    end
    object cdsNfe_CabISUF: TStringField
      FieldName = 'ISUF'
      Size = 9
    end
    object cdsNfe_Cabemail_d: TStringField
      FieldName = 'email_d'
      Size = 60
    end
    object cdsNfe_CabinfAdFisco: TWideStringField
      FieldName = 'infAdFisco'
      Size = 2000
    end
    object cdsNfe_CabinfCpl: TWideStringField
      FieldName = 'infCpl'
      Size = 5000
    end
    object cdsNfe_CabxCampo: TStringField
      FieldName = 'xCampo'
    end
    object cdsNfe_CabxTexto: TStringField
      FieldName = 'xTexto'
      Size = 60
    end
  end
  object cdsNfeItens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem'
    Params = <>
    Left = 736
    Top = 232
    object cdsNfeItensnItem: TIntegerField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNfeItenscProd: TStringField
      FieldName = 'cProd'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cdsNfeItenscEAN: TStringField
      FieldName = 'cEAN'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsNfeItensxProd: TStringField
      FieldName = 'xProd'
      ProviderFlags = [pfInUpdate]
      Size = 120
    end
    object cdsNfeItensNCM: TStringField
      FieldName = 'NCM'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cdsNfeItensEXTIPI: TStringField
      FieldName = 'EXTIPI'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsNfeItensCFOP: TStringField
      FieldName = 'CFOP'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsNfeItensuCom: TStringField
      FieldName = 'uCom'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object cdsNfeItensqCom: TStringField
      FieldName = 'qCom'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsNfeItensvUnCom: TStringField
      FieldName = 'vUnCom'
      ProviderFlags = [pfInUpdate]
      Size = 21
    end
    object cdsNfeItensvProd: TStringField
      FieldName = 'vProd'
      ProviderFlags = [pfInUpdate]
      Size = 21
    end
    object cdsNfeItenscEANTrib: TStringField
      FieldName = 'cEANTrib'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsNfeItensuTrib: TStringField
      FieldName = 'uTrib'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object cdsNfeItensqTrib: TStringField
      FieldName = 'qTrib'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensvUnTrib: TStringField
      FieldName = 'vUnTrib'
      ProviderFlags = [pfInUpdate]
      Size = 21
    end
    object cdsNfeItensvFrete: TStringField
      FieldName = 'vFrete'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensvSeg: TStringField
      FieldName = 'vSeg'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensvDesc: TStringField
      FieldName = 'vDesc'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensvOutro: TStringField
      FieldName = 'vOutro'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensindTot: TStringField
      FieldName = 'indTot'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNfeItensxPed: TStringField
      FieldName = 'xPed'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cdsNfeItensnItemPed: TStringField
      FieldName = 'nItemPed'
      ProviderFlags = [pfInUpdate]
      Size = 6
    end
    object cdsNfeItensID_ICMS: TStringField
      FieldName = 'ID_ICMS'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cdsNfeItensorig: TStringField
      FieldName = 'orig'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNfeItensCST: TStringField
      FieldName = 'CST'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsNfeItensCSOSN: TStringField
      FieldName = 'CSOSN'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cdsNfeItensmodBC: TStringField
      FieldName = 'modBC'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNfeItenspRedBC: TStringField
      FieldName = 'pRedBC'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsNfeItensvBC: TStringField
      FieldName = 'vBC'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItenspICMS: TStringField
      FieldName = 'pICMS'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsNfeItensvICMS: TStringField
      FieldName = 'vICMS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensmodBCST: TStringField
      FieldName = 'modBCST'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNfeItenspMVAST: TStringField
      FieldName = 'pMVAST'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsNfeItenspRedBCST: TStringField
      FieldName = 'pRedBCST'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsNfeItensvBCST: TStringField
      FieldName = 'vBCST'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItenspICMSST: TStringField
      FieldName = 'pICMSST'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsNfeItensvICMSST: TStringField
      FieldName = 'vICMSST'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensUFST: TStringField
      FieldName = 'UFST'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cdsNfeItenspBCOp: TStringField
      FieldName = 'pBCOp'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsNfeItensvBCSTRet: TStringField
      FieldName = 'vBCSTRet'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensvICMSSTRet: TStringField
      FieldName = 'vICMSSTRet'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItenspCredSN: TStringField
      FieldName = 'pCredSN'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cdsNfeItensvCredICMSSN: TStringField
      FieldName = 'vCredICMSSN'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensvBCSTDest: TStringField
      FieldName = 'vBCSTDest'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensvICMSSTDest: TStringField
      FieldName = 'vICMSSTDest'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNfeItensinfAdProd: TStringField
      FieldName = 'infAdProd'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsNfeItensmotDesICMS: TStringField
      FieldName = 'motDesICMS'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
    object cdsNfeItensnFCI: TStringField
      FieldName = 'nFCI'
      Size = 36
    end
  end
  object cds_DI: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem;nDI'
    Params = <>
    Left = 744
    Top = 344
    object cds_DInItem: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_DInDI: TStringField
      FieldName = 'nDI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 12
    end
    object cds_DIdDI: TStringField
      FieldName = 'dDI'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cds_DIxLocDesemb: TStringField
      FieldName = 'xLocDesemb'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cds_DIUFDesemb: TStringField
      FieldName = 'UFDesemb'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cds_DIdDesemb: TStringField
      FieldName = 'dDesemb'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cds_DIcExportador: TStringField
      FieldName = 'cExportador'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object cds_aDI: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem;nDI;nAdicao'
    Params = <>
    Left = 744
    Top = 400
    object cds_aDInItem: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_aDInDI: TStringField
      FieldName = 'nDI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 12
    end
    object cds_aDInAdicao: TStringField
      FieldName = 'nAdicao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_aDInSeqAdicC: TStringField
      FieldName = 'nSeqAdicC'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cds_aDIcFabricante: TStringField
      FieldName = 'cFabricante'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cds_aDIvDescDI: TStringField
      FieldName = 'vDescDI'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cds_NFref: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 8
    object cds_NFrefrefNFe: TStringField
      FieldName = 'refNFe'
      Size = 44
    end
    object cds_NFrefcUF: TStringField
      FieldName = 'cUF'
      Size = 2
    end
    object cds_NFrefAAMM: TStringField
      FieldName = 'AAMM'
      Size = 4
    end
    object cds_NFrefCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cds_NFrefmod: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object cds_NFrefserie: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object cds_NFrefnNF: TStringField
      FieldName = 'nNF'
      Size = 9
    end
    object cds_NFrefrefCTe: TStringField
      FieldName = 'refCTe'
      Size = 44
    end
  end
  object cds_NfeMed: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 64
    object cds_NfeMednItem: TStringField
      FieldName = 'nItem'
      Size = 3
    end
    object cds_NfeMednLote: TStringField
      FieldName = 'nLote'
    end
    object cds_NfeMedqLote: TStringField
      FieldName = 'qLote'
    end
    object cds_NfeMeddFab: TStringField
      FieldName = 'dFab'
      Size = 10
    end
    object cds_NfeMeddVal: TStringField
      FieldName = 'dVal'
      Size = 10
    end
    object cds_NfeMedvPMC: TStringField
      FieldName = 'vPMC'
    end
  end
  object cds_NfeArma: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 120
    object cds_NfeArmanItem: TStringField
      FieldName = 'nItem'
      Size = 3
    end
    object cds_NfeArmatpArma: TStringField
      FieldName = 'tpArma'
      Size = 1
    end
    object cds_NfeArmanSerie: TStringField
      FieldName = 'nSerie'
      Size = 9
    end
    object cds_NfeArmanCano: TStringField
      FieldName = 'nCano'
      Size = 9
    end
    object cds_NfeArmadescr: TStringField
      FieldName = 'descr'
      Size = 256
    end
  end
  object cds_nfeReboque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 176
    object cds_nfeReboqueplaca: TStringField
      FieldName = 'placa'
      Size = 7
    end
    object cds_nfeReboqueUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cds_nfeReboqueRNTC: TStringField
      FieldName = 'RNTC'
    end
  end
  object cds_nfeVolumes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 224
    object cds_nfeVolumesqVol: TStringField
      FieldName = 'qVol'
      Size = 15
    end
    object cds_nfeVolumesesp: TStringField
      FieldName = 'esp'
      Size = 60
    end
    object cds_nfeVolumesmarca: TStringField
      FieldName = 'marca'
      Size = 60
    end
    object cds_nfeVolumesnVol: TStringField
      FieldName = 'nVol'
      Size = 60
    end
    object cds_nfeVolumespesoL: TStringField
      FieldName = 'pesoL'
    end
    object cds_nfeVolumespesoB: TStringField
      FieldName = 'pesoB'
    end
  end
  object cds_nfeLacre: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 275
    object cds_nfeLacrenVol: TStringField
      FieldName = 'nVol'
      Size = 15
    end
    object cds_nfeLacrenLacre: TStringField
      FieldName = 'nLacre'
      Size = 60
    end
  end
  object cds_nfeDuplicata: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1064
    Top = 264
    object cds_nfeDuplicatanFat: TStringField
      FieldName = 'nFat'
      Size = 60
    end
    object cds_nfeDuplicatanDup: TStringField
      FieldName = 'nDup'
      Size = 60
    end
    object cds_nfeDuplicatadVenc: TStringField
      FieldName = 'dVenc'
      Size = 10
    end
    object cds_nfeDuplicatavDup: TStringField
      FieldName = 'vDup'
    end
  end
  object cds_nfeProcRef: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1056
    Top = 24
    object cds_nfeProcRefnProc: TStringField
      FieldName = 'nProc'
      Size = 60
    end
    object cds_nfeProcRefindProc: TStringField
      FieldName = 'indProc'
      Size = 1
    end
  end
  object cds_CanaForDia: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1056
    Top = 88
    object cds_CanaForDiasafra: TStringField
      FieldName = 'safra'
      Size = 9
    end
    object cds_CanaForDiaref: TStringField
      FieldName = 'ref'
      Size = 7
    end
    object cds_CanaForDiadia: TStringField
      FieldName = 'dia'
      Size = 2
    end
    object cds_CanaForDiaqtde: TStringField
      FieldName = 'qtde'
      Size = 11
    end
    object cds_CanaForDiaqTotMes: TStringField
      FieldName = 'qTotMes'
      Size = 11
    end
    object cds_CanaForDiaqTotAnt: TStringField
      FieldName = 'qTotAnt'
      Size = 11
    end
    object cds_CanaForDiaqTotGer: TStringField
      FieldName = 'qTotGer'
      Size = 11
    end
    object cds_CanaForDiavFor: TStringField
      FieldName = 'vFor'
    end
    object cds_CanaForDiavTotDed: TStringField
      FieldName = 'vTotDed'
    end
    object cds_CanaForDiavLiqFor: TStringField
      FieldName = 'vLiqFor'
    end
  end
  object cds_nfeDeduc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1056
    Top = 144
    object cds_nfeDeducsafra: TStringField
      FieldName = 'safra'
      Size = 9
    end
    object cds_nfeDeducxDed: TStringField
      FieldName = 'xDed'
      Size = 60
    end
    object cds_nfeDeducvDed: TStringField
      FieldName = 'vDed'
    end
  end
  object cds_refNFP: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 64
    object cds_refNFPrefNFe: TStringField
      FieldName = 'refNFe'
      Size = 44
    end
    object StringField2: TStringField
      FieldName = 'cUF'
      Size = 2
    end
    object StringField3: TStringField
      FieldName = 'AAMM'
      Size = 4
    end
    object StringField4: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cds_refNFPCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cds_refNFPIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object StringField5: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'serie'
      Size = 3
    end
    object StringField7: TStringField
      FieldName = 'nNF'
      Size = 9
    end
  end
  object cds_refECF: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 824
    Top = 120
    object StringField12: TStringField
      FieldName = 'mod'
      Size = 2
    end
    object cds_refECFnECF: TStringField
      FieldName = 'nECF'
      Size = 3
    end
    object cds_refECFnCOO: TStringField
      FieldName = 'nCOO'
      Size = 6
    end
  end
  object cds_NfAvulsa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 64
    object cds_NfAvulsaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cds_NfAvulsaxOrgao: TStringField
      FieldName = 'xOrgao'
      Size = 60
    end
    object cds_NfAvulsamatr: TStringField
      FieldName = 'matr'
      Size = 60
    end
    object cds_NfAvulsaxAgente: TStringField
      FieldName = 'xAgente'
      Size = 60
    end
    object cds_NfAvulsafone: TStringField
      FieldName = 'fone'
      Size = 14
    end
    object cds_NfAvulsaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cds_NfAvulsanDAR: TStringField
      FieldName = 'nDAR'
      Size = 60
    end
    object cds_NfAvulsadEmi: TStringField
      FieldName = 'dEmi'
      Size = 10
    end
    object cds_NfAvulsavDAR: TFloatField
      FieldName = 'vDAR'
    end
    object cds_NfAvulsarepEmi: TStringField
      FieldName = 'repEmi'
      Size = 60
    end
    object cds_NfAvulsadPag: TStringField
      FieldName = 'dPag'
      Size = 10
    end
  end
  object cds_L_Retirada: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 120
    object cds_L_RetiradaCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cds_L_RetiradaCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cds_L_RetiradaxLgr: TStringField
      FieldName = 'xLgr'
      Size = 60
    end
    object cds_L_Retiradanro: TStringField
      FieldName = 'nro'
      Size = 60
    end
    object cds_L_RetiradaxCpl: TStringField
      FieldName = 'xCpl'
      Size = 60
    end
    object cds_L_RetiradaxBairro: TStringField
      FieldName = 'xBairro'
      Size = 60
    end
    object cds_L_RetiradacMun: TStringField
      FieldName = 'cMun'
      Size = 7
    end
    object cds_L_RetiradaxMun: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object cds_L_RetiradaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object cds_L_Entrega: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 176
    object StringField1: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object StringField8: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object StringField9: TStringField
      FieldName = 'xLgr'
      Size = 60
    end
    object StringField10: TStringField
      FieldName = 'nro'
      Size = 60
    end
    object StringField11: TStringField
      FieldName = 'xCpl'
      Size = 60
    end
    object StringField13: TStringField
      FieldName = 'xBairro'
      Size = 60
    end
    object StringField14: TStringField
      FieldName = 'cMun'
      Size = 7
    end
    object StringField15: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object cds_ICMSTot: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 896
    Top = 8
    object cds_ICMSTotvBC: TStringField
      FieldName = 'vBC'
    end
    object cds_ICMSTotvICMS: TStringField
      FieldName = 'vICMS'
    end
    object cds_ICMSTotvBCST: TStringField
      FieldName = 'vBCST'
    end
    object cds_ICMSTotvST: TStringField
      FieldName = 'vST'
    end
    object cds_ICMSTotvProd: TStringField
      FieldName = 'vProd'
    end
    object cds_ICMSTotvFrete: TStringField
      FieldName = 'vFrete'
    end
    object cds_ICMSTotvSeg: TStringField
      FieldName = 'vSeg'
    end
    object cds_ICMSTotvDesc: TStringField
      FieldName = 'vDesc'
    end
    object cds_ICMSTotvII: TStringField
      FieldName = 'vII'
    end
    object cds_ICMSTotvIPI: TStringField
      FieldName = 'vIPI'
    end
    object cds_ICMSTotvPIS: TStringField
      FieldName = 'vPIS'
    end
    object cds_ICMSTotvCOFINS: TStringField
      FieldName = 'vCOFINS'
    end
    object cds_ICMSTotvOutro: TStringField
      FieldName = 'vOutro'
    end
    object cds_ICMSTotvNF: TStringField
      FieldName = 'vNF'
    end
    object cds_ICMSTotvTotTrib: TStringField
      FieldName = 'vTotTrib'
    end
  end
  object cds_ISSQN: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem'
    Params = <>
    Left = 824
    Top = 296
    object cds_ISSQNnItem: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_ISSQNvBC: TStringField
      FieldName = 'vBC'
      ProviderFlags = [pfInUpdate]
    end
    object cds_ISSQNvAliq: TStringField
      FieldName = 'vAliq'
      ProviderFlags = [pfInUpdate]
    end
    object cds_ISSQNvISSQN: TStringField
      FieldName = 'vISSQN'
      ProviderFlags = [pfInUpdate]
    end
    object cds_ISSQNcMunFG: TStringField
      FieldName = 'cMunFG'
      ProviderFlags = [pfInUpdate]
      Size = 7
    end
    object cds_ISSQNcListServ: TStringField
      FieldName = 'cListServ'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cds_ISSQNcSitTrib: TStringField
      FieldName = 'cSitTrib'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object cds_transp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 328
    object cds_transpmodFrete: TStringField
      FieldName = 'modFrete'
      Size = 1
    end
    object cds_transpCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cds_transpCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cds_transpxNome: TStringField
      FieldName = 'xNome'
      Size = 60
    end
    object cds_transpIE: TStringField
      FieldName = 'IE'
      Size = 14
    end
    object cds_transpxEnder: TStringField
      FieldName = 'xEnder'
      Size = 60
    end
    object cds_transpxMun: TStringField
      FieldName = 'xMun'
      Size = 60
    end
    object cds_transpUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cds_transpvServ: TStringField
      FieldName = 'vServ'
    end
    object cds_transpvBCRet: TStringField
      FieldName = 'vBCRet'
    end
    object cds_transppICMSRet: TStringField
      FieldName = 'pICMSRet'
      Size = 10
    end
    object cds_transpvICMSRet: TStringField
      FieldName = 'vICMSRet'
    end
    object cds_transpCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cds_transpcMunFG: TStringField
      FieldName = 'cMunFG'
      Size = 7
    end
    object cds_transpplaca: TStringField
      FieldName = 'placa'
      Size = 7
    end
    object cds_transpUF_v: TStringField
      FieldName = 'UF_v'
      Size = 2
    end
    object cds_transpRNTC: TStringField
      FieldName = 'RNTC'
    end
  end
  object cds_Cobranca: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1056
    Top = 192
    object cds_CobrancanFat: TStringField
      FieldName = 'nFat'
      Size = 60
    end
    object cds_CobrancavOrig: TStringField
      FieldName = 'vOrig'
    end
    object cds_CobrancavDesc: TStringField
      FieldName = 'vDesc'
    end
    object cds_CobrancavLiq: TStringField
      FieldName = 'vLiq'
    end
  end
  object cds_veicProd: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 16
    object cds_veicProdnItem: TStringField
      FieldName = 'nItem'
      Size = 3
    end
    object cds_veicProdtpOp: TStringField
      FieldName = 'tpOp'
      Size = 1
    end
    object cds_veicProdchassi: TStringField
      FieldName = 'chassi'
      Size = 17
    end
    object cds_veicProdcCor: TStringField
      FieldName = 'cCor'
      Size = 4
    end
    object cds_veicProdxCor: TStringField
      FieldName = 'xCor'
      Size = 40
    end
    object cds_veicProdpot: TStringField
      FieldName = 'pot'
      Size = 4
    end
    object cds_veicProdcilin: TStringField
      FieldName = 'cilin'
      Size = 4
    end
    object cds_veicProdpesoL: TStringField
      FieldName = 'pesoL'
      Size = 9
    end
    object cds_veicProdpesoB: TStringField
      FieldName = 'pesoB'
      Size = 9
    end
    object cds_veicProdnSerie: TStringField
      FieldName = 'nSerie'
      Size = 9
    end
    object cds_veicProdtpComb: TStringField
      FieldName = 'tpComb'
      Size = 2
    end
    object cds_veicProdnMotor: TStringField
      FieldName = 'nMotor'
      Size = 21
    end
    object cds_veicProdCMT: TStringField
      FieldName = 'CMT'
      Size = 9
    end
    object cds_veicProddist: TStringField
      FieldName = 'dist'
      Size = 4
    end
    object cds_veicProdanoMod: TStringField
      FieldName = 'anoMod'
      Size = 4
    end
    object cds_veicProdanoFab: TStringField
      FieldName = 'anoFab'
      Size = 4
    end
    object cds_veicProdtpPint: TStringField
      FieldName = 'tpPint'
      Size = 1
    end
    object cds_veicProdtpVeic: TStringField
      FieldName = 'tpVeic'
      Size = 2
    end
    object cds_veicProdespVeic: TStringField
      FieldName = 'espVeic'
      Size = 1
    end
    object cds_veicProdVIN: TStringField
      FieldName = 'VIN'
      Size = 1
    end
    object cds_veicProdcondVeic: TStringField
      FieldName = 'condVeic'
      Size = 1
    end
    object cds_veicProdcMod: TStringField
      FieldName = 'cMod'
      Size = 6
    end
    object cds_veicProdcCorDENATRAN: TStringField
      FieldName = 'cCorDENATRAN'
      Size = 2
    end
    object cds_veicProdlota: TStringField
      FieldName = 'lota'
      Size = 3
    end
    object cds_veicProdtpRest: TStringField
      FieldName = 'tpRest'
      Size = 1
    end
  end
  object cds_IPI: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem'
    Params = <>
    Left = 824
    Top = 184
    object cds_IPInItem: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_IPIclEnq: TStringField
      FieldName = 'clEnq'
      ProviderFlags = [pfInUpdate]
      Size = 5
    end
    object cds_IPICNPJProd: TStringField
      FieldName = 'CNPJProd'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cds_IPIcSelo: TStringField
      FieldName = 'cSelo'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object cds_IPIqSelo: TStringField
      FieldName = 'qSelo'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cds_IPIcEnq: TStringField
      FieldName = 'cEnq'
      ProviderFlags = [pfInUpdate]
      Size = 3
    end
    object cds_IPICST: TStringField
      FieldName = 'CST'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cds_IPIvBC: TStringField
      FieldName = 'vBC'
      ProviderFlags = [pfInUpdate]
    end
    object cds_IPIpIPI: TStringField
      FieldName = 'pIPI'
      ProviderFlags = [pfInUpdate]
    end
    object cds_IPIqUnid: TStringField
      FieldName = 'qUnid'
      ProviderFlags = [pfInUpdate]
    end
    object cds_IPIvUnid: TStringField
      FieldName = 'vUnid'
      ProviderFlags = [pfInUpdate]
    end
    object cds_IPIvIPI: TStringField
      FieldName = 'vIPI'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cds_II: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem'
    Params = <>
    Left = 824
    Top = 240
    object StringField17: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_IIvBC: TStringField
      FieldName = 'vBC'
      ProviderFlags = [pfInUpdate]
    end
    object cds_IIvDespAdu: TStringField
      FieldName = 'vDespAdu'
      ProviderFlags = [pfInUpdate]
    end
    object cds_IIvII: TStringField
      FieldName = 'vII'
      ProviderFlags = [pfInUpdate]
    end
    object cds_IIvIOF: TStringField
      FieldName = 'vIOF'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cds_PIS: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem;ID_PIS'
    Params = <>
    Left = 824
    Top = 352
    object StringField18: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_PISID_PIS: TStringField
      FieldName = 'ID_PIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 4
    end
    object cds_PISCST: TStringField
      FieldName = 'CST'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cds_PISvBC: TStringField
      FieldName = 'vBC'
      ProviderFlags = [pfInUpdate]
    end
    object cds_PISpPIS: TStringField
      FieldName = 'pPIS'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cds_PISvPIS: TStringField
      FieldName = 'vPIS'
      ProviderFlags = [pfInUpdate]
    end
    object cds_PISqBCProd: TStringField
      FieldName = 'qBCProd'
      ProviderFlags = [pfInUpdate]
    end
    object cds_PISvAliqProd: TStringField
      FieldName = 'vAliqProd'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cds_COFINS: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem;ID_COFINS'
    Params = <>
    Left = 824
    Top = 408
    object cds_COFINSnItem: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cds_COFINSID_COFINS: TStringField
      FieldName = 'ID_COFINS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 1
    end
    object cds_COFINSCST: TStringField
      FieldName = 'CST'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object cds_COFINSvBC: TStringField
      FieldName = 'vBC'
      ProviderFlags = [pfInUpdate]
    end
    object cds_COFINSpCOFINS: TStringField
      FieldName = 'pCOFINS'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cds_COFINSvCOFINS: TStringField
      FieldName = 'vCOFINS'
      ProviderFlags = [pfInUpdate]
    end
    object cds_COFINSqBCProd: TStringField
      FieldName = 'qBCProd'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cds_COFINSvAliqProd: TStringField
      FieldName = 'vAliqProd'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cds_ISSQNTot: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 896
    Top = 72
    object cds_ISSQNTotvServ: TStringField
      FieldName = 'vServ'
    end
    object cds_ISSQNTotvBC: TStringField
      FieldName = 'vBC'
    end
    object cds_ISSQNTotvISS: TStringField
      FieldName = 'vISS'
    end
    object cds_ISSQNTotvCOFINS: TStringField
      FieldName = 'vCOFINS'
    end
    object cds_ISSQNTotvRetPIS: TStringField
      FieldName = 'vRetPIS'
    end
    object cds_ISSQNTotvRetCOFINS: TStringField
      FieldName = 'vRetCOFINS'
    end
    object cds_ISSQNTotvRetCSLL: TStringField
      FieldName = 'vRetCSLL'
    end
    object cds_ISSQNTotvBCIRRF: TStringField
      FieldName = 'vBCIRRF'
    end
    object cds_ISSQNTotvIRRF: TStringField
      FieldName = 'vIRRF'
    end
    object cds_ISSQNTotvBCRetPrev: TStringField
      FieldName = 'vBCRetPrev'
    end
    object cds_ISSQNTotvRetPrev: TStringField
      FieldName = 'vRetPrev'
    end
  end
  object cds_Exporta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1072
    Top = 336
    object cds_ExportaUFEmbarq: TStringField
      FieldName = 'UFEmbarq'
      Size = 2
    end
    object cds_ExportaxLocEmbarq: TStringField
      FieldName = 'xLocEmbarq'
      Size = 60
    end
  end
  object cds_compra: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 968
    Top = 392
    object cds_compraxNEmp: TStringField
      FieldName = 'xNEmp'
    end
    object cds_compraxPed: TStringField
      FieldName = 'xPed'
      Size = 60
    end
    object cds_compraxCont: TStringField
      FieldName = 'xCont'
      Size = 60
    end
  end
  object qryNFe_Log: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  ID_LOG,'
      '  DATA_HORA,'
      '  DESC_EVENTO,'
      '  NU_NF'
      'FROM '
      '  TB_NFE_LOG'
      'WHERE CAST(DATA_HORA AS DATE) = CURRENT_DATE'
      'ORDER BY DATA_HORA DESC ')
    SQLConnection = dm_Princial.SQLConnect
    Left = 144
    Top = 256
  end
  object cdsNFe_Log: TClientDataSet
    Aggregates = <>
    PacketRecords = 1000
    Params = <>
    ProviderName = 'dspNFe_Log'
    AfterInsert = cdsNFe_LogAfterInsert
    Left = 152
    Top = 312
    object cdsNFe_LogID_LOG: TIntegerField
      FieldName = 'ID_LOG'
      Required = True
    end
    object cdsNFe_LogDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      DisplayFormat = 'dd/MM/yy HH:NN:SS'
    end
    object cdsNFe_LogDESC_EVENTO: TStringField
      FieldName = 'DESC_EVENTO'
      Size = 200
    end
    object cdsNFe_LogNU_NF: TFMTBCDField
      FieldName = 'NU_NF'
      Precision = 18
      Size = 0
    end
  end
  object dspNFe_Log: TDataSetProvider
    DataSet = qryNFe_Log
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 218
    Top = 257
  end
  object dsNFe_Log: TDataSource
    DataSet = cdsNFe_Log
    Left = 218
    Top = 313
  end
  object qryNfe_Trans: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  ID_NFE_TRANS,'
      '  DTA_EMISSAO,'
      '  DTA_AUTORIZACAO,'
      '  HORA_AUTO,'
      '  DTA_CANCELAMENTO,'
      '  NU_NFE,'
      '  SERIE,'
      '  CPF_CNPJ,'
      '  NOME_DEST,'
      '  CHAVE_NFE,'
      '  FLG_IMPR,'
      '  FLG_AUTORIZADA,'
      '  COD_SITUACAO,'
      '  PROTOCOLO_ENVIO,'
      '  PROTOCOLO_CANCEL,'
      '  NFE_XML,'
      '  FLG_TP_TRANS,'
      '  NRECIBO,'
      '  NFE_XML_CANC,'
      '  XML_PROT_AUTO'
      'FROM'
      '  TB_NFE_TRANS')
    SQLConnection = dm_Princial.SQLConnect
    Left = 424
    Top = 280
  end
  object cdsNfe_Trans: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NU_NFE;CHAVE_NFE'
    Params = <>
    ProviderName = 'dpsNfe_Trans'
    OnPostError = cdsNfe_TransPostError
    Left = 424
    Top = 336
  end
  object dpsNfe_Trans: TDataSetProvider
    DataSet = qryNfe_Trans
    Options = [poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 504
    Top = 288
  end
  object dsNfe_Trans: TDataSource
    DataSet = cdsNfe_Trans
    Left = 504
    Top = 344
  end
  object qryCancelNFe: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT DATA_HORA'
      '      ,DTA_AUTORIZACAO'
      '      ,NU_NFE'
      '      ,PROTOCOLO_ENVIO'
      '      ,CHAVE_NFE'
      '      ,NOME_DEST'
      '      ,CPF_CNPJ'
      'FROM P_NFE_CANC')
    SQLConnection = dm_Princial.SQLConnect
    Left = 144
    Top = 384
  end
  object dspCancelNFe: TDataSetProvider
    DataSet = qryCancelNFe
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 224
    Top = 384
  end
  object dsCancelNFe: TDataSource
    DataSet = cdsCancelNFe
    Left = 224
    Top = 432
  end
  object qryDPEC: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  ID_NFE_DPEC,'
      '  NU_NFE,'
      '  CHAVE_NFE,'
      '  PROTOCOLO_DPEC,'
      '  DTA_DPEC,'
      '  MOTIVO_DPEC,'
      '  DPEC_XML'
      'FROM '
      '  TB_NFE_DPEC')
    SQLConnection = dm_Princial.SQLConnect
    Left = 144
    Top = 512
  end
  object cdsDPEC: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_NFE_DPEC'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NU_NFE'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CHAVE_NFE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 44
      end
      item
        Name = 'PROTOCOLO_DPEC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DTA_DPEC'
        DataType = ftDate
      end
      item
        Name = 'MOTIVO_DPEC'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DPEC_XML'
        DataType = ftMemo
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'idx_nfeTrans'
        Options = [ixUnique]
      end>
    Params = <>
    ProviderName = 'dspDPEC'
    StoreDefs = True
    AfterInsert = cdsDPECAfterInsert
    Left = 144
    Top = 560
    object cdsDPECID_NFE_DPEC: TIntegerField
      FieldName = 'ID_NFE_DPEC'
      Required = True
    end
    object cdsDPECNU_NFE: TStringField
      FieldName = 'NU_NFE'
      Size = 9
    end
    object cdsDPECCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Required = True
      Size = 44
    end
    object cdsDPECPROTOCOLO_DPEC: TStringField
      FieldName = 'PROTOCOLO_DPEC'
    end
    object cdsDPECMOTIVO_DPEC: TStringField
      FieldName = 'MOTIVO_DPEC'
      Size = 100
    end
    object cdsDPECDPEC_XML: TMemoField
      FieldName = 'DPEC_XML'
      BlobType = ftMemo
      Size = 1
    end
    object cdsDPECDTA_DPEC: TDateField
      FieldName = 'DTA_DPEC'
    end
  end
  object dspDPEC: TDataSetProvider
    DataSet = qryDPEC
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 512
  end
  object dsDPEC: TDataSource
    DataSet = cdsDPEC
    Left = 200
    Top = 560
  end
  object cdsCancelNFe: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATA_HORA'
        DataType = ftTimeStamp
      end
      item
        Name = 'DTA_AUTORIZACAO'
        DataType = ftDate
      end
      item
        Name = 'NU_NFE'
        DataType = ftInteger
      end
      item
        Name = 'PROTOCOLO_ENVIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CHAVE_NFE'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'NOME_DEST'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CPF_CNPJ'
        DataType = ftString
        Size = 14
      end>
    IndexDefs = <
      item
        Name = 'idx_nfeTrans'
        Options = [ixUnique]
      end>
    Params = <>
    ProviderName = 'dspCancelNFe'
    StoreDefs = True
    Left = 144
    Top = 432
    object cdsCancelNFeDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
    end
    object cdsCancelNFeDTA_AUTORIZACAO: TDateField
      FieldName = 'DTA_AUTORIZACAO'
    end
    object cdsCancelNFeNU_NFE: TIntegerField
      FieldName = 'NU_NFE'
    end
    object cdsCancelNFePROTOCOLO_ENVIO: TStringField
      FieldName = 'PROTOCOLO_ENVIO'
    end
    object cdsCancelNFeCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Size = 44
    end
    object cdsCancelNFeNOME_DEST: TStringField
      FieldName = 'NOME_DEST'
      Size = 30
    end
    object cdsCancelNFeCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 14
    end
  end
  object qryCCE: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  IDLOTE,'
      '  VERSAO_L,'
      '  VERSAO_E,'
      '  ID,'
      '  CORGAO,'
      '  TPAMB,'
      '  CNPJ,'
      '  CPF,'
      '  CHNFE,'
      '  DHEVENTO,'
      '  TPEVENTO,'
      '  NSEQEVENTO,'
      '  VEREVENTO,'
      '  DESCEVENTO,'
      '  XCORRECAO,'
      '  XML_CCE'
      'FROM '
      '  TB_NFE_CCE')
    SQLConnection = dm_Princial.SQLConnect
    Left = 720
    Top = 520
  end
  object cdsCCE: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLOTE'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'VERSAO_L'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'VERSAO_E'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 54
      end
      item
        Name = 'CORGAO'
        DataType = ftSmallint
      end
      item
        Name = 'TPAMB'
        DataType = ftSmallint
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CHNFE'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'DHEVENTO'
        DataType = ftDate
      end
      item
        Name = 'TPEVENTO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'NSEQEVENTO'
        DataType = ftSmallint
      end
      item
        Name = 'VEREVENTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'DESCEVENTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'XCORRECAO'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'XML_CCE'
        DataType = ftMemo
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'idx_nfeTrans'
        Options = [ixUnique]
      end>
    Params = <>
    ProviderName = 'dspCCE'
    StoreDefs = True
    AfterInsert = cdsCCEAfterInsert
    Left = 720
    Top = 576
    object cdsCCEIDLOTE: TLargeintField
      FieldName = 'IDLOTE'
      Required = True
    end
    object cdsCCEVERSAO_L: TFMTBCDField
      FieldName = 'VERSAO_L'
      Precision = 18
      Size = 2
    end
    object cdsCCEVERSAO_E: TFMTBCDField
      FieldName = 'VERSAO_E'
      Precision = 18
      Size = 2
    end
    object cdsCCEID: TStringField
      FieldName = 'ID'
      Size = 54
    end
    object cdsCCECORGAO: TSmallintField
      FieldName = 'CORGAO'
    end
    object cdsCCETPAMB: TSmallintField
      FieldName = 'TPAMB'
    end
    object cdsCCECNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsCCECPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object cdsCCECHNFE: TStringField
      FieldName = 'CHNFE'
      Size = 44
    end
    object cdsCCEDHEVENTO: TDateField
      FieldName = 'DHEVENTO'
    end
    object cdsCCETPEVENTO: TStringField
      FieldName = 'TPEVENTO'
      Size = 6
    end
    object cdsCCENSEQEVENTO: TSmallintField
      FieldName = 'NSEQEVENTO'
    end
    object cdsCCEVEREVENTO: TFMTBCDField
      FieldName = 'VEREVENTO'
      Precision = 18
      Size = 2
    end
    object cdsCCEDESCEVENTO: TStringField
      FieldName = 'DESCEVENTO'
      Size = 60
    end
    object cdsCCEXCORRECAO: TStringField
      FieldName = 'XCORRECAO'
      Size = 1000
    end
    object cdsCCEXML_CCE: TMemoField
      FieldName = 'XML_CCE'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspCCE: TDataSetProvider
    DataSet = qryCCE
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 768
    Top = 520
  end
  object dsCCE: TDataSource
    DataSet = cdsCCE
    Left = 768
    Top = 576
  end
  object NfdNFECCe: TNfdNFECCe
    NFe = nfdNFe2
    Left = 264
    Top = 168
  end
  object NfdNFECancelamentoEvent1: TNfdNFECancelamentoEvent
    NFe = nfdNFe2
    Left = 344
    Top = 224
  end
  object cdsNfeIImp: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'nItem;ID_ICMS'
    Params = <>
    Left = 736
    Top = 288
    object cdsNfeIImpnItem: TStringField
      FieldName = 'nItem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 3
    end
    object cdsNfeIImpID_ICMS: TStringField
      FieldName = 'ID_ICMS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 6
    end
    object cdsNfeIImpvTotTrib: TStringField
      FieldName = 'vTotTrib'
      Size = 10
    end
  end
  object qryInsert_nfe: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NFE_TRANS'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTA_EMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTA_AUTORIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTA_CANCELAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF_CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_DEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CHAVE_NFE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NU_NFE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLG_IMPR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLG_AUTORIZADA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROTOCOLO_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROTOCOLO_CANCEL'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NFE_XML'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLG_TP_TRANS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NRECIBO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_SITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA_AUTO'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NFE_XML_CANC'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'XML_PROT_AUTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO TB_NFE_TRANS( ID_NFE_TRANS '
      '                         ,DTA_EMISSAO '
      '                         ,DTA_AUTORIZACAO '
      '                         ,DTA_CANCELAMENTO '
      '                         ,SERIE '
      '                         ,CPF_CNPJ '
      '                         ,NOME_DEST '
      '                         ,CHAVE_NFE '
      '                         ,NU_NFE '
      '                         ,FLG_IMPR '
      '                         ,FLG_AUTORIZADA '
      '                         ,PROTOCOLO_ENVIO '
      '                         ,PROTOCOLO_CANCEL '
      '                         ,NFE_XML '
      '                         ,FLG_TP_TRANS '
      '                         ,NRECIBO '
      '                         ,COD_SITUACAO '
      '                         ,HORA_AUTO '
      '                         ,NFE_XML_CANC '
      '                         ,XML_PROT_AUTO )'
      '                VALUES ( :ID_NFE_TRANS, '
      '                         :DTA_EMISSAO, '
      '                         :DTA_AUTORIZACAO, '
      '                         :DTA_CANCELAMENTO, '
      '                         :SERIE, '
      '                         :CPF_CNPJ, '
      '                         :NOME_DEST, '
      '                         :CHAVE_NFE, '
      '                         :NU_NFE, '
      '                         :FLG_IMPR, '
      '                         :FLG_AUTORIZADA, '
      '                         :PROTOCOLO_ENVIO, '
      '                         :PROTOCOLO_CANCEL, '
      '                         :NFE_XML, '
      '                         :FLG_TP_TRANS, '
      '                         :NRECIBO, '
      '                         :COD_SITUACAO,'
      '                         :HORA_AUTO, '
      '                         :NFE_XML_CANC, '
      '                         :XML_PROT_AUTO)')
    SQLConnection = dm_Princial.SQLConnect
    Left = 416
    Top = 424
  end
  object qryUpdate_nfe: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftDate
        Name = 'DTA_EMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTA_AUTORIZACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTA_CANCELAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CPF_CNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME_DEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLG_IMPR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLG_AUTORIZADA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROTOCOLO_ENVIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PROTOCOLO_CANCEL'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NFE_XML'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLG_TP_TRANS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NRECIBO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'COD_SITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftTime
        Name = 'HORA_AUTO'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NFE_XML_CANC'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'XML_PROT_AUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NU_NFE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CHAVE_NFE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        ' UPDATE TB_NFE_TRANS  SET DTA_EMISSAO      = COALESCE(:DTA_EMISS' +
        'AO,DTA_EMISSAO)'
      
        '                         ,DTA_AUTORIZACAO  = COALESCE(:DTA_AUTOR' +
        'IZACAO,DTA_AUTORIZACAO)'
      '                         ,DTA_CANCELAMENTO = :DTA_CANCELAMENTO'
      
        '                         ,SERIE            = COALESCE(:SERIE,SER' +
        'IE)'
      
        '                         ,CPF_CNPJ         = COALESCE(:CPF_CNPJ,' +
        'CPF_CNPJ)'
      
        '                         ,NOME_DEST        = COALESCE(:NOME_DEST' +
        ',NOME_DEST)'
      
        '                         ,FLG_IMPR         = COALESCE(:FLG_IMPR,' +
        'FLG_IMPR)'
      
        '                         ,FLG_AUTORIZADA   = COALESCE(:FLG_AUTOR' +
        'IZADA,FLG_AUTORIZADA)'
      
        '                         ,PROTOCOLO_ENVIO  = COALESCE(:PROTOCOLO' +
        '_ENVIO,PROTOCOLO_ENVIO)'
      '                         ,PROTOCOLO_CANCEL = :PROTOCOLO_CANCEL'
      
        '                         ,NFE_XML          = COALESCE(:NFE_XML,N' +
        'FE_XML)'
      
        '                         ,FLG_TP_TRANS     = COALESCE(:FLG_TP_TR' +
        'ANS,FLG_TP_TRANS)'
      
        '                         ,NRECIBO          = COALESCE(:NRECIBO,N' +
        'RECIBO)'
      '                         ,COD_SITUACAO     = :COD_SITUACAO'
      
        '                         ,HORA_AUTO        = COALESCE(:HORA_AUTO' +
        ',HORA_AUTO)'
      '                         ,NFE_XML_CANC     = :NFE_XML_CANC'
      
        '                         ,XML_PROT_AUTO    = COALESCE(:XML_PROT_' +
        'AUTO,XML_PROT_AUTO)'
      'WHERE NU_NFE = :NU_NFE'
      '  AND CHAVE_NFE = :CHAVE_NFE')
    SQLConnection = dm_Princial.SQLConnect
    Left = 416
    Top = 488
  end
  object nfdNFeTemplates21: TnfdNFeTemplates2
    DataSet_Template.Strings = (
      '<infNFe Id="@a(Id_A03)" versao="@a(versao_A02)">'
      #9'<ide>'
      
        #9#9'<%cUF_B02%><%cNF_B03%><%natOp_B04%><%indPag_B05%><%mod_B06%><%' +
        'serie_B07%><%nNF_B08%><%dEmi_B09%><%dSaiEnt_B10%><%hSaiEnt_B10a%' +
        '><%tpNF_B11%><%cMunFG_B12%>   <NFref>       <%refNfe_B13%>      ' +
        ' <refNF>           <%cUF_B15%><%AAMM_B16%><%CNPJ_B17%><%mod_B18%' +
        '><%serie_B19%><%nNF_B20%>       </refNF>       <refNFP>         ' +
        '  <%cUF_B20b%><%AAMM_B20c%><%CNPJ_B20d%><%CPF_B20e%><%IE_B20f%><' +
        '%mod_B20f%><%serie_B20g%><%nNF_B20h%>       </refNFP>'#9#9#9#9'<%refCT' +
        'E_B20i%>       <refECF>           <%mod_B20k%><%nECF_B20l%><%nCO' +
        'O_B20m%>       </refECF>   </NFref>   <%tpImp_B21%><%tpEmis_B22%' +
        '><%cDV_B23%><%tpAmb_B24%><%finNFe_B25%><%procEmi_B26%><%verProc_' +
        'B27%><%dhCont_B28%><%xJust_B29%>'
      #9'</ide>'
      #9'<emit>'
      #9#9'<%CNPJ_C02%><%CPF_C02a%><%xNome_C03%><%xFant_C04%>'
      #9#9'<enderEmit>'
      
        #9#9#9'<%xLgr_C06%><%nro_C07%><%xCpl_C08%><%xBairro_C09%><%cMun_C10%' +
        '><%xMun_C11%><%UF_C12%><%CEP_C13%><%cPais_C14%><%xPais_C15%><%fo' +
        'ne_C16%>'
      #9#9'</enderEmit>'
      #9#9'<%IE_C17%><%IEST_C18%><%IM_C19%><%CNAE_C20%><%CRT_C21%>'
      #9'</emit>'
      #9'<dest>'
      #9#9'<%CNPJ_E02%><%CPF_E03%><%xNome_E04%>'
      #9#9'<enderDest>'
      
        #9#9#9'<%xLgr_E06%><%nro_E07%><%xCpl_E08%><%xBairro_E09%><%cMun_E10%' +
        '><%xMun_E11%><%UF_E12%><%CEP_E13%><%cPais_E14%><%xPais_E15%><%fo' +
        'ne_E16%>'
      #9#9'</enderDest>'
      #9#9'<%IE_E17%><%ISUF_E18%><%email_E19%>'
      #9'</dest>'
      #9'<retirada>'
      
        #9#9'<%CNPJ_F02%><%CPF_F20a%><%xLgr_F03%><%nro_F04%><%xCpl_F05%><%x' +
        'Bairro_F06%><%cMun_F07%><%xMun_F08%><%UF_F09%>'
      #9'</retirada>'
      #9'<entrega>'
      
        #9#9'<%CNPJ_G02%><%CPF_G20a%><%xLgr_G03%><%nro_G04%><%xCpl_G05%><%x' +
        'Bairro_G06%><%cMun_G07%><%xMun_G08%><%UF_G09%>'
      #9'</entrega>'
      #9'<det nItem="@nItem">'
      #9#9'<prod>'
      
        #9#9#9'<%cProd_I02%><%cEAN_I03%><%xProd_I04%><%NCM_I05%><%EXTIPI_I06' +
        '%><%genero_I07%><%CFOP_I08%><%uCom_I09%><%qCom_I10%><%vUnCom_I10' +
        'a%><%vProd_I11%>     <%cEANTrib_I12%><%uTrib_I13%><%qTrib_I14%><' +
        '%vUnTrib_I14a%><%vFrete_I15%><%vSeg_I16%><%vDesc_I17%><%vOutro_I' +
        '17a%><%indTot_I17b%>'
      #9#9#9'<DI>'
      
        #9#9#9#9'<%nDI_I19%><%dDi_I20%><%xLocDesemb_I21%><%UFDesemb_I22%><%dD' +
        'esemb_I23%><%cExportador_I24%>'
      #9#9#9#9'<adi>'
      
        #9#9#9#9#9'<%nAdicao_I26%><%nSeqAdic_I27%><%cFabricante_I28%><%vDescDI' +
        '_I29%>'
      #9#9#9#9'</adi>'
      #9#9#9'</DI>'#9
      '     <%xPed_I30%><%nItemPed_I31%>'
      #9#9#9'<veicProd>'
      
        #9#9#9#9'  <%tpOp_J02%><%chassi_J03%><%cCor_J04%><%xCor_J05%><%pot_J0' +
        '6%><%cilin_J07%><%pesoL_J08%><%pesoB_J09%><%nSerie_J10%><%tpComb' +
        '_J11%>         <%nMotor_J12%><%CMT_J13%><%dist_J14%><%RENAVAM_J1' +
        '5%><%anoMod_J16%><%anoFab_J17%><%tpPint_J18%><%tpVeic_J19%><%esp' +
        'Veic_J20%><%VIN_J21%>         <%condVeic_J22%><%cMod_J23%><%cCor' +
        'DEN_J24%><%lota_J25%><%tpRest_J26%>'
      #9#9#9'</veicProd>'
      #9#9#9'<med>'
      
        #9#9#9#9'<%nLote_K02%><%qLote_K03%><%dFab_K04%><%dVal_K05%><%vPMC_K06' +
        '%>'
      #9#9#9'</med>'
      #9#9#9'<arma>'
      #9#9#9#9'<%tpArma_L02%><%nSerie_L03%><%nCano_L04%><%descr_L05%>'
      #9#9#9'</arma>'
      '     <comb>'
      
        '         <%cProdANP_L102%><%CODIF_L103%><%qTemp_L104%><%UFCons_L' +
        '120%>         <CIDE>            <%qBCprod_L106%><%vAliqProd_L107' +
        '%><%vCIDE_L108%>         </CIDE>     </comb>'
      #9#9'</prod>'
      #9#9'<imposto>'
      #9#9#9'<ICMS>'
      #9#9#9#9'<ICMS00>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%vBC_N15%><%pICMS_N16%' +
        '><%vICMS_N17%>'
      #9#9#9#9'</ICMS00>'
      #9#9#9#9'<ICMS10>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%vBC_N15%><%pICMS_N16%' +
        '><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pRedBCST_N20%><%vBC' +
        'ST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS10>'
      #9#9#9#9'<ICMS20>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%>'
      #9#9#9#9'</ICMS20>'
      #9#9#9#9'<ICMS30>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBCST_N18%><%pMVAST_N19%><%pRedB' +
        'CST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS30>'
      #9#9#9#9'<ICMS40>'
      #9#9#9#9#9'<%orig_N11%><%CST_N12%><%vICMS_N17%><%motDesICMS_N28%>'
      #9#9#9#9'</ICMS40>'
      #9#9#9#9'<ICMS51>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%>'
      #9#9#9#9'</ICMS51>'
      #9#9#9#9'<ICMS60>'
      #9#9#9#9#9'<%orig_N11%><%CST_N12%><%vBCSTRet_N26%><%vICMSSTRet_N27%>'
      #9#9#9#9'</ICMS60>'
      #9#9#9#9'<ICMS70>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pRedB' +
        'CST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS70>'
      #9#9#9#9'<ICMS90>'
      
        #9#9#9#9#9'<%orig_N11%><%CST_N12%><%modBC_N13%><%pRedBC_N14%><%vBC_N15' +
        '%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pRedB' +
        'CST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMS90>'
      #9#9#9#9'<ICMSPart>'
      
        #9#9#9#9'    <%orig_N11%><%CST_N12%><%modBC_N13%><%vBC_N15%><%pRedBC_' +
        'N14%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><%pR' +
        'edBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%><%pBCOp_N' +
        '25%><%UFST_N24%>'
      #9#9#9#9'</ICMSPart>'
      #9#9#9#9'<ICMSST>'
      
        #9#9#9#9'    <%orig_N11%><%CST_N12%><%vBCSTRet_N26%><%vICMSSTRet_N27%' +
        '><%vBCSTDest_N31%><%vICMSSTDest_N32%>'
      #9#9#9#9'</ICMSST>'
      #9#9#9#9'<ICMSSN101>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%pCredSN_N29%><%vCredICMSSN_N' +
        '30%>'
      #9#9#9#9'</ICMSSN101>'
      #9#9#9#9'<ICMSSN102>'
      #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%>'
      #9#9#9#9'</ICMSSN102>'
      #9#9#9#9'<ICMSSN201>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%modBCST_N18%><%pMVAST_N19%><' +
        '%pRedBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%><%pCre' +
        'dSN_N29%><%vCredICMSSN_N30%>'
      #9#9#9#9'</ICMSSN201>'
      #9#9#9#9'<ICMSSN202>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%modBCST_N18%><%pMVAST_N19%><' +
        '%pRedBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%>'
      #9#9#9#9'</ICMSSN202>'
      #9#9#9#9'<ICMSSN500>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%vBCSTRet_N26%><%vICMSSTRet_N' +
        '27%>'
      #9#9#9#9'</ICMSSN500>'
      #9#9#9#9'<ICMSSN900>'
      
        #9#9#9#9'    <%orig_N11%><%CSOSN_N12a%><%modBC_N13%><%vBC_N15%><%pRed' +
        'BC_N14%><%pICMS_N16%><%vICMS_N17%><%modBCST_N18%><%pMVAST_N19%><' +
        '%pRedBCST_N20%><%vBCST_N21%><%pICMSST_N22%><%vICMSST_N23%><%pCre' +
        'dSN_N29%><%vCredICMSSN_N30%>'
      #9#9#9#9'</ICMSSN900>'
      #9#9#9'</ICMS>'
      #9#9#9'<IPI>'
      
        #9#9#9#9'<%clEnq_O02%><%CNPJProd_O03%><%cSelo_O04%><%qSelo_O05%><%cEn' +
        'q_O06%>'
      #9#9#9#9'<IPITrib>'
      
        #9#9#9#9#9'<%CST_O09%><%vBC_O10%><%qUnid_O11%><%vUnid_O12%><%pIPI_O13%' +
        '><%vIPI_O14%>'
      #9#9#9#9'</IPITrib>'
      #9#9#9#9'<IPINT>'
      #9#9#9#9#9'<%CST_O09%>'
      #9#9#9#9'</IPINT>'
      #9#9#9'</IPI>'
      #9#9#9'<II>'
      #9#9#9#9'<%vBC_P02%><%vDespAdu_P03%><%vII_P04%><%vIOF_P05%>'
      #9#9#9'</II>'
      #9#9#9'<ISSQN>'
      
        #9#9#9#9'<%vBC_U02%><%vAliq_U03%><%vISSQN_U04%><%cMunFG_U05%><%cListS' +
        'erv_U06%><%cSitTrib_U07%>'
      #9#9#9'</ISSQN>'
      #9#9#9'<PIS>'
      #9#9#9#9'<PISAliq>'
      #9#9#9#9#9'<%CST_Q06%><%vBC_Q07%><%pPIS_Q08%><%vPIS_Q09%>'
      #9#9#9#9'</PISAliq>'
      #9#9#9#9'<PISQtde>'
      #9#9#9#9#9'<%CST_Q06%><%qBCProd_Q10%><%vAliqProd_Q11%><%vPIS_Q09%>'
      #9#9#9#9'</PISQtde>'
      #9#9#9#9'<PISNT>'
      #9#9#9#9#9'<%CST_Q06%>'
      #9#9#9#9'</PISNT>'
      #9#9#9#9'<PISOutr>'
      
        #9#9#9#9#9'<%CST_Q06%><%vBC_Q07%><%pPIS_Q08%><%qBCProd_Q10%><%vAliqPro' +
        'd_Q11%><%vPIS_Q09%>'
      #9#9#9#9'</PISOutr>'
      #9#9#9'</PIS>'
      #9#9#9'<PISST>'
      
        #9#9#9#9'<%vBC_R02%><%pPIS_R03%><%qBCProd_R04%><%vAliqProd_R05%><%vPI' +
        'S_R06%>'
      #9#9#9'</PISST>'
      #9#9#9'<COFINS>'
      #9#9#9#9'<COFINSAliq>'
      #9#9#9#9#9'<%CST_S06%><%vBC_S07%><%pCOFINS_S08%><%vCOFINS_S11%>'
      #9#9#9#9'</COFINSAliq>'
      #9#9#9#9'<COFINSQtde>'
      #9#9#9#9#9'<%CST_S06%><%qBCProd_S09%><%vAliqProd_S10%><%vCOFINS_S11%>'
      #9#9#9#9'</COFINSQtde>'
      #9#9#9#9'<COFINSNT>'
      #9#9#9#9#9'<%CST_S06%>'
      #9#9#9#9'</COFINSNT>'
      #9#9#9#9'<COFINSOutr>'
      
        #9#9#9#9#9'<%CST_S06%><%vBC_S07%><%pCOFINS_S08%><%qBCProd_S09%><%vAliq' +
        'Prod_S10%><%vCOFINS_S11%>'
      #9#9#9#9'</COFINSOutr>'
      #9#9#9'</COFINS>'
      #9#9#9'<COFINSST>'
      
        #9#9#9#9'<%vBC_T02%><%pCOFINS_T03%><%qBCProd_T04%><%vAliqProd_T05%><%' +
        'vCOFINS_T06%>'
      #9#9#9'</COFINSST>'
      #9#9'</imposto>'
      #9#9'<%infAdProd_V01%>'
      #9'</det>'
      '<total>'
      #9'<ICMSTot>'
      
        #9#9'<%vBC_W03%><%vICMS_W04%><%vBCST_W05%><%vST_W06%><%vProd_W07%><' +
        '%vFrete_W08%><%vSeg_W09%><%vDesc_W10%><%vII_W11%><%vIPI_W12%><%v' +
        'PIS_W13%><%vCOFINS_W14%><%vOutro_W15%><%vNF_W16%>'
      #9'</ICMSTot>'
      #9'<ISSQNtot>'
      
        #9#9'<%vServ_W18%><%vBC_W19%><%vISS_W20%><%vPIS_W21%><%vCOFINS_W22%' +
        '>'
      #9'</ISSQNtot>'
      #9'<retTrib>'
      
        #9#9'<%vRetPIS_W24%><%vRetCOFINS_W25%><%vRetCSLL_W26%><%vBCIRRF_W27' +
        '%><%vIRRF_W28%><%vBCRetPrev_W29%><%vRetPrev_W30%>'
      #9'</retTrib>'
      '</total>'
      '<transp>'
      #9'<%modFrete_X02%>'
      #9'<transporta>'
      
        #9#9'<%CNPJ_X04%><%CPF_X05%><%xNome_X06%><%IE_X07%><%xEnder_X08%><%' +
        'xMun_X09%><%UF_X10%>'
      #9'</transporta>'
      #9'<retTransp>'
      
        #9#9'<%vServ_X12%><%vBCRet_X13%><%pICMSRet_X14%><%vICMSRet_X15%><%C' +
        'FOP_X16%><%cMunFG_X17%>'
      #9'</retTransp>'
      #9'<veicTransp>'
      #9#9'<%placa_X19%><%UF_X20%><%RNTC_X21%>'
      #9'</veicTransp>'
      #9'<reboque>'
      
        #9#9'<%placa_X23%><%UF_X24%><%RNTC_X25%><%vagao_x25a%><%balsa_x25b%' +
        '>'
      #9'</reboque>'
      #9'<vol>'
      
        #9#9'<%qVol_X27%><%esp_X28%><%marca_X29%><%nVol_X30%><%pesoL_X31%><' +
        '%pesoB_X32%>'
      #9'  <lacres>'
      #9#9'  <%nLacre_X34%>'
      #9'  </lacres>'
      #9'</vol>'
      '</transp>'
      '<cobr>'
      #9'<fat>'
      #9#9'<%nFat_Y03%><%vOrig_Y04%><%vDesc_Y05%><%vLiq_Y06%>'
      #9'</fat>'
      #9'<dup>'
      #9#9'<%nDup_Y08%><%dVenc_Y09%><%vDup_Y10%>'
      #9'</dup>'
      '</cobr>'
      '<infAdic>'
      
        #9' <%infAdFisco_Z02%><%infCpl_Z03%>  <obsCont>    <%xCampo_Z05%><' +
        '%xTexto_Z06%>  </obsCont></infAdic>'
      '<exporta><%UFEmbarq_ZA02%><%xLocEmbarq_ZA03%></exporta>'
      '<compra><%xNEmp_ZB02%><%xPed_ZB03%><%xCont_ZB04%></compra>'
      '<cana>'
      '  <%cana_ZC01%><%safra_ZC02%>  <forDia>'
      
        '    <%ref_ZC03%><%dia_ZC05%><%qtde_ZC06%><%qTotMes_ZC07%><%qTotA' +
        'nt_ZC08%><%qTotGer_ZC09%>  </forDia>'
      '  <deduc>'
      
        '    <%xDed_ZC11%><%vDed_ZC12%><%vFor_ZC13%><%vTotDed_ZC14%><%vLi' +
        'qFor_ZC15%>  </deduc>'
      '</cana>'
      '</infNFe>')
    DataSet_Campos.Strings = (
      '<A>'
      
        '<campo1 nome="infNFe_A01" tamanho="4"  requerido="n" tpnode="gru' +
        'po"/>'
      
        '<campo2 nome="versao_A02" tamanho="4"  requerido="n" tpnode="atr' +
        'ibuto"/>'
      
        '<campo3 nome="Id_A03"     tamanho="47" requerido="n" tpnode="atr' +
        'ibuto"/>'
      '</A>'
      '<B>'
      
        '<campo1  nome="ide_B01"      tamanho="2"  requerido="s" tpnode="' +
        'grupo" />'
      
        '<campo2  nome="cUF_B02"      tamanho="2"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo3  nome="cNF_B03"      tamanho="8"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo4  nome="natOp_B04"    tamanho="60" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo5  nome="indPag_B05"   tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo6  nome="mod_B06"      tamanho="2"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo7  nome="serie_B07"    tamanho="3"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo8  nome="nNF_B08"      tamanho="9"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo9  nome="dEmi_B09"     tamanho="10" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo10 nome="dSaiEnt_B10"  tamanho="10" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo11 nome="hSaiEnt_B10a" tamanho="10" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo12 nome="tpNF_B11"     tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo13 nome="cMunFG_B12"   tamanho="7"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo14 nome="tpImp_B21"    tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo15 nome="tpEmis_B22"   tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo16 nome="cDV_B23"      tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo17 nome="tpAmb_B24"    tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo18 nome="finNFe_B25"   tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo19 nome="procEmi_B26"  tamanho="1"  requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo20 nome="verProc_B27"  tamanho="20" requerido="s" tpnode="' +
        'elemento" />'
      
        '<campo21 nome="dhCont_B28"   tamanho="20" requerido="n" tpnode="' +
        'elemento" />'
      
        '<campo22 nome="xJust_B29"    tamanho="20" requerido="n" tpnode="' +
        'elemento" />'
      '</B>'
      '<NFref>'
      
        '<campo1 '#9#9'nome="refNFe_B13"   tamanho="44" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo2 '#9#9'nome="cUF_B15"      tamanho="2"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo3 '#9#9'nome="AAMM_B16"     tamanho="4"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo4 '#9#9'nome="CNPJ_B17"     tamanho="14" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo5 '#9#9'nome="mod_B18"      tamanho="2"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo6 '#9#9'nome="serie_B19"    tamanho="3"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo7 '#9#9'nome="nNF_B20"      tamanho="9"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo8 '#9#9'nome="cUF_B20b"     tamanho="2"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo9 '#9#9'nome="AAMM_B20c"    tamanho="4"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo10 '#9'nome="CNPJ_B20d"    tamanho="14" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo11 '#9'nome="CPF_B20e"     tamanho="11" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo12'#9#9'nome="IE_B20f"      tamanho="14" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo13 '#9'nome="mod_B20f"     tamanho="2"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo14 '#9'nome="serie_B20g"   tamanho="3"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo15 '#9'nome="nNF_B20h"     tamanho="9"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo16 '#9'nome="refCTe_B20i"  tamanho="44" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo17 '#9'nome="mod_B20k"     tamanho="2"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo18 '#9'nome="nECF_B20l"    tamanho="3"  requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo19 '#9'nome="nCOO_B20m"    tamanho="6"  requerido="n" tpnode=' +
        '"elemento" />'
      '</NFref>'
      '<C>'
      
        '<campo1  nome="emit_C01"        tamanho="14"  requerido="s" tpno' +
        'de="grupo"    />'
      
        '<campo2  nome="CNPJ_C02"        tamanho="14"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo3  nome="CPF_C02a"        tamanho="11"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo4  nome="xNome_C03"       tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo5  nome="xFant_C04"       tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo6  nome="enderEmit_C05"   tamanho="14"  requerido="s" tpno' +
        'de="grupo"    />'
      
        '<campo7  nome="xLgr_C06"        tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo8  nome="nro_C07"         tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo9  nome="xCpl_C08"        tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo10 nome="xBairro_C09"     tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo11 nome="cMun_C10"        tamanho="7"   requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo12 nome="xMun_C11"        tamanho="60"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo13 nome="UF_C12"          tamanho="2"   requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo14 nome="CEP_C13"         tamanho="8"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo15 nome="cPais_C14"       tamanho="4"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo16 nome="xPais_C15"       tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo17 nome="fone_C16"        tamanho="14"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo18 nome="IE_C17"          tamanho="14"  requerido="s" tpno' +
        'de="elemento" />'
      
        '<campo19 nome="IEST_C18"        tamanho="14"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo20 nome="IM_C19"          tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo21 nome="CNAE_C20"        tamanho="7"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo22 nome="CRT_C21"         tamanho="1"   requerido="s" tpno' +
        'de="elemento" />'
      '</C>'
      '<D>'
      
        '<campo1  nome="CNPJ_D02"        tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo2  nome="xOrgao_D03"      tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo3  nome="matr_D04"        tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo4  nome="xAgente_D05"     tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo5  nome="fone_D06"        tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo6  nome="UF_D07"          tamanho="2"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7  nome="nDAR_D08"        tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8  nome="dEmi_D09"        tamanho="8"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9  nome="vDAR_D10"        tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="repEmi_D11"      tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="dPag_D12"        tamanho="8"  requerido="n" tpnod' +
        'e="elemento" />'
      '</D>'
      '<E>'
      
        '<campo1 nome="dest_E01"        tamanho="14"  requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="CNPJ_E02"        tamanho="14"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo3 nome="CPF_E03"         tamanho="11"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo4 nome="xNome_E04"       tamanho="60"  requerido="s" tpnod' +
        'e="elemento" />'
      
        '<campo5 nome="enderDest_E05"   tamanho="60"  requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo6 nome="xLgr_E06"        tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7 nome="nro_E07"         tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8 nome="xCpl_E08"        tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9 nome="xBairro_E09"     tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="cMun_E10"       tamanho="7"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="xMun_E11"       tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo12 nome="UF_E12"         tamanho="2"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo13 nome="CEP_E13"        tamanho="8"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo14 nome="cPais_E14"      tamanho="4"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo15 nome="xPais_E15"      tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo16 nome="fone_E16"       tamanho="14"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo17 nome="IE_E17"         tamanho="14"  requerido="s" tpnod' +
        'e="elemento" />'
      
        '<campo18 nome="ISUF_E18"       tamanho="9"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo19 nome="email_E19"      tamanho="60"  requerido="n" tpnod' +
        'e="elemento" />'
      '</E>'
      '<F>'
      
        '<campo1  nome="retirada_F01"  tamanho="14"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="CNPJ_F02"      tamanho="14"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3  nome="CPF_F02a"      tamanho="11"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="xLgr_F03"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="nro_F04"       tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="xCpl_F05"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="xBairro_F06"   tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8  nome="cMun_F07"      tamanho="7"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9  nome="xMun_F08"      tamanho="60"   requerido="n" tpnod' +
        'e="elemento"/>'
      
        '<campo10 nome="UF_F09"        tamanho="2"   requerido="n" tpnode' +
        '="elemento" />'
      '</F>'
      '<G>'
      
        '<campo1  nome="entrega_G01"   tamanho="14"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="CNPJ_G02"      tamanho="14"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3  nome="CPF_G02a"      tamanho="11"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="xLgr_G03"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="nro_G04"       tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="xCpl_G05"      tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="xBairro_G06"   tamanho="60"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8  nome="cMun_G07"      tamanho="7"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9  nome="xMun_G08"      tamanho="60"   requerido="n" tpnod' +
        'e="elemento"/>'
      
        '<campo10 nome="UF_G09"        tamanho="2"   requerido="n" tpnode' +
        '="elemento" />'
      '</G>'
      '<H>'
      
        '<campo1 nome="det_H01"        tamanho="14" requerido="n" tpnode=' +
        '"grupo"     />'
      
        '<campo2 nome="nItem_H02"      tamanho="14" requerido="n" tpnode=' +
        '"atributo"  />'
      '</H>'
      ''
      '<I>'
      
        '<campo1 nome="prod_I01"          tamanho="60"  requerido="n" tpn' +
        'ode="grupo"    />'
      
        '<campo2  nome="cProd_I02"        tamanho="60"  requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo3  nome="cEAN_I03"         tamanho="14"  requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo4  nome="xProd_I04"        tamanho="120" requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo5  nome="NCM_I05"          tamanho="8"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo6  nome="EXTIPI_I06"       tamanho="3"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo7  nome="genero_I07"       tamanho="2"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo8  nome="CFOP_I08"         tamanho="4"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo9  nome="uCom_I09"         tamanho="6"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo10 nome="qCom_I10"         tamanho="14"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo11 nome="vUnCom_I10a"      tamanho="16"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo12 nome="vProd_I11"        tamanho="16"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo13 nome="cEANTrib_I12"     tamanho="14"  requerido="s" tpn' +
        'ode="elemento" />'
      
        '<campo14 nome="uTrib_I13"        tamanho="6"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo15 nome="qTrib_I14"        tamanho="12"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo16 nome="vUnTrib_I14a"     tamanho="16"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo17 nome="vFrete_I15"       tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo18 nome="vSeg_I16"         tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo19 nome="vDesc_I17"        tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo20 nome="vOutro_I17a"      tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo21 nome="indTot_I17b"      tamanho="15"  requerido="n" tpn' +
        'ode="elemento" />'
      '</I>'
      '<DI>'
      
        '<campo1 nome="nDI_I19"          tamanho="12"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo2 nome="dDI_I20"          tamanho="10"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo3 nome="xLocDesemb_I21"   tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo4 nome="UFDesemb_I22"     tamanho="2"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo5 nome="dDesemb_I23"      tamanho="10"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo6 nome="cExportador_I24"  tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      '</DI>'
      '<ADI>'
      
        '<campo1 nome="nAdicao_I26"      tamanho="3"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo2 nome="nSeqAdic_I27"     tamanho="3"   requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo3 nome="cFabricante_I28"  tamanho="60"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo4 nome="vDescDI_I29"      tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo5 nome="xPed_I30"         tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo6 nome="nItemPed_I31"     tamanho="6"   requerido="n" tpno' +
        'de="elemento" />'
      '</ADI>'
      '<J>'
      
        '<campo1  nome="tpOp_J02"         tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo2  nome="chassi_J03"       tamanho="17"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo3  nome="cCor_J04"         tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo4  nome="xCor_J05"         tamanho="40"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo5  nome="pot_J06"          tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo6  nome="cilin_J07"        tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo7  nome="pesoL_J08"        tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo8  nome="pesoB_J09"        tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo9  nome="nSerie_J10"       tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo10 nome="tpComb_J11"       tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo11 nome="nMotor_J12"       tamanho="21"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo12 nome="CMT_J13"          tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo13 nome="dist_J14"         tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo14 nome="anoMod_J16"       tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo15 nome="anoFab_J17"       tamanho="4"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo16 nome="tpPint_J18"       tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo17 nome="tpVeic_J19"       tamanho="9"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo18 nome="espVeic_J20"      tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo19 nome="VIN_J21"          tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo20 nome="condVeic_J22"     tamanho="1"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo21 nome="cMod_J23"         tamanho="6"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo22 nome="cCorDENATRAN_J24" tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo23 nome="lota_J25"         tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo24 nome="tpRest_J26"       tamanho="2"   requerido="n" tpn' +
        'ode="elemento"/>'
      '</J>'
      '<K>'
      
        '<campo1  nome="nLote_K02"        tamanho="20"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo2  nome="qLote_K03"        tamanho="11"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo3  nome="dFab_K04"         tamanho="11"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo4  nome="dVal_K05"         tamanho="11"  requerido="n" tpn' +
        'ode="elemento"/>'
      
        '<campo5  nome="vPMC_K06"         tamanho="15"  requerido="n" tpn' +
        'ode="elemento"/>'
      '</K>'
      '<L>'
      
        '<campo1  nome="tpArma_L02"      tamanho="1"   requerido="n" tpno' +
        'de="elemento"/>'
      
        '<campo1  nome="nSerie_L03"      tamanho="9"   requerido="n" tpno' +
        'de="elemento"/>'
      
        '<campo1  nome="nCano_L04"       tamanho="9"   requerido="n" tpno' +
        'de="elemento"/>'
      
        '<campo1  nome="descr_L05"       tamanho="256" requerido="n" tpno' +
        'de="elemento"/>'
      '</L>'
      '<L1>'
      
        '<campo1 nome="comb_L101"      tamanho="1"  requerido="n" tpnode=' +
        '"grupo" />'
      
        '<campo2 nome="cProdANP_l102"  tamanho="9"  requerido="s" tpnode=' +
        '"elemento" />'
      
        '<campo3 nome="CODIF_L103"     tamanho="21" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo4 nome="qTemp_L104"     tamanho="21" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo5 nome="UFCons_L120"    tamanho="2"  requerido="s" tpnode=' +
        '"elemento" />'
      
        '<campo6 nome="CIDE_L105"      tamanho="1"  requerido="n" tpnode=' +
        '"grupo" />'
      
        '<campo7 nome="qBCprod_L106"   tamanho="21" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo8 nome="vAliqProd_L107" tamanho="21" requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo9 nome="vCIDE_L108"     tamanho="18" requerido="n" tpnode=' +
        '"elemento" />'
      '</L1>'
      '<M>'
      
        '<campo1  nome="imposto_M01"    tamanho="60" requerido="n" tpnode' +
        '="grupo" />'
      
        '<campo2  nome="TIPO_M02"       tamanho="1"  requerido="s" tpnode' +
        '="elemento" />'
      '</M>'
      '<N>'
      
        '<campo1  nome="ICMS_N01"            tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo2  nome="ICMS00_N02"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo3  nome="ICMS10_N03"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo4  nome="ICMS20_N04"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo5  nome="ICMS30_N05"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo6  nome="ICMS40_N06"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo7  nome="ICMS51_N07"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo8  nome="ICMS60_N08"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo9  nome="ICMS70_N09"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo10 nome="ICMS90_N10"          tamanho="1"  requerido="n" t' +
        'pnode="grupo" />'
      
        '<campo11 nome="orig_N11"            tamanho="1"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo12 nome="CST_N12"             tamanho="2"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo13 nome="CSOSN_N12a"          tamanho="3"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo14 nome="modBC_N13"           tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo15 nome="pRedBC_N14"          tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo16 nome="vBC_N15"             tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo17 nome="pICMS_N16"           tamanho="5"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo18 nome="vICMS_N17"           tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo19 nome="modBCST_N18"         tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo20 nome="pMVAST_N19"          tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo21 nome="pRedBCST_N20"        tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo22 nome="vBCST_N21"           tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo23 nome="pICMSST_N22"         tamanho="6"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo24 nome="vICMSST_N23"         tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo25 nome="UFST_N24"            tamanho="2"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo26 nome="pBCOp_N25"           tamanho="5"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo27 nome="vBCSTRet_N26"        tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo28 nome="vICMSSTRet_N27"      tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo29 nome="motDesICMS_N28"      tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo30 nome="pCredSN_N29"         tamanho="5"  requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo31 nome="vCredICMSSN_N30"     tamanho="15" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo32 nome="vBCSTDest_N31"       tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      
        '<campo33 nome="vICMSSTDest_N32"     tamanho="16" requerido="n" t' +
        'pnode="elemento" />'
      '</N>'
      '<O>'
      
        '<campo1  nome="IPI_O01"       tamanho="5"   requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="clEnq_O02"     tamanho="5"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3  nome="CNPJProd_O03"  tamanho="14"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="cSelo_O04"     tamanho="50"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="qSelo_O05"     tamanho="12"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="cEnq_O06"      tamanho="3"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="IPITrib_O07"   tamanho="5"   requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo8  nome="IPINT_O08"     tamanho="5"   requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo9  nome="CST_O09"       tamanho="2"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo10 nome="vBC_O10"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo11 nome="qUnid_O11"     tamanho="16"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo12 nome="vUnid_O12"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo13 nome="pIPI_O13"      tamanho="5"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo14 nome="vIPI_O14"      tamanho="16"  requerido="n" tpnode' +
        '="elemento" />'
      '</O>'
      '<P>'
      
        '<campo1 nome="II_P01"         tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="vBC_P02"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="vDespAdu_P03"   tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="vII_P04"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="vIOF_P05"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      '</P>'
      '<Q>'
      
        '<campo1 nome="PIS_Q01"         tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="PISAliq_Q02"     tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo3 nome="PISQtde_Q03"     tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo4 nome="PISNT_Q04"       tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo5 nome="PISOutr_Q05"     tamanho="2"   requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo6 nome="CST_Q06"         tamanho="2"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7 nome="vBC_Q07"         tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8 nome="pPIS_Q08"        tamanho="6"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9 nome="vPIS_Q09"        tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="qBCProd_Q10"    tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="vAliqProd_Q11"  tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      '</Q>'
      '<R>'
      
        '<campo1 nome="PISST_R01"      tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="vBC_R02"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="pPIS_R03"       tamanho="6"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="qBCProd_R04"    tamanho="16"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="vAliqProd_R05"  tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="vPIS_R06"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      '</R>'
      '<S>'
      
        '<campo1  nome="COFINS_S01"       tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo2  nome="COFINSAliq_S01"   tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo3  nome="COFINSQtde_S01"   tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo4  nome="COFINSNT_S01"     tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo5  nome="COFINSOutr_S01"   tamanho="2"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo6  nome="CST_S06"          tamanho="2"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo7  nome="vBC_S07"          tamanho="15" requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo8  nome="pCOFINS_S08"      tamanho="5"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo9  nome="qBCProd_S09"      tamanho="16" requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo10 nome="vAliqProd_S10"    tamanho="15" requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo11 nome="vCOFINS_S11"      tamanho="15" requerido="n" tpno' +
        'de="elemento" />'
      '</S>'
      '<T>'
      
        '<campo1 nome="COFINSST_T01"    tamanho="15"  requerido="n" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="vBC_T02"         tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo3 nome="pCOFINS_T03"     tamanho="5"   requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo4 nome="qBCProd_T04"     tamanho="16"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo5 nome="vAliqProd_T05"   tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo6 nome="vCOFINS_T06"     tamanho="15"  requerido="n" tpnod' +
        'e="elemento" />'
      '</T>'
      '<U>'
      
        '<campo1 nome="ISSQN_U01"      tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="vBC_U02"        tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="vAliq_U03"      tamanho="6"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="vISSQN_U04"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="cMunFG_U05"     tamanho="7"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="cListServ_U06"  tamanho="4"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7 nome="cSitTrib_U07"   tamanho="1"   requerido="n" tpnode' +
        '="elemento" />'
      '</U>'
      '<V>'
      
        '<campo1 nome="infAdProd_V01"  tamanho="500"  requerido="n" tpnod' +
        'e="elemento" />'
      '</V>'
      '<W>'
      
        '<campo1  nome="total_W01"     tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2  nome="ICMSTot_W02"   tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo3  nome="vBC_W03"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4  nome="vICMS_W04"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5  nome="vBCST_W05"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6  nome="vST_W06"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7  nome="vProd_W07"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8  nome="vFrete_W08"    tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9  nome="vSeg_W09"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo10 nome="vDesc_W10"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo11 nome="vII_W11"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo12 nome="vIPI_W12"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo13 nome="vPIS_W13"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo14 nome="vCOFINS_W14"   tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo15 nome="vOutro_W15"    tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo16 nome="vNF_W16"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo17 nome="ISSQNtot_W17"  tamanho="15"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo18 nome="vServ_W18"     tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo19 nome="vBC_W19"       tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo20 nome="vISS_W20"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo21 nome="vPIS_W21"      tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo22 nome="vCOFINS_W22"   tamanho="15"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo23 nome="retTrib_W23"     tamanho="15"  requerido="n" tpno' +
        'de="grupo"  />'
      
        '<campo24 nome="vRetPIS_W24"     tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo25 nome="vRetCOFINS_W25"  tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo26 nome="vRetCSLL_W26"    tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo27 nome="vBCIRRF_W27"     tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo28 nome="vIRRF_W28"       tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo29 nome="vBCRetPrev_W29"  tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo30 nome="vRetPrev_W30"    tamanho="15"  requerido="n" tpno' +
        'de="elemento" />'
      '</W>'
      '<X>'
      
        '<campo1 nome="transp_X01"       tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo2 nome="modFrete_X02"     tamanho="1"  requerido="s" tpnod' +
        'e="elemento" />'
      
        '<campo3 nome="transporta_X03"   tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo4 nome="CNPJ_X04"         tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo5 nome="CPF_X05"          tamanho="11" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo6 nome="xNome_X06"        tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo7 nome="IE_X07"           tamanho="14" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo8 nome="xEnder_X08"       tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo9 nome="xMun_X09"         tamanho="60" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo10 nome="UF_X10"          tamanho="2"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo11 nome="retTransp_X13"   tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo12 nome="vServ_X12"       tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo13 nome="vBCRet_X13"      tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo14 nome="pICMSRet_X14"    tamanho="6"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo15 nome="vICMSRet_X15"    tamanho="15" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo16 nome="CFOP_X16"        tamanho="4"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo17 nome="cMunFG_X17"      tamanho="7"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo18 nome="veicTransp_X18"  tamanho="1"  requerido="s" tpnod' +
        'e="grupo"    />'
      
        '<campo19 nome="placa_X19"       tamanho="8"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo20 nome="UF_X20"          tamanho="2"  requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo21 nome="RNTC_X21"        tamanho="20" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo22 nome="vagao_x25a"      tamanho="20" requerido="n" tpnod' +
        'e="elemento" />'
      
        '<campo23 nome="balsa_x25b"      tamanho="20" requerido="n" tpnod' +
        'e="elemento" />'
      '</X>'
      '<XREBOQUE>'
      
        '<campo1 nome="placa_X23"       tamanho="8"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo2 nome="UF_X24"          tamanho="2"  requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="RNTC_X25"        tamanho="20" requerido="n" tpnode' +
        '="elemento" />'
      '</XREBOQUE>'
      '<XVOLUME>'
      
        '<campo1 nome="qVol_X27"        tamanho="15" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo2 nome="esp_X28"         tamanho="60" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="marca_X29"       tamanho="60" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="nVol_X30"        tamanho="60" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="pesoL_X31"       tamanho="15" requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="pesoB_X32"       tamanho="15" requerido="n" tpnode' +
        '="elemento" />'
      '</XVOLUME>'
      '<XLACRE>'
      
        '<campo1 nome="nLacre_X34"      tamanho="60" requerido="n" tpnode' +
        '="elemento"   />'
      '</XLACRE>'
      '<Y>'
      
        '<campo1 nome="cobr_Y01"    tamanho="60"  requerido="n" tpnode="g' +
        'rupo"    />'
      
        '<campo2 nome="fat_Y02"     tamanho="60"  requerido="n" tpnode="g' +
        'rupo"    />'
      
        '<campo3 nome="nFat_Y03"    tamanho="60"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo4 nome="vOrig_Y04"   tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo5 nome="vDesc_Y05"   tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo6 nome="vLiq_Y06"    tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo7  nome="dup_Y07"    tamanho="60"  requerido="n" tpnode="g' +
        'rupo"    />'
      
        '<campo8  nome="nDup_Y08"   tamanho="60"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo9  nome="dVenc_Y09"  tamanho="10"  requerido="n" tpnode="e' +
        'lemento" />'
      
        '<campo10 nome="vDup_Y10"   tamanho="15"  requerido="n" tpnode="e' +
        'lemento" />'
      '</Y>'
      '<Z>'
      
        '<campo1 nome="infAdic_Z01"     tamanho="200"   requerido="n" tpn' +
        'ode="grupo"    />'
      
        '<campo2 nome="infAdFisco_Z02"  tamanho="256"   requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo3 nome="infCpl_Z03"      tamanho="5000"  requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo4 nome="obsCont_Z04"     tamanho="2"     requerido="n" tpn' +
        'ode="grupo"    />'
      
        '<campo5 nome="xCampo_Z05"      tamanho="20"    requerido="n" tpn' +
        'ode="elemento" />'
      
        '<campo6 nome="xTexto_Z06"      tamanho="60"    requerido="n" tpn' +
        'ode="elemento" />'
      '</Z>'
      '<ZA>'
      
        '<campo1 nome="exporta_ZA01"    tamanho="200"  requerido="n" tpno' +
        'de="grupo"    />'
      
        '<campo2 nome="UFEmbarq_ZA02"   tamanho="2"    requerido="n" tpno' +
        'de="elemento" />'
      
        '<campo3 nome="xLocEmbarq_ZA03"  tamanho="60"   requerido="n" tpn' +
        'ode="elemento" />'
      '</ZA>'
      '<ZB>'
      
        '<campo1 nome="compra_ZB01"  tamanho="200"  requerido="n" tpnode=' +
        '"grupo"    />'
      
        '<campo2 nome="xNEmp_ZB02"   tamanho="22"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="xPed_ZB03"    tamanho="60"   requerido="n" tpnode=' +
        '"elemento" />'
      
        '<campo4 nome="xCont_ZB04"   tamanho="60"   requerido="n" tpnode=' +
        '"elemento" />'
      '</ZB>'
      '<ZC>'
      
        '<campo1 nome="cana_ZC01"     tamanho="200"  requerido="n" tpnode' +
        '="grupo"    />'
      
        '<campo2 nome="safra_ZC02"    tamanho="9"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo3 nome="ref_ZC03"      tamanho="6"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo4 nome="dia_ZC05"      tamanho="2"    requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo5 nome="qtde_ZC06"     tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo6 nome="qTotMes_ZC07"  tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo7 nome="qTotAnt_ZC08"  tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo8 nome="qTotGer_ZC09"  tamanho="11"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo9 nome="xDed_ZC11"     tamanho="60"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo10 nome="vDed_ZC12"    tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo11 nome="vFor_ZC13"    tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo12 nome="vTotDed_ZC14" tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      
        '<campo13 nome="vLiqFor_ZC15" tamanho="15"   requerido="n" tpnode' +
        '="elemento" />'
      '</ZC>')
    DPEC_Campos.Strings = (
      '<cabecalho>'
      
        '<campo1 nome="cUF_AP06"      tipo="string" tamanho="2"   requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo2 nome="tpAmb_AP07"    tipo="string" tamanho="1"   requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo3 nome="verProc_AP08"  tipo="string" tamanho="20"  requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo4 nome="CNPJ_AP09"     tipo="string" tamanho="14"  requeri' +
        'do="s" tpnode="elemento"/>'
      
        '<campo5 nome="IE_AP10"       tipo="string" tamanho="14"  requeri' +
        'do="s" tpnode="elemento"/>'
      '</cabecalho>'
      '<notas>'
      
        '<campo1 nome="chNFe_AP12"  tipo="string" tamanho="44"  requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo2 nome="CNPJ_AP13"   tipo="string" tamanho="14"  requerido' +
        '="n" tpnode="elemento"/>'
      
        '<campo3 nome="CPF_AP14"    tipo="string" tamanho="11"  requerido' +
        '="n" tpnode="elemento"/>'
      
        '<campo4 nome="UF_AP15"     tipo="string" tamanho="2"   requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo5 nome="vNF_AP16"    tipo="string" tamanho="15"  requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo6 nome="vICMS_AP17"  tipo="string" tamanho="15"  requerido' +
        '="s" tpnode="elemento"/>'
      
        '<campo7 nome="vST_AP18"    tipo="string" tamanho="15"  requerido' +
        '="s" tpnode="elemento"/>'
      '</notas>')
    DPEC_Template.Strings = (
      '<infDPEC Id*>'
      '<ideDec>'
      
        '<%cUF_AP06%><%tpAmb_AP07%><%verProc_AP08%><%CNPJ_AP09%><%IE_AP10' +
        '%>'
      '</ideDec>'
      '<resNFe>'
      
        '<%chNFe_AP12%><%CNPJ_AP13%><%CPF_AP14%><%UF_AP15%><%vNF_AP16%><%' +
        'vICMS_AP17%><%vST_AP18%>'
      '</resNFe>'
      '</infDPEC>')
    CCe_Template.Strings = (
      '<envEvento versao="@a(versao_HP02)">'
      '   <%idLote_HP03%>'
      '   <evento versao="@a(versao_HP05)">'
      '       <infEvento Id="@a(Id_HP07)">'
      '           <%cOrgao_HP08%>'
      '           <%tpAmb_HP09%>'
      '           <%CNPJ_HP10%>'
      '           <%CPF_HP11%>'
      '           <%chNFe_HP12%>'
      '           <%dhEvento_HP13%>'
      '           <%tpEvento_HP14%>'
      '           <%nSeqEvento_HP15%>'
      '           <%verEvento_HP16%>'
      '           <detEvento versao="@a(versao_HP18)">'
      '               <%descEvento_HP19%>'
      '               <%xCorrecao_HP20%>'
      '               <%xCondUso_HP20a%>'
      '           </detEvento>'
      '       </infEvento>'
      '   </evento>'
      '</envEvento>')
    CCe_Campos.Strings = (
      '<envEvento>'
      
        '<campo1  nome="envEvento_HP01"     tamanho="4"     requerido="n"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP02"        tamanho="4"     requerido="n"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="idLote_HP03"        tamanho="15"    requerido="s"' +
        '   tpnode="elemento"/>'
      '</envEvento>'
      '<evento>'
      
        '<campo1  nome="evento_HP04"        tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP05"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="infEvento_HP06"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo4  nome="Id_HP07"            tamanho="54"    requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo5  nome="cOrgao_HP08"        tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo6  nome="tpAmb_HP09"         tamanho="1"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo7  nome="CNPJ_HP10"          tamanho="14"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo8  nome="CPF_HP11"           tamanho="11"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo9  nome="chNFe_HP12"         tamanho="44"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo10 nome="dhEvento_HP13"      tamanho="25"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo11 nome="tpEvento_HP14"      tamanho="6"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo12 nome="nSeqEvento_HP15"    tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo13 nome="verEvento_HP16"     tamanho="4"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo14 nome="detEvento_HP17"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo15 nome="versao_HP18"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo16 nome="descEvento_HP19"    tamanho="60"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo17 nome="xCorrecao_HP20"     tamanho="1000"  requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo18 nome="xCondUso_HP20a"     tamanho="1000"  requerido="s"' +
        '   tpnode="elemento"/>'
      '</evento>')
    CLe_Template.Strings = (
      '<enviCLe versao="@a(versao)">'
      ' <%tpAmb%>'
      ' <CLe>'
      '   <transportador>'
      '     <%CNPJ%>'
      '     <%CPF%>'
      '     <%xNome%>'
      '     <%xFant%>'
      '     <dadosTranspCLeAvulsa>'
      '       <%CPFCLeAvulsa%>'
      '       <%CNPJCLeAvulsa%>'
      '       <%xNomeCLeAvulsa%>'
      '     </dadosTranspCLeAvulsa>'
      '   </transportador>'
      '   <mdTransp>'
      '     <rodoviario>'
      '       <%pVeic%>'
      '       <%cUFVeic%>'
      '       <%pCarreta%>'
      '       <%cUFCarreta%>'
      '       <%pCarreta2%>'
      '       <%cUFCarreta2%>'
      '     </rodoviario>'
      '     <outro>'
      '       <%cMod%>'
      '       <%cUFTransporte%>'
      '       <%xIdent%>'
      '     </outro>'
      '   </mdTransp>'
      '   <%cUFOrigem%>'
      '   <%cUFDestino%>'
      '   <det>'
      '     <%chvAcesso%>'
      '   </det>'
      ' </CLe>'
      '</enviCLe>')
    CLe_Campos.Strings = (
      '<enviCLe>'
      
        '<campo1 nome="enviCLe" tamanho="4" requerido="n" tpnode="grupo"/' +
        '>'
      
        '<campo2 nome="versao" tamanho="4" requerido="n" tpnode="atributo' +
        '"/>'
      
        '<campo3 nome="tpAmb" tamanho="1" requerido="n" tpnode="elemento"' +
        '/>'
      '<campo4 nome="CLe" tamanho="4" requerido="n" tpnode="grupo"/>'
      
        '<campo5 nome="tranportador" tamanho="4" requerido="n" tpnode="gr' +
        'upo"/>'
      
        '<campo6 nome="CNPJ" tamanho="14" requerido="n" tpnode="elemento"' +
        '/>'
      
        '<campo7 nome="CPF" tamanho="11" requerido="n" tpnode="elemento"/' +
        '>'
      
        '<campo8 nome="xNome" tamanho="60" requerido="n" tpnode="elemento' +
        '"/>'
      
        '<campo9 nome="xFant" tamanho="60" requerido="n" tpnode="elemento' +
        '"/>'
      
        '<campo10 nome="dadosTranspCLeAvulsa" tamanho="4" requerido="n" t' +
        'pnode="grupo"/>'
      
        '<campo11 nome="CPFCLeAvulsa" tamanho="11" requerido="n" tpnode="' +
        'elemento"/>'
      
        '<campo12 nome="CNPJCLeAvulsa" tamanho="14" requerido="n" tpnode=' +
        '"elemento"/>'
      
        '<campo13 nome="xNomeCLeAvulsa" tamanho="60" requerido="n" tpnode' +
        '="elemento"/>'
      
        '<campo14 nome="mdTransp" tamanho="4" requerido="n" tpnode="grupo' +
        '"/>'
      
        '<campo15 nome="rodoviario" tamanho="4" requerido="n" tpnode="gru' +
        'po"/>'
      
        '<campo16 nome="pVeic" tamanho="8" requerido="n" tpnode="elemento' +
        '"/>'
      
        '<campo17 nome="cUFVeic" tamanho="2" requerido="n" tpnode="elemen' +
        'to"/>'
      
        '<campo18 nome="pCarreta" tamanho="8" requerido="n" tpnode="eleme' +
        'nto"/>'
      
        '<campo19 nome="cUFCarreta" tamanho="2" requerido="n" tpnode="ele' +
        'mento"/>'
      
        '<campo20 nome="pCarreta2" tamanho="8" requerido="n" tpnode="elem' +
        'ento"/>'
      
        '<campo21 nome="cUFCarreta2" tamanho="2" requerido="n" tpnode="el' +
        'emento"/>'
      '<campo22 nome="outro" tamanho="4" requerido="n" tpnode="grupo"/>'
      
        '<campo23 nome="cMod" tamanho="2" requerido="n" tpnode="elemento"' +
        '/>'
      
        '<campo24 nome="cUFTransporte" tamanho="2" requerido="n" tpnode="' +
        'elemento"/>'
      
        '<campo25 nome="xIdent" tamanho="255" requerido="n" tpnode="eleme' +
        'nto"/>'
      
        '<campo26 nome="cUFOrigem" tamanho="2" requerido="n" tpnode="elem' +
        'ento"/>'
      
        '<campo27 nome="cUFDestino" tamanho="2" requerido="n" tpnode="ele' +
        'mento"/>'
      '</enviCLe>'
      '<det>'
      '<campo1 nome="det" tamanho="4" requerido="n" tpnode="grupo"/>'
      
        '<campo2 nome="chvAcesso" tamanho="44" requerido="n" tpnode="elem' +
        'ento"/>'
      '</det>')
    CancelamentoEvt_Campos.Strings = (
      '<envEvento>'
      
        '<campo1  nome="envEvento_HP01"     tamanho="4"     requerido="n"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP02"        tamanho="4"     requerido="n"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="idLote_HP03"        tamanho="15"    requerido="s"' +
        '   tpnode="elemento"/>'
      '</envEvento>'
      '<evento>'
      
        '<campo1  nome="evento_HP04"        tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo2  nome="versao_HP05"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo3  nome="infEvento_HP06"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo4  nome="Id_HP07"            tamanho="54"    requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo5  nome="cOrgao_HP08"        tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo6  nome="tpAmb_HP09"         tamanho="1"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo7  nome="CNPJ_HP10"          tamanho="14"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo8  nome="CPF_HP11"           tamanho="11"    requerido="n"' +
        '   tpnode="elemento"/>'
      
        '<campo9  nome="chNFe_HP12"         tamanho="44"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo10 nome="dhEvento_HP13"      tamanho="25"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo11 nome="tpEvento_HP14"      tamanho="6"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo12 nome="nSeqEvento_HP15"    tamanho="2"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo13 nome="verEvento_HP16"     tamanho="4"     requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo14 nome="detEvento_HP17"     tamanho="2"     requerido="s"' +
        '   tpnode="grupo"/>'
      
        '<campo15 nome="versao_HP18"        tamanho="4"     requerido="s"' +
        '   tpnode="atributo"/>'
      
        '<campo16 nome="descEvento_HP19"    tamanho="60"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo17 nome="nProt_HP20"         tamanho="15"    requerido="s"' +
        '   tpnode="elemento"/>'
      
        '<campo18 nome="xJust_HP21"         tamanho="255"   requerido="s"' +
        '   tpnode="elemento"/>'
      '</evento>')
    CancelamentoEvt_Template.Strings = (
      '<envEvento versao="@a(versao_HP02)">'
      '   <%idLote_HP03%>'
      '   <evento versao="@a(versao_HP05)">'
      '       <infEvento Id="@a(Id_HP07)">'
      '           <%cOrgao_HP08%>'
      '           <%tpAmb_HP09%>'
      '           <%CNPJ_HP10%>'
      '           <%CPF_HP11%>'
      '           <%chNFe_HP12%>'
      '           <%dhEvento_HP13%>'
      '           <%tpEvento_HP14%>'
      '           <%nSeqEvento_HP15%>'
      '           <%verEvento_HP16%>'
      '           <detEvento versao="@a(versao_HP18)">'
      '               <%descEvento_HP19%>'
      '               <%nProt_HP20%>'
      '               <%xJust_HP21%>'
      '           </detEvento>'
      '       </infEvento>'
      '   </evento>'
      '</envEvento>')
    Left = 1032
    Top = 592
  end
end
