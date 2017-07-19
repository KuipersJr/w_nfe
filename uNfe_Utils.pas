{
 Uit de funções de tratamento para emissão e processos relativos a NF-e
}
unit uNfe_Utils;

interface

uses uDm_nfe, nfdNFe2,SysUtils, Data.DB, Datasnap.DBClient, System.Math, System.IniFiles,Vcl.Forms,Vcl.StdCtrls,
     Vcl.Controls, nfdNFeDataSets2, System.Classes, Datasnap.Midas, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, MSXML2_TLB, System.Variants, Winapi.Windows, Vcl.Dialogs, Data.SqlExpr,System.DateUtils;
// Função que retorna o código, do retorno, da solicitação, enviada para o servidor da sefaz
function GetCodMsgStatus(sXML : WideString ) : Integer;
// Função que retorna uma mensagem cadastrada no bando de dados referente ao retorno da solicitação enviada para a sefaz
function GetMsgSolicitacao(cod_mdg : Integer; cdsConsulta : TClientDataSet ) : String;
// Função que envia a uma solicitação para verificar se o emissor esta autorizado a emitir NF-e
function GetAutorizacao(UF,IE,CNPJ : String) : Integer;
function PreencheDadosNfe(sDirFiles : String) : Boolean;
function TransmiteNfe : Boolean;
function VerificaStatusServ : Integer;
procedure ResetDataSetNfe;
function ObterNotaID(const aXml: WideString): string;
function ObterNroRecibo(const aXml: WideString): string;
function ObterNroProtocolo(const aXml: WideString): string;
function ObterNroDPEC(const aXml: WideString): string;
function ObterData(const aXml: String): string;
function ObterDataDPEC(const aXml: WideString): string;
function ValidaXML(XML: AnsiString; out sMsg: AnsiString; Const APathSchemas: String = ''): Boolean;
procedure GravaTransNfe; // grava dados da nfe
procedure GravaNFeCanc;
function formataDtaFb(sDta : String) : TDateTime;
procedure CancelaNFe(idNFe,nProtocolo,Justificativa: String);
procedure GravaDPEC;
function RetXMLNFeDPEC(wXML,nDPEC : WideString) : WideString;
procedure TransNFePendente;
procedure TransCCe;
procedure GravaCCe;
procedure StartDataSetNfe;
function TemProtocolo : Boolean;
function NewName(strName : String ) : String;
procedure GetTempMed;
function GetTempoMedWs(sXML : WideString) : Integer;
procedure GravaProtocolo(sXML : WideString); // grava dados do protocolo de autorização da emissão da nfe
implementation

uses uGlobalVar, uFuncoes, uPrincipal, uDm_Princial;

var
  stEmail : TStringList;

const
  StrAmbiente: array[TTipoAmbiente] of string = ('2', '1');

function GetAutorizacao(UF,IE,CNPJ : String) : Integer;
var
  sXML : WideString;
begin
  with dm_nfe do begin
    sXML := nfdNFe2.ConsultarCadastro(UF,IE,CNPJ,'');
    Result := GetCodMsgStatus(sXML);
  end;
end;

function GetMsgSolicitacao(cod_mdg : Integer; cdsConsulta : TClientDataSet ) : String;
begin
  cdsConsulta.Close;
  cdsConsulta.CommandText := ' SELECT (COD_MSG || '' - '' || MSG) MSG ' +
                             ' FROM TB_NFE_MSG '+
                             ' WHERE COD_MSG = :COD_MSG';
  cdsConsulta.Params.ParamByName('COD_MSG').AsInteger := cod_mdg;
  cdsConsulta.Open;
  if not cdsConsulta.IsEmpty then
    Result := cdsConsulta.FieldByName('MSG').AsString;
  cdsConsulta.Close;
end;

function GetCodMsgStatus(sXML : WideString ) : Integer;
var
  auxXml : WideString;
begin
  if EmptyWideStr <> sXML then begin
    auxXml := sXML;
  // montar rotina para obter os xml do protocolo
    if Pos(WideString('<protNFe'),sXML) > 0 then
      auxXml := Copy(sXML, (Pos(WideString('<infProt>'), sXML)+9), (Pos(WideString('</infProt>'), sXML)) - Pos(WideString('<infProt>'), sXML)-9);
    if Pos(WideString('<retEvento'),sXML) > 0 then
      auxXml := Copy(sXML, (Pos(WideString('<retEvento '), sXML)+25), (Pos(WideString('</retEvento>'), sXML)) - Pos(WideString('<retEvento>'), sXML)-11);
    Result := StrToIntDef(Copy(auxXml, (Pos(WideString('<cStat>'), auxXml)+7), (Pos(WideString('</cStat>'), auxXml)) - Pos(WideString('<cStat>'), auxXml)-7),-1);
  end;
end;

function PreencheDadosNfe(sDirFiles : String) : Boolean;
//****
  procedure Preenchelista(var sList : TStringList; sTr : String);
  var
      strAux : String;
      RecCount : Integer;
  begin
    sList.Clear;
    strAux     := StringReplace(sTr,'|','|#', [rfReplaceAll, rfIgnoreCase]);
    RecCount   := ExtractStrings(['|'],[' '],PChar(strAux),sList);
    sList.Text := StringReplace(sList.Text,'#','', [rfReplaceAll, rfIgnoreCase]);
    sList.Delete(0);
//    sList.Delete(sList.Count-1);
  end;

var
  Busca : TSearchRec;
  Conta,
  I, J, X : Integer;
  LstTxtNFe,
  ArqTxtNFe,
  LstDados : TStringList;
  nItem,
  oItem,
  nDI,
  nFatura,
  refNFe,
  sSafra : String;
  iCodStatus : Integer;
