unit uDanfeUtils;

interface

uses
  Winapi.Mapi, nfeNFDXML, uDM_Danfe, IdBaseComponent, IdMessage,
  Winapi.Windows, Vcl.Dialogs, System.Classes, System.SysUtils, System.IniFiles, Vcl.Graphics, System.Types,
  Vcl.ExtCtrls, uFuncoesNFE, Data.DB, Datasnap.DBClient, System.Variants, Vcl.Forms,
  Winapi.ShlObj;

type
  {Tipo Visualização ou Impressão}
  TPrintView = (pvPrinter, pvPreview, pvDesigner, pvPDF, pvJPG);

  TDanfeUtils = class(TObject)
  private
    fDANFETemplate: TFilename;
    fDataSet: TClientDataSet;
    fDataSetItens: TClientDataSet;
    fDataSetCob: TClientDataSet;
    FaXML : TnfeNFDXML;
    FLogotipoEmitente: string;
    //procedure LoadConfig;
    procedure SetaXML(const Value: TnfeNFDXML);

    procedure SetLogotipoEmitente(const Value: string);

    procedure GetDadosEmitente(Node: TXmlNode);
    procedure GetDadosDestinatario(Node: TXmlNode);
    procedure GetDadosIdNF(Node: TXmlNode);
    procedure GetDadosCalcImposto(Node: TXmlNode);
    procedure GetDadosTransp(Node: TXmlNode);
    procedure GetDadosVeicTransp(Node: TXmlNode);
    procedure GetDadosVolumeTransp(Node: TXmlNode);
    procedure GetDadosChaveNF(Node: TXmlNode);
    procedure GetDadosItens(Node: TXmlNode);
    procedure GetDadosAdicionais(Node: TXmlNode);
    procedure GetDadosTotalISSQN(Node: TXmlNode);
    procedure GetDadosDuplicata(Node: TXmlNode);

    function GetValueTag(aTag: string; Node: TXmlNode): string;
    function ConverteString(const vTexto: string; const AoContrario: Boolean = False): string;
    function GeraCodBarAdicional: string;

  protected
    TipoDanfe: integer;
    property aXML: TnfeNFDXML read FaXML write SetaXML;
  public
    procedure ClearDataSets;
    procedure PopulaDataSet;
    procedure CarregarXML(sXML: string);
    constructor Create;
    destructor Destroy; override;
    procedure PrintDanfe(TypePrint: TPrintView; sXML: WideString; aFileReport: string);

    {Envia a DANFE por mail}
    //procedure EmailDanfe(aFileReport: string; sXML: WideString; aSubject: string; aMsgBody: string; aTo: string; aFilesAttach: string); overload;
    //procedure EmailDanfe(sXML: WideString; AFileconfig, pAddressTo: string; Anexos: string = ''); overload;
    //procedure EmailDanfe(sXML: WideString; pHostName, pUserName, pPassWord, pAddressTo, pSubject, pEmailMessage, pFrom, pName: string; pPort: Integer;  AAnexos: string = ''); overload;
    procedure EditarDanfe(aFileTemplate: string; sXML: WideString);
    procedure SaveDanfeTemplate(const sPath: string = '');

    property LogotipoEmitente: string read FLogotipoEmitente write SetLogotipoEmitente;
  end;

implementation

uses uFuncoes, uGlobalVar, uNfe_Utils;

var
   TFormatSet : TFormatSettings;
  _OldDecimalSeparator: Char; // Guarda o Decimal Separator usado no sistema.

  {TDanfeUtils}

procedure TDanfeUtils.CarregarXML(sXML: string);
var
  NovoXML: WideString;

begin
  NovoXML := sXML;
  if (Pos('<?xml version="1.0" encoding="UTF-8"?>', sXML) <= 0) or (Pos('<?xml version="1.0"?>', sXML) <= 0) then
    NovoXML := '<?xml version="1.0" encoding="UTF-8"?>' + sXML;

  aXML.ReadFromString(NovoXML);
  aXML.Utf8Encoded := True;

  fDataSet := DM_Danfe.cdsNFE;
  fDataSetItens := DM_Danfe.cdsNFE_Itens;
  fDataSetCob := DM_Danfe.cdsCobranca;
end;

procedure TDanfeUtils.ClearDataSets;
begin
  DM_Danfe.cdsNFE.EmptyDataSet;
  DM_Danfe.cdsCobranca.EmptyDataSet;
  DM_Danfe.cdsNFE_Itens.EmptyDataSet;
end;

