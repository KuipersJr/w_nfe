{
 unit aonde sera declaradas as Variáveis globais;
}
unit uGlobalVar;

interface

uses System.SysUtils, Data.DB;

var
  sJustificaDPEC,
  sdhCont : string;
  vvAutorizado,
  vvTrayAtivado : Boolean;
  vvModal : Integer;
  vvNomeImpr,
  vvDirTxt,
  vvTpAmbiente,
  vvDirLog,
  vvUf : String;
  vvContingencia,
  vvSimples : Boolean;
// Variáveis para configuração do envio da nfe por email
  vvServSMTP,
  vvEmailR,
  vvUsuario,
  vvAssunto,
  vvSenha,
  vvMsgEmail,
  vvEmailDest,
  vvFileXml,
  vvFilePdf : String;
  vvSSI,
  vvSSL,
  vvPdf,
  vvEnvioAuto,
  vvEnviou : Boolean;
  vvPorta : Integer;
//**
// Variáveis para configuração de impressão
  vvTP_IMPR : String;
  vvIMPR : Boolean;
  vvQtde_Impr : SmallInt;
  vvImprPadrao,
  vvMODOIMP : String;
//**
// Variáveis para configuração da excução de backup
  vvDirBkp,
  vvPeriodo,
  vvDiaBkp,
  vvHoraBkp : String;
//**
// variávies utilizada na transmição da nfe e retorno do status de processamento na sefaz
  sXMLProtocolado : WideString;
  vNFeXML,
  vvNFE_XML,
  vvXML_Canc,
  vvDPEC_XML,
  vvXML_PROTOCOLO,
  vvXML_PROT_AUTO : WideString;
  vvnRecibo,
  vvCHAVE_NFE,
  vvNU_NFE,
  vvSERIE,
  vvCPF_CNPJ,
  vvNOME_DEST,
  vvFLG_IMPR,
  vvImprimiu,
  vvFLG_AUTORIZADA,
  vvCOD_SITUACAO,
  vvPROTOCOLO_ENVIO,
  vvPROTOCOLO_CANCEL,
  vvNRegDPEC,
  vv_TP_TRANS,
  vvDirShema,
  vvDirProcessado,
  vvDirRejeitado,
  vvDirComErro,
  vvDirTmp : String;
  vvTrans,
  vvValida : Boolean;
  vvDtaEmissao,
  vvDtaAutoriza,
  vvDtaCancela,
  vvDtaDPEC : TDate;
  vvHoraAut : TTime;
 // variáveis para transmição da carta de correção
  vvIDLOTE,
  vvVERSAO_L,
  vvVERSAO_E,
  vvID,
  vvCORGAO,
  vvTPAMB,
  vvCNPJ,
  vvCPF,
  vvDHEVENTO,
  vvTPEVENTO,
  vvNSEQEVENTO,
  vvVEREVENTO,
  vvDESCEVENTO,
  vvXCORRECAO,
  vvCONDUSO : String;
  XML_CCEProt,
  vvXML_CancProt : String;
  XML_CCE : WideString;
//--------------------------------------------
  pathDB,
  vvDirExport : String;
//--------------------------------------------
  vvConfigurado : Boolean;
  vvStatusServ : Boolean;
  vvHVerao : Boolean;
//----------------------------------------------
  vvTmpMed : Integer;
const
  INI_NFeConf = 'nfeConfig.ini';
  INI_WCHI_CONF = 'whcinfe.conf';
  vvTipoImpr = 'P';   //P = Produto. S= Serviço.
  vvDirAuto = 'Autorizadas';
  vvDirCanc = 'Canceladas';
  vvDirPrtAuto = 'ProtAuto';
  vvDirPrtCanc = 'ProtCanc';
  vvDirInutiliza = 'Inutilizada';

implementation

end.