begin

 if not VerificaInternet then begin
   StatusMsg('Computador sem conexção com internet. Impossivel continuar transmisão',3);
   Application.ProcessMessages;
  if vvTrayAtivado then
    ExibeMsgTray('Computador sem conexção com internet. Impossivel continuar transmisão',1);
   GeraEvento('Computador sem conexção com internet. Impossivel continuar transmisão');
   Exit;
 end;

  // essa parte da função lista os arquivos contidos no diretório escolhido na configuração para repositório de txt
 try
   if vvTrayAtivado then
    ExibeMsgTray('Verificando arquivos NF-e.txt',1);
   //GeraEvento('Verificando arquivos NF-e.txt');
   StatusMsg('Verificando arquivos NF-e.txt',0);

    ArqTxtNFe := TStringList.Create;
    ArqTxtNFe := TStringList.Create;
    LstDados  := TStringList.Create;
    LstTxtNFe := TStringList.Create;
    //------------------------------
    //ResetDataSetNfe;
    //StarDataSetNfe;
    //-----------------------------
    Conta := FindFirst(sDirFiles + '\*.txt',faAnyFile,Busca);
    while Conta = 0 do begin
      if Busca.Attr <> faDirectory then
        LstTxtNFe.Add(Busca.Name);
      Conta := FindNext(Busca);
    end;
    if LstTxtNFe.Count <= 0 then begin
      if vvTrayAtivado then
        ExibeMsgTray('Não há arquivos NF-e.txt para transmissão',1);
      //GeraEvento('Não arquivos NF-e.txt para transmição');
      StatusMsg('Não há arquivos NF-e.txt para transmissão',0);
    end;
    SysUtils.FindClose(Busca);
  // le os arquivos e carrega os dados para envio da nfe
    for I := 0 to LstTxtNFe.Count -1 do begin
      if FileExists(sDirFiles + '\' + LstTxtNFe.Strings[I]) then begin
         ArqTxtNFe.LoadFromFile(sDirFiles + '\' + LstTxtNFe.Strings[I]);
         nItem := EmptyStr;
         ResetDataSetNfe;
         StartDataSetNfe;
         for J := 0 to ArqTxtNFe.Count -1 do begin
           if not dm_nfe.cdsNfe_Cab.Active then
             dm_nfe.cdsNfe_Cab.CreateDataSet;
           if dm_nfe.cdsNfe_Cab.State = dsBrowse then
             if dm_nfe.cdsNfe_Cab.IsEmpty then
               dm_nfe.cdsNfe_Cab.Append
             else
               dm_nfe.cdsNfe_Cab.Edit;
           if Copy(ArqTxtNFe.Strings[J],1,1) = 'B' then begin
             // Grupo das informações de identificação da NF-e
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfe_Cab.FieldByName('cUF').Value    := LstDados.Strings[00];
             dm_nfe.cdsNfe_Cab.FieldByName('cNF').Value    := EmptyStr; //Random(99999999);
             dm_nfe.cdsNfe_Cab.FieldByName('natOp').Value  := LstDados.Strings[02];
             dm_nfe.cdsNfe_Cab.FieldByName('indPag').Value := LstDados.Strings[03];
             dm_nfe.cdsNfe_Cab.FieldByName('mod').Value    := LstDados.Strings[04];
             dm_nfe.cdsNfe_Cab.FieldByName('serie').Value  := LstDados.Strings[05];
             dm_nfe.cdsNfe_Cab.FieldByName('nNF').Value    := LstDados.Strings[06];
             dm_nfe.cdsNfe_Cab.FieldByName('dEmi').Value   := LstDados.Strings[07];
             dm_nfe.cdsNfe_Cab.FieldByName('dSaiEnt').Value := LstDados.Strings[08];
             dm_nfe.cdsNfe_Cab.FieldByName('hSaiEnt').Value := LstDados.Strings[09];
             dm_nfe.cdsNfe_Cab.FieldByName('tpNF').Value := LstDados.Strings[10];
             dm_nfe.cdsNfe_Cab.FieldByName('cMunFG').Value  := LstDados.Strings[11];
             dm_nfe.cdsNfe_Cab.FieldByName('tpImp').Value   := iff(vvMODOIMP <> '',iff(vvMODOIMP = 'R','1',iff(vvMODOIMP = 'P','2',LstDados.Strings[12])),LstDados.Strings[12]);
             dm_nfe.cdsNfe_Cab.FieldByName('tpEmis').Value  := LstDados.Strings[13];
             dm_nfe.cdsNfe_Cab.FieldByName('cDV').Value     := LstDados.Strings[14];
             dm_nfe.cdsNfe_Cab.FieldByName('tpAmb').Value   := StrAmbiente[dm_nfe.nfdNFe2.Ambiente]; //LstDados.Strings[15];
             dm_nfe.cdsNfe_Cab.FieldByName('finNFe').Value  := LstDados.Strings[16];
             dm_nfe.cdsNfe_Cab.FieldByName('procEmi').Value := LstDados.Strings[17];
             dm_nfe.cdsNfe_Cab.FieldByName('verProc').Value := LstDados.Strings[18];
             // campo serão usados quando entar em contingência
             //NFeDataSet.Campo('dhCont_B28').Value;
             //NFeDataSet.Campo('xJust_B29').Value;
           end;
            refNFe := EmptyStr;
            // Grupo de informação das NF/NF-e referenciadas
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B13' then begin
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             refNFe := LstDados.Strings[0];
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B14' then begin
             // Grupo de informação da NF modelo 1/1A referenciada
             if not dm_nfe.cds_NFref.Locate('refNFe',refNFe,[]) then
               InsDadosCds(dm_nfe.cds_NFref)
             else
               EditaDadosCds(dm_nfe.cds_NFref);
             dm_nfe.cds_NFref.FieldByName('refNFe').Value := refNFe;
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_NFref.FieldByName('AAMM').Value  := LstDados.Strings[00];
             dm_nfe.cds_NFref.FieldByName('CNPJ').Value  := LstDados.Strings[01];
             dm_nfe.cds_NFref.FieldByName('mod').Value   := LstDados.Strings[02];
             dm_nfe.cds_NFref.FieldByName('serie').Value := LstDados.Strings[03];
             dm_nfe.cds_NFref.FieldByName('nNF').Value := LstDados.Strings[04];
             GravaDadosCds(dm_nfe.cds_NFref);
           end;
           if (Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20a') and
              (Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20d') and
              (Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20e') and
              (Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20i') then begin
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20a' then begin
               // Grupo de informações da NF de produtor rural referenciada
               if not dm_nfe.cds_refNFP.Locate('refNFe',refNFe,[]) then
                 InsDadosCds(dm_nfe.cds_refNFP)
               else
                 EditaDadosCds(dm_nfe.cds_refNFP);
               dm_nfe.cds_refNFP.FieldByName('refNFe').Value := refNFe;
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_refNFP.FieldByName('cUF').Value  := LstDados.Strings[00];
               dm_nfe.cds_refNFP.FieldByName('AAMM').Value := LstDados.Strings[01];
               dm_nfe.cds_refNFP.FieldByName('IE').Value  := LstDados.Strings[02];
               dm_nfe.cds_refNFP.FieldByName('mod').Value := LstDados.Strings[03];
               dm_nfe.cds_refNFP.FieldByName('serie').Value := LstDados.Strings[04];
               dm_nfe.cds_refNFP.FieldByName('nNF').Value   := LstDados.Strings[05];
               GravaDadosCds(dm_nfe.cds_refNFP);
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20d' then begin
               if not dm_nfe.cds_refNFP.Locate('refNFe',refNFe,[]) then
                 InsDadosCds(dm_nfe.cds_refNFP)
               else
                 EditaDadosCds(dm_nfe.cds_refNFP);
               dm_nfe.cds_refNFP.FieldByName('refNFe').Value := refNFe;
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_refNFP.FieldByName('CNPJ').Value := LstDados.Strings[00];
               GravaDadosCds(dm_nfe.cds_refNFP);
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20e' then begin
               if not dm_nfe.cds_refNFP.Locate('refNFe',refNFe,[]) then
                 InsDadosCds(dm_nfe.cds_refNFP)
               else
                 EditaDadosCds(dm_nfe.cds_refNFP);
               dm_nfe.cds_refNFP.FieldByName('refNFe').Value := refNFe;
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_refNFP.FieldByName('CPF').Value := LstDados.Strings[00];
               GravaDadosCds(dm_nfe.cds_refNFP);
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'B20i' then begin
               if not dm_nfe.cds_refNFP.Locate('refNFe',refNFe,[]) then
                 InsDadosCds(dm_nfe.cds_refNFP)
               else
                 EditaDadosCds(dm_nfe.cds_refNFP);
               dm_nfe.cds_refNFP.FieldByName('refNFe').Value := refNFe;
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_refNFP.FieldByName('refCTe').Value := LstDados.Strings[00];
               GravaDadosCds(dm_nfe.cds_NFref);
             end;
           end;
           //****

           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'C') then begin
             // Identificação do Emitente da Nota Fiscal eletrônica
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'C' then begin
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('xNome').Value := LstDados.Strings[00];
                 dm_nfe.cdsNfe_Cab.FieldByName('xFant').Value := LstDados.Strings[01];
                 dm_nfe.cdsNfe_Cab.FieldByName('IE').Value    := LstDados.Strings[02];
                 dm_nfe.cdsNfe_Cab.FieldByName('IEST').Value := LstDados.Strings[03];
                 dm_nfe.cdsNfe_Cab.FieldByName('IM').Value   := LstDados.Strings[04];
                 dm_nfe.cdsNfe_Cab.FieldByName('CNAE').Value := LstDados.Strings[05];
                 dm_nfe.cdsNfe_Cab.FieldByName('CRT').Value  := LstDados.Strings[06];
                 dm_nfe.nfdNFe2.SimplesNacional := (dm_nfe.cdsNfe_Cab.FieldByName('CRT').AsInteger in [1,2]);
               end;
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'C02' then begin
               // Grupo de identificação do emitente da NF-e
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('CNPJ').Value := LstDados.Strings[00];
               end;
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'C02a' then begin
               // Grupo de identificação do emitente da NF-e
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('CPF').Value := LstDados.Strings[00];
               end;
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'C05' then begin
               // Grupo do Endereço do emitente
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('xLgr').Value := LstDados.Strings[00];
                 dm_nfe.cdsNfe_Cab.FieldByName('nro').Value  := LstDados.Strings[01];
                 dm_nfe.cdsNfe_Cab.FieldByName('xCpl').Value := LstDados.Strings[02];
                 dm_nfe.cdsNfe_Cab.FieldByName('xBairro').Value := LstDados.Strings[03];
                 dm_nfe.cdsNfe_Cab.FieldByName('cMun').Value := LstDados.Strings[04];
                 dm_nfe.cdsNfe_Cab.FieldByName('xMun').Value := LstDados.Strings[05];
                 dm_nfe.cdsNfe_Cab.FieldByName('UF').Value := LstDados.Strings[06];
                 dm_nfe.cdsNfe_Cab.FieldByName('CEP').Value := LstDados.Strings[07];
                 dm_nfe.cdsNfe_Cab.FieldByName('cPais').Value := LstDados.Strings[08];
                 dm_nfe.cdsNfe_Cab.FieldByName('xPais').Value := LstDados.Strings[09];
                 dm_nfe.cdsNfe_Cab.FieldByName('fone').Value := LstDados.Strings[10];
               end;
             end;
           end;
           //****
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'E') then begin
             // Grupo de identificação do Destinatário da NF-e
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'E' then begin
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('xNome_d').Value := LstDados.Strings[00];
                 dm_nfe.cdsNfe_Cab.FieldByName('IE_d').Value := LstDados.Strings[01];
                 dm_nfe.cdsNfe_Cab.FieldByName('ISUF').Value := LstDados.Strings[02];
                 dm_nfe.cdsNfe_Cab.FieldByName('email_d').Value := LstDados.Strings[03];
               end;
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'E02' then begin
               // Grupo de identificação do Destinatário da NF-e
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('CNPJ_d').Value := LstDados.Strings[00];
               end;
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'E03' then begin
               // Grupo de identificação do Destinatário da NF-e
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('CPF_d').Value := LstDados.Strings[00];
               end;
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'E05' then begin
               // Grupo de endereço do Destinatário da NF-e
               if (dm_nfe.cdsNfe_Cab.State in [dsInsert,dsEdit]) then begin
                 Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
                 dm_nfe.cdsNfe_Cab.FieldByName('xLgr_d').Value := LstDados.Strings[00];
                 dm_nfe.cdsNfe_Cab.FieldByName('nro_d').Value := LstDados.Strings[01];
                 dm_nfe.cdsNfe_Cab.FieldByName('xCpl_d').Value := LstDados.Strings[02];
                 dm_nfe.cdsNfe_Cab.FieldByName('xBairro_d').Value := LstDados.Strings[03];
                 dm_nfe.cdsNfe_Cab.FieldByName('cMun_d').Value := LstDados.Strings[04];
                 dm_nfe.cdsNfe_Cab.FieldByName('xMun_d').Value := LstDados.Strings[05];
                 dm_nfe.cdsNfe_Cab.FieldByName('UF_d').Value := LstDados.Strings[06];
                 dm_nfe.cdsNfe_Cab.FieldByName('CEP_d').Value := LstDados.Strings[07];
                 dm_nfe.cdsNfe_Cab.FieldByName('cPais_d').Value := LstDados.Strings[08];
                 dm_nfe.cdsNfe_Cab.FieldByName('xPais_d').Value := LstDados.Strings[09];
                 dm_nfe.cdsNfe_Cab.FieldByName('fone_d').Value := LstDados.Strings[10];
               end;
             end;
           end;
           //****
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'F') then begin
            // Grupo de identificação do Local de retirada
             if dm_nfe.cds_L_Retirada.RecordCount > 0 then
               InsDadosCds(dm_nfe.cds_L_Retirada)
             else
               EditaDadosCds(dm_nfe.cds_L_Retirada);
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'F' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_L_Retirada.FieldByName('xLgr').Value := LstDados.Strings[01];
               dm_nfe.cds_L_Retirada.FieldByName('nro').Value  := LstDados.Strings[02];
               dm_nfe.cds_L_Retirada.FieldByName('xCpl').Value := LstDados.Strings[03];
               dm_nfe.cds_L_Retirada.FieldByName('xBairro').Value := LstDados.Strings[04];
               dm_nfe.cds_L_Retirada.FieldByName('cMun').Value := LstDados.Strings[05];
               dm_nfe.cds_L_Retirada.FieldByName('xMun').Value := LstDados.Strings[06];
               dm_nfe.cds_L_Retirada.FieldByName('UF').Value   := LstDados.Strings[07];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'F02' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_L_Retirada.FieldByName('CNPJ_F02').Value := LstDados.Strings[00];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'F02a' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_L_Retirada.FieldByName('CPF_F02a').Value := LstDados.Strings[00];
             end;
             GravaDadosCds(dm_nfe.cds_L_Retirada);
           end;
           //****
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'G') then begin
             // Grupo de identificação do Local de entrega
             if dm_nfe.cds_L_Entrega.RecordCount > 0 then
               InsDadosCds(dm_nfe.cds_L_Entrega)
             else
               EditaDadosCds(dm_nfe.cds_L_Entrega);
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'G' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_L_Entrega.FieldByName('xLgr').Value := LstDados.Strings[01];
               dm_nfe.cds_L_Entrega.FieldByName('nro').Value := LstDados.Strings[02];
               dm_nfe.cds_L_Entrega.FieldByName('xCpl').Value := LstDados.Strings[03];
               dm_nfe.cds_L_Entrega.FieldByName('xBairro').Value := LstDados.Strings[04];
               dm_nfe.cds_L_Entrega.FieldByName('cMun').Value := LstDados.Strings[05];
               dm_nfe.cds_L_Entrega.FieldByName('xMun').Value := LstDados.Strings[06];
               dm_nfe.cds_L_Entrega.FieldByName('UF').Value := LstDados.Strings[07];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'G02' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_L_Entrega.FieldByName('CNPJ').Value := LstDados.Strings[00];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'G02a' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_L_Entrega.FieldByName('CPF').Value := LstDados.Strings[00];
             end;
             GravaDadosCds(dm_nfe.cds_L_Entrega);
           end;
           //*****
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'H' then begin
             // Grupo do detalhamento de Produtos e Serviços da NF-e
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cdsNfeItens);
             dm_nfe.cdsNfeItens.FieldByName('nItem').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('infAdProd').Value := LstDados.Strings[01];
             nItem := dm_nfe.cdsNfeItens.FieldByName('nItem').Value;
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'I' then begin
             // Grupo do detalhamento de Produtos e Serviços da NF-e
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             //dm_nfe.cdsNfe_Itens.FieldByName('TIPO').Value := 'P'; // mudar para variável posteriormente para emissão de podutos e serviços
             dm_nfe.cdsNfeItens.FieldByName('cProd').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('cEAN').Value  := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('xProd').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('NCM').Value   := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('EXTIPI').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('CFOP').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('uCom').Value := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('qCom').Value := LstDados.Strings[07];
             dm_nfe.cdsNfeItens.FieldByName('vUnCom').Value := LstDados.Strings[08];
             dm_nfe.cdsNfeItens.FieldByName('vProd').Value := LstDados.Strings[09];
             dm_nfe.cdsNfeItens.FieldByName('cEANTrib').Value := LstDados.Strings[10];
             dm_nfe.cdsNfeItens.FieldByName('uTrib').Value := LstDados.Strings[11];
             dm_nfe.cdsNfeItens.FieldByName('qTrib').Value := LstDados.Strings[12];
             dm_nfe.cdsNfeItens.FieldByName('vUnTrib').Value := LstDados.Strings[13];
             dm_nfe.cdsNfeItens.FieldByName('vFrete').Value   := LstDados.Strings[14];
             dm_nfe.cdsNfeItens.FieldByName('vSeg').Value     := LstDados.Strings[15];
             dm_nfe.cdsNfeItens.FieldByName('vDesc').Value    := LstDados.Strings[16];
             dm_nfe.cdsNfeItens.FieldByName('vOutro').Value  := LstDados.Strings[17];
             dm_nfe.cdsNfeItens.FieldByName('indTot').Value  := LstDados.Strings[18];
             dm_nfe.cdsNfeItens.FieldByName('xPed').Value     := LstDados.Strings[19];
             dm_nfe.cdsNfeItens.FieldByName('nItemPed').Value := LstDados.Strings[20];
             if LstDados.Count > 20 then
             dm_nfe.cdsNfeItens.FieldByName('nFCI').Value := LstDados.Strings[21];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'I18' then begin
             // Declaração de Importação
             InsDadosCds(dm_nfe.cds_DI);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_DI.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_DI.FieldByName('nDI').Value := LstDados.Strings[00];
             nDI := dm_nfe.cds_DI.FieldByName('nDI').Value;
             dm_nfe.cds_DI.FieldByName('dDI').Value := LstDados.Strings[01];
             dm_nfe.cds_DI.FieldByName('xLocDesemb').Value := LstDados.Strings[02];
             dm_nfe.cds_DI.FieldByName('UFDesemb').Value := LstDados.Strings[03];
             dm_nfe.cds_DI.FieldByName('dDesemb').Value := LstDados.Strings[04];
             dm_nfe.cds_DI.FieldByName('cExportador').Value := LstDados.Strings[05];
             GravaDadosCds(dm_nfe.cds_DI);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'I25' then begin
             //Adições
             InsDadosCds(dm_nfe.cds_aDI);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_aDI.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_aDI.FieldByName('nDI').Value := nDI;
             dm_nfe.cds_aDI.FieldByName('nAdicao').Value := LstDados.Strings[00];
             dm_nfe.cds_aDI.FieldByName('nSeqAdicC').Value := LstDados.Strings[01];
             dm_nfe.cds_aDI.FieldByName('cFabricante').Value := LstDados.Strings[02];
             dm_nfe.cds_aDI.FieldByName('vDescDI').Value := LstDados.Strings[03];
             GravaDadosCds(dm_nfe.cds_aDI);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'J' then begin
             // Grupo do detalhamento de Veículos novos
             InsDadosCds(dm_nfe.cds_veicProd);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_veicProd.FieldByName('nItem').Value  := nItem;
             dm_nfe.cds_veicProd.FieldByName('tpOp').Value   := LstDados.Strings[00];
             dm_nfe.cds_veicProd.FieldByName('chassi').Value := LstDados.Strings[01];
             dm_nfe.cds_veicProd.FieldByName('cCor').Value := LstDados.Strings[02];
             dm_nfe.cds_veicProd.FieldByName('xCor').Value := LstDados.Strings[03];
             dm_nfe.cds_veicProd.FieldByName('pot').Value  := LstDados.Strings[04];
             dm_nfe.cds_veicProd.FieldByName('cilin').Value := LstDados.Strings[05];
             dm_nfe.cds_veicProd.FieldByName('pesoL').Value := LstDados.Strings[06];
             dm_nfe.cds_veicProd.FieldByName('pesoB').Value := LstDados.Strings[07];
             dm_nfe.cds_veicProd.FieldByName('nSerie').Value := LstDados.Strings[08];
             dm_nfe.cds_veicProd.FieldByName('tpComb').Value := LstDados.Strings[09];
             dm_nfe.cds_veicProd.FieldByName('nMotor').Value := LstDados.Strings[10];
             dm_nfe.cds_veicProd.FieldByName('CMT').Value  := LstDados.Strings[11];
             dm_nfe.cds_veicProd.FieldByName('dist').Value := LstDados.Strings[12];
             dm_nfe.cds_veicProd.FieldByName('anoMod').Value  := LstDados.Strings[13];
             dm_nfe.cds_veicProd.FieldByName('anoFab').Value  := LstDados.Strings[14];
             dm_nfe.cds_veicProd.FieldByName('tpPint').Value  := LstDados.Strings[15];
             dm_nfe.cds_veicProd.FieldByName('tpVeic').Value  := LstDados.Strings[16];
             dm_nfe.cds_veicProd.FieldByName('espVeic').Value := LstDados.Strings[17];
             dm_nfe.cds_veicProd.FieldByName('VIN').Value := LstDados.Strings[18];
             dm_nfe.cds_veicProd.FieldByName('condVeic').Value := LstDados.Strings[19];
             dm_nfe.cds_veicProd.FieldByName('cMod').Value := LstDados.Strings[20];
             dm_nfe.cds_veicProd.FieldByName('cCorDENATRAN').Value := LstDados.Strings[21];
             dm_nfe.cds_veicProd.FieldByName('lota').Value   := LstDados.Strings[22];
             dm_nfe.cds_veicProd.FieldByName('tpRest').Value := LstDados.Strings[23];
             GravaDadosCds(dm_nfe.cds_veicProd);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'K' then begin
             // Grupo do detalhamento de Medicamentos e de matérias-primas farmacêuticas
             InsDadosCds(dm_nfe.cds_NfeMed);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_NfeMed.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_NfeMed.FieldByName('nLote').Value := LstDados.Strings[00];
             dm_nfe.cds_NfeMed.FieldByName('qLote').Value := LstDados.Strings[01];
             dm_nfe.cds_NfeMed.FieldByName('dFab').Value := LstDados.Strings[02];
             dm_nfe.cds_NfeMed.FieldByName('dVal').Value := LstDados.Strings[03];
             dm_nfe.cds_NfeMed.FieldByName('vPMC').Value := LstDados.Strings[04];
             GravaDadosCds(dm_nfe.cds_NfeMed);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'L' then begin
             // Grupo do detalhamento de Armamento
             InsDadosCds(dm_nfe.cds_NfeArma);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_NfeArma.FieldByName('nItem').Value  := nItem;
             dm_nfe.cds_NfeArma.FieldByName('tpArma').Value := LstDados.Strings[00];
             dm_nfe.cds_NfeArma.FieldByName('nSerie').Value := LstDados.Strings[03];
             dm_nfe.cds_NfeArma.FieldByName('nCano').Value := LstDados.Strings[04];
             dm_nfe.cds_NfeArma.FieldByName('descr').Value := LstDados.Strings[05];
             GravaDadosCds(dm_nfe.cds_NfeArma);
           end;
           (*
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'L01' then begin
             // preencher campos da nfe L01
             Preenchelista(LstDados,ArqTxtNFe.Strings[J]);
             CProdANP|
             CODIF|
             QTemp|
             UFCons
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'L105' then begin
             // preencher campos da nfe L105
             Preenchelista(LstDados,ArqTxtNFe.Strings[J]);
           end;
           *)
           //***
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'M') then begin
             InsDadosCds(dm_nfe.cdsNfeIImp);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeIImp.FieldByName('nItem').Value := nItem;
             dm_nfe.cdsNfeIImp.FieldByName('ID_ICMS').AsString := 'M';
             dm_nfe.cdsNfeIImp.FieldByName('vTotTrib').Value := LstDados.Strings[00];
             GravaDadosCds(dm_nfe.cdsNfeIImp);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N02' then begin
             //Grupo de Tributação do ICMS= 00
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N02';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBC').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('vBC').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('pICMS').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value := LstDados.Strings[05];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N03' then begin
             // Grupo de Tributação do ICMS = 10
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N03';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value  := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBC').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('vBC').Value   := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('pICMS').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value := LstDados.Strings[07];
             dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value := LstDados.Strings[08];
             dm_nfe.cdsNfeItens.FieldByName('vBCST').Value   := LstDados.Strings[09];
             dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value := LstDados.Strings[10];
             dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value := LstDados.Strings[11];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N04' then begin
             // Grupo de Tributação do ICMS = 20
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N04';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value  := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBC').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('pRedBC').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('vBC').Value   := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('pICMS').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value := LstDados.Strings[06];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N05' then begin
             // Grupo de Tributação do ICMS = 30
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N05';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value  := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('vBCS').Value   := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value := LstDados.Strings[07];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N06' then begin
             // Grupo de Tributação do ICMS = 40, 41 ou 50
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N06';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value := LstDados.Strings[02];
             if dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString <> EmptyStr then
               dm_nfe.cdsNfeItens.FieldByName('motDesICMS').Value := LstDados.Strings[03];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N07' then begin
             // Grupo de Tributação do ICMS = 51
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N07';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBC').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('pRedBC').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('vBC').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('pICMS').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value := LstDados.Strings[06];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N08' then begin
             // Grupo de Tributação do ICMS = 60
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N08';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('vBCSTRet').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('vICMSSTRet').Value := LstDados.Strings[03];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if (Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N09') or
              (Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10') then begin
             // Grupo de Tributação do ICMS = 70 ou Grupo de Tributação do ICMS = 90
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := (Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1));
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBC').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('pRedBC').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('vBC').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('pICMS').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value := LstDados.Strings[07];
             dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value := LstDados.Strings[08];
             dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value := LstDados.Strings[09];
             dm_nfe.cdsNfeItens.FieldByName('vBCST').Value   := LstDados.Strings[10];
             dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value := LstDados.Strings[11];
             dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value := LstDados.Strings[12];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10a' then begin
             // Grupo de partilha do ICMS entre a UF de origem e UF de destino ou a UF definida na legislação.
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10a';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBC').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('pRedBC').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('vBC').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('pICMS').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value := LstDados.Strings[07];
             dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value := LstDados.Strings[08];
             dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value := LstDados.Strings[09];
             dm_nfe.cdsNfeItens.FieldByName('vBCST').Value := LstDados.Strings[10];
             dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value := LstDados.Strings[11];
             dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value := LstDados.Strings[12];
             dm_nfe.cdsNfeItens.FieldByName('pBCOp').Value := LstDados.Strings[13];
             dm_nfe.cdsNfeItens.FieldByName('UFST').Value := LstDados.Strings[14];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10b' then begin
             // Grupo de repasse de ICMS ST retido anteriormente em operações interestaduais com repasses através do Substituto Tributário
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10b';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CST').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('vBCSTRet').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('vICMSSTRet').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('vBCSTDest').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('vICMSSTDest').Value := LstDados.Strings[05];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10c' then begin
             // Grupo CRT=1 – Simples Nacional e CSOSN=101
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10c';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CSOSN').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('pCredSN').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('vCredICMSSN').Value := LstDados.Strings[03];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10d' then begin
             // Grupo CRT=1 – Simples Nacional e CSOSN=102, 103, 300 ou 400
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10d';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CSOSN').Value := LstDados.Strings[01];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10e' then begin
             // Grupo CRT=1 – Simples Nacional e CSOSN=201
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10e';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CSOSN').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('vBCST').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value := LstDados.Strings[07];
             dm_nfe.cdsNfeItens.FieldByName('pCredSN').Value := LstDados.Strings[08];
             dm_nfe.cdsNfeItens.FieldByName('vCredICMSSN').Value := LstDados.Strings[09];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10f' then begin
             // Grupo CRT=1 – Simples Nacional e CSOSN=202 ou 203
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10f';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CSOSN').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('vBCST').Value := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value := LstDados.Strings[07];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10g' then begin
             // Grupo CRT=1 – Simples Nacional e CSOSN = 500
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10g';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CSOSN').Value := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('vBCSTRet').Value := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('vICMSSTRet').Value := LstDados.Strings[04];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'N10h' then begin
             // Grupo CRT=1 – Simples Nacional e CSOSN=900
             EditaDadosCds(dm_nfe.cdsNfeItens);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString := 'N10h';
             dm_nfe.cdsNfeItens.FieldByName('orig').Value        := LstDados.Strings[00];
             dm_nfe.cdsNfeItens.FieldByName('CSOSN').Value       := LstDados.Strings[01];
             dm_nfe.cdsNfeItens.FieldByName('modBC').Value       := LstDados.Strings[02];
             dm_nfe.cdsNfeItens.FieldByName('vBC').Value         := LstDados.Strings[03];
             dm_nfe.cdsNfeItens.FieldByName('pRedBC').Value      := LstDados.Strings[04];
             dm_nfe.cdsNfeItens.FieldByName('pICMS').Value       := LstDados.Strings[05];
             dm_nfe.cdsNfeItens.FieldByName('vICMS').Value       := LstDados.Strings[06];
             dm_nfe.cdsNfeItens.FieldByName('modBCST').Value     := LstDados.Strings[07];
             dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value      := LstDados.Strings[08];
             dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value    := LstDados.Strings[09];
             dm_nfe.cdsNfeItens.FieldByName('vBCST').Value       := LstDados.Strings[10];
             dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value     := LstDados.Strings[11];
             dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value     := LstDados.Strings[12];
             dm_nfe.cdsNfeItens.FieldByName('pCredSN').Value     := LstDados.Strings[13];
             dm_nfe.cdsNfeItens.FieldByName('vCredICMSSN').Value := LstDados.Strings[14];
             GravaDadosCds(dm_nfe.cdsNfeItens);
           end;
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'O') then begin
             // Grupo do IPI
             if not dm_nfe.cds_IPI.FindKey([nItem]) then
               InsDadosCds(dm_nfe.cds_IPI)
             else
               EditaDadosCds(dm_nfe.cds_IPI);
             dm_nfe.cds_IPI.FieldByName('nItem').Value := nItem;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'O' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_IPI.FieldByName('clEnq').Value := LstDados.Strings[00];
               dm_nfe.cds_IPI.FieldByName('CNPJProd').Value := LstDados.Strings[01];
               dm_nfe.cds_IPI.FieldByName('cSelo').Value := LstDados.Strings[02];
               dm_nfe.cds_IPI.FieldByName('qSelo').Value := LstDados.Strings[03];
               dm_nfe.cds_IPI.FieldByName('cEnq').Value := LstDados.Strings[04];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'O07' then begin
               // Grupo do IPI da CST 00, 49, 50 e 99
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_IPI.FieldByName('CST').Value := LstDados.Strings[00];
               dm_nfe.cds_IPI.FieldByName('vIPI').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'O08' then begin
               // Grupo do CST 01, 02, 03, 04, 51, 52, 53, 54 e 55
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_IPI.FieldByName('CST').Value := LstDados.Strings[00];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'O10' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_IPI.FieldByName('vBC').Value := LstDados.Strings[00];
               dm_nfe.cds_IPI.FieldByName('pIPI').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'O11' then begin
               Preenchelista(LstDados,ArqTxtNFe.Strings[J]);
               dm_nfe.cds_IPI.FieldByName('qUnid').Value := LstDados.Strings[00];
               dm_nfe.cds_IPI.FieldByName('vUnid').Value := LstDados.Strings[01];
             end;
             GravaDadosCds(dm_nfe.cds_IPI);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'P' then begin
             // Grupo do Imposto de Importação
             InsDadosCds(dm_nfe.cds_II);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_II.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_II.FieldByName('vBC').Value := LstDados.Strings[00];
             dm_nfe.cds_II.FieldByName('vDespAdu').Value := LstDados.Strings[01];
             dm_nfe.cds_II.FieldByName('vII').Value := LstDados.Strings[02];
             dm_nfe.cds_II.FieldByName('vIOF').Value := LstDados.Strings[03];
             GravaDadosCds(dm_nfe.cds_II);
           end;
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'U' then begin
             // Grupo do ISSQN
             InsDadosCds(dm_nfe.cds_ISSQN);
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             dm_nfe.cds_ISSQN.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_ISSQN.FieldByName('vBC').Value := LstDados.Strings[00];
             dm_nfe.cds_ISSQN.FieldByName('vAliq').Value := LstDados.Strings[01];
             dm_nfe.cds_ISSQN.FieldByName('vISSQN').Value := LstDados.Strings[02];
             dm_nfe.cds_ISSQN.FieldByName('cMunFG').Value := LstDados.Strings[03];
             dm_nfe.cds_ISSQN.FieldByName('cListServ').Value := LstDados.Strings[04];
             dm_nfe.cds_ISSQN.FieldByName('cSitTrib').Value := LstDados.Strings[05];
             GravaDadosCds(dm_nfe.cds_ISSQN);
           end;
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'Q') then begin
             if not dm_nfe.cds_PIS.FindKey([nItem,'Q']) then
               InsDadosCds(dm_nfe.cds_PIS)
             else
               EditaDadosCds(dm_nfe.cds_PIS);
             dm_nfe.cds_PIS.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_PIS.FieldByName('ID_PIS').Value := 'Q';
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Q02' then begin
               // Grupo de PIS tributado pela alíquota
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('CST').Value := LstDados.Strings[00];
               dm_nfe.cds_PIS.FieldByName('vBC').Value := LstDados.Strings[01];
               dm_nfe.cds_PIS.FieldByName('pPIS').Value := LstDados.Strings[02];
               dm_nfe.cds_PIS.FieldByName('vPIS').Value := LstDados.Strings[03];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Q03' then begin
               // Grupo de PIS tributado por Qtde
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('CST').Value := LstDados.Strings[00];
               dm_nfe.cds_PIS.FieldByName('qBCProd').Value := LstDados.Strings[01];
               dm_nfe.cds_PIS.FieldByName('vAliqProd').Value := LstDados.Strings[02];
               dm_nfe.cds_PIS.FieldByName('vPIS').Value := LstDados.Strings[03];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Q04' then begin
               // Grupo de PIS não tributado
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('CST').Value := LstDados.Strings[00];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Q05' then begin
               //Grupo de PIS Outras Operações
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('CST').Value := LstDados.Strings[00];
               dm_nfe.cds_PIS.FieldByName('vPIS').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Q07' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('vBC').Value := LstDados.Strings[00];
               dm_nfe.cds_PIS.FieldByName('pPIS').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Q10' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('qBCProd').Value := LstDados.Strings[00];
               dm_nfe.cds_PIS.FieldByName('vAliqProd').Value := LstDados.Strings[01];
             end;
             GravaDadosCds(dm_nfe.cds_PIS);
           end;
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'R') then begin
             // Grupo de PIS Substituição Tributária
             if not dm_nfe.cds_PIS.FindKey([nItem,'R']) then
               InsDadosCds(dm_nfe.cds_PIS)
             else
               EditaDadosCds(dm_nfe.cds_PIS);
             dm_nfe.cds_PIS.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_PIS.FieldByName('ID_PIS').Value := 'R';
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'R' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('vPIS').Value := LstDados.Strings[00];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'R02' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('vBC').Value := LstDados.Strings[00];
               dm_nfe.cds_PIS.FieldByName('pPIS').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'R04' then begin
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_PIS.FieldByName('qBCProd').Value := LstDados.Strings[00];
               dm_nfe.cds_PIS.FieldByName('vAliqProd').Value := LstDados.Strings[01];
             end;
             GravaDadosCds(dm_nfe.cds_PIS);
           end;
           //*****
           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'S') then begin
              if not dm_nfe.cds_COFINS.FindKey([nItem,'S']) then
                InsDadosCds(dm_nfe.cds_COFINS)
              else
                EditaDadosCds(dm_nfe.cds_COFINS);
             dm_nfe.cds_COFINS.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_COFINS.FieldByName('ID_COFINS').Value := 'S';
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'S02' then begin
               // Grupo de COFINS tributado pela alíquota
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('CST').Value := LstDados.Strings[00];
               dm_nfe.cds_COFINS.FieldByName('vBC').Value := LstDados.Strings[01];
               dm_nfe.cds_COFINS.FieldByName('pCOFINS').Value := LstDados.Strings[02];
               dm_nfe.cds_COFINS.FieldByName('vCOFINS').Value := LstDados.Strings[03];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'S03' then begin
               //Grupo de COFINS tributado por Qtde
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('CST').Value := LstDados.Strings[00];
               dm_nfe.cds_COFINS.FieldByName('qBCProd').Value := LstDados.Strings[01];
               dm_nfe.cds_COFINS.FieldByName('vAliqProd').Value := LstDados.Strings[02];
               dm_nfe.cds_COFINS.FieldByName('vCOFINS').Value := LstDados.Strings[03];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'S04' then begin
               // Grupo de COFINS não tributado
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('CST').Value := LstDados.Strings[00];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'S05' then begin
               // Grupo de COFINS Outras Operações
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('CST').Value := LstDados.Strings[00];
               dm_nfe.cds_COFINS.FieldByName('vCOFINS').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'S07' then begin
               // Valor da Base de Cálculo da COFINS
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('vBC').Value := LstDados.Strings[00];
               dm_nfe.cds_COFINS.FieldByName('pCOFINS').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'S09' then begin
               // Quantidade Vendida
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('qBCProd').Value := LstDados.Strings[00];
               dm_nfe.cds_COFINS.FieldByName('vAliqProd').Value := LstDados.Strings[01];
             end;
             GravaDadosCds(dm_nfe.cds_COFINS);
           end;

           if (Trim(ArqTxtNFe.Strings[J]) <> EmptyStr) and (ArqTxtNFe.Strings[J][1] = 'T') then begin
             if not dm_nfe.cds_COFINS.FindKey([nItem,'T']) then
               InsDadosCds(dm_nfe.cds_COFINS)
             else
               EditaDadosCds(dm_nfe.cds_COFINS);
             dm_nfe.cds_COFINS.FieldByName('nItem').Value := nItem;
             dm_nfe.cds_COFINS.FieldByName('ID_COFINS').Value := 'T';
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'T' then begin
               // Grupo de COFINS Substituição Tributária
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('vCOFINS').Value := LstDados.Strings[00];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'T02' then begin
               // Valor da Base de Cálculo da COFINS
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('vBC').Value := LstDados.Strings[00];
               dm_nfe.cds_COFINS.FieldByName('pCOFINS').Value := LstDados.Strings[01];
             end;
             if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'T04' then begin
               // Quantidade Vendida
               Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
               dm_nfe.cds_COFINS.FieldByName('qBCProd').Value := LstDados.Strings[00];
               dm_nfe.cds_COFINS.FieldByName('vAliqProd').Value := LstDados.Strings[01];
             end;
             GravaDadosCds(dm_nfe.cds_COFINS);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'W02' then begin
             //Grupo de Valores Totais referentes ao ICMS
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_ICMSTot);
             dm_nfe.cds_ICMSTot.FieldByName('vBC').Value     := LstDados.Strings[00];
             dm_nfe.cds_ICMSTot.FieldByName('vICMS').Value   := LstDados.Strings[01];
             dm_nfe.cds_ICMSTot.FieldByName('vBCST').Value   := LstDados.Strings[02];
             dm_nfe.cds_ICMSTot.FieldByName('vST').Value     := LstDados.Strings[03];
             dm_nfe.cds_ICMSTot.FieldByName('vProd').Value   := LstDados.Strings[04];
             dm_nfe.cds_ICMSTot.FieldByName('vFrete').Value  := LstDados.Strings[05];
             dm_nfe.cds_ICMSTot.FieldByName('vSeg').Value    := LstDados.Strings[06];
             dm_nfe.cds_ICMSTot.FieldByName('vDesc').Value   := LstDados.Strings[07];
             dm_nfe.cds_ICMSTot.FieldByName('vII').Value     := LstDados.Strings[08];
             dm_nfe.cds_ICMSTot.FieldByName('vIPI').Value    := LstDados.Strings[09];
             dm_nfe.cds_ICMSTot.FieldByName('vPIS').Value    := LstDados.Strings[10];
             dm_nfe.cds_ICMSTot.FieldByName('vCOFINS').Value := LstDados.Strings[11];
             dm_nfe.cds_ICMSTot.FieldByName('vOutro').Value  := LstDados.Strings[12];
             dm_nfe.cds_ICMSTot.FieldByName('vNF').Value     := LstDados.Strings[13];
             dm_nfe.cds_ICMSTot.FieldByName('vTotTrib').Value := LstDados.Strings[14];
             GravaDadosCds(dm_nfe.cds_ICMSTot);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'W17' then begin
             // Grupo de Valores Totais referentes ao ISSQN
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_ISSQNTot);
             dm_nfe.cds_ISSQNTot.FieldByName('vServ').Value := LstDados.Strings[00];
             dm_nfe.cds_ISSQNTot.FieldByName('vBC').Value := LstDados.Strings[01];
             dm_nfe.cds_ISSQNTot.FieldByName('vISS').Value := LstDados.Strings[02];
             dm_nfe.cds_ISSQNTot.FieldByName('vPIS').Value := LstDados.Strings[03];
             dm_nfe.cds_ISSQNTot.FieldByName('vCOFINS').Value := LstDados.Strings[04];
             GravaDadosCds(dm_nfe.cds_ISSQNTot);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'W23' then begin
             // Grupo de Retenções de Tributos
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_ISSQNTot);
             dm_nfe.cds_ISSQNTot.FieldByName('vRetPIS').Value := LstDados.Strings[00];
             dm_nfe.cds_ISSQNTot.FieldByName('vRetCOFINS').Value := LstDados.Strings[01];
             dm_nfe.cds_ISSQNTot.FieldByName('vRetCSLL').Value := LstDados.Strings[02];
             dm_nfe.cds_ISSQNTot.FieldByName('vBCIRRF').Value := LstDados.Strings[03];
             dm_nfe.cds_ISSQNTot.FieldByName('vIRRF').Value := LstDados.Strings[04];
             dm_nfe.cds_ISSQNTot.FieldByName('vBCRetPrev').Value := LstDados.Strings[05];
             dm_nfe.cds_ISSQNTot.FieldByName('vRetPrev').Value := LstDados.Strings[06];
             GravaDadosCds(dm_nfe.cds_ISSQNTot);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X' then begin
             // Grupo de Informações do Transporte da NF-e
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_transp);
             dm_nfe.cds_transp.FieldByName('modFrete').Value := LstDados.Strings[00];
             GravaDadosCds(dm_nfe.cds_transp);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X03' then begin
             // Grupo Transportador
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cds_transp);
             dm_nfe.cds_transp.FieldByName('xNome').Value := LstDados.Strings[00];
             dm_nfe.cds_transp.FieldByName('IE').Value := LstDados.Strings[01];
             dm_nfe.cds_transp.FieldByName('xEnder').Value := LstDados.Strings[02];
             dm_nfe.cds_transp.FieldByName('UF').Value := LstDados.Strings[03];
             dm_nfe.cds_transp.FieldByName('xMun').Value := LstDados.Strings[04];
             GravaDadosCds(dm_nfe.cds_transp);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X04' then begin
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cds_transp);
             dm_nfe.cds_transp.FieldByName('CNPJ').Value := LstDados.Strings[00];
             GravaDadosCds(dm_nfe.cds_transp);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X05' then begin
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cds_transp);
             dm_nfe.cds_transp.FieldByName('CPF').Value := LstDados.Strings[00];
             GravaDadosCds(dm_nfe.cds_transp);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X11' then begin
             // Grupo de Retenção do ICMS do transporte
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cds_transp);
             dm_nfe.cds_transp.FieldByName('vServ').Value := LstDados.Strings[00];
             dm_nfe.cds_transp.FieldByName('vBCRet').Value := LstDados.Strings[01];
             dm_nfe.cds_transp.FieldByName('pICMSRet').Value := LstDados.Strings[02];
             dm_nfe.cds_transp.FieldByName('vICMSRet').Value := LstDados.Strings[03];
             dm_nfe.cds_transp.FieldByName('CFOP').Value := LstDados.Strings[04];
             dm_nfe.cds_transp.FieldByName('CMunFG').Value := LstDados.Strings[05];
             GravaDadosCds(dm_nfe.cds_transp);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X18' then begin
             //Grupo Veículo
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cds_transp);
             dm_nfe.cds_transp.FieldByName('placa').Value := LstDados.Strings[00];
             dm_nfe.cds_transp.FieldByName('UF_v').Value := LstDados.Strings[01];
             dm_nfe.cds_transp.FieldByName('RNTC').Value := LstDados.Strings[02];
             GravaDadosCds(dm_nfe.cds_transp);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X22' then begin
             // Grupo Reboque
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_nfeReboque);
             dm_nfe.cds_nfeReboque.FieldByName('placa').Value := LstDados.Strings[00];
             dm_nfe.cds_nfeReboque.FieldByName('UF').Value := LstDados.Strings[01];
             dm_nfe.cds_nfeReboque.FieldByName('RNTC').Value := LstDados.Strings[02];
             GravaDadosCds(dm_nfe.cds_nfeReboque);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X26' then begin
             // Grupo Volumes
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_nfeVolumes);
             dm_nfe.cds_nfeVolumes.FieldByName('qVol').Value := LstDados.Strings[00];
             dm_nfe.cds_nfeVolumes.FieldByName('esp').Value := LstDados.Strings[01];
             dm_nfe.cds_nfeVolumes.FieldByName('marca').Value := LstDados.Strings[02];
             dm_nfe.cds_nfeVolumes.FieldByName('nVol').Value := LstDados.Strings[03];
             dm_nfe.cds_nfeVolumes.FieldByName('pesoL').Value := LstDados.Strings[04];
             dm_nfe.cds_nfeVolumes.FieldByName('pesoB').Value := LstDados.Strings[05];
             GravaDadosCds(dm_nfe.cds_nfeVolumes);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'X33' then begin
             // Grupo de Lacres
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_nfeLacre);
             dm_nfe.cds_nfeLacre.FieldByName('nVol').Value := dm_nfe.cds_nfeVolumes.FieldByName('nVol').Value;
             dm_nfe.cds_nfeLacre.FieldByName('nLacre').Value := LstDados.Strings[00];
             GravaDadosCds(dm_nfe.cds_nfeLacre);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Y02' then begin
             // Grupo da Fatura
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_Cobranca);
             dm_nfe.cds_Cobranca.FieldByName('nFat').Value := LstDados.Strings[00];
             nFatura := dm_nfe.cds_Cobranca.FieldByName('nFat').Value;
             dm_nfe.cds_Cobranca.FieldByName('vOrig').Value := LstDados.Strings[01];
             dm_nfe.cds_Cobranca.FieldByName('vDesc').Value := LstDados.Strings[02];
             dm_nfe.cds_Cobranca.FieldByName('vLiq').Value := LstDados.Strings[03];
             GravaDadosCds(dm_nfe.cds_Cobranca);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Y07' then begin
             // Grupo da Duplicata
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             if not dm_nfe.cdsDuplic.Active then
               dm_nfe.cdsDuplic.Open;
             dm_nfe.cdsDuplic.Insert;

             dm_nfe.cdsDuplic.FieldByName('nFat').AsString  := nFatura;
             dm_nfe.cdsDuplic.FieldByName('nDup').AsString  := LstDados.Strings[00];
             dm_nfe.cdsDuplic.FieldByName('dVenc').AsString := LstDados.Strings[01];
             dm_nfe.cdsDuplic.FieldByName('vDup').AsString  := LstDados.Strings[02];

             if dm_nfe.cdsDuplic.State in [dsInsert,dsEdit] then
               dm_nfe.cdsDuplic.Post;
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Z' then begin
             //Grupo de Informações Adicionais
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cdsNfe_Cab);
             dm_nfe.cdsNfe_Cab.FieldByName('infAdFisco').Value := LstDados.Strings[00];
             dm_nfe.cdsNfe_Cab.FieldByName('infCpl').Value := LstDados.Strings[01];
             GravaDadosCds(dm_nfe.cdsNfe_Cab);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Z04' then begin
             // Grupo do campo de uso livre do contribuinte
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cdsNfe_Cab);
             dm_nfe.cdsNfe_Cab.FieldByName('xCampo').Value := LstDados.Strings[00];
             dm_nfe.cdsNfe_Cab.FieldByName('xTexto').Value := LstDados.Strings[01];
             GravaDadosCds(dm_nfe.cdsNfe_Cab);
           end;

           (*
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Z07' then begin
             // preencher campos da nfe Z07
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));

           end;
           *)

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'Z10' then begin
             // preencher campos da nfe Z10
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cdsNfe_Cab);
             dm_nfe.cds_nfeProcRef.FieldByName('nProc').Value := LstDados.Strings[00];
             dm_nfe.cds_nfeProcRef.FieldByName('indProc').Value := LstDados.Strings[01];
             GravaDadosCds(dm_nfe.cdsNfe_Cab);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'ZA' then begin
             // Grupo de Exportação
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_Exporta);
             dm_nfe.cds_Exporta.FieldByName('UFEmbarq').Value := LstDados.Strings[00];
             dm_nfe.cds_Exporta.FieldByName('xLocEmbarq').Value := LstDados.Strings[01];
             GravaDadosCds(dm_nfe.cds_Exporta);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'ZB' then begin
             // Grupo de Compra
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_compra);
             dm_nfe.cds_compra.FieldByName('xNEmp').Value := LstDados.Strings[00];
             dm_nfe.cds_compra.FieldByName('xPed').Value := LstDados.Strings[01];
             dm_nfe.cds_compra.FieldByName('xCont').Value := LstDados.Strings[02];
             GravaDadosCds(dm_nfe.cds_compra);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'ZC01' then begin
             // Grupo de cana
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             InsDadosCds(dm_nfe.cds_CanaForDia);
             dm_nfe.cds_CanaForDia.FieldByName('safra').Value := LstDados.Strings[00];
             sSafra := dm_nfe.cds_CanaForDia.FieldByName('safra').Value;
             dm_nfe.cds_CanaForDia.FieldByName('ref').Value := LstDados.Strings[01];
             dm_nfe.cds_CanaForDia.FieldByName('qTotMes').Value := LstDados.Strings[02];
             dm_nfe.cds_CanaForDia.FieldByName('qTotAnt').Value := LstDados.Strings[03];
             dm_nfe.cds_CanaForDia.FieldByName('qTotGer').Value := LstDados.Strings[04];
             dm_nfe.cds_CanaForDia.FieldByName('vFor').Value := LstDados.Strings[05];
             dm_nfe.cds_CanaForDia.FieldByName('vTotDed').Value := LstDados.Strings[06];
             dm_nfe.cds_CanaForDia.FieldByName('vLiqFor').Value := LstDados.Strings[07];
             GravaDadosCds(dm_nfe.cds_CanaForDia);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'ZC04' then begin
             // Grupo de Fornecimento diário de cana
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cds_CanaForDia);
             dm_nfe.cds_CanaForDia.FieldByName('dia_ZC05').Value := LstDados.Strings[00];
             dm_nfe.cds_CanaForDia.FieldByName('qtde_ZC06').Value := LstDados.Strings[01];
             GravaDadosCds(dm_nfe.cds_CanaForDia);
           end;

           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'ZC10' then begin
             // Grupo de Deduções – Taxas e Contribuições
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             EditaDadosCds(dm_nfe.cds_nfeDeduc);
             dm_nfe.cds_nfeDeduc.FieldByName('safra').Value := sSafra;
             dm_nfe.cds_nfeDeduc.FieldByName('xDed_ZC11').Value := LstDados.Strings[00];
             dm_nfe.cds_nfeDeduc.FieldByName('vDed_ZC12').Value := LstDados.Strings[01];
             GravaDadosCds(dm_nfe.cds_nfeDeduc);
           end;
           //.:: email manager ::.
           if Copy(ArqTxtNFe.Strings[J],1,Pos('|',ArqTxtNFe.Strings[J])-1) = 'MANAGER' then begin
             Preenchelista(LstDados,RemoveEspecial(ArqTxtNFe.Strings[J]));
             if LstDados.Count > 0 then begin
               if stEmail = nil then
                 stEmail := TStringList.Create;
               stEmail.Assign(LstDados);
             end;
           end;
           //::.
           if (dm_nfe.cdsNfeItens.State in [dsInsert,dsEdit]) and (Length(Trim(dm_nfe.cdsNfeItens.FieldByName('cProd').Value)) > 0) then
             GravaDadosCds(dm_nfe.cdsNfeItens);

         end;
         if TransmiteNfe then
           RenameFile(sDirFiles+'\'+LstTxtNFe.Strings[I],newname(sDirFiles+'\'+LstTxtNFe.Strings[I]));
          // MoveFile(PWideChar(sDirFiles+'\'+LstTxtNFe.Strings[I]),PWideChar(vvDirProcessado+'\'+LstTxtNFe.Strings[I]));
         //else
         //  MoveFile(PWideChar(sDirFiles+'\'+LstTxtNFe.Strings[I]),PWideChar(vvDirRejeitado+'\'+LstTxtNFe.Strings[I]));
         vvNFE_XML := EmptyWideStr;
      end else begin
        // garvar log
        StatusMsg('Arquivo '+ LstTxtNFe.Strings[I] + ' não localizado na pasta '+ sDirFiles,0);
        GeraEvento('Arquivo '+ LstTxtNFe.Strings[I] + ' não localizado na pasta '+ sDirFiles);
        if vvTrayAtivado then
          ExibeMsgTray('Arquivo '+ LstTxtNFe.Strings[I] + ' não localizado na pasta '+ sDirFiles,1);
      end;
    end;

    FreeAndNil(ArqTxtNFe);
    FreeAndNil(ArqTxtNFe);
    FreeAndNil(LstDados);
    FreeAndNil(LstTxtNFe);

 except
  on e : exception do begin
    //
    {
    StatusMsg('Verificando status do serviço na SEFAZ...',2);
    iCodStatus := VerificaStatusServ;
    StatusMsg(GetMsgSolicitacao(iCodStatus,dm_Princial.cdsGeral),3);
    Application.ProcessMessages;
    GeraEvento(GetMsgSolicitacao(iCodStatus,dm_Princial.cdsGeral));
    Application.ProcessMessages;
    }
    //
    //MoveFile(PWideChar(sDirFiles+'\'+LstTxtNFe.Strings[I]),PWideChar(vvDirComErro+'\'+LstTxtNFe.Strings[I]));
    FreeAndNil(ArqTxtNFe);
    FreeAndNil(ArqTxtNFe);
    FreeAndNil(LstDados);
    FreeAndNil(LstTxtNFe);
    ResetDataSetNfe;
    StatusMsg('Erro ao caregar dados da nfe verifice o erro em enventos',1);
    GeraEvento('Erro ao caregar dados da nfe, Erro original ' + E.Message);
    if vvTrayAtivado then
      ExibeMsgTray('Erro ao caregar dados da nfe, Erro original ' + E.Message,2);
    frmPrincipal.Timer_Monitor.Enabled := True;
  end;
 end;

end;

function TransmiteNfe : Boolean;
var
  idNfe,
  tpEmis : String;
  sMsg : AnsiString;
  nCons,
  iCodStatus,
  impr,
  iStatusMsg, iE : Integer;
  sLstFXML,
  sLstXmlAp : TStringList;
  idIDpec,
  sJustificaDPEC,
  sdhCont,
  sCnpj : string;
  bContingencia : Boolean;
  qItem,
  vlrItem : Real48;
  sProt : WideString;
begin
  Result := False;
  try
    try
      if not dm_nfe.cdsNfe_Cab.FieldByName('nNF').IsNull then
        if ExisteNF(dm_nfe.cdsNfe_Cab.FieldByName('nNF').AsFloat,dm_Princial.cdsGeral) then begin
          // limpa variaveis
          vNFeXML := EmptyWideStr;
          vvXML_PROT_AUTO := EmptyWideStr;
          vvXML_PROTOCOLO := EmptyWideStr;
          sXMLProtocolado := EmptyWideStr;
          //
          if not dm_nfe.cdsNfe_Cab.IsEmpty then begin
            dm_nfe.nfdNFeDataSets.CriarDataSets;
            dm_nfe.nfdNFeDataSets.LoteNFe.Clear;
            dm_nfe.nfdNFeDataSets.Incluir;
            // Grupo das informações da NF-e
            dm_nfe.nfdNFeDataSets.Campo('versao_A02').Value := '2.00';
            //..: Grupo das informações de identificação da NF-e :..
            dm_nfe.nfdNFeDataSets.Campo('cUF_B02').Value := dm_nfe.cdsNfe_Cab.FieldByName('cUF').AsString;
            dm_nfe.nfdNFeDataSets.Campo('cNF_B03').Value := LPad(dm_nfe.cdsNfe_Cab.FieldByName('nNF').AsString,'0',9);// Random(99999999);
            dm_nfe.nfdNFeDataSets.Campo('natOp_B04').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('natOp').AsString);
            dm_nfe.nfdNFeDataSets.Campo('indPag_B05').Value := dm_nfe.cdsNfe_Cab.FieldByName('indPag').AsString;
            dm_nfe.nfdNFeDataSets.Campo('mod_B06').Value := dm_nfe.cdsNfe_Cab.FieldByName('mod').AsString;
            dm_nfe.nfdNFeDataSets.Campo('serie_B07').Value := IntToStr(dm_nfe.cdsNfe_Cab.FieldByName('serie').AsInteger);
            vvSERIE := dm_nfe.nfdNFeDataSets.Campo('serie_B07').Value;
            dm_nfe.nfdNFeDataSets.Campo('nNF_B08').Value := FloatToStr(dm_nfe.cdsNfe_Cab.FieldByName('nNF').AsFloat);
            vvNU_NFE := dm_nfe.cdsNfe_Cab.FieldByName('nNF').AsString;
            dm_nfe.nfdNFeDataSets.Campo('dEmi_B09').Value := dm_nfe.cdsNfe_Cab.FieldByName('dEmi').AsString;
            vvDtaEmissao := formataDtaFb(dm_nfe.nfdNFeDataSets.Campo('dEmi_B09').Value);
            dm_nfe.nfdNFeDataSets.Campo('dSaiEnt_B10').Value := dm_nfe.cdsNfe_Cab.FieldByName('dSaiEnt').AsString;
            dm_nfe.nfdNFeDataSets.Campo('hSaiEnt_B10a').Value := dm_nfe.cdsNfe_Cab.FieldByName('hSaiEnt').AsString;
            dm_nfe.nfdNFeDataSets.Campo('tpNF_B11').Value := dm_nfe.cdsNfe_Cab.FieldByName('tpNF').AsString;
            dm_nfe.nfdNFeDataSets.Campo('cMunFG_B12').Value := dm_nfe.cdsNfe_Cab.FieldByName('cMunFG').AsString;
            dm_nfe.nfdNFeDataSets.Campo('tpImp_B21').Value := dm_nfe.cdsNfe_Cab.FieldByName('tpImp').AsString;
            dm_nfe.nfdNFeDataSets.Campo('tpEmis_B22').Value := iff(bContingencia,'4',dm_nfe.cdsNfe_Cab.FieldByName('tpEmis').AsString);
            dm_nfe.nfdNFeDataSets.Campo('cDV_B23').Value := dm_nfe.cdsNfe_Cab.FieldByName('cDV').AsString;
            dm_nfe.nfdNFeDataSets.Campo('tpAmb_B24').Value := dm_nfe.cdsNfe_Cab.FieldByName('tpAmb').AsString;
            dm_nfe.nfdNFeDataSets.Campo('finNFe_B25').Value := dm_nfe.cdsNfe_Cab.FieldByName('finNFe').AsString;
            dm_nfe.nfdNFeDataSets.Campo('procEmi_B26').Value := dm_nfe.cdsNfe_Cab.FieldByName('procEmi').AsString;
            dm_nfe.nfdNFeDataSets.Campo('verProc_B27').Value := dm_nfe.cdsNfe_Cab.FieldByName('verProc').AsString;
            dm_nfe.nfdNFeDataSets.Campo('dhCont_B28').Value := sdhCont; //dm_nfe.cdsNfe_Cab.FieldByName('dhCont').AsString;
            dm_nfe.nfdNFeDataSets.Campo('xJust_B29').Value  := RemoveAcentos(sJustificaDPEC); //dm_nfe.cdsNfe_Cab.FieldByName('xJust').AsString;
            // Grupo de informação das NF/NF-e referenciadas
            if not dm_nfe.cds_NFref.IsEmpty then begin
              // ..: Grupo de informação da NF modelo 1/1A referenciada :..
              dm_nfe.cds_NFref.First;
              while not dm_nfe.cds_NFref.Eof do begin
                dm_nfe.nfdNFeDataSets.IncluirNFref;
                dm_nfe.nfdNFeDataSets.Campo('refNFe_B13').Value := dm_nfe.cdsNfe_Cab.FieldByName('refNfe').AsString;
                dm_nfe.nfdNFeDataSets.Campo('cUF_B15').Value := dm_nfe.cdsNfe_Cab.FieldByName('cUF').AsString;
                dm_nfe.nfdNFeDataSets.Campo('AAMM_B16').Value := dm_nfe.cdsNfe_Cab.FieldByName('AAMM').AsString;
                dm_nfe.nfdNFeDataSets.Campo('CNPJ_B17').Value := dm_nfe.cdsNfe_Cab.FieldByName('CNPJ').AsString;
                dm_nfe.nfdNFeDataSets.Campo('mod_B18').Value := dm_nfe.cdsNfe_Cab.FieldByName('mod').AsString;
                dm_nfe.nfdNFeDataSets.Campo('serie_B19').Value := dm_nfe.cdsNfe_Cab.FieldByName('serie').AsString;
                dm_nfe.nfdNFeDataSets.Campo('nNF_B20').Value := dm_nfe.cdsNfe_Cab.FieldByName('nNF').AsString;
                dm_nfe.nfdNFeDataSets.Campo('refCTe_B20i').Value := dm_nfe.cdsNfe_Cab.FieldByName('refCTe').AsString;
                dm_nfe.nfdNFeDataSets.SalvarNFref;
                dm_nfe.cds_NFref.Next;
              end;
            end;
            // ..: Grupo de informações da NF de produtor rural referenciada :..
            if not dm_nfe.cds_refNFP.IsEmpty then begin
              dm_nfe.cds_refNFP.First;
              while not dm_nfe.cds_refNFP.Eof do begin
                dm_nfe.nfdNFeDataSets.IncluirNFref;
                dm_nfe.nfdNFeDataSets.Campo('refNFe_B13').Value := dm_nfe.cds_refNFP.FieldByName('refNfe').AsString;
                dm_nfe.nfdNFeDataSets.Campo('cUF_B20b').Value := dm_nfe.cds_refNFP.FieldByName('cUF').AsString;
                dm_nfe.nfdNFeDataSets.Campo('AAMM_B20c').Value := dm_nfe.cds_refNFP.FieldByName('AAMM').AsString;
                dm_nfe.nfdNFeDataSets.Campo('CNPJ_B20d').Value := dm_nfe.cds_refNFP.FieldByName('CNPJ').AsString;
                dm_nfe.nfdNFeDataSets.Campo('CPF_B20e').Value := dm_nfe.cds_refNFP.FieldByName('CPF').AsString;
                dm_nfe.nfdNFeDataSets.Campo('IE_B20f').Value := dm_nfe.cds_refNFP.FieldByName('IE').AsString;
                dm_nfe.nfdNFeDataSets.Campo('mod_B20f').Value := dm_nfe.cds_refNFP.FieldByName('mod').AsString;
                dm_nfe.nfdNFeDataSets.Campo('serie_B20g').Value := dm_nfe.cds_refNFP.FieldByName('serie').AsString;
                dm_nfe.nfdNFeDataSets.Campo('nNF_B20h').Value := dm_nfe.cds_refNFP.FieldByName('nNF').AsString;
                dm_nfe.nfdNFeDataSets.SalvarNFref;
                dm_nfe.cds_refNFP.Next;
              end;
            end;
            // ..: Informações do Cupom Fiscal referenciado :..
            if not dm_nfe.cds_refECF.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.IncluirNFref;
              dm_nfe.nfdNFeDataSets.Campo('mod_B20k').Value := dm_nfe.cds_refECF.FieldByName('mod').AsString;
              dm_nfe.nfdNFeDataSets.Campo('nECF_B20l').Value := dm_nfe.cds_refECF.FieldByName('nECF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('nCOO_B20m').Value := dm_nfe.cds_refECF.FieldByName('nCOO').AsString;
              dm_nfe.nfdNFeDataSets.SalvarNFref;
            end;
            // ..: Grupo de identificação do emitente da NF-e :..
            dm_nfe.nfdNFeDataSets.Campo('CNPJ_C02').Value := dm_nfe.cdsNfe_Cab.FieldByName('CNPJ').AsString;
            dm_nfe.nfdNFeDataSets.Campo('CPF_C02a').Value := dm_nfe.cdsNfe_Cab.FieldByName('CPF').AsString;
            dm_nfe.nfdNFeDataSets.Campo('xNome_C03').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xNome').AsString);
            dm_nfe.nfdNFeDataSets.Campo('xFant_C04').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xFant').AsString);
            // ..: Grupo do Endereço do emitente :..
            dm_nfe.nfdNFeDataSets.Campo('xLgr_C06').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xLgr').AsString);
            dm_nfe.nfdNFeDataSets.Campo('nro_C07').Value := dm_nfe.cdsNfe_Cab.FieldByName('nro').AsString;
            dm_nfe.nfdNFeDataSets.Campo('xCpl_C08').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xCpl').AsString);
            dm_nfe.nfdNFeDataSets.Campo('xBairro_C09').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xBairro').AsString);
            dm_nfe.nfdNFeDataSets.Campo('cMun_C10').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('cMun').AsString);
            dm_nfe.nfdNFeDataSets.Campo('xMun_C11').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xMun').AsString);
            dm_nfe.nfdNFeDataSets.Campo('UF_C12').Value := dm_nfe.cdsNfe_Cab.FieldByName('UF').AsString;
            dm_nfe.nfdNFeDataSets.Campo('CEP_C13').Value := dm_nfe.cdsNfe_Cab.FieldByName('CEP').AsString;
            dm_nfe.nfdNFeDataSets.Campo('cPais_C14').Value := dm_nfe.cdsNfe_Cab.FieldByName('cPais').AsString;
            dm_nfe.nfdNFeDataSets.Campo('xPais_C15').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xPais').AsString);
            dm_nfe.nfdNFeDataSets.Campo('fone_C16').Value := dm_nfe.cdsNfe_Cab.FieldByName('fone').AsString;
            dm_nfe.nfdNFeDataSets.Campo('IE_C17').Value := dm_nfe.cdsNfe_Cab.FieldByName('IE').AsString;
            dm_nfe.nfdNFeDataSets.Campo('IEST_C18').Value := dm_nfe.cdsNfe_Cab.FieldByName('IEST').AsString;
            dm_nfe.nfdNFeDataSets.Campo('IM_C19').Value := dm_nfe.cdsNfe_Cab.FieldByName('IM').AsString;
            dm_nfe.nfdNFeDataSets.Campo('CNAE_C20').Value := dm_nfe.cdsNfe_Cab.FieldByName('CNAE').AsString;
            dm_nfe.nfdNFeDataSets.Campo('CRT_C21').Value := dm_nfe.cdsNfe_Cab.FieldByName('CRT').AsString;
            // ..: Avulsa :..
            if not dm_nfe.cds_NfAvulsa.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.Campo('CNPJ_D02').Value := dm_nfe.cds_NfAvulsa.FieldByName('CNPJ').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xOrgao_D03').Value := dm_nfe.cds_NfAvulsa.FieldByName('xOrgao').AsString;
              dm_nfe.nfdNFeDataSets.Campo('matr_D04').Value := dm_nfe.cds_NfAvulsa.FieldByName('matr').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xAgente_D05').Value := dm_nfe.cds_NfAvulsa.FieldByName('xAgente').AsString;
              dm_nfe.nfdNFeDataSets.Campo('fone_D06').Value := dm_nfe.cds_NfAvulsa.FieldByName('fone').AsString;
              dm_nfe.nfdNFeDataSets.Campo('UF_D07').Value := dm_nfe.cds_NfAvulsa.FieldByName('UF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('nDAR_D08').Value := dm_nfe.cds_NfAvulsa.FieldByName('nDAR').AsString;
              dm_nfe.nfdNFeDataSets.Campo('dEmi_D09').Value := dm_nfe.cds_NfAvulsa.FieldByName('dEmi').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vDAR_D10').Value := dm_nfe.cds_NfAvulsa.FieldByName('vDAR').AsString;
              dm_nfe.nfdNFeDataSets.Campo('repEmi_D11 ').Value := dm_nfe.cds_NfAvulsa.FieldByName('repEmi').AsString;
              dm_nfe.nfdNFeDataSets.Campo('dPag_D12').Value := dm_nfe.cds_NfAvulsa.FieldByName('dPag').AsString;
            end;
            // ..: Grupo de identificação do Destinatário da NF-e :..
            if (not dm_nfe.cds_Exporta.IsEmpty) or (dm_nfe.cdsNfe_Cab.FieldByName('UF_d').AsString = 'EX') then
              sCnpj := '§§§§§§§§§§§§§'
            else
              sCnpj := Trim(iff((vvTpAmbiente = 'H') and (dm_nfe.cdsNfe_Cab.FieldByName('CPF_d').AsString = ''),'00000000000191',dm_nfe.cdsNfe_Cab.FieldByName('CNPJ_d').AsString));
            dm_nfe.nfdNFeDataSets.Campo('CNPJ_E02').Value := sCnpj;
            dm_nfe.nfdNFeDataSets.Campo('CPF_E03').Value := Trim(iff((vvTpAmbiente = 'H') and ((dm_nfe.cdsNfe_Cab.FieldByName('CPF_d').AsString <> '') or (dm_nfe.nfdNFeDataSets.Campo('CNPJ_E02').Value = '')),'00000000191',dm_nfe.cdsNfe_Cab.FieldByName('CPF_d').AsString));
            dm_nfe.nfdNFeDataSets.Campo('xNome_E04').Value := Trim(iff((vvTpAmbiente = 'H'),'NF-E EMITIDA EM AMBIENTE DE HOMOLOGACAO - SEM VALOR FISCAL',dm_nfe.cdsNfe_Cab.FieldByName('xNome_d').AsString));
            vvCPF_CNPJ  := iff(dm_nfe.nfdNFeDataSets.Campo('CNPJ_E02').Value <> '',dm_nfe.nfdNFeDataSets.Campo('CNPJ_E02').Value,dm_nfe.nfdNFeDataSets.Campo('CPF_E03').Value);
            vvNOME_DEST := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xNome_d').AsString);
            // ..: Grupo de endereço do Destinatário da NF-e :..
            dm_nfe.nfdNFeDataSets.Campo('xLgr_E06').Value := dm_nfe.cdsNfe_Cab.FieldByName('xLgr_d').AsString;
            dm_nfe.nfdNFeDataSets.Campo('nro_E07').Value := dm_nfe.cdsNfe_Cab.FieldByName('nro_d').AsString;
            dm_nfe.nfdNFeDataSets.Campo('xCpl_E08').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xCpl_d').AsString);
            dm_nfe.nfdNFeDataSets.Campo('xBairro_E09').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xBairro_d').AsString);
            dm_nfe.nfdNFeDataSets.Campo('cMun_E10').Value := dm_nfe.cdsNfe_Cab.FieldByName('cMun_d').AsString;
            dm_nfe.nfdNFeDataSets.Campo('xMun_E11').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xMun_d').AsString);
            dm_nfe.nfdNFeDataSets.Campo('UF_E12').Value := dm_nfe.cdsNfe_Cab.FieldByName('UF_d').AsString;
            dm_nfe.nfdNFeDataSets.Campo('CEP_E13').Value := dm_nfe.cdsNfe_Cab.FieldByName('CEP_d').AsString;
            dm_nfe.nfdNFeDataSets.Campo('cPais_E14').Value := dm_nfe.cdsNfe_Cab.FieldByName('cPais_d').AsString;
            dm_nfe.nfdNFeDataSets.Campo('xPais_E15').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('xPais_d').AsString);
            dm_nfe.nfdNFeDataSets.Campo('fone_E16').Value := dm_nfe.cdsNfe_Cab.FieldByName('fone_d').AsString;
            dm_nfe.nfdNFeDataSets.Campo('IE_E17').Value := iff(vvTpAmbiente = 'H','',dm_nfe.cdsNfe_Cab.FieldByName('IE_d').AsString);
            dm_nfe.nfdNFeDataSets.Campo('ISUF_E18').Value := dm_nfe.cdsNfe_Cab.FieldByName('ISUF').AsString;
            dm_nfe.nfdNFeDataSets.Campo('email_E19').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('email_d').AsString);
            vvEmailDest := dm_nfe.nfdNFeDataSets.Campo('email_E19').Value;
            // ..: Grupo de identificação do Local de retirada :..
            if not dm_nfe.cds_L_Retirada.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.Campo('CNPJ_F02').Value := dm_nfe.cds_L_Retirada.FieldByName('CNPJ').AsString;
              dm_nfe.nfdNFeDataSets.Campo('CPF_F02a').Value := dm_nfe.cds_L_Retirada.FieldByName('CPF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xLgr_F03').Value := RemoveAcentos(dm_nfe.cds_L_Retirada.FieldByName('xLgr').AsString);
              dm_nfe.nfdNFeDataSets.Campo('nro_F04').Value := dm_nfe.cds_L_Retirada.FieldByName('nro').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xCpl_F05').Value := RemoveAcentos(dm_nfe.cds_L_Retirada.FieldByName('xCpl').AsString);
              dm_nfe.nfdNFeDataSets.Campo('xBairro_F06').Value := RemoveAcentos(dm_nfe.cds_L_Retirada.FieldByName('xBairro').AsString);
              dm_nfe.nfdNFeDataSets.Campo('cMun_F07').Value := dm_nfe.cds_L_Retirada.FieldByName('cMun').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xMun_F08').Value := RemoveAcentos(dm_nfe.cds_L_Retirada.FieldByName('xMun').AsString);
              dm_nfe.nfdNFeDataSets.Campo('UF_F09').Value := dm_nfe.cds_L_Retirada.FieldByName('UF').AsString;
            end;
            // ..: Grupo de identificação do Local de entrega :..
            if not dm_nfe.cds_L_Entrega.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.Campo('CNPJ_G02').Value := dm_nfe.cds_L_Entrega.FieldByName('CNPJ').AsString;
              dm_nfe.nfdNFeDataSets.Campo('CPF_G02a').Value := dm_nfe.cds_L_Entrega.FieldByName('CPF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xLgr_G03').Value := dm_nfe.cds_L_Entrega.FieldByName('xLgr').AsString;
              dm_nfe.nfdNFeDataSets.Campo('nro_G04').Value := dm_nfe.cds_L_Entrega.FieldByName('nro').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xCpl_G05').Value := dm_nfe.cds_L_Entrega.FieldByName('xCpl').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xBairro_G06').Value := dm_nfe.cds_L_Entrega.FieldByName('xBairro').AsString;
              dm_nfe.nfdNFeDataSets.Campo('cMun_G07').Value := dm_nfe.cds_L_Entrega.FieldByName('cMun').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xMun_G08').Value := RemoveAcentos(dm_nfe.cds_L_Entrega.FieldByName('xMun').AsString);
              dm_nfe.nfdNFeDataSets.Campo('UF_G09').Value := dm_nfe.cds_L_Entrega.FieldByName('UF').AsString;
            end;
            // ..: Grupo do detalhamento de Produtos e Serviços da NF-e :..
            if not dm_nfe.cdsNfeItens.IsEmpty then begin
              // ..: Grupo do detalhamento de Produtos e Serviços da NF-e :..
              dm_nfe.cdsNfeItens.First;
              while not dm_nfe.cdsNfeItens.Eof do begin
                dm_nfe.nfdNFeDataSets.IncluirItem;
                dm_nfe.nfdNFeDataSets.Campo('TIPO_M02').Value := vvTipoImpr;
                dm_nfe.nfdNFeDataSets.Campo('nItem_H02').Value := dm_nfe.cdsNfeItens.FieldByName('nItem').AsString;
                dm_nfe.nfdNFeDataSets.Campo('cProd_I02').Value := dm_nfe.cdsNfeItens.FieldByName('cProd').AsString;
                dm_nfe.nfdNFeDataSets.Campo('cEAN_I03').Value := dm_nfe.cdsNfeItens.FieldByName('cEAN').AsString;
                dm_nfe.nfdNFeDataSets.Campo('xProd_I04').Value := RemoveAcentos(dm_nfe.cdsNfeItens.FieldByName('xProd').AsString);
                dm_nfe.nfdNFeDataSets.Campo('NCM_I05').Value := dm_nfe.cdsNfeItens.FieldByName('NCM').AsString;
                dm_nfe.nfdNFeDataSets.Campo('EXTIPI_I06').Value := dm_nfe.cdsNfeItens.FieldByName('EXTIPI').AsString;
                //dm_nfe.nfdNFeDataSets.Campo('genero_I07').Value := dm_nfe.cdsNfeItens.FieldByName('genero').AsString;
                dm_nfe.nfdNFeDataSets.Campo('CFOP_I08').Value := dm_nfe.cdsNfeItens.FieldByName('CFOP').AsString;
                dm_nfe.nfdNFeDataSets.Campo('uCom_I09').Value := dm_nfe.cdsNfeItens.FieldByName('uCom').AsString;
                dm_nfe.nfdNFeDataSets.Campo('qCom_I10').Value := dm_nfe.cdsNfeItens.FieldByName('qCom').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vUnCom_I10a').Value := dm_nfe.cdsNfeItens.FieldByName('vUnCom').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vProd_I11').Value := dm_nfe.cdsNfeItens.FieldByName('vProd').AsString;
                dm_nfe.nfdNFeDataSets.Campo('cEANTrib_I12').Value := dm_nfe.cdsNfeItens.FieldByName('cEANTrib').AsString;
                dm_nfe.nfdNFeDataSets.Campo('uTrib_I13').Value := dm_nfe.cdsNfeItens.FieldByName('uTrib').AsString;
                dm_nfe.nfdNFeDataSets.Campo('qTrib_I14').Value := dm_nfe.cdsNfeItens.FieldByName('qTrib').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vUnTrib_I14a').Value := dm_nfe.cdsNfeItens.FieldByName('vUnTrib').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vFrete_I15').Value := dm_nfe.cdsNfeItens.FieldByName('vFrete').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vSeg_I16').Value := dm_nfe.cdsNfeItens.FieldByName('vSeg').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vDesc_I17').Value := dm_nfe.cdsNfeItens.FieldByName('vDesc').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vOutro_I17a').Value := dm_nfe.cdsNfeItens.FieldByName('vOutro').AsString;
                dm_nfe.nfdNFeDataSets.Campo('indTot_I17b').Value := dm_nfe.cdsNfeItens.FieldByName('indTot').AsString;
                dm_nfe.nfdNFeDataSets.Campo('xPed_I18').Value := dm_nfe.cdsNfeItens.FieldByName('xPed').AsString;
                dm_nfe.nfdNFeDataSets.Campo('nItemPed_I19').Value := dm_nfe.cdsNfeItens.FieldByName('nItemPed').AsString;
                dm_nfe.nfdNFeDataSets.Campo('infAdProd_V01').Value := RemoveAcentos(dm_nfe.cdsNfeItens.FieldByName('infAdProd').AsString);
                dm_nfe.nfdNFeDataSets.Campo('nFCI_I70').Value := dm_nfe.cdsNfeItens.FieldByName('nFCI').Value;
                // ..: Declaração de Importação :..
                if not dm_nfe.cds_DI.IsEmpty  then begin
                  dm_nfe.cds_DI.Filtered := False;
                  dm_nfe.cds_DI.Filter := 'nItem = '+ dm_nfe.cdsNfeItens.FieldByName('nItem').AsString;
                  dm_nfe.cds_DI.Filtered := True;
                  if not dm_nfe.cds_DI.IsEmpty then
                    while not dm_nfe.cds_DI.Eof   do begin
                      dm_nfe.nfdNFeDataSets.IncluirDI;
                      dm_nfe.nfdNFeDataSets.Campo('nDI_I19').Value := dm_nfe.cds_DI.FieldByName('nDI').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('dDI_I20').Value := dm_nfe.cds_DI.FieldByName('dDI').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('xLocDesemb_I21').Value := dm_nfe.cds_DI.FieldByName('xLocDesemb').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('UFDesemb_I22').Value := dm_nfe.cds_DI.FieldByName('UFDesemb').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('dDesemb_I23').Value := dm_nfe.cds_DI.FieldByName('dDesemb').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('cExportador_I24').Value := RemoveAcentos(dm_nfe.cds_DI.FieldByName('cExportador').AsString);
                      if not dm_nfe.cds_aDI.IsEmpty then begin
                        // ..: Adições :..
                        dm_nfe.cds_aDI.Filtered := False;
                        dm_nfe.cds_aDI.Filter := 'nItem = '+ dm_nfe.cds_DI.FieldByName('nItem').AsString +
                                                 ' and nDI = '+ QuotedStr(dm_nfe.cds_DI.FieldByName('nDI').AsString);
                        dm_nfe.cds_aDI.Filtered := True;
                        if not dm_nfe.cds_aDI.IsEmpty then begin
                          dm_nfe.cds_aDI.First;
                          while not dm_nfe.cds_aDI.Eof do begin
                           dm_nfe.nfdNFeDataSets.Incluiradi;
                           dm_nfe.nfdNFeDataSets.Campo('nAdicao_I26').Value := dm_nfe.cds_aDI.FieldByName('nAdicao').AsString;
                           dm_nfe.nfdNFeDataSets.Campo('nSeqAdic_I27').Value := dm_nfe.cds_aDI.FieldByName('nSeqAdicC').AsString;
                           dm_nfe.nfdNFeDataSets.Campo('cFabricante_I28').Value := dm_nfe.cds_aDI.FieldByName('cFabricante').AsString;
                           dm_nfe.nfdNFeDataSets.Campo('vDescDI_I29').Value := dm_nfe.cds_aDI.FieldByName('vDescDI').AsString;
                           dm_nfe.cds_aDI.Next;
                           dm_nfe.nfdNFeDataSets.Salvaradi;
                          end;
                        end;
                      end;
                      dm_nfe.nfdNFeDataSets.SalvarDI;
                      dm_nfe.cds_DI.Next;
                    end;
                end;
                // ..: Grupo do detalhamento de Veículos novos :..
                if dm_nfe.cds_veicProd.RecordCount > 0 then begin
                  dm_nfe.cds_veicProd.Filtered := False;
                  dm_nfe.cds_veicProd.Filter := 'nItem = '+ dm_nfe.cdsNfeItens.FieldByName('nItem').AsString;
                  dm_nfe.cds_veicProd.Filtered := True;
                  if not dm_nfe.cds_veicProd.IsEmpty then begin
                    dm_nfe.nfdNFeDataSets.Campo('tpOp_J02').Value := dm_nfe.cds_veicProd.FieldByName('tpOp').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('chassi_J03').Value := dm_nfe.cds_veicProd.FieldByName('chassi').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cCor_J04').Value := dm_nfe.cds_veicProd.FieldByName('cCor').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('xCor_J05').Value := dm_nfe.cds_veicProd.FieldByName('xCor').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('pot_J06').Value := dm_nfe.cds_veicProd.FieldByName('pot').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cilin_J07').Value := dm_nfe.cds_veicProd.FieldByName('cilin').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('pesoL_J08').Value := dm_nfe.cds_veicProd.FieldByName('pesoL').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('pesoB_J09').Value := dm_nfe.cds_veicProd.FieldByName('pesoB').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('nSerie_J10').Value := dm_nfe.cds_veicProd.FieldByName('nSerie').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('tpComb_J11').Value := dm_nfe.cds_veicProd.FieldByName('tpComb').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('nMotor_J12').Value := dm_nfe.cds_veicProd.FieldByName('nMotor').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('CMT_J13').Value := dm_nfe.cds_veicProd.FieldByName('CMT').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('dist_J14').Value := dm_nfe.cds_veicProd.FieldByName('dist').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('anoMod_J16').Value := dm_nfe.cds_veicProd.FieldByName('anoMod').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('anoFab_J17').Value := dm_nfe.cds_veicProd.FieldByName('anoFab').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('tpPint_J18').Value := dm_nfe.cds_veicProd.FieldByName('tpPint').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('tpVeic_J19').Value := dm_nfe.cds_veicProd.FieldByName('tpVeic').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('espVeic_J20').Value := dm_nfe.cds_veicProd.FieldByName('espVeic').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('VIN_J21').Value := dm_nfe.cds_veicProd.FieldByName('VIN').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('condVeic_J22').Value := dm_nfe.cds_veicProd.FieldByName('condVeic').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cMod_J23').Value := dm_nfe.cds_veicProd.FieldByName('cMod').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cCorDENATRAN_J24').Value := dm_nfe.cds_veicProd.FieldByName('cCorDENATRAN').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('lota_J25').Value := dm_nfe.cds_veicProd.FieldByName('lota').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('tpRest_J26').Value := dm_nfe.cds_veicProd.FieldByName('tpRest').AsString;
                  end;
                end;
                // ..: Grupo do detalhamento de Medicamentos e de matérias-primas farmacêuticas :..
                if dm_nfe.cds_NfeMed.RecordCount > 0 then begin
                  dm_nfe.cds_NfeMed.Filtered := False;
                  dm_nfe.cds_NfeMed.Filter := ' nItem = '+ dm_nfe.cdsNfeItens.FieldByName('nItem').AsString;
                  dm_nfe.cds_NfeMed.Filtered := True;
                  if not dm_nfe.cds_NfeMed.IsEmpty then begin
                    dm_nfe.cds_NfeMed.First;
                    while not dm_nfe.cds_NfeMed.Eof do begin
                      dm_nfe.nfdNFeDataSets.Campo('nLote_K02').Value := dm_nfe.cds_NfeMed.FieldByName('nLote').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('qLote_K03').Value := dm_nfe.cds_NfeMed.FieldByName('qLote').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('dFab_K04').Value := dm_nfe.cds_NfeMed.FieldByName('dFab').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('dVal_K05').Value := dm_nfe.cds_NfeMed.FieldByName('dVal').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('vPMC_K06').Value := dm_nfe.cds_NfeMed.FieldByName('vPMC').AsString;
                      dm_nfe.cds_NfeMed.Next;
                    end;
                  end;
                end;
                // ..: Grupo do detalhamento de Armamento :..
                if dm_nfe.cds_NfeArma.RecordCount > 0 then begin
                  dm_nfe.cds_NfeArma.Filtered := False;
                  dm_nfe.cds_NfeArma.Filter := 'nItem = '+ dm_nfe.cdsNfeItens.FieldByName('nItem').AsString;
                  dm_nfe.cds_NfeArma.Filtered := True;
                  if not dm_nfe.cds_NfeArma.IsEmpty then begin
                    dm_nfe.cds_NfeArma.First;
                    while not dm_nfe.cds_NfeArma.Eof do begin
                      dm_nfe.nfdNFeDataSets.Campo('tpArma_L02').Value := dm_nfe.cds_NfeArma.FieldByName('tpArma').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('nSerie_L03').Value := dm_nfe.cds_NfeArma.FieldByName('nSerie').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('nCano_L04').Value := dm_nfe.cds_NfeArma.FieldByName('nCano').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('descr_L05').Value := dm_nfe.cds_NfeArma.FieldByName('descr').AsString;
                      dm_nfe.cds_NfeArma.Next;
                    end;
                  end;
                end;
                if dm_nfe.cdsNfeIImp.FindKey([dm_nfe.cdsNfeItens.FieldByName('nItem').AsString,'M']) then begin
                  dm_nfe.nfdNFeDataSets.Campo('vTotTrib_M02').Value := dm_nfe.cdsNfeIImp.FieldByName('vTotTrib').AsString;
                end;
                // ..: Grupo de Tributos incidentes no Produto ou Serviço :..
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N02' then begin
                  // ..: Grupo de Tributação do ICMS= 00 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value  := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value   := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBC_N13').Value := dm_nfe.cdsNfeItens.FieldByName('modBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBC_N15').Value   := dm_nfe.cdsNfeItens.FieldByName('vBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMS_N16').Value := dm_nfe.cdsNfeItens.FieldByName('pICMS').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N03' then begin
                   //dm_nfe.nfdNFeDataSets.UsaICMS_ST := True;
                   // ..: Grupo de Tributação do ICMS = 10 :..
                   dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('modBC_N13').Value := dm_nfe.cdsNfeItens.FieldByName('modBC').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('vBC_N15').Value := dm_nfe.cdsNfeItens.FieldByName('vBC').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('pICMS_N16').Value := dm_nfe.cdsNfeItens.FieldByName('pICMS').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('modBCST_N18').Value := dm_nfe.cdsNfeItens.FieldByName('modBCST').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('pMVAST_N19').Value := dm_nfe.cdsNfeItens.FieldByName('pMVAST').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('pRedBCST_N20').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBCST').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('pRedBC_N14').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBC').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('vBCST_N21').Value := dm_nfe.cdsNfeItens.FieldByName('vBCST').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('pICMSST_N22').Value := dm_nfe.cdsNfeItens.FieldByName('pICMSST').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('vICMSST_N23').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSST').AsString;
                   {
                   dm_nfe.nfdNFeDataSets.Campo('pBCOp_N25').Value := dm_nfe.cdsNfeItens.FieldByName('pBCOp').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('UFST_N24').Value := dm_nfe.cdsNfeItens.FieldByName('UFST').AsString;
                   }
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N04' then begin

                  // ..: Grupo de Tributação do ICMS = 20 :..
                   dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('modBC_N13').Value := dm_nfe.cdsNfeItens.FieldByName('modBC').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('pRedBC_N14').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBC').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('vBC_N15').Value := dm_nfe.cdsNfeItens.FieldByName('vBC').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('pICMS_N16').Value := dm_nfe.cdsNfeItens.FieldByName('pICMS').AsString;
                   dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N05' then begin
                  //dm_nfe.nfdNFeDataSets.UsaICMS_ST := True;
                  // ..: Grupo de Tributação do ICMS = 30 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBCST_N18').Value := dm_nfe.cdsNfeItens.FieldByName('modBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pMVAST_N19').Value := dm_nfe.cdsNfeItens.FieldByName('pMVAST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBCST_N20').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCST_N21').Value := dm_nfe.cdsNfeItens.FieldByName('vBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMSST_N22').Value := dm_nfe.cdsNfeItens.FieldByName('pICMSST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSST_N23').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSST').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N06' then begin
                  // ..: Grupo de Tributação do ICMS = 40, 41 ou 50 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('motDesICMS_N28').Value := dm_nfe.cdsNfeItens.FieldByName('motDesICMS').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N07' then begin
                  // ..: Grupo de Tributação do ICMS = 51 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBC_N13').Value := dm_nfe.cdsNfeItens.FieldByName('modBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBC_N14').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBC_N15').Value := dm_nfe.cdsNfeItens.FieldByName('vBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMS_N16').Value := dm_nfe.cdsNfeItens.FieldByName('pICMS').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N08' then begin
                   //dm_nfe.nfdNFeDataSets.UsaICMS_ST := True;
                  // ..: Grupo de Tributação do ICMS = 60 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCSTRet_N26').Value := dm_nfe.cdsNfeItens.FieldByName('vBCSTRet').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSSTRet_N27').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSSTRet').AsString;
                end;
                if (dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N09') or
                   (dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10') then begin
                  //dm_nfe.nfdNFeDataSets.UsaICMS_ST := dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N09';
                  // ..: Grupo de Tributação do ICMS = 70 ou ICMS = 90 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBC_N13').Value := dm_nfe.cdsNfeItens.FieldByName('modBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBC_N14').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBC_N15').Value := dm_nfe.cdsNfeItens.FieldByName('vBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMS_N16').Value := dm_nfe.cdsNfeItens.FieldByName('pICMS').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBCST_N18').Value := dm_nfe.cdsNfeItens.FieldByName('modBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pMVAST_N19').Value := dm_nfe.cdsNfeItens.FieldByName('pMVAST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBCST_N20').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCST_N21').Value := dm_nfe.cdsNfeItens.FieldByName('vBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMSST_N22').Value := dm_nfe.cdsNfeItens.FieldByName('pICMSST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSST_N23').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSST').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10a' then begin
                  // ..: Grupo de Tributação do ICMSPart :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBC_N13').Value := dm_nfe.cdsNfeItens.FieldByName('modBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBC_N15').Value := dm_nfe.cdsNfeItens.FieldByName('vBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBC_N14').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBC').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMS_N16').Value := dm_nfe.cdsNfeItens.FieldByName('pICMS').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBCST_N18').Value := dm_nfe.cdsNfeItens.FieldByName('modBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pMVAST_N19').Value := dm_nfe.cdsNfeItens.FieldByName('pMVAST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBCST_N20').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCST_N21').Value := dm_nfe.cdsNfeItens.FieldByName('vBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMSST_N22').Value := dm_nfe.cdsNfeItens.FieldByName('pICMSST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSST_N23').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pBCOp_N25').Value := dm_nfe.cdsNfeItens.FieldByName('pBCOp').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('UFST_N24').Value := dm_nfe.cdsNfeItens.FieldByName('UFST').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10b' then begin
                   dm_nfe.nfdNFeDataSets.UsaICMS_ST := True;
                  // ..: Grupo de repasse de ICMS ST retido anteriormente em operações interestaduais com repasses através do Substituto Tributário :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CST_N12').Value := dm_nfe.cdsNfeItens.FieldByName('CST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCSTRet_N26').Value := dm_nfe.cdsNfeItens.FieldByName('vBCSTRet').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSSTRet_N27').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSSTRet').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCSTDest_N31').Value := dm_nfe.cdsNfeItens.FieldByName('vBCSTDest').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSSTDest_N32').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSSTDest').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10c' then begin
                // ..: Grupo CRT=1 – Simples Nacional e CSOSN=101 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CSOSN_N12a').Value := dm_nfe.cdsNfeItens.FieldByName('CSOSN').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pCredSN_N29').Value := dm_nfe.cdsNfeItens.FieldByName('pCredSN').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vCredICMSSN_N30').Value := dm_nfe.cdsNfeItens.FieldByName('vCredICMSSN').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10d' then begin
                // ..: Grupo CRT=1 – Simples Nacional e CSOSN=102, 103, 300 ou 400 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CSOSN_N12a').Value := dm_nfe.cdsNfeItens.FieldByName('CSOSN').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10e' then begin
                // ..: Grupo CRT=1 – Simples Nacional e CSOSN=201 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CSOSN_N12a').Value := dm_nfe.cdsNfeItens.FieldByName('CSOSN').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBCST_N18').Value := dm_nfe.cdsNfeItens.FieldByName('modBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pMVAST_N19').Value := dm_nfe.cdsNfeItens.FieldByName('pMVAST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBCST_N20').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCST_N21').Value := dm_nfe.cdsNfeItens.FieldByName('vBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMSST_N22').Value := dm_nfe.cdsNfeItens.FieldByName('pICMSST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSST_N23').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pCredSN_N29').Value := dm_nfe.cdsNfeItens.FieldByName('pCredSN').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vCredICMSSN_N30').Value := dm_nfe.cdsNfeItens.FieldByName('vCredICMSSN').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10f' then begin
                  //dm_nfe.nfdNFeDataSets.UsaICMS_ST := True;
                // ..: Grupo CRT=1 – Simples Nacional e CSOSN=202 ou 203 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CSOSN_N12a').Value := dm_nfe.cdsNfeItens.FieldByName('CSOSN').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('modBCST_N18').Value := dm_nfe.cdsNfeItens.FieldByName('modBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pMVAST_N19').Value := dm_nfe.cdsNfeItens.FieldByName('pMVAST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBCST_N20').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCST_N21').Value := dm_nfe.cdsNfeItens.FieldByName('vBCST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('pICMSST_N22').Value := dm_nfe.cdsNfeItens.FieldByName('pICMSST').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSST_N23').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSST').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10g' then begin
                //..: Grupo CRT=1 – Simples Nacional e CSOSN = 500 :..
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CSOSN_N12a').Value := dm_nfe.cdsNfeItens.FieldByName('CSOSN').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vBCSTRet_N26').Value := dm_nfe.cdsNfeItens.FieldByName('vBCSTRet').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSSTRet_N27').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSSTRet').AsString;
                end;
                if dm_nfe.cdsNfeItens.FieldByName('ID_ICMS').AsString = 'N10h' then begin
                //..: Grupo CRT=1 – Simples Nacional e CSOSN=900 :..
                  //dm_nfe.nfdNFeDataSets.UsaICMS_ST := True;
                  dm_nfe.nfdNFeDataSets.Campo('orig_N11').Value := dm_nfe.cdsNfeItens.FieldByName('orig').AsString;
                  dm_nfe.nfdNFeDataSets.Campo('CSOSN_N12a').Value := dm_nfe.cdsNfeItens.FieldByName('CSOSN').Value;
                  dm_nfe.nfdNFeDataSets.Campo('modBC_N13').Value := dm_nfe.cdsNfeItens.FieldByName('modBC').Value;
                  dm_nfe.nfdNFeDataSets.Campo('vBC_N15').Value := dm_nfe.cdsNfeItens.FieldByName('vBC').Value;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBC_N14').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBC').Value;
                  dm_nfe.nfdNFeDataSets.Campo('pICMS_N16').Value := dm_nfe.cdsNfeItens.FieldByName('pICMS').Value;
                  dm_nfe.nfdNFeDataSets.Campo('vICMS_N17').Value := dm_nfe.cdsNfeItens.FieldByName('vICMS').Value;
                  dm_nfe.nfdNFeDataSets.Campo('modBCST_N18').Value := dm_nfe.cdsNfeItens.FieldByName('modBCST').Value;
                  dm_nfe.nfdNFeDataSets.Campo('pMVAST_N19').Value := dm_nfe.cdsNfeItens.FieldByName('pMVAST').Value;
                  dm_nfe.nfdNFeDataSets.Campo('pRedBCST_N20').Value := dm_nfe.cdsNfeItens.FieldByName('pRedBCST').Value;
                  dm_nfe.nfdNFeDataSets.Campo('vBCST_N21').Value := dm_nfe.cdsNfeItens.FieldByName('vBCST').Value;
                  dm_nfe.nfdNFeDataSets.Campo('vICMSST_N23').Value := dm_nfe.cdsNfeItens.FieldByName('vICMSST').Value;
                  dm_nfe.nfdNFeDataSets.Campo('pICMSST_N22').Value := dm_nfe.cdsNfeItens.FieldByName('pICMSST').Value;
                  //dm_nfe.nfdNFeDataSets.Campo('pBCOp_N25').Value :=
                  //dm_nfe.nfdNFeDataSets.Campo('vBCSTRet_N26').Value :=
                  //dm_nfe.nfdNFeDataSets.Campo('vICMSSTRet_N27').Value :=
                  //dm_nfe.nfdNFeDataSets.Campo('motDesICMS_N28').Value :=
                  dm_nfe.nfdNFeDataSets.Campo('pCredSN_N29').Value := dm_nfe.cdsNfeItens.FieldByName('pCredSN').Value;
                  dm_nfe.nfdNFeDataSets.Campo('vCredICMSSN_N30').Value := dm_nfe.cdsNfeItens.FieldByName('vCredICMSSN').Value;
                end;
                if dm_nfe.cds_IPI.RecordCount > 0 then begin
                  // ..: Grupo do IPI :..
                  if dm_nfe.cds_IPI.FindKey([dm_nfe.cdsNfeItens.FieldByName('nItem').Value]) then begin
                    dm_nfe.nfdNFeDataSets.Campo('clEnq_O02').Value := dm_nfe.cds_IPI.FieldByName('clEnq').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('CNPJProd_O03').Value := dm_nfe.cds_IPI.FieldByName('CNPJProd').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cSelo_O04').Value := dm_nfe.cds_IPI.FieldByName('cSelo').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('qSelo_O05').Value := dm_nfe.cds_IPI.FieldByName('qSelo').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cEnq_O06').Value := dm_nfe.cds_IPI.FieldByName('cEnq').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('CST_O09').Value := dm_nfe.cds_IPI.FieldByName('CST').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vBC_O10').Value := iff(dm_nfe.cds_IPI.FieldByName('vBC').AsString <> '',dm_nfe.cds_IPI.FieldByName('vBC').AsString, FormatReal(dm_nfe.cdsNfeItens.FieldByName('vUnTrib').AsString));
                    //dm_nfe.nfdNFeDataSets.Campo('qUnid_O11').Value := dm_nfe.cdsNfe_Itens.FieldByName('qTrib').AsString;
                    //dm_nfe.nfdNFeDataSets.Campo('vUnid_O12').Value := dm_nfe.cdsNfe_Itens.FieldByName('vUnTrib').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('pIPI_O13').Value := dm_nfe.cds_IPI.FieldByName('pIPI').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vIPI_O14').Value  := dm_nfe.cds_IPI.FieldByName('vIPI').AsString;
                    //if StrToIntDef(dm_nfe.nfdNFeDataSets.Campo('CST_O09').AsString,-1) in [00,49,50,99] then begin
                    //end;
                  end;
                end;
                if dm_nfe.cds_II.RecordCount > 0 then begin
                // ..: Grupo do Imposto de Importação :..
                  if dm_nfe.cds_II.FindKey([dm_nfe.cdsNfeItens.FieldByName('nItem').Value]) then begin
                    dm_nfe.nfdNFeDataSets.Campo('vBC_P02').Value := dm_nfe.cds_II.FieldByName('vBC').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vDespAdu_P03').Value := dm_nfe.cds_II.FieldByName('vDespAdu').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vII_P04').Value := dm_nfe.cds_II.FieldByName('vII').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vIOF_P05').Value := dm_nfe.cds_II.FieldByName('vIOF').AsString;
                  end;
                end;
                if dm_nfe.cds_PIS.RecordCount > 0 then begin
                 // ..: Grupo do PIS :..
                  if dm_nfe.cds_PIS.FindKey([dm_nfe.cdsNfeItens.FieldByName('nItem').Value,'Q']) then begin
                    dm_nfe.nfdNFeDataSets.Campo('CST_Q06').Value := dm_nfe.cds_PIS.FieldByName('CST').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vBC_Q07').Value := iff(dm_nfe.cds_PIS.FieldByName('vBC').AsString <> '',dm_nfe.cds_PIS.FieldByName('vBC').AsString,'0.00');
                    dm_nfe.nfdNFeDataSets.Campo('pPIS_Q08').Value := iff(dm_nfe.cds_PIS.FieldByName('pPIS').AsString <> '', dm_nfe.cds_PIS.FieldByName('pPIS').AsString,'0.00');
                    dm_nfe.nfdNFeDataSets.Campo('vPIS_Q09').Value := dm_nfe.cds_PIS.FieldByName('vPIS').AsString;
                    //dm_nfe.nfdNFeDataSets.Campo('qBCProd_Q10').Value := dm_nfe.cds_PIS.FieldByName('qBCProd').AsString;
                    //dm_nfe.nfdNFeDataSets.Campo('vAliqProd_Q11').Value := dm_nfe.cds_PIS.FieldByName('vAliqProd').AsString;
                  end;
                  if dm_nfe.cds_PIS.FindKey([dm_nfe.cdsNfeItens.FieldByName('nItem').Value,'R']) then begin
                    dm_nfe.nfdNFeDataSets.Campo('vBC_R02').Value := dm_nfe.cds_PIS.FieldByName('vBC').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('pPIS_R03').Value := dm_nfe.cds_PIS.FieldByName('pPIS').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('qBCProd_R04').Value := dm_nfe.cds_PIS.FieldByName('qBCProd').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vAliqProd_R05').Value := dm_nfe.cds_PIS.FieldByName('vAliqProd').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vPIS_R06').Value := dm_nfe.cds_PIS.FieldByName('vPIS').AsString;
                  end;
                end;
                //
                if dm_nfe.cds_COFINS.RecordCount > 0 then begin
                  //..: Grupo do COFINS :..
                  if dm_nfe.cds_COFINS.FindKey([dm_nfe.cdsNfeItens.FieldByName('nItem').Value,'S']) then begin
                    dm_nfe.nfdNFeDataSets.Campo('CST_S06').Value := dm_nfe.cds_COFINS.FieldByName('CST').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vBC_S07').Value := dm_nfe.cds_COFINS.FieldByName('vBC').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('pCOFINS_S08').Value := dm_nfe.cds_COFINS.FieldByName('pCOFINS').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('qBCProd_S09').Value := dm_nfe.cds_COFINS.FieldByName('qBCProd').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vAliqProd_S10').Value := dm_nfe.cds_COFINS.FieldByName('vAliqProd').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vCOFINS_S11').Value := dm_nfe.cds_COFINS.FieldByName('vCOFINS').AsString;
                  end;
                  if dm_nfe.cds_COFINS.FindKey([dm_nfe.cdsNfeItens.FieldByName('nItem').Value,'T']) then begin
                    dm_nfe.nfdNFeDataSets.Campo('vBC_T02').Value := dm_nfe.cds_COFINS.FieldByName('vBC').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('pCOFINS_T03').Value := dm_nfe.cds_COFINS.FieldByName('pCOFINS').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('qBCProd_T04').Value := dm_nfe.cds_COFINS.FieldByName('qBCProd').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vAliqProd_T05').Value := dm_nfe.cds_COFINS.FieldByName('vAliqProd').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vCOFINS_T06').Value := dm_nfe.cds_COFINS.FieldByName('vCOFINS').AsString;
                  end;
                end;
                if dm_nfe.cds_ISSQN.RecordCount > 0 then begin
                //..: Grupo do ISSQN :..
                  dm_nfe.cds_ISSQN.Filtered := False;
                  dm_nfe.cds_ISSQN.Filter := 'nItem = '+ dm_nfe.cdsNfeItens.FieldByName('nItem').AsString;
                  dm_nfe.cds_ISSQN.Filtered := True;
                  if not dm_nfe.cds_ISSQN.IsEmpty then begin
                    dm_nfe.nfdNFeDataSets.Campo('vBC_U02').Value := dm_nfe.cds_ISSQN.FieldByName('vBC').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vAliq_U03').Value := dm_nfe.cds_ISSQN.FieldByName('vAliq').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('vISSQN_U04').Value := dm_nfe.cds_ISSQN.FieldByName('vISSQN').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cMunFG_U05').Value := dm_nfe.cds_ISSQN.FieldByName('cMunFG').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cListServ_U06').Value := dm_nfe.cds_ISSQN.FieldByName('cListServ').AsString;
                    dm_nfe.nfdNFeDataSets.Campo('cSitTrib_U07').Value := dm_nfe.cds_ISSQN.FieldByName('cSitTrib').AsString;
                  end;
                end;
                dm_nfe.nfdNFeDataSets.SalvarItem;
                dm_nfe.cdsNfeItens.Next;
              end;
            end;
            // ..: Grupo de Valores Totais da NF-e :..
            if not dm_nfe.cds_ICMSTot.IsEmpty then begin
            // ..: Grupo de Valores Totais referentes ao ICMS :..
              dm_nfe.nfdNFeDataSets.Campo('vBC_W03').Value := dm_nfe.cds_ICMSTot.FieldByName('vBC').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vICMS_W04').Value := dm_nfe.cds_ICMSTot.FieldByName('vICMS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vBCST_W05').Value := dm_nfe.cds_ICMSTot.FieldByName('vBCST').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vST_W06').Value := dm_nfe.cds_ICMSTot.FieldByName('vST').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vProd_W07').Value := dm_nfe.cds_ICMSTot.FieldByName('vProd').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vFrete_W08').Value := dm_nfe.cds_ICMSTot.FieldByName('vFrete').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vSeg_W09').Value := dm_nfe.cds_ICMSTot.FieldByName('vSeg').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vDesc_W10').Value := dm_nfe.cds_ICMSTot.FieldByName('vDesc').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vII_W11').Value := dm_nfe.cds_ICMSTot.FieldByName('vII').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vIPI_W12').Value := dm_nfe.cds_ICMSTot.FieldByName('vIPI').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vPIS_W13').Value := dm_nfe.cds_ICMSTot.FieldByName('vPIS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vCOFINS_W14').Value := dm_nfe.cds_ICMSTot.FieldByName('vCOFINS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vOutro_W15').Value := dm_nfe.cds_ICMSTot.FieldByName('vOutro').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vNF_W16').Value := dm_nfe.cds_ICMSTot.FieldByName('vNF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vTotTrib_W16a').Value := dm_nfe.cds_ICMSTot.FieldByName('vTotTrib').AsString;
            end;
            if not dm_nfe.cds_ISSQNTot.IsEmpty then begin
              //..: Grupo de Valores Totais referentes ao ISSQN :..
              dm_nfe.nfdNFeDataSets.Campo('vServ_W18').Value := dm_nfe.cds_ISSQNTot.FieldByName('vServ').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vBC_W19').Value := dm_nfe.cds_ISSQNTot.FieldByName('vBC').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vISS_W20').Value := dm_nfe.cds_ISSQNTot.FieldByName('vISS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vPIS_W21').Value := dm_nfe.cds_ISSQNTot.FieldByName('vPIS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vCOFINS_W22').Value := dm_nfe.cds_ISSQNTot.FieldByName('vCOFINS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('retTrib_W23').Value := dm_nfe.cds_ISSQNTot.FieldByName('retTrib').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vRetPIS_W24').Value := dm_nfe.cds_ISSQNTot.FieldByName('vRetPIS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vRetCOFINS_W25').Value := dm_nfe.cds_ISSQNTot.FieldByName('vRetCOFINS').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vRetCSLL_W26').Value := dm_nfe.cds_ISSQNTot.FieldByName('vRetCSLL').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vBCIRRF_W27').Value := dm_nfe.cds_ISSQNTot.FieldByName('vBCIRRF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vIRRF_W28').Value := dm_nfe.cds_ISSQNTot.FieldByName('vIRRF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vBCRetPrev_W29').Value := dm_nfe.cds_ISSQNTot.FieldByName('vBCRetPrev').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vRetPrev_W30').Value := dm_nfe.cds_ISSQNTot.FieldByName('vRetPrev').AsString;
            end;
            //..: Grupo de Informações do Transporte da NF-e :..
            if not dm_nfe.cds_transp.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.Campo('modFrete_X02').Value := dm_nfe.cds_transp.FieldByName('modFrete').AsString;
              // ..: Grupo Transportador :..
              dm_nfe.nfdNFeDataSets.Campo('CNPJ_X04').Value := dm_nfe.cds_transp.FieldByName('CNPJ').AsString;
              dm_nfe.nfdNFeDataSets.Campo('CPF_X05').Value := dm_nfe.cds_transp.FieldByName('CPF').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xNome_X06').Value := dm_nfe.cds_transp.FieldByName('xNome').AsString;
              dm_nfe.nfdNFeDataSets.Campo('IE_X07').Value := dm_nfe.cds_transp.FieldByName('IE').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xEnder_X08').Value := dm_nfe.cds_transp.FieldByName('xEnder').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xMun_X09').Value := dm_nfe.cds_transp.FieldByName('xMun').AsString;
              dm_nfe.nfdNFeDataSets.Campo('UF_X10').Value := dm_nfe.cds_transp.FieldByName('UF').AsString;
              // ..: Grupo de Retenção do ICMS do transporte :..
              dm_nfe.nfdNFeDataSets.Campo('vServ_X12').Value := dm_nfe.cds_transp.FieldByName('vServ').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vBCRet_X13').Value := dm_nfe.cds_transp.FieldByName('vBCRet').AsString;
              dm_nfe.nfdNFeDataSets.Campo('pICMSRet_X14').Value := dm_nfe.cds_transp.FieldByName('pICMSRet').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vICMSRet_X15').Value := dm_nfe.cds_transp.FieldByName('vICMSRet').AsString;
              dm_nfe.nfdNFeDataSets.Campo('CFOP_X16').Value := dm_nfe.cds_transp.FieldByName('CFOP').AsString;
              dm_nfe.nfdNFeDataSets.Campo('cMunFG_X17').Value := dm_nfe.cds_transp.FieldByName('cMunFG').AsString;
              //** Grupo Veículo **
              dm_nfe.nfdNFeDataSets.Campo('placa_X19').Value := dm_nfe.cds_transp.FieldByName('placa').AsString;
              dm_nfe.nfdNFeDataSets.Campo('UF_X20').Value := dm_nfe.cds_transp.FieldByName('UF_v').AsString;
              dm_nfe.nfdNFeDataSets.Campo('RNTC_X21').Value := dm_nfe.cds_transp.FieldByName('RNTC').AsString;
              //dm_nfe.nfdNFeDataSets.Campo('vagao_x2').Value := dm_nfe.cds_transp.FieldByName('cMunFG').AsString;
              //dm_nfe.nfdNFeDataSets.Campo('balsa_x25b').Value := dm_nfe.cds_transp.FieldByName('cMunFG').AsString;
            end;

            if not dm_nfe.cds_nfeReboque.IsEmpty then begin
            // ..: Grupo Reboque :..
              dm_nfe.cds_nfeReboque.First;
              while not dm_nfe.cds_nfeReboque.Eof do begin
                dm_nfe.nfdNFeDataSets.IncluirReboque;
                dm_nfe.nfdNFeDataSets.Campo('placa_X23').Value := dm_nfe.cds_nfeReboque.FieldByName('placa').AsString;
                dm_nfe.nfdNFeDataSets.Campo('UF_X24').Value := dm_nfe.cds_nfeReboque.FieldByName('UF').AsString;
                dm_nfe.nfdNFeDataSets.Campo('RNTC_X25').Value := dm_nfe.cds_nfeReboque.FieldByName('RNTC').AsString;
                dm_nfe.nfdNFeDataSets.SalvarReboque;
                dm_nfe.cds_nfeReboque.Next;
              end;
            end;

            if not dm_nfe.cds_nfeVolumes.IsEmpty then begin
             // ..: Grupo Volumes :..
              dm_nfe.cds_nfeVolumes.First;
              while not dm_nfe.cds_nfeVolumes.Eof do begin
                dm_nfe.nfdNFeDataSets.IncluirVolume;
                dm_nfe.nfdNFeDataSets.Campo('qVol_X27').Value := dm_nfe.cds_nfeVolumes.FieldByName('qVol').AsString;
                dm_nfe.nfdNFeDataSets.Campo('esp_X28').Value := dm_nfe.cds_nfeVolumes.FieldByName('esp').AsString;
                dm_nfe.nfdNFeDataSets.Campo('marca_X29').Value := dm_nfe.cds_nfeVolumes.FieldByName('marca').AsString;
                dm_nfe.nfdNFeDataSets.Campo('nVol_X30').Value := dm_nfe.cds_nfeVolumes.FieldByName('nVol').AsString;
                dm_nfe.nfdNFeDataSets.Campo('pesoL_X31').Value := dm_nfe.cds_nfeVolumes.FieldByName('pesoL').AsString;
                dm_nfe.nfdNFeDataSets.Campo('pesoB_X32').Value := dm_nfe.cds_nfeVolumes.FieldByName('pesoB').AsString;
                if dm_nfe.cds_nfeLacre.RecordCount > 0 then begin
                  // ..: Grupo de Lacres :..
                  dm_nfe.cds_nfeLacre.Filtered := False;
                  dm_nfe.cds_nfeLacre.Filter := 'nVol = '+ dm_nfe.cds_nfeVolumes.FieldByName('qVol').AsString;
                  dm_nfe.cds_nfeLacre.Filtered := True;
                  if not dm_nfe.cds_nfeLacre.IsEmpty then begin
                    while not dm_nfe.cds_nfeLacre.Eof do begin
                      dm_nfe.nfdNFeDataSets.IncluirLacre;
                      dm_nfe.nfdNFeDataSets.Campo('nLacre_X34').Value := dm_nfe.cds_nfeLacre.FieldByName('nLacre').AsString;
                      dm_nfe.nfdNFeDataSets.SalvarLacre;
                      dm_nfe.cds_nfeLacre.Next;
                    end;
                  end;
                end;
                dm_nfe.nfdNFeDataSets.SalvarVolume;
                dm_nfe.cds_nfeVolumes.Next;
              end;
            end;
            // ..: Grupo de Cobrança :..
            if not dm_nfe.cds_Cobranca.IsEmpty then begin
            // .. : Grupo da Fatura :..
              dm_nfe.cds_Cobranca.First;
              while not dm_nfe.cds_Cobranca.Eof do begin
                dm_nfe.nfdNFeDataSets.Y.Append;
                dm_nfe.nfdNFeDataSets.Campo('nFat_Y03').Value := dm_nfe.cds_Cobranca.FieldByName('nFat').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vOrig_Y04').Value := dm_nfe.cds_Cobranca.FieldByName('vOrig').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vDesc_Y05').Value := dm_nfe.cds_Cobranca.FieldByName('vDesc').AsString;
                dm_nfe.nfdNFeDataSets.Campo('vLiq_Y06').Value := dm_nfe.cds_Cobranca.FieldByName('vLiq').AsString;
                if dm_nfe.cdsDuplic.RecordCount > 0 then begin
                  // ..: Grupo da Duplicata :..
                  dm_nfe.cdsDuplic.Filtered := False;
                  dm_nfe.cdsDuplic.Filter := 'nFat = '+ dm_nfe.cds_Cobranca.FieldByName('nFat').AsString;
                  dm_nfe.cdsDuplic.Filtered := True;
                  if not dm_nfe.cdsDuplic.IsEmpty then begin
                    dm_nfe.cdsDuplic.First;
                    while not dm_nfe.cdsDuplic.Eof do begin
                      if dm_nfe.nfdNFeDataSets.Y.State <> dsInsert then
                        dm_nfe.nfdNFeDataSets.Y.Append;
                      dm_nfe.nfdNFeDataSets.Campo('nDup_Y08').Value := dm_nfe.cdsDuplic.FieldByName('nDup').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('dVenc_Y09').Value := dm_nfe.cdsDuplic.FieldByName('dVenc').AsString;
                      dm_nfe.nfdNFeDataSets.Campo('vDup_Y10').Value := dm_nfe.cdsDuplic.FieldByName('vDup').AsString;
                      dm_nfe.nfdNFeDataSets.Y.Post;
                      dm_nfe.cdsDuplic.Next;
                    end;
                  end;
                end;
                if dm_nfe.nfdNFeDataSets.Y.State in [dsEdit,dsInsert] then
                  dm_nfe.nfdNFeDataSets.Y.Post;
                dm_nfe.cds_Cobranca.Next;
              end;
            end;
            //..: Grupo de Informações Adicionais :..
            if dm_nfe.cdsNfe_Cab.FieldByName('infAdFisco').AsString <> EmptyStr then
              dm_nfe.nfdNFeDataSets.Campo('infAdFisco_Z02').Value := RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('infAdFisco').AsString);
            if dm_nfe.cdsNfe_Cab.FieldByName('infCpl').AsString <> EmptyStr then
              dm_nfe.nfdNFeDataSets.Campo('infCpl_Z03').Value:= RemoveAcentos(dm_nfe.cdsNfe_Cab.FieldByName('infCpl').AsString);
            if dm_nfe.cdsNfe_Cab.FieldByName('xCampo').AsString <> EmptyStr then
              dm_nfe.nfdNFeDataSets.Campo('xCampo_Z05').Value := dm_nfe.cdsNfe_Cab.FieldByName('xCampo').AsString;
            if dm_nfe.cdsNfe_Cab.FieldByName('xTexto').AsString <> EmptyStr then
              dm_nfe.nfdNFeDataSets.Campo('xTexto_Z06').Value := dm_nfe.cdsNfe_Cab.FieldByName('xCampo').AsString;
            // ..: Grupo de Exportação :..
            if not dm_nfe.cds_Exporta.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.Campo('UFEmbarq_ZA02').Value := dm_nfe.cds_Exporta.FieldByName('UFEmbarq').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xLocEmbarq_ZA03').Value := dm_nfe.cds_Exporta.FieldByName('xLocEmbarq').AsString;
            end;
            // ..: Grupo de Compra :..
            if not dm_nfe.cds_compra.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.Campo('xNEmp_ZB02').Value := dm_nfe.cds_compra.FieldByName('xNEmp').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xPed_ZB03').Value := dm_nfe.cds_compra.FieldByName('xPed').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xCont_ZB04').Value := dm_nfe.cds_compra.FieldByName('xCont').AsString;
            end;
            if not dm_nfe.cds_CanaForDia.IsEmpty then begin
              dm_nfe.nfdNFeDataSets.Campo('safra_ZC02').Value := dm_nfe.cds_CanaForDia.FieldByName('safra').AsString;
              dm_nfe.nfdNFeDataSets.Campo('ref_ZC03').Value := dm_nfe.cds_CanaForDia.FieldByName('ref').AsString;
              dm_nfe.nfdNFeDataSets.Campo('dia_ZC05').Value := dm_nfe.cds_CanaForDia.FieldByName('dia').AsString;
              dm_nfe.nfdNFeDataSets.Campo('qtde_ZC06').Value := dm_nfe.cds_CanaForDia.FieldByName('qtde').AsString;
              dm_nfe.nfdNFeDataSets.Campo('qTotMes_ZC07').Value := dm_nfe.cds_CanaForDia.FieldByName('qTotMes').AsString;
              dm_nfe.nfdNFeDataSets.Campo('qTotAnt_ZC08').Value := dm_nfe.cds_CanaForDia.FieldByName('qTotAnt').AsString;
              dm_nfe.nfdNFeDataSets.Campo('qTotGer_ZC09').Value := dm_nfe.cds_CanaForDia.FieldByName('qTotGer').AsString;
              dm_nfe.nfdNFeDataSets.Campo('xDed_ZC11').Value := dm_nfe.cds_CanaForDia.FieldByName('xDed').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vDed_ZC12').Value := dm_nfe.cds_CanaForDia.FieldByName('vDed').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vFor_ZC13').Value := dm_nfe.cds_CanaForDia.FieldByName('vFor').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vTotDed_ZC14').Value := dm_nfe.cds_CanaForDia.FieldByName('vTotDed').AsString;
              dm_nfe.nfdNFeDataSets.Campo('vLiqFor_ZC15').Value := dm_nfe.cds_CanaForDia.FieldByName('vLiqFor').AsString;
            end;

            dm_nfe.nfdNFeDataSets.Salvar;
            vvNFE_XML := dm_nfe.nfdNFeDataSets.LoteNFe.GetText;
            vvNFE_XML := StringReplace(vvNFE_XML,'§','',[rfReplaceAll]);
            vvNFE_XML := dm_nfe.nfdNFe2.AssinarNota(vvNFE_XML);
            vvTrans := True;
            StatusMsg('Transmitindo NF-e para SEFAZ, nota :'+ vvNU_NFE +' Dest. '+ vvNOME_DEST +', Aguarde...',3);
            GeraEvento('Transmitindo NF-e para SEFAZ, nota :'+ vvNU_NFE +' Dest. '+ vvNOME_DEST);
            vvCHAVE_NFE := ObterNotaID(vvNFE_XML);
            GravaTransNfe;
            /// prepara DPEC
            if bContingencia then begin

              dm_nfe.nfdDPEC2.CriarDataSets;
              dm_nfe.nfdDPEC2.Incluir;
              dm_nfe.nfdDPEC2.Campo('cUF_AP06').Value := dm_nfe.cdsNfe_Cab.FieldByName('cUF').AsString;
              dm_nfe.nfdDPEC2.Campo('tpAmb_AP07').Value := dm_nfe.cdsNfe_Cab.FieldByName('tpAmb').AsString;
              dm_nfe.nfdDPEC2.Campo('verProc_AP08').Value := dm_nfe.cdsNfe_Cab.FieldByName('verProc').AsString;
              dm_nfe.nfdDPEC2.Campo('CNPJ_AP09').Value := dm_nfe.cdsNfe_Cab.FieldByName('CNPJ').AsString;
              dm_nfe.nfdDPEC2.Campo('IE_AP10').Value := dm_nfe.cdsNfe_Cab.FieldByName('IE').AsString;
              //-------------------------------------------------------------------------------------------
              dm_nfe.nfdDPEC2.IncluirNota;
              dm_nfe.nfdDPEC2.Campo('chNFe_AP12').Value := vvCHAVE_NFE;
              dm_nfe.nfdDPEC2.Campo('CNPJ_AP13').Value  := Trim(iff((vvTpAmbiente = 'H') and (dm_nfe.cdsNfe_Cab.FieldByName('CNPJ_d').AsString <> ''),'00000000000191',dm_nfe.cdsNfe_Cab.FieldByName('CNPJ_d').AsString));
              dm_nfe.nfdDPEC2.Campo('CPF_AP14').Value   := Trim(iff((vvTpAmbiente = 'H') and (dm_nfe.cdsNfe_Cab.FieldByName('CPF_d').AsString <> ''),'00000000191',dm_nfe.cdsNfe_Cab.FieldByName('CPF_d').AsString));
              dm_nfe.nfdDPEC2.Campo('UF_AP15').Value    := dm_nfe.cdsNfe_Cab.FieldByName('UF_d').AsString;
              dm_nfe.nfdDPEC2.Campo('vNF_AP16').Value   := dm_nfe.cds_ICMSTot.FieldByName('vNF').AsString;
              dm_nfe.nfdDPEC2.Campo('vICMS_AP17').Value := dm_nfe.cds_ICMSTot.FieldByName('vICMS').AsString;
              dm_nfe.nfdDPEC2.Campo('vST_AP18').Value   := dm_nfe.cds_ICMSTot.FieldByName('vST').AsString;
              dm_nfe.nfdDPEC2.SalvarNota;
              dm_nfe.nfdDPEC2.Salvar;

              vvDPEC_XML := StringReplace(dm_nfe.nfdDPEC2.XML_DPED.Text,#$D#$A,'',[rfReplaceAll,rfIgnoreCase]);

              if vvValida then
                if not ValidaXML(vvDPEC_XML,sMsg,vvDirShema) then begin
                  Application.ProcessMessages;
                  GeraEvento(sMsg);
                  if vvTrayAtivado then
                    ExibeMsgTray(sMsg,1);
                  Exit;
                end;

              vvDPEC_XML := dm_nfe.nfdNFe2.EnviarDPEC(vvDPEC_XML);
              GravaMsg(vvDPEC_XML);
              vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(vvDPEC_XML));
              vvDtaDPEC := formataDtaFb(ObterDataDPEC(vvDPEC_XML));
              vvNRegDPEC := ObterNroDPEC(vvDPEC_XML);

              Application.ProcessMessages;
              GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
              Application.ProcessMessages;
              StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);
              if vvTrayAtivado then
                ExibeMsgTray(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),0);

              Result := (StrToInt(vvCOD_SITUACAO) = 124) and (vvNRegDPEC <> EmptyStr);

              if (vvCOD_SITUACAO <> '124') and (vvNRegDPEC = EmptyStr) then
                Exit;

              vv_TP_TRANS := 'D';
              GravaTransNfe;
              GravaDPEC;
              GravaRegeitadas;

              if (vvCOD_SITUACAO = '124') and (vvNRegDPEC <> EmptyStr) then begin
                vvNRegDPEC := vvNRegDPEC + ' ' + FormatDateTime('DD/MM/YYYY HH:nn:ss',vvDtaDPEC);
                vvNFE_XML := RetXMLNFeDPEC(vvNFE_XML,vvNRegDPEC);
                vvImprimiu := 'N';
                if vvFLG_IMPR = 'S' then begin
                  case vvTP_IMPR[1] of
                    'V' : try
                            VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                          except
                            dm_nfe.nfdNFe2.VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                          end;
                    'I' : for impr := 1 to vvQtde_Impr do begin
                            try
                              ImprimirDanfe(vvNU_NFE,vvNFE_XML);
                            except
                              dm_nfe.nfdNFe2.ImprimirDanfe(vvNU_NFE,vvNFE_XML);
                            end;
                          end;
                    'A' : begin
                            //dm_nfe.nfdNFe2.ExportarDanfePdf(vvNFE_XML);
                            for impr := 1 to vvQtde_Impr do begin
                              try
                                ImprimirDanfe(vvNU_NFE,vvNFE_XML);
                              except
                                dm_nfe.nfdNFe2.ImprimirDanfe(vvNU_NFE,vvNFE_XML);
                              end;
                            end;
                            try
                              VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                            except
                              dm_nfe.nfdNFe2.VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                            end;
                          end;
                  end;
                end else begin
                  try
                    VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                  except
                    dm_nfe.nfdNFe2.VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                  end;
                end;
                vvImprimiu := 'S';
              end;
              Exit;
            end;
            ///

            if vvValida then
              if not ValidaXML(vvNFE_XML,sMsg,vvDirShema) then begin
                Application.ProcessMessages;
                GeraEvento(sMsg);
                //ResetDataSetNfe;
                if vvTrayAtivado then
                  ExibeMsgTray(sMsg,1);
                exit;
              end;

            vNFeXML := dm_nfe.nfdNFe2.EnviarNF(vvNU_NFE,vvNFE_XML);
            GravaMsg(vNFeXML);
            Application.ProcessMessages;
            vvnRecibo := ObterNroRecibo(vNFeXML);
            Application.ProcessMessages;
            vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(vNFeXML));
            GravaTransNfe;
            GravaRegeitadas;
            Application.ProcessMessages;
            GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral) + ' Recibo Nº ' + ObterNroRecibo(vNFeXML));
            Application.ProcessMessages;
            StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);
            if vvTrayAtivado then
              ExibeMsgTray(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),0);

            nCons := 0;
            while nCons <= 5 do begin
              StatusMsg('Consultando Status da NF-e na sefaz aguarde...',3);

              if vvCHAVE_NFE <> EmptyStr then
                vNFeXML := dm_nfe.nfdNFe2.ConsultarNF2_01(vvCHAVE_NFE);
              if GetCodMsgStatus(vNFeXML) >= 200 then
                vNFeXML := dm_nfe.nfdNFe2.ConsultarRecibo(vvnRecibo);
              Sleep(vvTmpMed);
              GravaMsg(vNFeXML);
              Application.ProcessMessages;
              GeraEvento(GetMsgSolicitacao(GetCodMsgStatus(vNFeXML),dm_Princial.cdsGeral));
              StatusMsg(GetMsgSolicitacao(GetCodMsgStatus(vNFeXML),dm_Princial.cdsGeral),0);
              Application.ProcessMessages;
              vvCOD_SITUACAO   := IntToStr(GetCodMsgStatus(vNFeXML));
              vvFLG_AUTORIZADA := iff(vvCOD_SITUACAO = '100','S','N');
              vv_TP_TRANS := 'N';
              vvDtaAutoriza := iff(vvCOD_SITUACAO = '100',formataDtaFb(ObterData(vNFeXML)),StrToDateDef(EmptyStr,0));
              vvHoraAut := iff(vvCOD_SITUACAO = '100',formataDtaFb(ObterData(vNFeXML)),StrToDateTimeDef(EmptyStr,0));
              iStatusMsg := iff(StrToInt(vvCOD_SITUACAO) > 200,1,0);

              if vvTrayAtivado then
                ExibeMsgTray(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),iStatusMsg);

              vvPROTOCOLO_ENVIO := EmptyStr;
              vvXML_PROTOCOLO := EmptyWideStr;
              vvXML_PROT_AUTO := EmptyWideStr;

              GravaTransNfe;

              if (StrToInt(vvCOD_SITUACAO) = 100) then begin
                Application.ProcessMessages;
                vvXML_PROTOCOLO := vNFeXML;
                //vvNFE_XML :=
                Application.ProcessMessages;
                vvPROTOCOLO_ENVIO := ObterNroProtocolo(vNFeXML);
                vvXML_PROTOCOLO := vNFeXML;
                vvXML_PROT_AUTO := vNFeXML;
                //
                //** grava dados do protocolo
                sXMLProtocolado := dm_nfe.nfdNFe2.RetXMLNFeProc(vvNFE_XML,vvXML_PROT_AUTO);
                GravaProtocolo(vvXML_PROTOCOLO);
                //
                sProt := '<nfeProc';
                if Pos(sProt,sXMLProtocolado) > 0 then
                  vvCOD_SITUACAO := '100'
                else
                  vvCOD_SITUACAO := '105';
                //
                GravaTransNfe;
                //
                Application.ProcessMessages;
                if (StrToInt(vvCOD_SITUACAO) = 100) and (vvPROTOCOLO_ENVIO <> EmptyStr) then begin
                  vvImprimiu := 'N';
                  if vvFLG_IMPR = 'S' then begin
                    case vvTP_IMPR[1]  of
                      //'P' : dm_nfe.nfdNFe2.ExportarDanfePdf(vvNFE_XML);
                      'I' : for impr := 1 to vvQtde_Impr do begin
                              try
                                ImprimirDanfe(vvNU_NFE,sXMLProtocolado);
                              except
                                dm_nfe.nfdNFe2.ImprimirDanfe(vvNU_NFE,sXMLProtocolado);
                              end;
                            end;
                      'A' : begin
                              //dm_nfe.nfdNFe2.ExportarDanfePdf(vvNFE_XML);
                              for impr := 1 to vvQtde_Impr do begin
                                try
                                  ImprimirDanfe(vvNU_NFE,sXMLProtocolado);
                                except
                                  dm_nfe.nfdNFe2.ImprimirDanfe(vvNU_NFE,sXMLProtocolado);
                                end;
                              end;
                              try
                                VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                              except
                                dm_nfe.nfdNFe2.VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                              end;
                            end;
                      'V' : begin
                              try
                                VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                              except
                                dm_nfe.nfdNFe2.VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                              end;
                            end;
                    end;
                  end else begin
                    try
                      VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                    except
                      dm_nfe.nfdNFe2.VisualizarDanfe(vvNU_NFE,sXMLProtocolado);
                    end;
                  end;
                  vvImprimiu := 'S';
                end;
                //
                if (StrToInt(vvCOD_SITUACAO) in [100,150]) and (Pos(sProt,sXMLProtocolado) > 0) then begin
                  sLstFXML := TStringList.Create;
                  sLstFXML.Add(sXMLProtocolado);
                  sLstFXML.SaveToFile(vvDirTmp +'\'+ vvCHAVE_NFE + '.xml');
                  vvFileXml := vvDirTmp +'\'+ vvCHAVE_NFE + '.xml';
                  if vvPdf then begin
                    ExportarDanfePdf(sXMLProtocolado);
                    vvFilePdf := vvDirTmp +'\'+ vvCHAVE_NFE + '.pdf';
                  end;
                  FreeAndNil(sLstFXML);
                end;
                //
                GravaTransNfe;
                //
                if dm_nfe.nfdNFe2.DiretorioExportacao <> EmptyStr  then begin
                  sLstXmlAp := TStringList.Create;
                  sLstXmlAp.Add(sXMLProtocolado);
                  sLstXmlAp.SaveToFile(dm_nfe.nfdNFe2.DiretorioExportacao + '\' + vvCHAVE_NFE + 'NF-e.xml');
                  FreeAndNil(sLstXmlAp);
                end;
                //
                Application.ProcessMessages;
                if vvTrayAtivado then
                  ExibeMsgTray(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),0);
              end;

              GravaRegeitadas;
              Application.ProcessMessages;
              if StrToInt(vvCOD_SITUACAO) in [103,104,105] then begin
                Inc(nCons);
                Sleep(vvTmpMed);
              end else if (StrToInt(vvCOD_SITUACAO) in [100,150]) and (Pos(sProt,sXMLProtocolado) > 0) then
                Break
              else if StrToInt(vvCOD_SITUACAO) >= 200 then begin
                GravaRegeitadas;
                exit;
              end;
            end;

            if vvEnvioAuto then
              if (StrToInt(vvCOD_SITUACAO) in [100,150]) then
                if vvEmailDest <> EmptyStr then
                  if ValidaEmail(vvEmailDest) and FileExists(vvFileXml) then begin
                    SendEmail;
                    if stEmail <> nil then
                      if stEmail.Count > 0 then begin
                        for iE := 0 to stEmail.Count -1 do begin
                          if Trim(stEmail.Strings[iE]) <> EmptyStr then begin
                            vvEmailDest := stEmail.Strings[iE];
                            SendEmail;
                          end;
                        end;
                      end;
                  end else begin
                    GeraEvento('Email do cliente inválido');
                    StatusMsg('Email do cliente inválido',0);
                    vvEmailDest := InputBox('Email','Entre com e-mail válido para envio da nfe(xml)','');
                    if ValidaEmail(vvEmailDest) then
                      SendEmail
                    else
                      Application.MessageBox('Email inválido!','Atenção',MB_OK + MB_ICONWARNING);
                  end;

            Result := (StrToInt(vvCOD_SITUACAO) in [100,150,124,103,104,105]);
            //GravaTransNfe;
            GravaRegeitadas;
            vvTrans := False;
            //ResetDataSetNfe;

          end;
          StatusMsg('Aguardando liberação do WebService. apox. 1 mim.',0);
        end;
    finally
      // limpa variaveis
      vNFeXML := EmptyWideStr;
      vvXML_PROT_AUTO := EmptyWideStr;
      vvXML_PROTOCOLO := EmptyWideStr;
      sXMLProtocolado := EmptyWideStr;
      //
      dm_nfe.ClearCdsNfe;
    end;
  except
    on E : Exception do begin
      raise Exception.Create('Ocoreu o erro '+ #13 + E.Message + #13 +
                             ', na transmisção para SEFAZ da NF '+ vvNU_NFE);
      ResetDataSetNfe;
      Result := False;
    end;
  end;

end;

function VerificaStatusServ : Integer;
var
  sXml : WideString;
begin
  sXml := dm_nfe.nfdNFe2.StatusDoServico;
  Result := GetCodMsgStatus(sXml);
end;

procedure ResetDataSetNfe;
begin
dm_nfe.ClearCdsNfe;
{*********************************
  if not dm_nfe.cdsNfe_Cab.IsEmpty then begin
   dm_nfe.cdsNfe_Cab.First;
    while not dm_nfe.cdsNfe_Cab.Eof do begin
      dm_nfe.cdsNfe_Cab.Delete;
      dm_nfe.cdsNfe_Cab.Next;
    end;
    dm_nfe.cdsNfe_Cab.Close;
  end;
  if not dm_nfe.cds_NfAvulsa.IsEmpty then begin
    dm_nfe.cds_NfAvulsa.First;
    while not dm_nfe.cds_NfAvulsa.Eof do begin
      dm_nfe.cds_NfAvulsa.Delete;
      dm_nfe.cds_NfAvulsa.Next;
    end;
    dm_nfe.cds_NfAvulsa.Close;
  end;
  if not dm_nfe.cds_L_Retirada.IsEmpty then begin
    dm_nfe.cds_L_Retirada.First;
    while not dm_nfe.cds_L_Retirada.Eof do begin
      dm_nfe.cds_L_Retirada.Delete;
      dm_nfe.cds_L_Retirada.Next;
    end;
    dm_nfe.cds_L_Retirada.Close
  end;

  if not dm_nfe.cds_L_Entrega.IsEmpty then begin
    dm_nfe.cds_L_Entrega.First;
    while not dm_nfe.cds_L_Entrega. do


    dm_nfe.cds_L_Entrega.EmptyDataSet;
    dm_nfe.cds_L_Entrega.Close;

  end;
  if not dm_nfe.cdsNfeItens.IsEmpty then
    dm_nfe.cdsNfeItens.EmptyDataSet;
  dm_nfe.cdsNfeItens.Close;
  if not dm_nfe.cds_DI.IsEmpty then
    dm_nfe.cds_DI.EmptyDataSet;
  dm_nfe.cds_DI.Close;
  if not dm_nfe.cds_aDI.IsEmpty then
    dm_nfe.cds_aDI.EmptyDataSet;
  dm_nfe.cds_aDI.Close;
  if not dm_nfe.cds_NFref.IsEmpty then
    dm_nfe.cds_NFref.EmptyDataSet;
  dm_nfe.cds_NFref.Close;
  if not dm_nfe.cds_refNFP.IsEmpty then
    dm_nfe.cds_refNFP.EmptyDataSet;
  dm_nfe.cds_refNFP.Close;
  if not dm_nfe.cds_refECF.IsEmpty then
    dm_nfe.cds_refECF.EmptyDataSet;
  dm_nfe.cds_refECF.Close;
  if not dm_nfe.cds_IPI.IsEmpty then
    dm_nfe.cds_IPI.EmptyDataSet;
  dm_nfe.cds_IPI.Close;
  if not dm_nfe.cds_II.IsEmpty then
    dm_nfe.cds_II.EmptyDataSet;
  dm_nfe.cds_II.Close;
  if not dm_nfe.cds_ISSQN.IsEmpty then
    dm_nfe.cds_ISSQN.EmptyDataSet;
  dm_nfe.cds_ISSQN.Close;
  if not dm_nfe.cds_PIS.IsEmpty then
    dm_nfe.cds_PIS.EmptyDataSet;
  dm_nfe.cds_PIS.Close;
  if not dm_nfe.cds_COFINS.IsEmpty then
    dm_nfe.cds_COFINS.EmptyDataSet;
  dm_nfe.cds_COFINS.Close;
  if not dm_nfe.cds_ICMSTot.IsEmpty then
    dm_nfe.cds_ICMSTot.EmptyDataSet;
  dm_nfe.cds_ICMSTot.Close;
  if not dm_nfe.cds_ISSQNTot.IsEmpty then
    dm_nfe.cds_ISSQNTot.EmptyDataSet;
  dm_nfe.cds_ISSQNTot.Close;
  if not dm_nfe.cds_veicProd.IsEmpty then
    dm_nfe.cds_veicProd.EmptyDataSet;
  dm_nfe.cds_veicProd.Close;
  if not dm_nfe.cds_NfeMed.IsEmpty then
    dm_nfe.cds_NfeMed.EmptyDataSet;
  dm_nfe.cds_NfeMed.Close;
  if not dm_nfe.cds_NfeArma.IsEmpty then
    dm_nfe.cds_NfeArma.EmptyDataSet;
  dm_nfe.cds_NfeArma.Close;
  if not dm_nfe.cds_nfeReboque.IsEmpty then
    dm_nfe.cds_nfeReboque.EmptyDataSet;
  dm_nfe.cds_nfeReboque.Close;
  if not dm_nfe.cds_nfeVolumes.IsEmpty then
    dm_nfe.cds_nfeVolumes.EmptyDataSet;
  dm_nfe.cds_nfeVolumes.Close;
  if not dm_nfe.cds_nfeLacre.IsEmpty then
    dm_nfe.cds_nfeLacre.EmptyDataSet;
  dm_nfe.cds_nfeLacre.Close;
  if not dm_nfe.cds_transp.IsEmpty then
    dm_nfe.cds_transp.EmptyDataSet;
  dm_nfe.cds_transp.Close;
  if not dm_nfe.cds_compra.IsEmpty then
    dm_nfe.cds_compra.EmptyDataSet;
  dm_nfe.cds_compra.Close;
  if not dm_nfe.cds_nfeProcRef.IsEmpty then
    dm_nfe.cds_nfeProcRef.EmptyDataSet;
  dm_nfe.cds_nfeProcRef.Close;
  if not dm_nfe.cds_CanaForDia.IsEmpty then
    dm_nfe.cds_CanaForDia.EmptyDataSet;
  dm_nfe.cds_CanaForDia.Close;
  if not dm_nfe.cds_nfeDeduc.IsEmpty then
    dm_nfe.cds_nfeDeduc.EmptyDataSet;
  dm_nfe.cds_nfeDeduc.Close;
  if not dm_nfe.cds_Cobranca.IsEmpty then
    dm_nfe.cds_Cobranca.EmptyDataSet;
  dm_nfe.cds_Cobranca.Close;
  if not dm_nfe.cds_nfeDuplicata.IsEmpty then
    dm_nfe.cds_nfeDuplicata.EmptyDataSet;
  dm_nfe.cds_nfeDuplicata.Close;
  if not dm_nfe.cds_Exporta.IsEmpty then
    dm_nfe.cds_Exporta.EmptyDataSet;
  dm_nfe.cds_Exporta.Close;
**************************************************}
end;

function ObterNotaID(const aXml: WideString): string;
var
  _Posini: integer;
  aTag: WideString;
begin
  Result := '';
  aTag := '<infNFe Id="NFe';
  _Posini := POS(aTag, aXML);
  if (_Posini > 0) then
  begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini, 44);
  end;