function TDanfeUtils.ConverteString(const vTexto: string; const AoContrario: Boolean = False): string;
const
  vChars: array [0 .. 74, 0 .. 1] of string = (('&lt;', '<'), ('&gt;', '>'), ('&amp;', '&'), ('&quot;', '"'), ('&#39;', ''''), ('&Aacute;', 'Á'),
    ('&aacute;', 'á'), ('&Acirc;', 'Â'), ('&acirc;', 'â'), ('&Agrave;', 'À'), ('&agrave;', 'à'), ('&Aring;', 'Å'), ('&aring;', 'å'), ('&Atilde;', 'Ã'),
    ('&atilde;', 'ã'), ('&Auml;', 'Ä'), ('&auml;', 'ä'), ('&AElig;', 'Æ'), ('&aelig;', 'æ'), ('&Eacute;', 'É'), ('&eacute;', 'é'), ('&Ecirc;', 'Ê'),
    ('&ecirc;', 'ê'), ('&Egrave;', 'È'), ('&egrave;', 'è'), ('&Euml;', 'Ë'), ('&euml;', 'ë'), ('&ETH;', 'Ð'), ('&eth;', 'ð'), ('&Iacute;', 'Í'),
    ('&iacute;', 'í'), ('&Icirc;', 'Î'), ('&icirc;', 'î'), ('&Igrave;', 'Ì'), ('&igrave;', 'ì'), ('&Iuml;', 'Ï'), ('&iuml;', 'ï'), ('&Oacute;', 'Ó'),
    ('&oacute;', 'ó'), ('&Ocirc;', 'Ô'), ('&ocirc;', 'ô'), ('&Ograve;', 'Ò'), ('&ograve;', 'ò'), ('&Oslash;', 'Ø'), ('&oslash;', 'ø'), ('&Otilde;', 'Õ'),
    ('&otilde;', 'õ'), ('&Ouml;', 'Ö'), ('&ouml;', 'ö'), ('&Uacute;', 'Ú'), ('&uacute;', 'ú'), ('&Ucirc;', 'Û'), ('&ucirc;', 'û'), ('&Ugrave;', 'Ù'),
    ('&ugrave;', 'ù'), ('&Uuml;', 'Ü'), ('&uuml;', 'ü'), ('&Ccedil;', 'Ç'), ('&ccedil;', 'ç'), ('&Ntilde;', 'Ñ'), ('&ntilde;', 'ñ'), ('&reg;', '®'),
    ('&copy;', '©'), ('&Yacute;', 'Ý'), ('&yacute;', 'ý'), ('&THORN;', 'Þ'), ('&thorn;', 'þ'), ('&szlig;', 'ß'), ('&deg;', '°'), ('&plusmn;', '±'),
    ('&sup1;', '¹'), ('&sup2;', '²'), ('&sup3;', '³'), ('&ordm;', 'º'), ('&para;', '¶'));
var
  vNewText: string;
  i: integer;
begin
  vNewText := vTexto;

  for i := 0 to 74 do
  begin
    if AoContrario then
      vNewText := StringReplace(vNewText, vChars[i, 1], vChars[i, 0], [rfReplaceAll])
    else
      vNewText := StringReplace(vNewText, vChars[i, 0], vChars[i, 1], [rfReplaceAll]);
  end;
  Result := vNewText;
end;

constructor TDanfeUtils.Create;
begin
  aXML := TnfeNFDXML.Create;
{$IFDEF NO_DANFERB}
  _OldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
{$ENDIF}
end;

destructor TDanfeUtils.Destroy;
begin
  aXML.Free;
{$IFDEF NO_DANFERB}
  DecimalSeparator := _OldDecimalSeparator;
{$ENDIF}
  inherited;
end;

procedure TDanfeUtils.EditarDanfe(aFileTemplate: string; sXML: WideString);
begin
  if not FileExists(aFileTemplate) then
  begin
    Exception.Create('Arquivo de template do DANFE, não existe.');
  end
  else
  begin
    ClearDataSets;
    CarregarXML(sXML);
    PopulaDataSet;
    {
    dmNfe.RelDanfe.LoadFromFile(aFileTemplate);
    dmNfe.RelDanfe.PrepareReport;
    dmNfe.RelDanfe.DesignReport(True, False);
    }
  end;
end;

(*
procedure TDanfeUtils.EmailDanfe(sXML: WideString; AFileconfig, pAddressTo, Anexos: string);
//var
  //EMail: TSendMailDanfe;
begin
 {
  EMail := SingleSendMailDanfe;
  EMail.LoadConfig(AFileconfig);
  EMail.AddressTo := pAddressTo;
  EMail.XMLFile := sXML;
  EMail.Attachs := Anexos;
  EMail.Send;
  }
end;

procedure TDanfeUtils.EmailDanfe(sXML: WideString; pHostName, pUserName, pPassWord, pAddressTo, pSubject, pEmailMessage, pFrom, pName: string; pPort: Integer;
  AAnexos: string);
//var
//  Email: TSendMailDanfe;
begin
  {
  Email := SingleSendMailDanfe;
  Email.HostName := pHostName;
  EMail.Port := pPort;
  EMail.UserName := pUserName;
  EMail.Password := pPassWord;
  EMail.AddressTo := pAddressTo;
  Email.From := pFrom;
  Email.name := pName;
  Email.XMLFile := sXML;
  Email.Attachs := AAnexos;
  Email.Send;
  }
end;
*)
(*
procedure TDanfeUtils.EmailDanfe(aFileReport: string; sXML: WideString; aSubject, aMsgBody, aTo, aFilesAttach: string);
var
  i: integer;
  SL: TStringList;
  mail: TStringList;
{.$REGION 'SendEMail'}
  function SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
  type
    TAttachAccessArray = array [0 .. 0] of TMapiFileDesc;
    PAttachAccessArray = ^TAttachAccessArray;
  var
    MapiMessage: TMapiMessage;
    Receip: TMapiRecipDesc;
    Attachments: PAttachAccessArray;
    AttachCount: Integer;
    i1: integer;
    FileName: string;
    dwRet: Cardinal;
    MAPI_Session: Cardinal;
    WndList: Pointer;
  begin

    dwRet := MapiLogon(Handle, PAnsiChar(''), PAnsiChar(''), MAPI_LOGON_UI or MAPI_NEW_SESSION, 0, @MAPI_Session);

    if (dwRet <> SUCCESS_SUCCESS) then
    begin
      MessageBox(Handle, PChar('Error while trying to send email'), PChar('Error'), MB_IConerror or MB_OK);
    end
    else
    begin
      FillChar(MapiMessage, SizeOf(MapiMessage), #0);
      Attachments := nil;
      FillChar(Receip, SizeOf(Receip), #0);

      if Mail.Values['to'] <> '' then
      begin
        Receip.ulReserved := 0;
        Receip.ulRecipClass := MAPI_TO;

        Receip.lpszName := StrNew(PAnsiChar(Mail.Values['to']));
        Receip.lpszAddress := StrNew(PAnsiChar('SMTP:' + Mail.Values['to']));

        Receip.ulEIDSize := 0;
        MapiMessage.nRecipCount := 1;
        MapiMessage.lpRecips := @Receip;
      end;

      AttachCount := 0;

      for i1 := 0 to MaxInt do
      begin
        if Mail.Values['attachment' + IntToStr(i1)] = '' then
          break;
        Inc(AttachCount);
      end;

      if AttachCount > 0 then
      begin
        GetMem(Attachments, SizeOf(TMapiFileDesc) * AttachCount);

        for i1 := 0 to AttachCount - 1 do
        begin
          FileName := Mail.Values['attachment' + IntToStr(i1)];
          Attachments[i1].ulReserved := 0;
          Attachments[i1].flFlags := 0;
          Attachments[i1].nPosition := ULONG($FFFFFFFF);

          Attachments[i1].lpszPathName := StrNew(PAnsiChar(FileName));
          Attachments[i1].lpszFileName := StrNew(PAnsiChar(ExtractFileName(FileName)));

          Attachments[i1].lpFileType := nil;
        end;
        MapiMessage.nFileCount := AttachCount;
        MapiMessage.lpFiles := @Attachments^;
      end;

      if Mail.Values['subject'] <> '' then
        MapiMessage.lpszSubject := StrNew(PAnsiChar(Mail.Values['subject']));
      if Mail.Values['body'] <> '' then
        MapiMessage.lpszNoteText := StrNew(PAnsiChar(Mail.Values['body']));

      WndList := DisableTaskWindows(0);
      try
        Result := MapiSendMail(MAPI_Session, Handle, MapiMessage, MAPI_DIALOG, 0);
      finally
        EnableTaskWindows(WndList);
      end;

      for i1 := 0 to AttachCount - 1 do
      begin
        StrDispose(Attachments[i1].lpszPathName);
        StrDispose(Attachments[i1].lpszFileName);
      end;

      if Assigned(MapiMessage.lpszSubject) then
        StrDispose(MapiMessage.lpszSubject);
      if Assigned(MapiMessage.lpszNoteText) then
        StrDispose(MapiMessage.lpszNoteText);
      if Assigned(Receip.lpszAddress) then
        StrDispose(Receip.lpszAddress);
      if Assigned(Receip.lpszName) then
        StrDispose(Receip.lpszName);
      MapiLogOff(MAPI_Session, Handle, 0, 0);
    end;
  end;
{.$ENDREGION}

begin
  ClearDataSets;
  CarregarXML(sXML);
  PopulaDataSet;
  /*
  if Trim(aFileReport) <> EmptyStr then
  begin
    dmNfe.RelDanfe.LoadFromFile(aFileReport);
    dmNfe.RelDanfePais.LoadFromFile(aFileReport);
  end;

  dmNfe.RelDanfe.PrepareReport;
  dmNfe.RelDanfe.export(DM_Danfe.frxPDFExport1);
   */
  mail := TStringList.Create;
  SL := TStringList.Create;
  try
    mail.values['to'] := aTo;
    /// AQUI VAI O EMAIL DO DESTINATARIO///
    mail.values['subject'] := aSubject;
    /// AQUI O ASSUNTO///
    mail.values['body'] := StringReplace(aMsgBody, ';;;', #13#10, [rfReplaceAll]);
    /// AQUI O TEXTO NO CORPO DO EMAIL///
    SL.Text := StringReplace(DM_Danfe.frxPDFExport1.FileName + ';;;' + aFilesAttach, ';;;', #13#10, [rfReplaceAll]);

    for i := 0 to SL.Count - 1 do
      mail.values['attachment' + IntToStr(i)] := SL.Strings[i];
    /// /AQUI O ENDEREÇO ONDE ENCONTRAM OS ARQUIVOS//

    sendEMail(Application.Handle, mail);
  finally
    mail.Free;
    SL.Free;
  end;
end;
 *)
function TDanfeUtils.GeraCodBarAdicional: string;
  function StrZero(str: string; zeros: integer): string;
  var
    izeros: integer;
    vstr: string;
  begin
    for izeros := 1 to (zeros - Length(str)) do
      vstr := vstr + '0';
    Result := vstr + str;
  end;

begin
  Result := fDataset.FieldByName('cUF').AsString + fDataset.FieldByName('tpEmis').AsString + StrZero(fDataset.FieldByName('EmitCNPJ').AsString, 14) + StrZero
    (StringReplace(StringReplace(FormatFloat('#,0.00', fDataset.FieldByName('ValorTotNota').AsCurrency), '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]),
    14);
  if fDataset.FieldByName('ValorICMS').AsCurrency > 0 then
    Result := Result + '1'
  else
    Result := Result + '0';
  if fDataset.FieldByName('ValorICMSSubs').AsCurrency > 0 then
    Result := Result + '1'
  else
    Result := Result + '0';

  Result := Result + FormatDateTime('dd', fDataset.FieldByName('DtEmissao').AsDateTime);
end;

procedure TDanfeUtils.GetDadosAdicionais(Node: TXmlNode);
var
  vInfCpl, vInfFisco: string;
begin
  vInfCpl := EmptyStr;
  if not(AnsiSameText(fDataSet.FieldByName('tpEmis').AsString, '1')) then
  begin
    vInfCpl := '**** DANFE EM CONTINGÊNCIA, IMPRESSO EM DECORRÊNCIA DE PROBLEMAS TÉCNICOS. ****' + #13#10;
  end;

  if (AnsiSameText(fDataSet.FieldByName('tpEmis').AsString, '4')) then
  begin
    vInfCpl := '**** DANFE IMPRESSO EM CONTINGÊNCIA - DPEC REGULARMENTE RECEBIDA PELA RECEITA FEDERAL DO BRASIL. ****' + #13#10;
  end;

  vInfCpl := vInfCpl + GetValueTag('infCpl', Node);
  vInfCpl := StringReplace(vInfCpl, ';;;', #13#10, [rfReplaceAll]);
  vInfCpl := vInfCpl + #13#10 + ' .';
  vInfFisco := GetValueTag('infAdFisco', Node);
  vInfFisco := StringReplace(vInfFisco, ';;;', #13#10, [rfReplaceAll]);
  vInfFisco := vInfFisco + #13#10 + ' .';

  fDataset.FieldByName('ObsFisco').AsString := vInfFisco;
  fDataset.FieldByName('ObsContribuinte').AsString := vInfCpl;
end;

procedure TDanfeUtils.GetDadosCalcImposto(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('ICMSTot');
  if Assigned(aTempNode) then
  begin
    if Empty(GetValueTag('vBC', aTempNode)) then
      fDataset.FieldByName('BaseCalcIcms').AsFloat := 0
    else
      fDataset.FieldByName('BaseCalcIcms').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vBC', aTempNode)));

    if Empty(GetValueTag('vICMS', aTempNode)) then
      fDataset.FieldByName('ValorIcms').AsFloat := 0
    else
      fDataset.FieldByName('ValorIcms').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vICMS', aTempNode)));

    if Empty(GetValueTag('vBCST', aTempNode)) then
      fDataset.FieldByName('BaseCalcIcmsSubs').AsFloat := 0
    else
      fDataset.FieldByName('BaseCalcIcmsSubs').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vBCST', aTempNode)));

    if Empty(GetValueTag('vST', aTempNode)) then
      fDataset.FieldByName('ValorIcmsSubs').AsFloat := 0
    else
      fDataset.FieldByName('ValorIcmsSubs').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vST', aTempNode)));

    if Empty(GetValueTag('vProd', aTempNode)) then
      fDataset.FieldByName('ValorTotProd').AsFloat := 0
    else
      fDataset.FieldByName('ValorTotProd').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vProd', aTempNode)));

    if Empty(GetValueTag('vFrete', aTempNode)) then
      fDataset.FieldByName('ValorFrete').AsFloat := 0
    else
      fDataset.FieldByName('ValorFrete').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vFrete', aTempNode)));

    if Empty(GetValueTag('vSeg', aTempNode)) then
      fDataset.FieldByName('ValorSeguro').AsFloat := 0
    else
      fDataset.FieldByName('ValorSeguro').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vSeg', aTempNode)));

    if Empty(GetValueTag('vDesc', aTempNode)) then
      fDataset.FieldByName('Desconto').AsFloat := 0
    else
      fDataset.FieldByName('Desconto').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vDesc', aTempNode)));

    if Empty(GetValueTag('vOutro', aTempNode)) then
      fDataset.FieldByName('OutrasDesp').AsFloat := 0
    else
      fDataset.FieldByName('OutrasDesp').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vOutro', aTempNode)));

    if Empty(GetValueTag('vIPI', aTempNode)) then
      fDataset.FieldByName('ValorIPI').AsFloat := 0
    else
      fDataset.FieldByName('ValorIPI').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vIPI', aTempNode)));

    if Empty(GetValueTag('vTotTrib', aTempNode)) then
      fDataset.FieldByName('vTotTrib').AsFloat := 0
    else
      fDataset.FieldByName('vTotTrib').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vTotTrib', aTempNode)));

    if Empty((GetValueTag('vNF', aTempNode))) then
      fDataset.FieldByName('ValorTotNota').AsFloat := 0
    else
      fDataset.FieldByName('ValorTotNota').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vNF', aTempNode)));
  end;
end;

procedure TDanfeUtils.GetDadosChaveNF(Node: TXmlNode);
var
  sID: string;
  TempNode: TXmlNode;
begin
  TempNode := Node.FindNode('infNFe');
  if not Assigned(TempNode) then
    raise Exception.Create('Existe Nota sem Chave (ID). Por favor, verifique e tente novamente.');

  sID := TempNode.AttributeByName['Id'];
  sID := Copy(sID, 4, Length(sID));
  fDataset.FieldByName('CodBarra').Value := sID;
end;

procedure TDanfeUtils.GetDadosDestinatario(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('dest');
  if Assigned(aTempNode) then
  begin
    if Trim(GetValueTag('CNPJ', aTempNode)) = EmptyStr then
      fDataset.FieldByName('DestCNPJ').Value := GetValueTag('CPF', aTempNode)
    else
      fDataset.FieldByName('DestCNPJ').Value := GetValueTag('CNPJ', aTempNode);
    fDataset.FieldByName('DestIE').Value := GetValueTag('IE', aTempNode);
    fDataset.FieldByName('DestNome').Value := GetValueTag('xNome', aTempNode);

    aTempNode := aTempNode.FindNode('enderDest');
    if Assigned(aTempNode) then
    begin
      fDataset.FieldByName('DestEnd').value := GetValueTag('xLgr', aTempNode) + ' , ' + GetValueTag('nro', aTempNode) + ' - ' + GetValueTag('xCpl', aTempNode);
      fDataset.FieldByName('DestBairro').Value := GetValueTag('xBairro', aTempNode);
      fDataset.FieldByName('DestMun').Value := GetValueTag('xMun', aTempNode);
      fDataset.FieldByName('DestUF').Value := GetValueTag('UF', aTempNode);
      fDataset.FieldByName('DestCep').Value := GetValueTag('CEP', aTempNode);
      fDataset.FieldByName('DestFoneFax').Value := GetValueTag('fone', aTempNode);
    end;
  end;
end;

procedure TDanfeUtils.GetDadosDuplicata(Node: TXmlNode);
var
  i: integer;
  aList: TList;
  _DtVenc: string;
begin
  aList := TList.Create;
  try
    Node.FindNodes('dup', aList);

    // Pegando as duplicatas
    for i := 0 to aList.Count - 1 do
    begin
      fDataSetCob.Append;
      fDataSetCob.FieldByName('nNF').Value := fDataset.FieldByName('nNF').Value;
      fDataSetCob.FieldByName('NumDuplicata').Value := GetValueTag('nDup', aList[i]);
      // Converte data Vencimento no Padrão Brasil //
      _DtVenc := '';
      _DtVenc := GetValueTag('dVenc', aList[i]);
      fDataSetCob.FieldByName('DtVencimento').Value := Copy(_DtVenc, 9, 2) + '/' + Copy(_DtVenc, 6, 2) + '/' + Copy(_DtVenc, 1, 4);

      if Empty(GetValueTag('vDup', aList[i])) then
        fDataSetCob.FieldByName('ValorDuplicata').AsCurrency := 0
      else
        fDataSetCob.FieldByName('ValorDuplicata').AsCurrency := FormatToReal(GetValueTag('vDup', aList[i]));
      fDataSetCob.Post;
    end;
  finally
    aList.Free;
  end;
end;

procedure TDanfeUtils.GetDadosEmitente(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('emit');
  if Assigned(aTempNode) then
  begin
    fDataset.FieldByName('EmitNome').Value := GetValueTag('xNome', aTempNode);
    fDataset.FieldByName('EmitCNPJ').Value := GetValueTag('CNPJ', aTempNode);
    fDataset.FieldByName('EmitIE').Value := GetValueTag('IE', aTempNode);
    fDataset.FieldByName('EmitIEST').Value := GetValueTag('IEST', aTempNode);
    fDataset.FieldByName('EmitIM').Value := GetValueTag('IM', aTempNode);
    fDataset.FieldByName('EmitFone').Value := GetValueTag('fone', aTempNode);
    fDataset.FieldByName('EmitFoneStr').Value := 'Fone / FAX: ' + fDataset.FieldByName('EmitFone').Value;

    aTempNode := Node.FindNode('enderEmit');
    if Assigned(aTempNode) then
    begin
      fDataset.FieldByName('EmitEnd').Value := GetValueTag('xLgr', aTempNode) + ' , ' + GetValueTag('nro', aTempNode) + ' - ' + GetValueTag('xCpl', aTempNode);
      fDataset.FieldByName('EmitBairro').Value := GetValueTag('xBairro', aTempNode);
      fDataset.FieldByName('EmitMun').Value := GetValueTag('xMun', aTempNode);
      fDataset.FieldByName('EmitUF').Value := GetValueTag('UF', aTempNode);
      fDataset.FieldByName('EmitCep').Value := GetValueTag('CEP', aTempNode);
      fDataset.FieldByName('EmitMunUF').Value := fDataset.FieldByName('EmitMun').Value + ' - ' + fDataset.FieldByName('EmitUF').Value;
    end;
  end;
end;

procedure TDanfeUtils.GetDadosIdNF(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('ide');
  if Assigned(aTempNode) then
  begin
    fDataset.FieldByName('cUF').Value := GetValueTag('cUF', aTempNode);
    TipoDanfe := StrToIntDef(GetValueTag('tpImp', aTempNode), 1);
    fDataset.FieldByName('NatOper').Value := GetValueTag('natOp', aTempNode);
    fDataset.FieldByName('Serie').Value := GetValueTag('serie', aTempNode);
    fDataset.FieldByName('DtEmissao').AsDateTime := StrToDate(ConverteData(GetValueTag('dEmi', aTempNode)));
    if (Trim(GetValueTag('dSaiEnt', aTempNode)) <> EmptyStr) then
      fDataset.FieldByName('DtSaida').AsDateTime := StrToDate(ConverteData(GetValueTag('dSaiEnt', aTempNode)))
    else
      fDataset.FieldByName('DtSaida').Clear;
    fDataset.FieldByName('nNF').Value := GetValueTag('nNF', aTempNode);
    fDataset.FieldByName('tpAmb').Value := GetValueTag('tpAmb', aTempNode);
    fDataset.FieldByName('tpEmis').Value := GetValueTag('tpEmis', aTempNode);

    fDataset.FieldByName('nTpNF').Value := GetValueTag('tpNF', aTempNode);

    // if GetValueTag('tpNF', aTempNode) = '0' then
    // fDataset.FieldByName('nTpNF').Value := '2'; // Entrada
    // if GetValueTag('tpNF', aTempNode) = '1' then
    // fDataset.FieldByName('nTpNF').Value := '1'; // Saída
  end
  else
  begin
    TipoDanfe := StrToIntDef(GetValueTag('tpImp', Node), 1);
    fDataset.FieldByName('NatOper').Value := GetValueTag('natOp', Node);
    fDataset.FieldByName('Serie').Value := GetValueTag('serie', Node);
    fDataset.FieldByName('DtEmissao').AsDateTime := StrToDate(ConverteData(GetValueTag('dEmi', Node)));
    if (Trim(GetValueTag('dSaiEnt', Node)) <> EmptyStr) then
      fDataset.FieldByName('DtSaida').AsDateTime := StrToDate(ConverteData(GetValueTag('dSaiEnt', Node)))
    else
      fDataset.FieldByName('DtSaida').Clear;
    fDataset.FieldByName('nNF').Value := GetValueTag('nNF', Node);
    fDataset.FieldByName('tpAmb').Value := GetValueTag('tpAmb', Node);
    fDataset.FieldByName('tpEmis').Value := GetValueTag('tpEmis', Node);

    if GetValueTag('tpNF', Node) = '0' then
      fDataset.FieldByName('nTpNF').Value := '2'; // Entrada
    if GetValueTag('tpNF', Node) = '1' then
      fDataset.FieldByName('nTpNF').Value := '1'; // Saída
  end;
end;

procedure TDanfeUtils.GetDadosItens(Node: TXmlNode);
var
  i: integer;
  aList: TList;
  vinfAdProd: string;

  function RetQtdeCob: integer;
  var
    vRest, vResult: integer;
  begin
    fDataSetCob.First;
    fDataSetCob.Last;
    if fDataSetCob.RecordCount <= 1 then
      Result := 0
    else
    begin
      vResult := 0;
      vRest := fDataSetCob.RecordCount;
      while vRest > 0 do
      begin
        vRest := vRest - 3;
        if vRest >= 1 then
          Inc(vResult);
      end;
      Result := vResult;
    end;
  end;

begin
  aList := TList.Create;

  try
    Node.FindNodes('det', aList);

    if aList.Count < 0 then
      raise Exception.Create('Nota Sem Itens, por favor verifique.');

    // Pegando os itens (produtos)
    for i := 0 to aList.Count - 1 do
    begin
      fDataSetItens.Append;
      fDataSetItens.FieldByName('nNF').Value := fDataSet.FieldByName('nNF').Value;

      fDataSetItens.FieldByName('ItemCodigo').Value := GetValueTag('cProd', aList[i]);
      fDataSetItens.FieldByName('ItemNCM').Value := GetValueTag('NCM', aList[i]);
      fDataSetItens.FieldByName('ItemDescricao').Value := GetValueTag('xProd', aList[i]);

      if (GetValueTag('CSOSN', aList[I]) <> EmptyStr) then
        fDataSetItens.FieldByName('ItemCST').Value := GetValueTag('orig', aList[i]) + GetValueTag('CSOSN', aList[I])
      else
        fDataSetItens.FieldByName('ItemCST').Value := GetValueTag('orig', aList[i]) + GetValueTag('CST', aList[i]);
        
      fDataSetItens.FieldByName('ItemCFOP').Value := GetValueTag('CFOP', aList[i]);
      fDataSetItens.FieldByName('ItemUnidade').Value := GetValueTag('uCom', aList[i]);

      if Empty(GetValueTag('qCom', aList[i])) then
        fDataSetItens.FieldByName('ItemQuantidade').AsFloat := 0
      else
        fDataSetItens.FieldByName('ItemQuantidade').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('qCom', aList[i])));

      if Empty(GetValueTag('vUnCom', aList[i])) then
        fDataSetItens.FieldByName('ItemVUnit').AsFloat := 0
      else
        fDataSetItens.FieldByName('ItemVUnit').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vUnCom', aList[i])));

      if Empty(GetValueTag('vProd', aList[i])) then
        fDataSetItens.FieldByName('ItemVTotal').AsFloat := 0
      else
        fDataSetItens.FieldByName('ItemVTotal').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vProd', aList[i])));

      if (TXmlNode(aList[i]).FindNode('ICMS30') <> nil) or (TXmlNode(aList[i]).FindNode('ICMS40') <> nil) or (TXmlNode(aList[i]).FindNode('ICMS60') <> nil) then
      begin
        fDataSetItens.FieldByName('ItemBCalcIcms').AsFloat := 0;
        fDataSetItens.FieldByName('ItemVIcms').AsFloat := 0;
        fDataSetItens.FieldByName('ItemAliqIcms').AsFloat := 0
      end
      else
      begin
        if Trim(GetValueTag('vBC', aList[i])) = EmptyStr then
          fDataSetItens.FieldByName('ItemBCalcIcms').AsFloat := 0
        else
          fDataSetItens.FieldByName('ItemBCalcIcms').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vBC', aList[i])));

        if Trim(GetValueTag('vICMS', aList[i])) = EmptyStr then
          fDataSetItens.FieldByName('ItemVIcms').AsFloat := 0
        else
          fDataSetItens.FieldByName('ItemVIcms').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vICMS', aList[i])));

        if Trim(GetValueTag('pICMS', aList[i])) = EmptyStr then
          fDataSetItens.FieldByName('ItemAliqIcms').AsFloat := 0
        else
          fDataSetItens.FieldByName('ItemAliqIcms').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('pICMS', aList[i])));
      end;

      if (Trim(GetValueTag('vIPI', aList[i])) = EmptyStr) then
      begin
        if (Trim(GetValueTag('vUnid', aList[i])) <> EmptyStr) and (Trim(GetValueTag('qUnid', aList[i])) <> EmptyStr) then
        begin
          try
            fDataSetItens.FieldByName('ItemVIPI').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vUnid', aList[i]))) * StrToFloat(FrmtsRealStr(GetValueTag('qUnid', aList[i])));
          except
            fDataSetItens.FieldByName('ItemVIPI').AsFloat := -99;
          end;
        end
        else
          fDataSetItens.FieldByName('ItemVIPI').AsFloat := 0;
      end
      else
        fDataSetItens.FieldByName('ItemVIPI').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('vIPI', aList[i])));

      if (Trim(GetValueTag('pIPI', aList[i])) = EmptyStr) then
        fDataSetItens.FieldByName('ItemAliqIPI').AsFloat := 0
      else
        fDataSetItens.FieldByName('ItemAliqIPI').AsFloat := StrToFloat(FrmtsRealStr(GetValueTag('pIPI', aList[i])));

      if GetValueTag('infAdProd', aList[i]) <> '' then
      begin
        vinfAdProd := GetValueTag('infAdProd', aList[i]);
        vinfAdProd := StringReplace(vinfAdProd, ';;;', #13#10, [rfReplaceAll]);
        fDataSetItens.FieldByName('infAdProd').Value := vinfAdProd;
        fDataSetItens.FieldByName('ItemDescricao').Value := fDataSetItens.FieldByName('ItemDescricao').Value + #13#10 + fDataSetItens.FieldByName('infAdProd')
          .Value;
      end;

      fDataSetItens.Post;
    end;

    // if aList.Count >= 16 then
    // begin
    // for i := 0 to (24 - aList.Count) do
    // begin
    // fDataSetItens.Append;
    // fDataSetItens.FieldByName('nNF').Value := fDataSet.FieldByName('nNF').Value;
    // for j := 1 to fDataSetItens.FieldCount - 1 do
    // fDataSetItens.Fields[j].Clear;
    // fDataSetItens.Post;
    // end;
    // end;
  finally
    aList.Free;
  end;
end;

procedure TDanfeUtils.GetDadosTotalISSQN(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('ISSQNtot');

  if Assigned(aTempNode) then
  begin
    if Empty(GetValueTag('vServ', aTempNode)) then
      fDataset.FieldByName('ValorTotServ').AsCurrency := 0
    else
      fDataset.FieldByName('ValorTotServ').AsCurrency := FormatToReal(GetValueTag('vServ', aTempNode)); // Total Servico

    if Empty(GetValueTag('vBC', aTempNode)) then
      fDataset.FieldByName('BaseCalcISSQN').AsCurrency := 0
    else
      fDataset.FieldByName('BaseCalcISSQN').AsCurrency := FormatToReal(GetValueTag('vBC', aTempNode)); // Base Calculo Imposto

    if Empty(GetValueTag('vISS', aTempNode)) then
      fDataset.FieldByName('ValorTotISSQN').AsCurrency := 0
    else
      fDataset.FieldByName('ValorTotISSQN').AsCurrency := FormatToReal(GetValueTag('vISS', aTempNode)); // Valor Do Imposto
  end
  else
  begin
    fDataset.FieldByName('ValorTotServ').AsCurrency := 0;
    fDataset.FieldByName('BaseCalcISSQN').AsCurrency := 0;
    fDataset.FieldByName('ValorTotISSQN').AsCurrency := 0;
  end;
end;

procedure TDanfeUtils.GetDadosTransp(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('transp');
  if Assigned(aTempNode) then
  begin
    if GetValueTag('modFrete', aTempNode) = '0' then
      fDataset.FieldByName('TraModFrete').Value := '1';
    if GetValueTag('modFrete', aTempNode) = '1' then
      fDataset.FieldByName('TraModFrete').Value := '2';
    fDataset.FieldByName('TraModFrete').Value := GetValueTag('modFrete', aTempNode);
  end;

  aTempNode := Node.FindNode('transporta');
  if Assigned(aTempNode) then
  begin
    if Empty(GetValueTag('CNPJ', aTempNode)) then
      fDataset.FieldByName('TraCNPJ').AsString := GetValueTag('CPF', aTempNode)
    else
      fDataset.FieldByName('TraCNPJ').AsString := GetValueTag('CNPJ', aTempNode);

    fDataset.FieldByName('TraNome').AsString := GetValueTag('xNome', aTempNode);
    fDataset.FieldByName('TraIE').AsString := GetValueTag('IE', aTempNode);
    fDataset.FieldByName('TraEnd').AsString := GetValueTag('xEnder', aTempNode);
    fDataset.FieldByName('TraMun').AsString := GetValueTag('xMun', aTempNode);
    fDataset.FieldByName('TraUF').AsString := GetValueTag('UF', aTempNode);
  end;
end;

procedure TDanfeUtils.GetDadosVeicTransp(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('veicTransp');
  if Assigned(aTempNode) then
  begin
    fDataset.FieldByName('VeiCodigoANTT').AsString := GetValueTag('RNTC', aTempNode);
    fDataset.FieldByName('VeiPlaca').AsString := GetValueTag('placa', aTempNode);
    fDataset.FieldByName('VeiUF').AsString := GetValueTag('UF', aTempNode);
  end;
end;

procedure TDanfeUtils.GetDadosVolumeTransp(Node: TXmlNode);
var
  aTempNode: TXmlNode;
begin
  aTempNode := Node.FindNode('vol');
  if Assigned(aTempNode) then
  begin
    fDataset.FieldByName('VolQuantidade').AsString := GetValueTag('qVol', aTempNode);
    fDataset.FieldByName('VolEspecie').AsString := GetValueTag('esp', aTempNode);
    fDataset.FieldByName('VolMarca').AsString := GetValueTag('marca', aTempNode);
    fDataset.FieldByName('VolNumeracao').AsString := GetValueTag('nVol', aTempNode);

    if Empty(GetValueTag('pesoB', aTempNode)) then
      fDataset.FieldByName('VolPesoBruto').AsCurrency := 0
    else
      fDataset.FieldByName('VolPesoBruto').AsCurrency := FormatToReal(GetValueTag('pesoB', aTempNode));
    if Empty(GetValueTag('pesoL', aTempNode)) then
      fDataset.FieldByName('VolPesoLiquido').AsCurrency := 0
    else
      fDataset.FieldByName('VolPesoLiquido').AsCurrency := FormatToReal(GetValueTag('pesoL', aTempNode));
  end;
end;

function TDanfeUtils.GetValueTag(aTag: string; Node: TXmlNode): string;
var
  vTempNode: TXmlNode;
begin
  vTempNode := Node.FindNode(aTag);
  if not Assigned(vTempNode) then
  begin
    Result := EmptyStr;
    Exit;
  end;

  if vTempNode.IsEmpty then
    Result := EmptyStr
  else
    Result := vTempNode.ValueAsString;

  Result := ConverteString(Result);
end;
{
procedure TDanfeUtils.LoadConfig;
var
  Data: TIniFile;
begin
  Data := TIniFile.Create('nfeConfig.ini');

  try
    fDANFETemplate := Data.ReadString('DANFE', 'DANFE_Template', '');
    DM_Danfe.RelDanfe.PrintOptions.Copies := Data.ReadInteger('DANFE', 'Vias', 1);
    DM_Danfe.RelDanfePais.PrintOptions.Copies := Data.ReadInteger('DANFE', 'Vias', 1);

    DM_Danfe.ImprimeHora := Data.ReadBool('DANFE', 'ImprimeHora', False);
    if Trim(Data.ReadString('DANFE', 'Impressora', '')) <> EmptyStr then
    begin
      DM_Danfe.RelDanfe.PrintOptions.Printer := Data.ReadString('DANFE', 'Impressora', '');
      DM_Danfe.RelDanfe.ShowProgress := False;
      DM_Danfe.RelDanfe.PrintOptions.ShowDialog := False;

      DM_Danfe.RelDanfePais.PrintOptions.Printer := Data.ReadString('DANFE', 'Impressora', '');
      DM_Danfe.RelDanfePais.ShowProgress := False;
      DM_Danfe.RelDanfePais.PrintOptions.ShowDialog := False;
    end
    else
    begin
      DM_Danfe.RelDanfe.ShowProgress := True;

      DM_Danfe.RelDanfePais.ShowProgress := True;
    end;

  finally
    FreeAndNil(Data);
  end;
end;
}
procedure TDanfeUtils.PopulaDataSet;
var
  aNodeRootList: TXmlNode;
  aTempNode, aNodeprotNFe, aTempProtNFE: TXmlNode;
  i: integer;
  NfeProc: Boolean;
  DataProc, HoraProc: string;
begin
  if aXML.IsEmpty then
    raise Exception.Create('XML não carregado.');

  ClearDataSets;

  _OldDecimalSeparator := TFormatSet.DecimalSeparator;
  TFormatSet.DecimalSeparator := '.';
  try
    aXML.XmlFormat := xfReadable;
    if not Assigned(aXML.Root) then
      Exit;

    aNodeRootList := aXML.RootNodeList;
    NfeProc := False;
    with aNodeRootList do
    begin
      for i := 0 to NodeCount - 1 do
      begin // Percorrendo todos os roots, para ver se tem mais de uma nota.
        aTempNode := Nodes[i];
        aNodeprotNFe := nil;

        if AnsiSameText(aTempNode.name, 'NFeProc') then
        begin
          NfeProc := True;
          aNodeprotNFe := aTempNode.FindNode('protNFe');
          aTempNode := aTempNode.FindNode('NFe');
        end;

        if AnsiSameText(aTempNode.name, 'enviNFe') then
          aTempNode := aTempNode.FindNode('NFe');

        if AnsiSameText(aTempNode.name, 'NFe') then
        begin

          fDataSet.Append;
          GetDadosEmitente(Nodes[i]);
          GetDadosDestinatario(Nodes[i]);
          GetDadosIdNF(Nodes[i]);
          GetDadosCalcImposto(Nodes[i]);
          GetDadosTransp(Nodes[i]);
          GetDadosVeicTransp(Nodes[i]);
          GetDadosVolumeTransp(Nodes[i]);
          GetDadosChaveNF(Nodes[i]);
          GetDadosAdicionais(Nodes[i]);
          GetDadosTotalISSQN(Nodes[i]);
          GetDadosDuplicata(Nodes[i]);
          GetDadosItens(Nodes[i]);

          fDataSet.FieldByName('TextoCanhoto').AsString := 'RECEBEMOS DE ' + fDataSet.FieldByName('EmitNome').AsString +
            ' OS PRODUTOS E/OU SERVIÇOS CONSTANTES DA NOTA FISCAL ELETRÔNICA INDICADA ABAIXO.  ' + ' EMISSÃO: ' + FormatDateTime
            ('dd/mm/yyyy', fDataSet.FieldByName('DtEmissao').AsDateTime) + '  VALOR TOTAL: R$ ' + FormatFloat
            ('#,0.00', fDataSet.FieldByName('ValorTotNota').AsCurrency) + ' DESTINATÁRIO: ' + fDataSet.FieldByName('DestNome').AsString;

          if not(AnsiSameText(fDataSet.FieldByName('tpEmis').AsString, '1')) then
            fDataset.FieldByName('NumProtocolo').AsString := GeraCodBarAdicional
          else

            if NfeProc and Assigned(aNodeprotNFe) then
          begin
            aTempProtNFE := aNodeprotNFe.FindNode('infProt');
            DataProc := Copy(GetValueTag('dhRecbto', aTempProtNFE), 0, 10);
            HoraProc := Copy(GetValueTag('dhRecbto', aTempProtNFE), 12, 8);
            fDataset.FieldByName('NumProtocolo').AsString := GetValueTag('nProt', aTempProtNFE) + '  /  ' + ConverteData(DataProc) + ' - ' + HoraProc;

          end;

          fDataSet.Post;
        end;
      end;
    end;
  finally
    TFormatSet.DecimalSeparator := _OldDecimalSeparator;
  end;
end;

procedure TDanfeUtils.PrintDanfe(TypePrint: TPrintView; sXML: WideString; aFileReport: string);
var
  _OldDec: Char;

  function BrowseDialog(const Title: string; const Flag: integer): string;
  var
    lpItemID: PItemIDList;
    BrowseInfo: TBrowseInfo;
    DisplayName: array [0 .. MAX_PATH] of char;
    TempPath: array [0 .. MAX_PATH] of char;
  begin
    Result := '';
    FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
    with BrowseInfo do
    begin
      hwndOwner := Application.Handle;
      pszDisplayName := @DisplayName;
      lpszTitle := PChar(Title);
      ulFlags := Flag;
    end;
    lpItemID := SHBrowseForFolder(BrowseInfo);
    if lpItemId <> nil then
    begin
      SHGetPathFromIDList(lpItemID, TempPath);
      Result := TempPath;
      GlobalFreePtr(lpItemID);
    end;
  end;

begin

  ClearDataSets;
  CarregarXML(sXML);
  PopulaDataSet;

  _OldDec := TFormatSet.DecimalSeparator;
  TFormatSet.DecimalSeparator := ',';
  try
    if TypePrint = pvPDF then
    begin
      //DM_Danfe.RelDanfe.PrepareReport;
      if (aFileReport <> EmptyStr) then
      begin
        if not DirectoryExists(ExtractFileDir(aFileReport)) then
          ForceDirectories(ExtractFileDir(aFileReport));
        //DM_Danfe.frxPDFExport1.ShowDialog := False;
        //DM_Danfe.frxPDFExport1.FileName := aFileReport;
      end
      else
        ShowMessage(aFileReport);
      if TipoDanfe = 2 then
      begin
        DM_Danfe.RelDanfePais.export(DM_Danfe.frxPDFExport1);
      end else begin
        DM_Danfe.frxPDFExport1.FileName := vvDirTmp +'\'+ ObterNotaID(sXML) + '.pdf';
        DM_Danfe.frxPDFExport1.DefaultPath := vvDirTmp;
        DM_Danfe.frxPDFExport1.ShowDialog := False;
        DM_Danfe.frxPDFExport1.ShowProgress := False;
        DM_Danfe.frxPDFExport1.OverwritePrompt := False;
        DM_Danfe.RelDanfe.PrepareReport();
        DM_Danfe.RelDanfe.export(DM_Danfe.frxPDFExport1); ;
      end;
    end;

    if TypePrint in [pvPreview, pvPrinter] then
    begin
      //LoadConfig;

      if Trim(aFileReport) <> EmptyStr then
      begin
        DM_Danfe.RelDanfe.LoadFromFile(aFileReport);
        DM_Danfe.RelDanfePais.LoadFromFile(aFileReport);
      end;

      if TypePrint = pvPreview then
      begin
        if TipoDanfe = 1 then
        begin
          DM_Danfe.RelDanfe.PrepareReport;
          DM_Danfe.RelDanfe.ShowReport;
        end
        else
        begin
          DM_Danfe.RelDanfePais.PrepareReport;
          DM_Danfe.RelDanfePais.ShowReport; // FAZER O DANFE EM PAISAGEM.
        end;
      end;
      if TypePrint = pvPrinter then
      begin
        if TipoDanfe = 1 then
        begin
          DM_Danfe.RelDanfe.PrepareReport;
          DM_Danfe.RelDanfe.PrintOptions.ShowDialog := False;
          DM_Danfe.RelDanfe.Print;
        end
        else
        begin
          DM_Danfe.RelDanfePais.PrepareReport;
          DM_Danfe.RelDanfePais.PrintOptions.ShowDialog := False;
          DM_Danfe.RelDanfePais.Print;
        end;
      end;
    end;
  finally
    TFormatSet.DecimalSeparator := _OldDec;
  end;
end;

procedure TDanfeUtils.SaveDanfeTemplate(const sPath: string = '');
begin
  if Trim(sPath) = '' then
  begin
    //DM_Danfe.RelDanfe.SaveToFile('DANFE_ret.fr3');
    //DM_Danfe.RelDanfePais.SaveToFile('DANFE_pais.fr3');
  end
  else
  begin
    //DM_Danfe.RelDanfe.SaveToFile(sPath + 'DANFE_ret.fr3');
    //DM_Danfe.RelDanfePais.SaveToFile(sPath + 'DANFE_pais.fr3');
  end
end;

procedure TDanfeUtils.SetaXML(const Value: TnfeNFDXML);
begin
  FaXML := Value;
end;

procedure TDanfeUtils.SetLogotipoEmitente(const Value: string);
begin
  FLogotipoEmitente := Value;
  if (Trim(Value) <> EmptyStr) then
  begin
    if (not FileExists(Value)) then
    begin
      FLogotipoEmitente := EmptyStr;
      ShowMessage('Arquivo do logotipo de Emitente não localizado: ' + Value);
      Exit;
    end;
    //DM_Danfe.ArqLogotipo := Value;
  end;
end;


initialization

//DM_Danfe := TDM_Danfe.Create(nil);
{$IFNDEF NO_DANFERB}
_OldDecimalSeparator := TFormatSet.DecimalSeparator;
TFormatSet.DecimalSeparator := '.';
{$ENDIF}

finalization

//DM_Danfe.Free;
{$IFNDEF NO_DANFERB}
TFormatSet.DecimalSeparator := _OldDecimalSeparator;
{$ENDIF}

end.
