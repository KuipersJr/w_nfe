unit uDm_nfe;

interface

uses
  System.SysUtils, System.Classes, nfdNFEServidores, nfdNFe2, nfdNFETemplates2,
  nfdNFeDataSets2, unfdDPEC2, Data.FMTBcd, Data.DB, Datasnap.Provider,
  Datasnap.DBClient, Data.SqlExpr, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Imaging.Jpeg, Vcl.DBCtrls,
  System.Variants;

type
  Tdm_nfe = class(TDataModule)
    nfdDPEC2: TnfdDPEC2;
    nfdNFe2: TnfdNFe2;
    nfdNFeDataSets: TnfdNFeDataSets2;
    nfdNFeTemplates2: TnfdNFeTemplates2;
    ValidaEschemaAntesEnvio: TValidaEschemaAntesEnvio;
    qryConf: TSQLQuery;
    cdsConf: TClientDataSet;
    dspConf: TDataSetProvider;
    dsConfi: TDataSource;
    cdsConfID_NFE_CONF: TIntegerField;
    cdsConfDIR_EXPORTACAO: TStringField;
    cdsConfDIR_LOG: TStringField;
    cdsConfFLG_ARQ_LOG: TStringField;
    cdsConfIMG_LOGO: TBlobField;
    cdsConfNOME_CERTIFICADO: TStringField;
    cdsConfPROXY: TStringField;
    cdsConfPROXY_SENHA: TStringField;
    cdsConfPROXY_USER: TStringField;
    cdsConfTIPO_CERTIFICADO: TStringField;
    cdsConfFLG_VALIDA: TStringField;
    cdsConfFLG_AMBIENTE: TStringField;
    cdsConfFLG_TP_IMP: TStringField;
    cdsConfFLG_IMPRIME: TStringField;
    cdsConfQTDE_IMP: TSmallintField;
    cdsConfIMP_PADRAO: TStringField;
    nfdNFeServidores2: TnfdNFeServidores;
    cdsConfDIR_TXTNFE: TStringField;
    qryConf_Cont: TSQLQuery;
    cdsConf_Cont: TClientDataSet;
    dspConf_Cont: TDataSetProvider;
    dsConf_Cont: TDataSource;
    cdsConf_ContID_CONTINGENCIA: TIntegerField;
    cdsConf_ContFLG_TP_CONTI: TStringField;
    cdsConf_ContMOTIVO: TStringField;
    cdsConf_ContDTA_CONTI: TSQLTimeStampField;
    cdsNfe_Cab: TClientDataSet;
    cdsNfeItens: TClientDataSet;
    cds_DI: TClientDataSet;
    cds_aDI: TClientDataSet;
    cds_NFref: TClientDataSet;
    cds_NfeMed: TClientDataSet;
    cds_NfeArma: TClientDataSet;
    cds_nfeReboque: TClientDataSet;
    cds_nfeVolumes: TClientDataSet;
    cds_nfeLacre: TClientDataSet;
    cds_nfeDuplicata: TClientDataSet;
    cds_nfeProcRef: TClientDataSet;
    cds_CanaForDia: TClientDataSet;
    cds_nfeDeduc: TClientDataSet;
    cdsNfe_CabcUF: TStringField;
    cdsNfe_CabcNF: TStringField;
    cdsNfe_CabnatOp: TStringField;
    cdsNfe_CabindPag: TStringField;
    cdsNfe_Cabmod: TStringField;
    cdsNfe_Cabserie: TStringField;
    cdsNfe_CabnNF: TStringField;
    cdsNfe_CabdEmi: TStringField;
    cdsNfe_CabdSaiEnt: TStringField;
    cdsNfe_CabhSaiEnt: TStringField;
    cdsNfe_CabtpNF: TStringField;
    cdsNfe_CabcMunFG: TStringField;
    cds_NFrefrefNFe: TStringField;
    cds_NFrefcUF: TStringField;
    cds_NFrefAAMM: TStringField;
    cds_NFrefCNPJ: TStringField;
    cds_NFrefmod: TStringField;
    cds_NFrefserie: TStringField;
    cds_NFrefnNF: TStringField;
    cds_refNFP: TClientDataSet;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    cds_refNFPCPF: TStringField;
    cds_refNFPIE: TStringField;
    cds_refECF: TClientDataSet;
    StringField12: TStringField;
    cds_refECFnECF: TStringField;
    cds_refECFnCOO: TStringField;
    cdsNfe_CabtpImp: TStringField;
    cdsNfe_CabtpEmis: TStringField;
    cdsNfe_CabcDV: TStringField;
    cdsNfe_CabtpAmb: TStringField;
    cdsNfe_CabfinNFe: TStringField;
    cdsNfe_CabprocEmi: TStringField;
    cdsNfe_CabverProc: TStringField;
    cdsNfe_CabdhCont: TStringField;
    cdsNfe_CabxJust: TStringField;
    cdsNfe_CabCNPJ: TStringField;
    cdsNfe_CabCPF: TStringField;
    cdsNfe_CabxNome: TStringField;
    cdsNfe_CabxFant: TStringField;
    cdsNfe_CabxLgr: TStringField;
    cdsNfe_Cabnro: TStringField;
    cdsNfe_CabxCpl: TStringField;
    cdsNfe_CabxBairro: TStringField;
    cdsNfe_CabcMun: TStringField;
    cdsNfe_CabxMun: TStringField;
    cdsNfe_CabUF: TStringField;
    cdsNfe_CabCEP: TStringField;
    cdsNfe_CabcPais: TStringField;
    cdsNfe_CabxPais: TStringField;
    cdsNfe_Cabfone: TStringField;
    cdsNfe_CabIE: TStringField;
    cdsNfe_CabIEST: TStringField;
    cdsNfe_CabIM: TStringField;
    cdsNfe_CabCNAE: TStringField;
    cdsNfe_CabCRT: TStringField;
    cds_NfAvulsa: TClientDataSet;
    cds_NfAvulsaCNPJ: TStringField;
    cds_NfAvulsaxOrgao: TStringField;
    cds_NfAvulsamatr: TStringField;
    cds_NfAvulsaxAgente: TStringField;
    cds_NfAvulsafone: TStringField;
    cds_NfAvulsaUF: TStringField;
    cds_NfAvulsanDAR: TStringField;
    cds_NfAvulsadEmi: TStringField;
    cds_NfAvulsavDAR: TFloatField;
    cds_NfAvulsarepEmi: TStringField;
    cds_NfAvulsadPag: TStringField;
    cdsNfe_CabCNPJ_d: TStringField;
    cdsNfe_CabCPF_d: TStringField;
    cdsNfe_CabxNome_d: TStringField;
    cdsNfe_CabxLgr_d: TStringField;
    cdsNfe_Cabnro_d: TStringField;
    cdsNfe_CabxCpl_d: TStringField;
    cdsNfe_CabxBairro_d: TStringField;
    cdsNfe_CabcMun_d: TStringField;
    cdsNfe_CabxMun_d: TStringField;
    cdsNfe_CabUF_d: TStringField;
    cdsNfe_CabCEP_d: TStringField;
    cdsNfe_CabcPais_d: TStringField;
    cdsNfe_CabxPais_d: TStringField;
    cdsNfe_Cabfone_d: TStringField;
    cdsNfe_CabIE_d: TStringField;
    cdsNfe_CabISUF: TStringField;
    cdsNfe_Cabemail_d: TStringField;
    cds_L_Retirada: TClientDataSet;
    cds_L_RetiradaCNPJ: TStringField;
    cds_L_RetiradaCPF: TStringField;
    cds_L_RetiradaxLgr: TStringField;
    cds_L_Retiradanro: TStringField;
    cds_L_RetiradaxCpl: TStringField;
    cds_L_RetiradaxBairro: TStringField;
    cds_L_RetiradacMun: TStringField;
    cds_L_RetiradaxMun: TStringField;
    cds_L_RetiradaUF: TStringField;
    cds_L_Entrega: TClientDataSet;
    StringField1: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    cdsNfeItenscProd: TStringField;
    cdsNfeItenscEAN: TStringField;
    cdsNfeItensxProd: TStringField;
    cdsNfeItensNCM: TStringField;
    cdsNfeItensEXTIPI: TStringField;
    cdsNfeItensCFOP: TStringField;
    cdsNfeItensuCom: TStringField;
    cdsNfeItensqCom: TStringField;
    cdsNfeItensvUnCom: TStringField;
    cdsNfeItensvProd: TStringField;
    cdsNfeItenscEANTrib: TStringField;
    cdsNfeItensuTrib: TStringField;
    cdsNfeItensqTrib: TStringField;
    cdsNfeItensvUnTrib: TStringField;
    cdsNfeItensvFrete: TStringField;
    cdsNfeItensvSeg: TStringField;
    cdsNfeItensvDesc: TStringField;
    cdsNfeItensvOutro: TStringField;
    cdsNfeItensindTot: TStringField;
    cdsNfeItensxPed: TStringField;
    cdsNfeItensnItemPed: TStringField;
    cdsNfeItensorig: TStringField;
    cdsNfeItensCST: TStringField;
    cdsNfeItensCSOSN: TStringField;
    cdsNfeItensmodBC: TStringField;
    cdsNfeItenspRedBC: TStringField;
    cdsNfeItensvBC: TStringField;
    cdsNfeItenspICMS: TStringField;
    cdsNfeItensvICMS: TStringField;
    cdsNfeItensmodBCST: TStringField;
    cdsNfeItenspMVAST: TStringField;
    cdsNfeItenspRedBCST: TStringField;
    cdsNfeItensvBCST: TStringField;
    cdsNfeItenspICMSST: TStringField;
    cdsNfeItensvICMSST: TStringField;
    cdsNfeItensUFST: TStringField;
    cdsNfeItenspBCOp: TStringField;
    cdsNfeItensvBCSTRet: TStringField;
    cdsNfeItensvICMSSTRet: TStringField;
    cdsNfeItenspCredSN: TStringField;
    cdsNfeItensvCredICMSSN: TStringField;
    cdsNfeItensvBCSTDest: TStringField;
    cdsNfeItensvICMSSTDest: TStringField;
    cds_DInDI: TStringField;
    cds_DInItem: TStringField;
    cds_DIdDI: TStringField;
    cds_DIxLocDesemb: TStringField;
    cds_DIUFDesemb: TStringField;
    cds_DIdDesemb: TStringField;
    cds_DIcExportador: TStringField;
    cds_aDInItem: TStringField;
    cds_aDInDI: TStringField;
    cds_aDInAdicao: TStringField;
    cds_aDInSeqAdicC: TStringField;
    cds_aDIcFabricante: TStringField;
    cds_aDIvDescDI: TStringField;
    cds_nfeDuplicatanDup: TStringField;
    cds_nfeDuplicatadVenc: TStringField;
    cds_NfeMednLote: TStringField;
    cds_NfeMedqLote: TStringField;
    cds_NfeMeddFab: TStringField;
    cds_NfeMeddVal: TStringField;
    cds_NfeMedvPMC: TStringField;
    cds_NfeArmatpArma: TStringField;
    cds_NfeArmanSerie: TStringField;
    cds_NfeArmanCano: TStringField;
    cds_NfeArmadescr: TStringField;
    cds_nfeReboqueplaca: TStringField;
    cds_nfeReboqueUF: TStringField;
    cds_nfeReboqueRNTC: TStringField;
    cds_nfeVolumesqVol: TStringField;
    cds_nfeVolumesesp: TStringField;
    cds_nfeVolumesmarca: TStringField;
    cds_nfeVolumesnVol: TStringField;
    cds_nfeVolumespesoL: TStringField;
    cds_nfeVolumespesoB: TStringField;
    cds_nfeLacrenLacre: TStringField;
    cds_nfeProcRefnProc: TStringField;
    cds_nfeProcRefindProc: TStringField;
    cds_CanaForDiadia: TStringField;
    cds_CanaForDiaqtde: TStringField;
    cds_CanaForDiaqTotMes: TStringField;
    cds_CanaForDiaqTotAnt: TStringField;
    cds_CanaForDiaqTotGer: TStringField;
    cds_nfeDeducxDed: TStringField;
    cds_nfeDeducvDed: TStringField;
    cds_ICMSTot: TClientDataSet;
    cds_ICMSTotvBC: TStringField;
    cds_ICMSTotvICMS: TStringField;
    cds_ICMSTotvBCST: TStringField;
    cds_ICMSTotvST: TStringField;
    cds_ICMSTotvProd: TStringField;
    cds_ICMSTotvFrete: TStringField;
    cds_ICMSTotvSeg: TStringField;
    cds_ICMSTotvDesc: TStringField;
    cds_ICMSTotvII: TStringField;
    cds_ICMSTotvIPI: TStringField;
    cds_ICMSTotvPIS: TStringField;
    cds_ICMSTotvCOFINS: TStringField;
    cds_ICMSTotvOutro: TStringField;
    cds_ICMSTotvNF: TStringField;
    cds_ISSQN: TClientDataSet;
    cds_transp: TClientDataSet;
    cds_transpmodFrete: TStringField;
    cds_transpCNPJ: TStringField;
    cds_transpCPF: TStringField;
    cds_transpxNome: TStringField;
    cds_transpIE: TStringField;
    cds_transpxEnder: TStringField;
    cds_transpxMun: TStringField;
    cds_transpUF: TStringField;
    cds_transpvServ: TStringField;
    cds_transpvBCRet: TStringField;
    cds_transppICMSRet: TStringField;
    cds_transpvICMSRet: TStringField;
    cds_transpCFOP: TStringField;
    cds_transpcMunFG: TStringField;
    cds_transpplaca: TStringField;
    cds_transpUF_v: TStringField;
    cds_transpRNTC: TStringField;
    cds_Cobranca: TClientDataSet;
    cds_CobrancanFat: TStringField;
    cds_nfeDuplicatanFat: TStringField;
    cds_CobrancavOrig: TStringField;
    cds_CobrancavDesc: TStringField;
    cds_CobrancavLiq: TStringField;
    cds_veicProd: TClientDataSet;
    cds_veicProdtpOp: TStringField;
    cds_veicProdnItem: TStringField;
    cds_veicProdchassi: TStringField;
    cds_veicProdcCor: TStringField;
    cds_veicProdxCor: TStringField;
    cds_veicProdpot: TStringField;
    cds_veicProdcilin: TStringField;
    cds_veicProdpesoL: TStringField;
    cds_veicProdpesoB: TStringField;
    cds_veicProdnSerie: TStringField;
    cds_veicProdtpComb: TStringField;
    cds_veicProdnMotor: TStringField;
    cds_veicProdCMT: TStringField;
    cds_veicProddist: TStringField;
    cds_veicProdanoMod: TStringField;
    cds_veicProdanoFab: TStringField;
    cds_veicProdtpPint: TStringField;
    cds_veicProdtpVeic: TStringField;
    cds_veicProdespVeic: TStringField;
    cds_veicProdVIN: TStringField;
    cds_veicProdcondVeic: TStringField;
    cds_veicProdcMod: TStringField;
    cds_veicProdcCorDENATRAN: TStringField;
    cds_veicProdlota: TStringField;
    cds_veicProdtpRest: TStringField;
    cds_NfeMednItem: TStringField;
    cds_NfeArmanItem: TStringField;
    cds_IPI: TClientDataSet;
    cds_IPIclEnq: TStringField;
    cds_IPInItem: TStringField;
    cds_IPICNPJProd: TStringField;
    cds_IPIcSelo: TStringField;
    cds_IPIqSelo: TStringField;
    cds_IPIcEnq: TStringField;
    cds_IPICST: TStringField;
    cds_IPIvBC: TStringField;
    cds_IPIpIPI: TStringField;
    cds_IPIqUnid: TStringField;
    cds_IPIvUnid: TStringField;
    cds_IPIvIPI: TStringField;
    cds_II: TClientDataSet;
    StringField17: TStringField;
    cds_IIvBC: TStringField;
    cds_IIvDespAdu: TStringField;
    cds_IIvII: TStringField;
    cds_IIvIOF: TStringField;
    cds_ISSQNnItem: TStringField;
    cds_ISSQNvBC: TStringField;
    cds_ISSQNvAliq: TStringField;
    cds_ISSQNvISSQN: TStringField;
    cds_ISSQNcMunFG: TStringField;
    cds_ISSQNcListServ: TStringField;
    cds_ISSQNcSitTrib: TStringField;
    cdsNfeItensinfAdProd: TStringField;
    cds_PIS: TClientDataSet;
    StringField18: TStringField;
    cds_PISCST: TStringField;
    cds_PISvBC: TStringField;
    cds_PISpPIS: TStringField;
    cds_PISvPIS: TStringField;
    cds_PISqBCProd: TStringField;
    cds_PISvAliqProd: TStringField;
    cds_COFINS: TClientDataSet;
    cds_COFINSnItem: TStringField;
    cds_COFINSCST: TStringField;
    cds_COFINSvBC: TStringField;
    cds_COFINSpCOFINS: TStringField;
    cds_COFINSvCOFINS: TStringField;
    cds_COFINSqBCProd: TStringField;
    cds_COFINSvAliqProd: TStringField;
    cds_ISSQNTot: TClientDataSet;
    cds_ISSQNTotvServ: TStringField;
    cds_ISSQNTotvBC: TStringField;
    cds_ISSQNTotvISS: TStringField;
    cds_ISSQNTotvCOFINS: TStringField;
    cds_ISSQNTotvRetPIS: TStringField;
    cds_ISSQNTotvRetCOFINS: TStringField;
    cds_ISSQNTotvRetCSLL: TStringField;
    cds_ISSQNTotvBCIRRF: TStringField;
    cds_ISSQNTotvIRRF: TStringField;
    cds_ISSQNTotvBCRetPrev: TStringField;
    cdsNfe_CabinfAdFisco: TWideStringField;
    cdsNfe_CabinfCpl: TWideStringField;
    cdsNfe_CabxCampo: TStringField;
    cdsNfe_CabxTexto: TStringField;
    cds_Exporta: TClientDataSet;
    cds_ExportaUFEmbarq: TStringField;
    cds_ExportaxLocEmbarq: TStringField;
    cds_compra: TClientDataSet;
    cds_compraxNEmp: TStringField;
    cds_compraxPed: TStringField;
    cds_compraxCont: TStringField;
    cds_CanaForDiasafra: TStringField;
    cds_CanaForDiaref: TStringField;
    cds_refNFPrefNFe: TStringField;
    cds_NFrefrefCTe: TStringField;
    cdsNfeItensID_ICMS: TStringField;
    cds_PISID_PIS: TStringField;
    cds_COFINSID_COFINS: TStringField;
    cds_ISSQNTotvRetPrev: TStringField;
    cds_nfeLacrenVol: TStringField;
    cds_CanaForDiavFor: TStringField;
    cds_CanaForDiavTotDed: TStringField;
    cds_CanaForDiavLiqFor: TStringField;
    cds_nfeDeducsafra: TStringField;
    cdsConfFLG_MODOIMP: TStringField;
    cdsConfFLG_MONITORA: TStringField;
    qryNFe_Log: TSQLQuery;
    cdsNFe_Log: TClientDataSet;
    dspNFe_Log: TDataSetProvider;
    dsNFe_Log: TDataSource;
    cdsNFe_LogDATA_HORA: TSQLTimeStampField;
    cdsNFe_LogDESC_EVENTO: TStringField;
    cdsNFe_LogID_LOG: TIntegerField;
    cdsNfeItensmotDesICMS: TStringField;
    qryNfe_Trans: TSQLQuery;
    cdsNfe_Trans: TClientDataSet;
    dpsNfe_Trans: TDataSetProvider;
    dsNfe_Trans: TDataSource;
    cdsConfFLG_SIMPLESN: TStringField;
    qryCancelNFe: TSQLQuery;
    dspCancelNFe: TDataSetProvider;
    dsCancelNFe: TDataSource;
    qryDPEC: TSQLQuery;
    cdsDPEC: TClientDataSet;
    dspDPEC: TDataSetProvider;
    dsDPEC: TDataSource;
    cdsCancelNFe: TClientDataSet;
    cdsCancelNFeDATA_HORA: TSQLTimeStampField;
    cdsCancelNFeDTA_AUTORIZACAO: TDateField;
    cdsCancelNFeNU_NFE: TIntegerField;
    cdsCancelNFePROTOCOLO_ENVIO: TStringField;
    cdsCancelNFeCHAVE_NFE: TStringField;
    cdsCancelNFeNOME_DEST: TStringField;
    cdsDPECID_NFE_DPEC: TIntegerField;
    cdsDPECNU_NFE: TStringField;
    cdsDPECCHAVE_NFE: TStringField;
    cdsDPECPROTOCOLO_DPEC: TStringField;
    cdsDPECMOTIVO_DPEC: TStringField;
    cdsDPECDPEC_XML: TMemoField;
    cdsDPECDTA_DPEC: TDateField;
    qryCCE: TSQLQuery;
    cdsCCE: TClientDataSet;
    dspCCE: TDataSetProvider;
    dsCCE: TDataSource;
    NfdNFECCe: TNfdNFECCe;
    cdsCCEIDLOTE: TLargeintField;
    cdsCCEVERSAO_L: TFMTBCDField;
    cdsCCEVERSAO_E: TFMTBCDField;
    cdsCCEID: TStringField;
    cdsCCECORGAO: TSmallintField;
    cdsCCETPAMB: TSmallintField;
    cdsCCECNPJ: TStringField;
    cdsCCECPF: TStringField;
    cdsCCECHNFE: TStringField;
    cdsCCEDHEVENTO: TDateField;
    cdsCCETPEVENTO: TStringField;
    cdsCCENSEQEVENTO: TSmallintField;
    cdsCCEVEREVENTO: TFMTBCDField;
    cdsCCEDESCEVENTO: TStringField;
    cdsCCEXCORRECAO: TStringField;
    NfdNFECancelamentoEvent1: TNfdNFECancelamentoEvent;
    cdsCancelNFeCPF_CNPJ: TStringField;
    cdsCCEXML_CCE: TMemoField;
    cdsNFe_LogNU_NF: TFMTBCDField;
    cdsNfeIImp: TClientDataSet;
    cdsNfeIImpnItem: TStringField;
    cdsNfeIImpID_ICMS: TStringField;
    cdsNfeIImpvTotTrib: TStringField;
    cds_ICMSTotvTotTrib: TStringField;
    qryInsert_nfe: TSQLQuery;
    qryUpdate_nfe: TSQLQuery;
    cdsNfeItensnItem: TIntegerField;
    cds_nfeDuplicatavDup: TStringField;
    cdsNfeItensnFCI: TStringField;
    nfdNFeTemplates21: TnfdNFeTemplates2;
    cdsConfHR_VERAO: TStringField;
    procedure cdsConfAfterInsert(DataSet: TDataSet);
    procedure cdsConf_ContAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsNFe_LogAfterInsert(DataSet: TDataSet);
    procedure cdsDPECAfterInsert(DataSet: TDataSet);
    procedure cdsCCEAfterInsert(DataSet: TDataSet);
    procedure cdsNfe_TransPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
   cdsDuplic : TClientDataSet;
   function CarregaConfNfe : Boolean;
   function CarregaWService(UF : String ) : Boolean;
   Procedure ClearCdsNfe;
   procedure CriacdsDuplic;
  end;