end;

function ObterNroRecibo(const aXml: WideString): string;
var
  _Posini, _Posfim: integer;
  aTag, aEndTag: WideString;
begin
  Result := '';
  aTag := '<nRec';
  aEndTag := '</nRec';
  _Posini := POS(aTag, aXML);
  _Posfim := POS(aEndTag, aXML);
  if (_Posini > 0) then begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini + 1, (_PosFim - _PosIni) - 1);
  end;
end;

function ValidaXML(XML: AnsiString; out sMsg: AnsiString; Const APathSchemas: String = ''): Boolean;
  function tratamsg(Str : String) : String;
  var
     I,
     iPini,
     iPfim : integer;
     sAux : String;
  begin
    for I := 0 to Length(Str)  do
      begin
        if Str[I] = '}' then
          iPini := I+1;
      end;
    sAux := Copy(Str,iPini,Pos(' ',Str)-2);
    sAux := StringReplace(Str,'{http://www.portalfiscal.inf.br/nfe}','',[rfReplaceAll,rfIgnoreCase]);
    Result := 'REJEIÇÃO: ' + sAux + ' Inválido ou não preenchido!';
  end;
var
  DOMDocument: IXMLDOMDocument2;
  ParseError: IXMLDOMParseError;
  Schema: XMLSchemaCache50;
  Tipo, I : Integer;
  schema_filename : String;
begin
  Try
    I := pos('<infNFe',XML) ;
    Tipo := 1;
    if I = 0  then
    begin
      I := pos('<infCanc',XML) ;
      if I > 0 then
         Tipo := 2
      else
      begin
        I := pos('<infInut',XML) ;
        if I > 0 then
          Tipo := 3
        else
          Tipo := 4;
      end;
    end;
    //.::-------------------------------------------------------------------------
    DOMDocument := CoDOMDocument50.Create;
    DOMDocument.async := False;
    DOMDocument.resolveExternals := False;
    DOMDocument.validateOnParse := True;
    DOMDocument.loadXML(XML);

    Schema := CoXMLSchemaCache50.Create;

    if not DirectoryExists(APathSchemas) then
      raise Exception.Create('Diretório de Schemas não encontrado!' + sLineBreak);

    case Tipo of
      1 : schema_filename := APathSchemas + 'nfe_v2.00.xsd';
      2 : schema_filename := APathSchemas + 'cancNFe_v2.00.xsd';
      3 : schema_filename := APathSchemas + 'inutNFe_v2.00.xsd';
      4 : schema_filename := APathSchemas + 'envDPEC_v1.01.xsd';
    end;
    //.::-------------------------------------------------------------------------
    if Not FileExists(schema_filename) then
      raise Exception.Create('Arquivo ' + schema_filename + ' não encontrado');

    Schema.add('http://www.portalfiscal.inf.br/nfe', schema_filename );

    DOMDocument.schemas := Schema;
    ParseError := DOMDocument.validate;
    Result := (ParseError.errorCode = 0);

    sMsg := ParseError.reason;
    if Length(Trim(sMsg)) > 0 then
      sMsg := tratamsg(sMsg);

    //sMsg := sMsg + ' ' + ParseError.reason;

    DOMDocument := nil;
    ParseError := nil;
    Schema := nil;
  Except on Ex : Exception do
    begin
      if sMsg = '' then
        Raise  exception.Create('Sr. Operador. Por gentileza, informe ao Suporte.' + #13 + #13 +
                                '  - Problemas com o validador do Schema XML (Validação HCI).' + #13 + #13 +
                                '  Mensagem: ' + Ex.Message);
    End;
  End;