var
  dm_nfe: Tdm_nfe;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uDm_Princial, uPrincipal, uFuncoes, uGlobalVar, uDM_Emitente;

{$R *.dfm}

function Tdm_nfe.CarregaConfNfe: Boolean;
var
   sDir,
   sDirAux : String;
begin
  Result := False;
  try
    sDir := GetCurrentDir;
    SetCurrentDir(sDir);
    sDirAux := ExtractFilePath(ParamStr(0));

    cdsConf.Close;
    cdsConf.Open;
    if not cdsConf.IsEmpty then begin
      // Carrega variável com o diretério de monitoração dos arquivos txt da nfe
      vvDirTxt := cdsConf.FieldByName('DIR_TXTNFE').AsString;
      // CARREGA CONFIGURAÇÕES DO COMPONENTE DA NF-e
      vvTpAmbiente := cdsConf.FieldByName('FLG_AMBIENTE').AsString;
      case vvTpAmbiente[1] of
        'P' : nfdNFe2.Ambiente := taProducao;
        'H' : nfdNFe2.Ambiente := taHomologacao;
      end;

      nfdNFe2.DiretorioExportacao := cdsConf.FieldByName('DIR_EXPORTACAO').AsString;
      vvDirExport := cdsConf.FieldByName('DIR_EXPORTACAO').AsString;
      nfdNFe2.DiretorioLog        := cdsConf.FieldByName('DIR_LOG').AsString;

      if not FileExists(sDirAux + 'logo.bmp') then begin
        cdsConfIMG_LOGO.SaveToFile(sDirAux + 'logo.bmp');
        nfdNFe2.LogotipoEmitente := sDirAux + 'logo.bmp';
      end else
        nfdNFe2.LogotipoEmitente := sDirAux + 'logo.bmp';

      nfdNFe2.NomeCertificado.Text := cdsConf.FieldByName('NOME_CERTIFICADO').AsString;

      nfdNFe2.Proxy := cdsConf.FieldByName('PROXY').AsString;
      nfdNFe2.Proxy_Usuario := cdsConf.FieldByName('PROXY_USER').AsString;
      nfdNFe2.Proxy_Senha   := cdsConf.FieldByName('PROXY_SENHA').AsString;

      if cdsConf.FieldByName('TIPO_CERTIFICADO').AsString = 'A1' then
        nfdNFe2.TipoCertificado := ckA1
      else if cdsConf.FieldByName('TIPO_CERTIFICADO').AsString = 'A3' then
        nfdNFe2.TipoCertificado := ckA3;

      nfdNFe2.SimplesNacional := cdsConf.FieldByName('FLG_SIMPLESN').AsString = 'S';

      vvValida := cdsConf.FieldByName('FLG_VALIDA').AsString = 'S';
      vvDirShema := GetCurrentDir + '\Shemas\';
      //*** configurações para impressão
      vvTP_IMPR := cdsConf.FieldByName('FLG_TP_IMP').AsString;
      vvFLG_IMPR := cdsConf.FieldByName('FLG_IMPRIME').AsString;
      vvQtde_Impr := cdsConf.FieldByName('QTDE_IMP').AsInteger;
      vvImprPadrao := cdsConf.FieldByName('IMP_PADRAO').AsString;
      vvMODOIMP := cdsConf.FieldByName('FLG_MODOIMP').AsString;
      vvHVerao := cdsConf.FieldByName('HR_VERAO').AsString = 'S';
      //**
      // carrega as URL dos WebServices da Sefaz da UF informada
      nfdNFe2.UF := vvUf;
      CarregaWService(vvUf);
      //
      vvDirProcessado := GetCurrentDir + '\Processados';
      if not DirectoryExists(vvDirProcessado) then
        CreateDir(vvDirProcessado);
      vvDirRejeitado := GetCurrentDir + '\Rejeitados';
      if not DirectoryExists(vvDirRejeitado) then
        CreateDir(vvDirRejeitado);
      vvDirComErro := GetCurrentDir + '\ComErro';
      if not DirectoryExists(vvDirComErro) then
        CreateDir(vvDirComErro);
      vvDirTmp := GetCurrentDir + '\Tmp';
      if not DirectoryExists(vvDirTmp) then
        CreateDir(vvDirTmp);
      //
      Result := True;
    end;
  except
    On E : Exception do begin
      GeraEvento('Erro ao carregar as configurações da nfdNFe - ' + E.Message);
      if vvTrayAtivado then
        ExibeMsgTray('Erro ao carregar as configurações da nfdNFe - ' + E.Message,2)
      else
        raise Exception.Create('Erro ao carregar as configurações da nfdNFe'+ #13 + E.Message);
      cdsConf.Close;
      vvConfigurado := Result;
    end;
  end;
  cdsConf.Close;
  cdsConf.Open;
  vvConfigurado := Result;
end;

function Tdm_nfe.CarregaWService(UF : String): Boolean;
begin
  Result := False;
  dm_Princial.cdsGeral.Close;
  dm_Princial.cdsGeral.CommandText := ' SELECT ' +
                                      ' CAD_CONSULTA, '+
                                      ' NFE_CANCELAMENTO, '+
                                      ' NFE_CONSULTA, '+
                                      ' NFE_INUTILIZA, '+
                                      ' NFE_RECEPCAO, '+
                                      ' NFE_RETRECEPCAO, '+
                                      ' NFE_STATUS_SERVICO, '+
                                      ' NFE_RECEPCAOEVENTO '+
                                      ' FROM '+
                                      '  TB_NFE_SERVIDOR '+
                                      ' WHERE UF = :UF '+
                                      ' AND FLG_AMBIENTE = :AMBIENTE ';
  dm_Princial.cdsGeral.Params.ParamByName('UF').AsString := UF;
  dm_Princial.cdsGeral.Params.ParamByName('AMBIENTE').AsString := vvTpAmbiente;
  dm_Princial.cdsGeral.Open;
  if not dm_Princial.cdsGeral.IsEmpty then begin
    Result := True;
    case vvTpAmbiente[1] of
      'P' : begin
              nfdNFeServidores2.WS_Producao.NfeStatusServico := dm_Princial.cdsGeral.FieldByName('NFE_STATUS_SERVICO').AsString;
              nfdNFeServidores2.WS_Producao.NfeCancelamento  := dm_Princial.cdsGeral.FieldByName('NFE_RECEPCAOEVENTO').AsString;
              nfdNFeServidores2.WS_Producao.NfeConsulta      := dm_Princial.cdsGeral.FieldByName('NFE_CONSULTA').AsString;
              nfdNFeServidores2.WS_Producao.NfeInutilizacao  := dm_Princial.cdsGeral.FieldByName('NFE_INUTILIZA').AsString;
              nfdNFeServidores2.WS_Producao.NfeRecepcao      := dm_Princial.cdsGeral.FieldByName('NFE_RECEPCAO').AsString;
              nfdNFeServidores2.WS_Producao.NfeRetRecepcao   := dm_Princial.cdsGeral.FieldByName('NFE_RETRECEPCAO').AsString;
              nfdNFeServidores2.WS_Producao.CadConsulta      := dm_Princial.cdsGeral.FieldByName('CAD_CONSULTA').AsString;
              nfdNFeServidores2.WS_Producao.CCe              := dm_Princial.cdsGeral.FieldByName('NFE_RECEPCAOEVENTO').AsString;
            end;
      'H' : begin
              nfdNFeServidores2.WS_Homologacao.NfeStatusServico := dm_Princial.cdsGeral.FieldByName('NFE_STATUS_SERVICO').AsString;
              nfdNFeServidores2.WS_Homologacao.NfeCancelamento  := dm_Princial.cdsGeral.FieldByName('NFE_RECEPCAOEVENTO').AsString;
              nfdNFeServidores2.WS_Homologacao.NfeConsulta      := dm_Princial.cdsGeral.FieldByName('NFE_CONSULTA').AsString;
              nfdNFeServidores2.WS_Homologacao.NfeInutilizacao  := dm_Princial.cdsGeral.FieldByName('NFE_INUTILIZA').AsString;
              nfdNFeServidores2.WS_Homologacao.NfeRecepcao      := dm_Princial.cdsGeral.FieldByName('NFE_RECEPCAO').AsString;
              nfdNFeServidores2.WS_Homologacao.NfeRetRecepcao   := dm_Princial.cdsGeral.FieldByName('NFE_RETRECEPCAO').AsString;
              nfdNFeServidores2.WS_Homologacao.CadConsulta      := dm_Princial.cdsGeral.FieldByName('CAD_CONSULTA').AsString;
              nfdNFeServidores2.WS_Homologacao.CCe              := dm_Princial.cdsGeral.FieldByName('NFE_RECEPCAOEVENTO').AsString;
            end;
    end;
  end;

end;

procedure Tdm_nfe.cdsCCEAfterInsert(DataSet: TDataSet);
begin
  //DataSet.FieldByName('IDLOTE').Value := GetAutoNum('TB_NFE_CCE','IDLOTE');
end;

procedure Tdm_nfe.cdsConfAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_NFE_CONF').Value := GetAutoNum('TB_NFE_CONF','ID_NFE_CONF');
end;

procedure Tdm_nfe.cdsConf_ContAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_CONTINGENCIA').Value := GetAutoNum('TB_NFE_CONTINGENCIA','ID_CONTINGENCIA');
end;

procedure Tdm_nfe.cdsDPECAfterInsert(DataSet: TDataSet);
begin
 DataSet.FieldByName('ID_NFE_DPEC').Value := GetAutoNum('TB_NFE_DPEC','ID_NFE_DPEC');
end;

procedure Tdm_nfe.cdsNFe_LogAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_LOG').Value := GetAutoNum('TB_NFE_LOG','ID_LOG');
end;

procedure Tdm_nfe.cdsNfe_TransPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  msgWarning(e.Message);
end;

procedure Tdm_nfe.ClearCdsNfe;
var
   I : Integer;
begin
  for I := 0 to ComponentCount -1 do begin
    if Components[I] is TClientDataSet then begin
      if TClientDataSet(Components[I]).ProviderName = EmptyStr then begin
        if TClientDataSet(Components[I]).Active then begin
          TClientDataSet(Components[I]).First;
          while not TClientDataSet(Components[I]).Eof do begin
            TClientDataSet(Components[I]).Delete;
            TClientDataSet(Components[I]).Next;
          end;
        end;
        TClientDataSet(Components[I]).Close;
      end;
    end;
  end;
end;

procedure Tdm_nfe.CriacdsDuplic;
begin
  if cdsDuplic <> nil then
    FreeAndNil(cdsDuplic);
  cdsDuplic := TClientDataSet.Create(Self);
  cdsDuplic.Close;
  cdsDuplic.FieldDefs.Clear;
  cdsDuplic.FieldDefs.Add('nFat',ftString,60);
  cdsDuplic.FieldDefs.Add('nDup',ftString,60);
  cdsDuplic.FieldDefs.Add('dVenc',ftString,60);
  cdsDuplic.FieldDefs.Add('vDup',ftString,60);
  cdsDuplic.CreateDataSet;
end;

procedure Tdm_nfe.DataModuleCreate(Sender: TObject);
begin
  CarregaConfNfe;
end;

end.