end;

function ObterNroProtocolo(const aXml: WideString): string;
var
    _Posini, _Posfim: integer;
    aTag, aEndTag: WideString;
begin
  Result := '';
  aTag := '<nProt';
  aEndTag := '</nProt';
  _Posini := POS(aTag, aXML);
  _Posfim := POS(aEndTag, aXML);
  if (_Posini > 0) then begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini + 1, (_PosFim - _PosIni) - 1);
  end;
end;

procedure GravaTransNfe;
var
  Trans : TTransactionDesc;
  bAutorizada : Boolean;
  vCodSituacaoold : Integer;
begin
  try
    if Trans.TransactionID <> 1 then
      if dm_Princial.SQLConnect.InTransaction then
        dm_Princial.SQLConnect.Commit(Trans);

    Trans.TransactionID := 1;
    Trans.IsolationLevel := xilREADCOMMITTED;
    dm_Princial.SQLConnect.StartTransaction(Trans);

    if ExisteNF(StrToFloat(vvNU_NFE),dm_Princial.cdsAux) then
      dm_nfe.dpsNfe_Trans.DataSet := dm_nfe.qryInsert_nfe
    else
      dm_nfe.dpsNfe_Trans.DataSet := dm_nfe.qryUpdate_nfe;
    dm_nfe.cdsNfe_Trans.FetchParams;
    bAutorizada := False;
    if dm_nfe.cdsNfe_Trans.Params.Items[0].Name = 'ID_NFE_TRANS' then
      dm_nfe.cdsNfe_Trans.Params.ParamByName('ID_NFE_TRANS').Value := GetAutoNum('TB_NFE_TRANS','ID_NFE_TRANS');

    dm_nfe.cdsNfe_Trans.Params.ParamByName('DTA_EMISSAO').Value := iff(DateToStr(vvDtaEmissao) <> '30/12/1899',vvDtaEmissao,Date);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('DTA_AUTORIZACAO').Value := iff(vvDtaAutoriza > 0,vvDtaAutoriza,null);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('HORA_AUTO').Value := vvHoraAut;
    dm_nfe.cdsNfe_Trans.Params.ParamByName('DTA_CANCELAMENTO').Value := null;
    dm_nfe.cdsNfe_Trans.Params.ParamByName('NU_NFE').Value  := vvNU_NFE;
    dm_nfe.cdsNfe_Trans.Params.ParamByName('SERIE').Value := vvSERIE;
    dm_nfe.cdsNfe_Trans.Params.ParamByName('CPF_CNPJ').Value := vvCPF_CNPJ;
    dm_nfe.cdsNfe_Trans.Params.ParamByName('NOME_DEST').Value := Copy(vvNOME_DEST,1,30);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('CHAVE_NFE').Value := vvCHAVE_NFE;
    dm_nfe.cdsNfe_Trans.Params.ParamByName('FLG_IMPR').Value := iff(vvImprimiu <> EmptyStr,vvImprimiu,null);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('FLG_AUTORIZADA').Value := iff(vvFLG_AUTORIZADA <> EmptyStr,vvFLG_AUTORIZADA,null);

    if (vvCOD_SITUACAO <> EmptyStr) then
      dm_nfe.cdsNfe_Trans.Params.ParamByName('COD_SITUACAO').Value := iff((not (StrToIntDef(vvCOD_SITUACAO,108) in [108,109])),StrToInt(vvCOD_SITUACAO),dm_nfe.cdsNfe_Trans.Params.ParamByName('COD_SITUACAO').Value)
    else
      dm_nfe.cdsNfe_Trans.Params.ParamByName('COD_SITUACAO').Value := 200;

    dm_nfe.cdsNfe_Trans.Params.ParamByName('PROTOCOLO_ENVIO').Value := iff(vvPROTOCOLO_ENVIO <> EmptyStr,vvPROTOCOLO_ENVIO,null);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('PROTOCOLO_CANCEL').Value := iff(vvXML_CancProt <> EmptyWideStr,ObterNroProtocolo(vvXML_CancProt),null);

    if StrToIntDef(vvCOD_SITUACAO,201) < 200 then begin
      if (GetCodMsgStatus(vvXML_PROTOCOLO) = 100) and (GetCodMsgStatus(vvNFE_XML) <> 100) then
        if Trim(sXMLProtocolado) = EmptyWideStr then
          sXMLProtocolado := dm_nfe.nfdNFe2.RetXMLNFeProc(vvNFE_XML,vvXML_PROT_AUTO);
      bAutorizada := (GetCodMsgStatus(sXMLProtocolado) = 100);
    end;

    dm_nfe.cdsNfe_Trans.Params.ParamByName('NFE_XML_CANC').Value := iff(StrToIntDef(vvCOD_SITUACAO,0) = 101,vvXML_CancProt,null);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('NFE_XML').Value := vvNFE_XML;
    dm_nfe.cdsNfe_Trans.Params.ParamByName('XML_PROT_AUTO').Value := iff(vvXML_PROT_AUTO <> EmptyWideStr,vvXML_PROT_AUTO,null);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('FLG_TP_TRANS').Value := iff(vv_TP_TRANS = EmptyStr,'N',vv_TP_TRANS);
    dm_nfe.cdsNfe_Trans.Params.ParamByName('NRECIBO').Value := iff(vvnRecibo <> EmptyStr,vvnRecibo,null);

    dm_nfe.cdsNfe_Trans.Execute;
    dm_Princial.SQLConnect.Commit(Trans);

  except
    on E : Exception do begin
       dm_Princial.SQLConnect.Rollback(Trans);
       if vvTrayAtivado then
         ExibeMsgTray('Erro ao gravar as informações, da nfe no banco de dados. Erro Original.:'+ E.Message,2)
       else
         Raise Exception.Create('Erro ao gravar as informações, da nfe no banco de dados. Erro Original.:'+ E.Message);
    end;
  end;
end;

function formataDtaFb(sDta : String) : TDateTime;
var
  sAno,
  sMes,
  sDia,
  sData : String;
begin
  sAno := Copy(sDta,1,4);
  sMes := Copy(sDta,6,2);
  sDia := Copy(sDta,9,2);
  sData := sDia + '/' + sMes + '/' + sAno;
  if Length(Trim(sDta)) > 10 then
    sData := sData + Copy(sDta,11,10);
  Result := StrToDateTimeDef(sData,0);
end;

function ObterData(const aXml: String): string;
var
  _Posini, _Posfim: integer;
  aTag, aEndTag: String;
  sAux,
  dtRec,
  dtEve : String;
begin
  dtRec := '<dhRecbto';
  dtEve := '<dhRegEvento';
  Result := EmptyStr;
  if Pos(dtRec,aXml) > 0 then begin
    aTag := '<dhRecbto';
    aEndTag := '</dhRecbto';
  end else if Pos(dtEve,aXml) > 0 then begin
    aTag := '<dhRegEvento';
    aEndTag := '</dhRegEvento';
  end;
  _Posini := POS(aTag, aXML);
  _Posfim := POS(aEndTag, aXML);
  if (_Posini > 0) then begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini + 1, (_PosFim - _PosIni) - 1);
    //Result := Copy(Result,1,10);
    sAux := Copy(Result,1,10);
    sAux := sAux +' '+ Copy(Result,Pos('T',Result)+1,08);
    Result := sAux;
  end;

end;

procedure CancelaNFe(idNFe,nProtocolo,Justificativa: String);
var
   sXML : WideString;
   sDta : String;
begin
  GeraEvento('Enviando solicitação de cancelamento, aguarde.');
  Application.ProcessMessages;
  StatusMsg('Enviando solicitação de cancelamento, aguarde.',3);
  Application.ProcessMessages;

  sXML := dm_nfe.nfdNFe2.CancelarNF(idNFe,nProtocolo,Justificativa,sDta);
  vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(sXML));
  vvPROTOCOLO_CANCEL := ObterNroProtocolo(sXML);
  vvDtaCancela := formataDtaFb(ObterData(sXML));
  vvXML_Canc := sXML;
  if StrToInt(vvCOD_SITUACAO) = 101 then begin
    vvXML_CancProt := sXML;
    GravaNFeCanc;
  end;

  GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
  Application.ProcessMessages;
  StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);
  Application.ProcessMessages;

  if StrToInt(vvCOD_SITUACAO) = 101 then
    msgInformation(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),'Cancelamento')
  else
    msgWarning(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
end;

procedure GravaNFeCanc;
begin
  try
    dm_Princial.cdsGeral.Close;
    dm_Princial.cdsGeral.CommandText := 'UPDATE TB_NFE_TRANS SET DTA_CANCELAMENTO = COALESCE(:DTA_CANC,DTA_CANCELAMENTO) '+
                                                                ',COD_SITUACAO = COALESCE(:COD_SIT,COD_SITUACAO) '+
                                                                ',PROTOCOLO_CANCEL = COALESCE(:PROT_CANCEL,PROTOCOLO_CANCEL) '+
                                                                ',NFE_XML_CANC = COALESCE(:NFE_XML,NFE_XML_CANC)'+
                                        'WHERE CAST(NU_NFE AS NUMERIC(09)) = :NU_NFE AND  CHAVE_NFE = :CHAVE_NFE';
    dm_Princial.cdsGeral.Params.ParamByName('DTA_CANC').AsDate := vvDtaCancela;
    dm_Princial.cdsGeral.Params.ParamByName('COD_SIT').AsInteger := StrToInt(vvCOD_SITUACAO);
    dm_Princial.cdsGeral.Params.ParamByName('PROT_CANCEL').AsString := vvPROTOCOLO_CANCEL;
    dm_Princial.cdsGeral.Params.ParamByName('NFE_XML').AsWideString := vvXML_CancProt;
    dm_Princial.cdsGeral.Params.ParamByName('NU_NFE').AsString := vvNU_NFE;
    dm_Princial.cdsGeral.Params.ParamByName('CHAVE_NFE').AsString := vvCHAVE_NFE;
    dm_Princial.cdsGeral.Execute;
  except
    on E : Exception do begin
      Raise Exception.Create('Erro ao gravar as informações, da nfe no banco de dados. Erro Original.:'+ E.Message);
    end;
  end;

end;

procedure GravaDPEC;
begin
  try
    if not dm_nfe.cdsDPEC.Active then
      dm_nfe.cdsDPEC.Open;
    dm_nfe.cdsDPEC.Insert;
    dm_nfe.cdsDPEC.FieldByName('NU_NFE').AsString := vvNU_NFE;
    dm_nfe.cdsDPEC.FieldByName('CHAVE_NFE').AsString := vvCHAVE_NFE;
    dm_nfe.cdsDPEC.FieldByName('PROTOCOLO_DPEC').AsString := vvNRegDPEC;
    dm_nfe.cdsDPEC.FieldByName('DTA_DPEC').AsDateTime := vvDtaDPEC;
    dm_nfe.cdsDPEC.FieldByName('DPEC_XML').AsWideString := vvDPEC_XML;
    dm_nfe.cdsDPEC.Post;
    dm_nfe.cdsDPEC.ApplyUpdates(-1);
  except
    on E : Exception do begin
      if vvTrayAtivado then
        ExibeMsgTray('Erro ao gravar as informações, da nfe no banco de dados. Erro Original.:'+ E.Message,2)
      else
        Raise Exception.Create('Erro ao gravar as informações, da nfe no banco de dados. Erro Original.:'+ E.Message);
    end;
  end;
end;

function ObterDataDPEC(const aXml: WideString): string;
var
  _Posini, _Posfim: integer;
  aTag, aEndTag: WideString;
  sAux : String;
begin
  Result := '';
  aTag := '<dhRegDPEC';
  aEndTag := '</dhRegDPEC';
  _Posini := POS(aTag, aXML);
  _Posfim := POS(aEndTag, aXML);
  if (_Posini > 0) then begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini + 1, (_PosFim - _PosIni) - 1);
    sAux := Copy(Result,1,10);
    sAux := sAux +' '+ Copy(Result,Pos('T',Result)+1,08);
    Result := sAux;
  end;
end;

function ObterNroDPEC(const aXml: WideString): string;
var
    _Posini, _Posfim: integer;
    aTag, aEndTag: WideString;
begin
  Result := '';
  aTag := '<nRegDPEC';
  aEndTag := '</nRegDPEC';
  _Posini := POS(aTag, aXML);
  _Posfim := POS(aEndTag, aXML);
  if (_Posini > 0) then
  begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini + 1, (_PosFim - _PosIni) - 1);
  end;
end;

function RetXMLNFeDPEC(wXML,nDPEC : WideString) : WideString;
var
  sXML : WideString;
  sxmlFim : WideString;
begin
  sXML := Copy(wXML,1,Pos(WideString('</NFe>'),wXML)-1);
  sxmlFim := Copy(wXML,Pos(WideString('</NFe>'),wXML),Length(wXML));
  sXML := sXML + '<DPEC><nRegDPEC>' + nDPEC + '</nRegDPEC></DPEC>' + sxmlFim;
  Result := sXML;
end;

procedure TransNFePendente;
var
  nCons,iCodStatus : Integer;
begin

  dm_Princial.cdsGeral.Close;
  dm_Princial.cdsGeral.CommandText := 'SELECT CHAVE_NFE, NU_NFE, NFE_XML FROM TB_NFE_TRANS WHERE COD_SITUACAO = 124';
  dm_Princial.cdsGeral.Open;
  if not dm_Princial.cdsGeral.IsEmpty then begin
    {
    if iCodStatus <> 107 then begin
      if vvTrayAtivado then
        ExibeMsgTray(GetMsgSolicitacao(iCodStatus,dm_Princial.cdsGeral),1);
      Exit;
    end;
    }
    while not dm_Princial.cdsGeral.Eof do begin
      vvCHAVE_NFE := dm_Princial.cdsGeral.FieldByName('CHAVE_NFE').AsString;
      vvNU_NFE    := dm_Princial.cdsGeral.FieldByName('NU_NFE').AsString;
      vvNFE_XML   := dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString;

      vNFeXML := dm_nfe.nfdNFe2.EnviarNF(vvNU_NFE,vvNFE_XML);
      Application.ProcessMessages;
      vvnRecibo := ObterNroRecibo(vNFeXML);
      Application.ProcessMessages;
      vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(vNFeXML));
      GravaTransNfe;
      Application.ProcessMessages;
      GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral) + ' Recibo Nº ' + ObterNroRecibo(vNFeXML));
      Application.ProcessMessages;
      StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);

      nCons := 0;
      while nCons <= 5 do begin
        StatusMsg('Consultando Status da NF-e na sefaz aguarde...',3);

        if vvCHAVE_NFE <> EmptyStr then
          vNFeXML := dm_nfe.nfdNFe2.ConsultarNF2_01(vvCHAVE_NFE)
        else
          vNFeXML := dm_nfe.nfdNFe2.ConsultarRecibo(vvnRecibo);

        Application.ProcessMessages;
        GeraEvento(GetMsgSolicitacao(GetCodMsgStatus(vNFeXML),dm_Princial.cdsGeral));
        Application.ProcessMessages;
        vvCOD_SITUACAO   := IntToStr(GetCodMsgStatus(vNFeXML));
        vvFLG_AUTORIZADA := iff(StrToInt(vvCOD_SITUACAO) in [100,150],'S','N');
        vv_TP_TRANS := 'N';
        vvDtaAutoriza := iff(StrToInt(vvCOD_SITUACAO) in [100,150],formataDtaFb(ObterData(vNFeXML)),StrToDateDef(EmptyStr,0));
        vvHoraAut := iff(StrToInt(vvCOD_SITUACAO) in [100,150],formataDtaFb(ObterData(vNFeXML)),StrToDateTimeDef(EmptyStr,0));

        if (StrToInt(vvCOD_SITUACAO) in [100,150]) then begin
          ExibeMsgTray(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),1);
          Application.ProcessMessages;
          //vvNFE_XML := dm_nfe.nfdNFe2.RetXMLNFeProc(vvNFE_XML,vvnRecibo,vvXML_PROTOCOLO);
          Application.ProcessMessages;
          vvPROTOCOLO_ENVIO := ObterNroProtocolo(vNFeXML);
          Application.ProcessMessages;
          GravaTransNfe;
          Break;
        end;
        GravaTransNfe;
        Sleep(vvTmpMed);
      end;
      dm_Princial.cdsGeral.Next;
    end;
  end;
end;

procedure TransCCe;
var
  sXML : WideString;
  sXMLcce : String;
const
  StrAmbiente: array[TTipoAmbiente] of string = ('2', '1');
begin
  dm_nfe.NfdNFECCe.CriarDataSet;
 try
  try
    vvIDLOTE := FormatFloat('000000000000000',GetAutoNum('TB_NFE_CCE','IDLOTE'));
    vvVERSAO_L := '1.00';
    vvVERSAO_E := '1.00';
    vvCORGAO := IntToStr(GetValueCmb(frmPrincipal.frmcce1.cmbUF));
    vvDHEVENTO := FormatDateTime('DD/MM/YYYY',NOW);
    vvTPEVENTO := '110110';
    vvNSEQEVENTO := IntToStr(GetAutoNum('TB_NFE_CCE','NSEQEVENTO'));
    vvVEREVENTO := '1.00';
    vvDESCEVENTO := 'Carta de Correcao';
    vvXCORRECAO := RemoveEspecial(RemoveAcentos(frmPrincipal.frmcce1.mmCorrecao.Text));
    vvCONDUSO := RemoveEspecial(RemoveAcentos(frmPrincipal.frmcce1.mmCodUso.Text));
    vvCHAVE_NFE := frmPrincipal.frmcce1.edtChave.Text;
    //-----------------------------------------------------------------------------
    dm_nfe.NfdNFECCe.IncluirCCe;
    dm_nfe.NfdNFECCe.Campo['versao_HP02'].AsString := vvVERSAO_L;
    dm_nfe.NfdNFECCe.Campo['idLote_HP03'].AsString := vvIDLOTE;
    dm_nfe.NfdNFECCe.IncluirEvento;
    dm_nfe.NfdNFECCe.Campo['versao_HP05'].AsString := vvVERSAO_E;
    dm_nfe.NfdNFECCe.Campo['Id_HP07'].AsString := 'ID';
    dm_nfe.NfdNFECCe.Campo['cOrgao_HP08'].AsString := vvCORGAO;
    dm_nfe.NfdNFECCe.Campo['tpAmb_HP09'].AsString := StrAmbiente[dm_nfe.nfdNFe2.Ambiente];
    dm_nfe.NfdNFECCe.Campo['CNPJ_HP10'].AsString := vvCNPJ;
    //dm_nfe.NfdNFECCe.Campo['CPF_HP11'].AsString := vvCPF;
    dm_nfe.NfdNFECCe.Campo['chNFe_HP12'].AsString := vvCHAVE_NFE;
    dm_nfe.NfdNFECCe.Campo['dhEvento_HP13'].AsString := Format(FormatDateTime('YYYY-MM-DD"T"HH:NN:SS"%s"', Now),[GetTZD]);
    dm_nfe.NfdNFECCe.Campo['tpEvento_HP14'].AsString := vvTPEVENTO;
    dm_nfe.NfdNFECCe.Campo['nSeqEvento_HP15'].AsString := vvNSEQEVENTO;
    dm_nfe.NfdNFECCe.Campo['verEvento_HP16'].AsString := vvVEREVENTO;
    dm_nfe.NfdNFECCe.Campo['versao_HP18'].AsString := vvVEREVENTO;
    dm_nfe.NfdNFECCe.Campo['descEvento_HP19'].AsString := vvDESCEVENTO;
    dm_nfe.NfdNFECCe.Campo['xCorrecao_HP20'].AsString := vvXCORRECAO;
    dm_nfe.NfdNFECCe.Campo['xCondUso_HP20a'].AsString := xCondUso;
    dm_nfe.NfdNFECCe.SalvarEvento;
    dm_nfe.NfdNFECCe.SalvarCCe;

    XML_CCE := dm_nfe.nfdNFe2.AssinarCCe(dm_nfe.NfdNFECCe.ConverterDataSetParaXml);
    XML_CCE :=  RemoveEspacosEntreTags(XML_CCE);
    sXMLcce := XML_CCE;
    StartWaint('Enviando carta de correção para SEFAZ' + #10#13 + 'Aguarde...');
    sXML := dm_nfe.nfdNFe2.EnviaCCe(sXMLcce);
    Application.ProcessMessages;
    vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(sXML));
    dm_nfe.nfdNFe2.ProcEvento(XML_CCE,sXML,XML_CCEProt);
    if StrToInt(vvCOD_SITUACAO) = 135  then
      GravaCCe;

    Application.ProcessMessages;
    GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
    Application.ProcessMessages;
    StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);

    if StrToInt(vvCOD_SITUACAO) = 135 then
      msgInformation(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),'Cancelamento')
    else
      msgWarning(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));

  except
    on E : Exception do begin
      EndWaint;
      dm_nfe.NfdNFECCe.LiberarDataSet;
      Application.ProcessMessages;
      GeraEvento(E.Message);
      Application.ProcessMessages;
      StatusMsg(E.Message,1);
    end;
  end;
 finally
   EndWaint;
   dm_nfe.NfdNFECCe.LiberarDataSet;
 end;

end;

procedure GravaCCe;
begin
  try
    if not dm_nfe.cdsCCE.Active then
      dm_nfe.cdsCCE.Open;
    dm_nfe.cdsCCE.Insert;

    dm_nfe.cdsCCE.FieldByName('IDLOTE').AsFloat := StrToFloat(vvIDLOTE);
    dm_nfe.cdsCCE.FieldByName('VERSAO_L').AsFloat := StrToFloat(FormatReal(vvVERSAO_L));
    dm_nfe.cdsCCE.FieldByName('VERSAO_E').AsFloat := StrToFloat(FormatReal(vvVERSAO_E));
    dm_nfe.cdsCCE.FieldByName('CORGAO').AsInteger := StrToInt(vvCORGAO);
    dm_nfe.cdsCCE.FieldByName('DHEVENTO').AsDateTime := StrToDate(vvDHEVENTO);
    dm_nfe.cdsCCE.FieldByName('CHNFE').AsString := vvCHAVE_NFE;
    dm_nfe.cdsCCE.FieldByName('TPEVENTO').AsString := vvTPEVENTO;
    dm_nfe.cdsCCE.FieldByName('NSEQEVENTO').AsInteger := StrToInt(vvNSEQEVENTO);
    dm_nfe.cdsCCE.FieldByName('VEREVENTO').AsFloat := StrToFloat(FormatReal(vvVEREVENTO));
    dm_nfe.cdsCCE.FieldByName('DESCEVENTO').AsString := vvDESCEVENTO;
    dm_nfe.cdsCCE.FieldByName('XCORRECAO').AsString := vvXCORRECAO;
    dm_nfe.cdsCCE.FieldByName('XML_CCE').Value := XML_CCEProt;
    dm_nfe.cdsCCE.Post;
    dm_nfe.cdsCCE.ApplyUpdates(-1);
  except
    on E : Exception do begin
      if vvTrayAtivado then
         ExibeMsgTray('Erro ao gravar as informações, da Carta de Correção no banco de dados. Erro Original.:'+ E.Message,2)
       else
         Raise Exception.Create('Erro ao gravar as informações, da Carta de Correção no banco de dados. Erro Original.:'+ E.Message);
    end;
  end;
end;

procedure StartDataSetNfe;
begin
  dm_nfe.cdsNfe_Cab.CreateDataSet;
  dm_nfe.cds_NFref.CreateDataSet;
  dm_nfe.cds_refNFP.CreateDataSet;
  dm_nfe.cds_refECF.CreateDataSet;
  dm_nfe.cds_L_Retirada.CreateDataSet;
  dm_nfe.cds_L_Entrega.CreateDataSet;
  dm_nfe.cdsNfeItens.CreateDataSet;
  dm_nfe.cds_DI.CreateDataSet;
  dm_nfe.cds_aDI.CreateDataSet;
  dm_nfe.cds_veicProd.CreateDataSet;
  dm_nfe.cds_NfeMed.CreateDataSet;
  dm_nfe.cds_NfeArma.CreateDataSet;
  dm_nfe.cds_IPI.CreateDataSet;
  dm_nfe.cds_II.CreateDataSet;
  dm_nfe.cds_ISSQN.CreateDataSet;
  dm_nfe.cds_PIS.CreateDataSet;
  dm_nfe.cds_COFINS.CreateDataSet;
  dm_nfe.cds_ICMSTot.CreateDataSet;
  dm_nfe.cds_ISSQNTot.CreateDataSet;
  dm_nfe.cds_transp.CreateDataSet;
  dm_nfe.cds_nfeReboque.CreateDataSet;
  dm_nfe.cds_nfeVolumes.CreateDataSet;
  dm_nfe.cds_nfeLacre.CreateDataSet;
  dm_nfe.cds_Cobranca.CreateDataSet;
  //.::
  dm_nfe.cds_nfeDuplicata.CreateDataSet;
  dm_nfe.CriacdsDuplic;
  //
  dm_nfe.cds_Exporta.CreateDataSet;
  dm_nfe.cds_compra.CreateDataSet;
  dm_nfe.cds_CanaForDia.CreateDataSet;
  dm_nfe.cds_nfeProcRef.CreateDataSet;
  dm_nfe.cds_nfeDeduc.CreateDataSet;
  dm_nfe.cdsNfeIImp.CreateDataSet;
end;

function TemProtocolo : Boolean;
begin

end;

function NewName(strName : String ) : String;
var
  sAux : String;
begin
   sAux := Copy(strName,1,Pos('.',strName)-1);
   Result := sAux + '.processado';
end;

procedure GetTempMed;
var
  sXml : WideString;
begin
  sXml := dm_nfe.nfdNFe2.StatusDoServico;
  vvTmpMed := GetTempoMedWs(sXml) * 1000;
end;

function GetTempoMedWs(sXML : WideString) : Integer;
var
    _Posini, _Posfim: integer;
    aTag, aEndTag: WideString;
begin
  Result := 1;
  aTag := '<tMed';
  aEndTag := '</tMed';
  _Posini := POS(aTag, sXML);
  _Posfim := POS(aEndTag, sXML);
  if (_Posini > 0) then begin
    inc(_PosIni, Length(aTag));
    Result := StrToIntDef(Copy(sXML, _Posini + 1, (_PosFim - _PosIni) - 1),1);
  end;
end;

procedure GravaProtocolo(sXML : WideString); // grava dados do protocolo de autorização da emissão da nfe
begin
 try

 except
   on E : Exception do begin

   end;
 end;
end;

end.



