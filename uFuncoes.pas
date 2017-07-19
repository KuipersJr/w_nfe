{
 Unit de Funções Gerais
}
unit uFuncoes;

interface

uses System.SysUtils, Data.DB, Datasnap.DBClient, System.Math, Vcl.Forms, Winapi.Windows, Vcl.Controls,
     System.IniFiles, Vcl.FileCtrl, Vcl.ComCtrls, nfdNFe2, Vcl.StdCtrls, System.Classes, Vcl.DBCtrls,
     Vcl.Graphics, Winapi.RichEdit, untTSendMail, Winapi.WinInet, System.DateUtils, Vcl.ExtCtrls, Vcl.Dialogs,
     System.Variants, Winapi.ShellAPI, uPesquisa;
// função de msg com icone War
procedure msgWarning(sMsg : String);
procedure msgInformation(sMsg, titulo : String);
procedure msgErro(sMsg : String);
function msgQuestion(sMsg, titulo : String) : Boolean;
function RemoveMascara(Str : String) : String;
function RemoveAcentos(Str: WideString): WideString;
function Iff(Condicao : Boolean; Param1, Param2 : Variant) : Variant;
// função que gera numeração automatica para os campos autonumerico chave das tabelas
function GetAutoNum(sTabela, sCampo : String) : Integer;
function VerificaAutorizacao : Boolean;
procedure CentralizaForm(ObjPai, ObjFilho : TControl);
procedure WriteToIni(aKey, aName, aValue, INI_FILE: string);
function SelectDir(iniDir, Titulo : String ) : String;
procedure OrdenaPageCtrl(PageCtrl : TPageControl);
function CarregaConfBkp(fa : TFrame) : Boolean;
function consiste( sender: Tobject; Cons: Boolean; retorno: string; tipopasta: Tobject; nomepasta: ttabsheet ): Boolean;
procedure CarregaCmb(cmb : TComboBox; cds : TClientDataSet; id, descricao, tabela : String);
function GetValueCmb(cmb : TComboBox) : Integer;
procedure InsDadosCds(cds : TClientDataSet);
procedure EditaDadosCds(cds : TClientDataSet);
procedure GravaDadosCds(cds : TClientDataSet);
procedure MarkRichEditText(RichEdit:TRichEdit; fgColor, bkColor :TColor; MarkMode :Integer);
procedure GeraEvento(msg : String);
procedure StatusMsg(sMsg : String; cdStatus : Integer);
function getSiglaUF(cdUf : Integer) : String;
procedure AlteraSituacaoNfe(CdStatus : Integer);
function LPad(sStr, sAdd : String; iRept  : Integer) : String;
function RPad(sStr, sAdd : String; iRept  : Integer) : String;
procedure SendEmail;
function ValidaEmail(email:String):boolean;
function VerificaInternet : Boolean;
function GetUTC : String;
function RemoveEspecial(Str : WideString) : WideString;
function RemoveEspacosEntreTags(Str: WideString): WideString;
procedure ExibeMsgTray(sMsg : string; idStatus : Integer);
function FormatReal(sReal : String ) : String;
procedure StartWaint(sMsg : String);
procedure EndWaint;
function FrmtsRealStr(Str : string) : string;
function FormatToReal(Str : String) : Real48;
procedure VisualizarDanfe(const aNumLote: string; const aLoteNotas: WideString; const aArquivoModelo: string = '');
procedure ImprimirDanfe(const aNumLote: string; const aLoteNotas: WideString; const aArquivoModelo: string = '');
function FormataXML(vXML: WideString): WideString;
procedure ExportarDanfePdf(sXml: WideString);
function ExisteNF(sNNF : Real; cds : TClientDataSet ) : Boolean;
function ValidaCNPJ(sCNPJ : String ) : Boolean;
function ValidaAno(iAno : Integer) : Boolean;
function GetIDProt(Nu_NF : Integer; sChave : String) : Integer; // obtem o valor do campo ID_NFE_TRANS da tabela de transmissão
function GetXmlProtolocado(Nu_NF : Integer; sChave : String) : WideString; // Retorna o xml da nfe + o protocolo de autorização validando o xml
procedure ReprocessaRgt; // procedure que reprocessa notas regeitadas;
procedure GravaRegeitadas;
procedure GravaMsg(sXML : WideString);
function ObterMotivo(const aXml: WideString): string;
procedure AtualizaStatusNfe(cdStatus, nNF : String);
//
function GetXML : WideString;
procedure consultaStatus(Sender : TObject);
procedure ClearLogs;
function GetTZD : String; // retorna o TZD se horário de verão 01:00, -02:00 e -03:00
procedure ExecutaExe(sFileName : String);
//

implementation

uses uDm_Princial, uDM_Emitente, uGlobalVar, uPrincipal, uDm_nfe, uNfe_Utils,
  udm_Geral, uWaint, DanfeRB, uDM_Danfe;


procedure msgWarning(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg),'Atenção!', MB_OK + MB_ICONWARNING);
end;

procedure msgInformation(sMsg, titulo : String);
begin
  Application.MessageBox(PChar(sMsg),PChar(titulo), MB_OK + MB_ICONINFORMATION);
end;

procedure msgErro(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg),'Erro', MB_OK + MB_ICONERROR);
end;

function msgQuestion(sMsg, titulo : String) : Boolean;
begin
  Result := (Application.MessageBox(PChar(sMsg),PChar(titulo), MB_YESNO + MB_ICONQUESTION) = idYes);
end;

function RemoveMascara(Str : String) : String;
begin
  Result := StringReplace(Str, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '/', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '(', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ')', '', [rfReplaceAll, rfIgnoreCase]);
end;

function RemoveAcentos(Str: WideString): WideString;
const
  VAcentos = 'áéíóúàèìòùâêîôûäëïöüãõñçÁÉÍÓÚÀÈÌÒÙÂÊÎÔÛÄËÏÖÜÃÕÑÇ';
  VSemAcentos = 'aeiouaeiouaeiouaeiouaoncAEIOUAEIOUAEIOUAEIOUAONC';
var
  I: Integer;
  SStr: string;
begin
  for I := 1 to Length(Str) do
  begin
    if Pos(Str[I], VAcentos) > 0 then
      SStr := SStr + WideChar(VSemAcentos[Pos(Str[I], VAcentos)])
    else
      SStr := SStr + Str[I];
  end;
  SStr := StringReplace(SStr, #13#10, EmptyStr, [RfReplaceAll]);
  Result := SStr;
end;

function Iff(Condicao : Boolean; Param1, Param2 : Variant) : Variant;
begin
  if Condicao then
    Result := Param1
  else
    Result := Param2;
end;

function GetAutoNum(sTabela, sCampo : String) : Integer;
begin
  with dm_Princial do begin
     cdsGeral.Close;
     cdsGeral.CommandText := ' SELECT NEW_ID '+
                             ' FROM P_AUTO_NUM '+
                             '(:CAMPO,:TABELA) ';
     cdsGeral.Params.ParamByName('CAMPO').AsString  := sCampo;
     cdsGeral.Params.ParamByName('TABELA').AsString := sTabela;
     cdsGeral.Open;
     if not cdsGeral.IsEmpty then
       Result := cdsGeral.FieldByName('NEW_ID').AsInteger
     else
       raise Exception.Create('Tabela ou Campo Informado não existem');
     cdsGeral.Close;
  end;
end;

function VerificaAutorizacao : Boolean;
begin
  Result := False;
  with dm_Emitente do begin
    cdsEmitente.Close;
    cdsEmitente.Open;
    cdsEndereco.Close;
    cdsEndereco.Open;
  if not cdsEmitente.IsEmpty then
    Result := cdsEmitente.FieldByName('FLG_AUTORIZADO').AsString = 'S'
  else begin
    cdsEmitente.Append;
    cdsEndereco.Append;
  end;
  end;
end;

procedure CentralizaForm(ObjPai, ObjFilho : TControl);
begin
  ObjFilho.Left := (ObjPai.Width - ObjFilho.Width)  div 2;
  ObjFilho.Top := (ObjPai.Height - ObjFilho.Height) div 2;
end;

procedure WriteToIni(aKey, aName, aValue, INI_FILE: string);
var
  IniFile: TIniFile;
  aCurrentDir: string;
begin
  aCurrentDir := ExtractFilePath(ParamStr(0));
  SetCurrentDir(aCurrentDir);
  IniFile := TIniFile.Create(aCurrentDir + INI_FILE);
  try
    IniFile.WriteString(aKey, aName, aValue);
  finally
    IniFile.Free;
  end;
end;

function SelectDir(iniDir, Titulo : String ) : String;
const
  SELDIRHELP = 1000;
var
   sDir : String;
   sW   : WideString;
begin
  sDir := Iff(iniDir = EmptyStr,'C:\',iniDir);
  if SelectDirectory(Titulo,sW,sDir,[],nil) then
    Result := sDir;
end;

procedure OrdenaPageCtrl(PageCtrl : TPageControl);
begin
  PageCtrl.ActivePageIndex := 0;
end;

function CarregaConfBkp(fa : TFrame): Boolean;
var
   IniArq : TIniFile;
   click : TNotifyEvent;
begin
  Result := False;
  try
    if FileExists(GetCurrentDir + '\'+ INI_WCHI_CONF) then begin
      IniArq    := TIniFile.Create(GetCurrentDir + '\'+ INI_WCHI_CONF);
      vvDirBkp  := IniArq.ReadString('BACKUP','DIR_BKP','');
      vvPeriodo := IniArq.ReadString('BACKUP','PERIODO','');
      vvDiaBkp  := IniArq.ReadString('BACKUP','DIA','');
      vvHoraBkp := IniArq.ReadString('BACKUP','HORA','');
      TEdit(fa.FindComponent('edtDirBkp')).Text := vvDirBkp;
      TRadioButton(fa.FindComponent('rdbDiario')).Checked := (vvPeriodo = 'D');
      if TRadioButton(fa.FindComponent('rdbDiario')).Checked then
        TRadioButton(fa.FindComponent('rdbDiario')).OnClick := click;
      TRadioButton(fa.FindComponent('rdbSemanal')).Checked := (vvPeriodo = 'S');
      if TRadioButton(fa.FindComponent('rdbSemanal')).Checked then begin
        TRadioButton(fa.FindComponent('rdbSemanal')).OnClick := click;
        TComboBox(fa.FindComponent('cmbDia')).ItemIndex := StrToIntDef(vvDiaBkp,1)-1;
      end;
      TRadioButton(fa.FindComponent('rdbMensal')).Checked := (vvPeriodo = 'M');
      if TRadioButton(fa.FindComponent('rdbMensal')).Checked then begin
        TRadioButton(fa.FindComponent('rdbMensal')).OnClick := click;
        TComboBox(fa.FindComponent('cmbDia')).ItemIndex := TComboBox(fa.FindComponent('cmbDia')).Items.IndexOf(iff(vvDiaBkp <> EmptyStr,vvDiaBkp,'01'));
      end;
      TUpDown(fa.FindComponent('upHora')).Position := StrToIntDef(Copy(vvHoraBkp,1,2),0);
      TUpDown(fa.FindComponent('upMin')).Position := StrToIntDef(Copy(vvHoraBkp,4,2),0);
    end;
    FreeAndNil(IniArq);
    Result := (Trim(vvDirBkp) <> EmptyStr) and (Trim(vvPeriodo) <> EmptyStr) and (Trim(vvDiaBkp) <> EmptyStr) and (Trim(vvHoraBkp) <> EmptyStr);
  except
     on E : Exception do begin
       if IniArq <> nil then
         FreeAndNil(IniArq);
     end;
  end;
end;

function consiste( sender: Tobject; Cons: Boolean; retorno: string; tipopasta: Tobject; nomepasta: ttabsheet ): Boolean;
var
s:string;
begin
  if cons then begin
     msgWarning(retorno);
     result := true;
     if tipopasta <> nil then
       ( tipopasta as tpagecontrol ).activepage := nomepasta;
     if sender <> nil then begin
        s:= uppercase(sender.classname);
        if s = 'TDBCOMBOBOX' then begin
           if ( sender as tdbcombobox ).canfocus then
              ( sender as tdbcombobox ).setfocus;
        end else if s = 'TCOMBOBOX' then begin
           if ( sender as tcombobox ).canfocus then
              ( sender as tcombobox ).setfocus;
        end else if s = 'TCUSTOMEDIT' then begin
           if ( sender as tcustomedit ).canfocus then
              ( sender as tcustomedit ).setfocus;
        end else if s = 'TDBDATEEDIT97' then begin
           if ( sender as tcustomedit ).canfocus then
              ( sender as tcustomedit ).setfocus;
        end else if s = 'TDBEDIT' then begin
           if ( sender as tdbedit ).canfocus then
              ( sender as tdbedit ).setfocus;
        end else if s = 'TEDIT' then begin
           if ( sender as tedit ).canfocus then
              ( sender as tedit ).setfocus;
        end else if s = 'TDBRadioGroup' then begin
           if ( sender as TDBRadioGroup ).canfocus then
              ( sender as TDBRadioGroup ).setfocus;
        end else if s = 'TDbComboBox' then begin
           if ( sender as TDBComboBox ).canfocus then
              ( sender as TDBComboBox ).setfocus;
        end;
     end;
  end else
    result := false;
end;

procedure CarregaCmb(cmb : TComboBox; cds : TClientDataSet; id, descricao, tabela : String);
begin
  cds.Close;
  cds.CommandText := 'SELECT ' + ID + ',' + DESCRICAO +
                     ' FROM '+ TABELA +' ORDER BY '+ DESCRICAO;
  cds.Open;
  if not cds.IsEmpty then begin
    cmb.Clear;
    while not cds.Eof do begin
      cmb.Items.AddObject(cds.FieldByName(DESCRICAO).AsString,Pointer(cds.FieldByName(ID).AsInteger));
      cds.Next;
    end;
  end;
end;

function GetValueCmb(cmb : TComboBox) : Integer;
begin
  Result := Integer(cmb.Items.Objects[cmb.ItemIndex]);
end;

procedure InsDadosCds(cds : TClientDataSet);
begin
  if not cds.Active then
    cds.Active;
  if not (cds.State in [dsInsert,dsEdit]) then
   cds.Append;
end;

procedure GravaDadosCds(cds : TClientDataSet);
begin
try
  if (cds.State in [dsInsert,dsEdit]) then
   cds.Post;
  if cds.ProviderName <> EmptyStr then
    cds.ApplyUpdates(-1);
except on E : Exception do
  raise Exception.Create(E.Message);
end;
end;

procedure EditaDadosCds(cds : TClientDataSet);
begin
  if not (cds.State in [dsInsert,dsEdit]) then
   cds.Edit;
end;

procedure MarkRichEditText(RichEdit:TRichEdit; fgColor, bkColor :TColor; MarkMode :Integer);
var
  CharFormat :TCharFormat2;
begin
  if MarkMode = SCF_WORD then
    MarkMode := MarkMode or SCF_SELECTION;
  CharFormat.cbSize := SizeOf(CharFormat);
  CharFormat.dwMask := CFM_BACKCOLOR or CFM_COLOR;
  CharFormat.crBackColor := ColorToRGB(bkColor);
  CharFormat.crTextColor := ColorToRGB(fgColor);
  SendMessage(RichEdit.handle, EM_SETCHARFORMAT, MarkMode, LongInt(@CharFormat));
end;

procedure GeraEvento(msg : String);
begin

  dm_nfe.cdsNFe_Log.Insert;
  dm_nfe.cdsNFe_Log.FieldByName('DATA_HORA').AsDateTime := Now;
  dm_nfe.cdsNFe_Log.FieldByName('DESC_EVENTO').AsString := msg;
  dm_nfe.cdsNFe_Log.FieldByName('NU_NF').Value := iff(vvNU_NFE <> EmptyStr,vvNU_NFE,Null);
  dm_nfe.cdsNFe_Log.Post;
  dm_nfe.cdsNFe_Log.ApplyUpdates(-1);

end;

procedure StatusMsg(sMsg : String; cdStatus : Integer);
begin
  frmPrincipal.StatusBar1.Font.Style := [fsBold];
  case cdStatus of
    0 : frmPrincipal.StatusBar1.Font.Color := clDefault;
    1 : frmPrincipal.StatusBar1.Font.Color := clRed;
    2 : frmPrincipal.StatusBar1.Font.Color := clYellow;
    3 : frmPrincipal.StatusBar1.Font.Color := clGreen;
  end;
  frmPrincipal.StatusBar1.Panels[0].Text := sMsg;
  frmPrincipal.StatusBar1.Refresh;
end;

function getSiglaUF(cdUf : Integer) : String;
begin
  dm_Princial.cdsGeral.Close;
  dm_Princial.cdsGeral.CommandText := 'SELECT SIGLA '+
                                      ' FROM TB_IBGE_UF '+
                                      ' WHERE COD_UF = :CDUF ';
  dm_Princial.cdsGeral.Params.ParamByName('CDUF').AsInteger := cdUf;
  dm_Princial.cdsGeral.Open;
  Result := dm_Princial.cdsGeral.FieldByName('SIGLA').AsString;
  dm_Princial.cdsGeral.Close;
end;

function ConsultaSituacaoSefaz(idNFe : String) : Integer;
begin
  if Length(Trim(idNFe)) = 44 then
    Result := GetCodMsgStatus(dm_nfe.nfdNFe2.ConsultarNF(idNFe))
  else
    Result := GetCodMsgStatus(dm_nfe.nfdNFe2.ConsultarRecibo(idNFe))
end;

procedure AlteraSituacaoNfe(CdStatus : Integer);
begin
  dm_Princial.cdsGeral.Close;
  dm_Princial.cdsGeral.CommandText := '';

end;

function LPad(sStr, sAdd : String; iRept  : Integer) : String;
var
   iInt : Integer;
   sAux : String;
begin
   iInt := (iRept - Length(sStr));
   while iInt > Length(sAux) do
     sAux := sAux + sAdd;
   Result := sAux + sStr;
end;

function RPad(sStr, sAdd : String; iRept  : Integer) : String;
var
   iInt : Integer;
   sAux : String;
begin
   iInt := (iRept - Length(sStr));
   while iInt > Length(sAux) do
     sAux := sAux + sAdd;
   Result := sStr + sAux;
end;

procedure SendEmail;
var
  eMail : TSendMail;
  sParam, sBody : String;
  sEmail : TStringList;
begin
  if vvPdf then
    if (not FileExists(vvFilePdf)) then begin
      if msgQuestion('O Arquivo '+ vvFilePdf + '.pdf' + ' não encontrado ' + #10#13 + 'Desseja continuar','Atenção') then
        msgWarning('O arquivo '+ vvFilePdf + '.pdf não sera enviado para o cliente')
      else
        exit;
    end;
  if (not FileExists(vvFileXml)) then begin
    msgWarning('O Arquivo '+ vvFileXml + ' não encontrado.' + #10#13 + 'O email não será enviado ao cliente');
    exit;
  end;
  if vvServSMTP = 'smtp.live.com'  then begin
    if FileExists(ExtractFilePath(ParamStr(0)) + 'sendmail.exe') then begin
      try
        sEmail := TStringList.Create;
        sEmail.Add(vvServSMTP); // host
        sEmail.Add(IntToStr(vvPorta)); // porta
        sEmail.Add(vvEmailR); // email remetente - conta
        sEmail.Add(vvSenha); // senha
        sEmail.Add(Trim(vvEmailDest)); // destinatário
        sEmail.Add(Trim(vvAssunto)); // assunto
        // corpo do email
        sEmail.Add(RemoveAcentos(StringReplace(vvMsgEmail,#10#13,'<br>',[rfReplaceAll,rfIgnoreCase]) + '<br><br> Chave da NF-e ' + vvCHAVE_NFE + ' ' +
                   'Como consultar a Nota Fiscal Eletrônica. <br>' +
                   'Acesse o Portal da Nota Fiscal Eletronica do Ministerio da Fazenda em <a target="_blank" href="http://www.nfe.fazenda.gov.br">www.nfe.fazenda.gov.br</a> <br>' +
                   'Vá até serviços > Consultar NF-e. Digite a chave acima para acessar todas as informações sobre a NF-e.'));
        sEmail.Add('<br>');
        sEmail.Add('<br>');
        sEmail.Add('<b><font size=1>Essa NF-e foi transmitida pelo WHCI NF-e da HCI Sistemas Integrados.');
        sEmail.Add('<br>');
        sEmail.Add('Site: <a target="_blank" href="http://www.hci.com.br">www.hci.com.br</a>');
        sEmail.Add('<br> Capitais e regioes metropolitanas: 11 3288.4522');
        sEmail.Add('<br> Demais localidades: 0800.77 23 424 </font></b>');
        //
        sEmail.Add(vvFileXml); // anexo xml
        sEmail.Add(vvFilePdf); // anexo pdf
        sEmail.SaveToFile(ExtractFilePath(ParamStr(0))+'email.txt');
        ShellExecute(0,nil,PWideChar(ExtractFilePath(ParamStr(0)) + 'sendmail.exe'),PWideChar(sParam),PWideChar(ExtractFilePath(ParamStr(0))),SW_SHOWNORMAL);
        DeleteFile(Pwidechar(ExtractFilePath(ParamStr(0))+'email.txt'));
      finally
        FreeAndNil(sEmail);
      end;
    end;
  end else begin
    eMail := TSendMail.Create;
    eMail.smtp := vvServSMTP;
    eMail.login := vvUsuario;
    eMail.senha := vvSenha;
    eMail.port := vvPorta;
    eMail.mailFrom := vvEmailR;;
    eMail.from := vvEmailR;
    eMail.mailDest := vvEmailDest;
    eMail.assunto := vvAssunto;
    eMail.sbody.Add(vvMsgEmail + '<br><br> Chave da NF-e ' + vvCHAVE_NFE + ' ');
    eMail.sbody.Add('Como consultar a Nota Fiscal Eletrônica. <br>');
    eMail.sbody.Add('Acesse o Portal da Nota Fiscal Eletrônica do Ministério da Fazenda em <a target="_blank" href="www.nfe.fazenda.gov.br">www.nfe.fazenda.gov.br</a> <br>');
    eMail.sbody.Add('Vá até serviços > Consultar NF-e. Digite a chave acima para acessar todas as informações sobre a NF-e.');
    eMail.sbody.Add('<br>');
    eMail.sbody.Add('<br>');
    eMail.sbody.Add('<b><font size=1>Essa NF-e foi transmitida pelo WHCI NF-e da HCI Sistemas Integrados.');
    eMail.sbody.Add('<br>');
    eMail.sbody.Add('Site: <a target="_blank" href="http://www.hci.com.br">www.hci.com.br</a>');
    eMail.sbody.Add('<br> Capitais e regioes metropolitanas: 11 3288.4522');
    eMail.sbody.Add('<br> Demais localidades: 0800.77 23 424 </font></b>');
    eMail.anexo := vvFileXml + ',' + vvFilePdf;
    eMail.executa;
  end;
  //DeleteFile(PWideChar(vvFileXml));
end;

function ValidaEmail(email : String) : boolean;
var
  sAux : string;
begin
  sAux := Copy(email,Pos('@',email),length(email));
  Result := (Pos('@',sAux) = 1) and (Pos('.',sAux) >= Pos('@',sAux)+2) and
            (Pos('.',sAux) < Length(sAux));
end;

function VerificaInternet : Boolean;
var
   Flags : DWORD;
begin
  if not InternetGetConnectedState(@Flags, 0) then
    result := False
  else
    result := True;
end;

function GetUTC : String;
var
  bias,
  Hours,
  Minutes: Integer;
  TimeZoneInfo: TTimeZoneInformation;
begin

  FillChar(TimeZoneInfo, SizeOf(TimeZoneInfo), #0);
  case GetTimeZoneInformation(TimeZoneInfo) of
    TIME_ZONE_ID_STANDARD:
      bias := -(TimeZoneInfo.Bias + TimeZoneInfo.StandardBias);
    TIME_ZONE_ID_UNKNOWN:
      bias := -(TimeZoneInfo.Bias + TimeZoneInfo.StandardBias);
    TIME_ZONE_ID_DAYLIGHT:
      bias := -(TimeZoneInfo.Bias + TimeZoneInfo.DaylightBias);
  end;

  Hours := Bias div 60;
  Minutes := Abs(Bias) mod 60;
  if Bias >= 0 then
    Result := Format('%.2d:%.2d', [Hours, Minutes])
  else
    Result := Format('%.2d:%.2d', [Hours, Minutes]);

end;

function RemoveEspecial(Str : WideString) : WideString;
begin
  Result := StringReplace(Str, #36, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #34, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #37, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #38, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #39, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #42, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #44, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #60, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #62, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #96, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #128, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #129, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #130, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #136, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #142, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #152, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #153, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #161, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #162, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #163, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #164, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #165, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #166, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #167, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #168, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #169, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #170, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #171, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #172, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #173, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #174, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #175, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #186, '', [rfReplaceAll, rfIgnoreCase]);
end;

function RemoveEspacosEntreTags(Str: WideString): WideString;
var
  CheckEspaco: Boolean;
  Cont: Integer;
begin
  CheckEspaco := False;
  Result := EmptyStr;
  Str := StringReplace(Str, #13#10, EmptyStr, [rfReplaceAll]);
  Str := StringReplace(Str, #13, EmptyStr, [rfReplaceAll]);
  Str := StringReplace(Str, #10, EmptyStr, [rfReplaceAll]);
  Str := StringReplace(Str, #9, EmptyStr, [rfReplaceAll]);
  for Cont := 1 to Length(Str) do
  begin
    CheckEspaco := CheckEspaco or (Str[Cont] = '>');
    if CheckEspaco and (Str[Cont] = #32) then
      Continue;
    Result := Result + Str[Cont];
    CheckEspaco := CheckEspaco and (Str[Cont + 1] = #32);
  end;
end;

procedure ExibeMsgTray(sMsg : string; idStatus : Integer);
begin
  case idStatus of
    0 : begin
          frmPrincipal.TrayIcon1.BalloonFlags := bfInfo;
          frmPrincipal.TrayIcon1.BalloonTitle := 'Aviso';
        end;
    1 : begin
          frmPrincipal.TrayIcon1.BalloonFlags := bfWarning;
          frmPrincipal.TrayIcon1.BalloonTitle := 'Atenção';
        end;
    2 : begin
          frmPrincipal.TrayIcon1.BalloonFlags := bfError;
          frmPrincipal.TrayIcon1.BalloonTitle := 'Erro';
        end;
  end;
  frmPrincipal.TrayIcon1.ShowBalloonHint;
  frmPrincipal.TrayIcon1.BalloonTimeout := 2000;
  //frmPrincipal.TrayIcon1.Animate := True;
  frmPrincipal.TrayIcon1.BalloonHint := sMsg;
end;

function FormatReal(sReal : String ) : String;
var
  sAux : String;
begin
  sAux := StringReplace(sReal,'.',',',[rfReplaceAll]);
  sAux := FloatToStr(RoundTo(StrToFloatDef(sAux,0),-2));
  sAux := StringReplace(sAux,'.','',[rfReplaceAll]);
  sAux := StringReplace(sAux,',','.',[rfReplaceAll]);
  Result := sAux;
end;

procedure StartWaint(sMsg : String);
begin
  if frmWaint = nil then begin
    frmWaint := TfrmWaint.Create(Application);
    frmWaint.sMsg := sMsg;
    frmWaint.Show;
    frmWaint.BringToFront;
    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;
  end;
end;

procedure EndWaint;
begin
  if frmWaint <> nil then begin
    Screen.Cursor := crDefault;
    FreeAndNil(frmWaint);
  end;
end;

function FrmtsRealStr(Str : string) : string;
begin
  Result := StringReplace(Str,'.',',',[rfReplaceAll,rfIgnoreCase]);
end;

function FormatToReal(Str : String) : Real48;
begin
  Result := StrToFloatDef(StringReplace(Str,'.',',',[rfReplaceAll]),0);
end;

function FormataXML(vXML: WideString): WideString;
var
  vTempXML: WideString;
begin
  vTempXML := vXML;

  vTempXML := StringReplace(vTempXML, #13#10, '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, #9, '', [rfReplaceAll]);

  vTempXML := StringReplace(vTempXML, '<?xml version="1.0"?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<?xml version="1.0" encoding="UTF-8"?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<?xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);

  vTempXML := StringReplace(vTempXML, '<? xml version="1.0"?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<? xml version="1.0" encoding="UTF-8"?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<? xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);

  vTempXML := StringReplace(vTempXML, '<? xml version="1.0" ?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<? xml version="1.0" encoding="UTF-8" ?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<? xml version="1.0" encoding="utf-8" ?>', '', [rfReplaceAll]);

  vTempXML := StringReplace(vTempXML, '<?xml version="1.0" ?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<?xml version="1.0" encoding="UTF-8" ?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<?xml version="1.0" encoding="utf-8" ?>', '', [rfReplaceAll]);

  vTempXML := StringReplace(vTempXML, '<? xml version="1.0"?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<? xml version="1.0" encoding="UTF-8"?>', '', [rfReplaceAll]);
  vTempXML := StringReplace(vTempXML, '<? xml version="1.0" encoding="utf-8"?>', '', [rfReplaceAll]);

  Result := '<?xml version="1.0" encoding="UTF-8"?>' + vTempXML;
end;

procedure VisualizarDanfe(const aNumLote: string; const aLoteNotas: WideString; const aArquivoModelo: string = '');
var
  aLoteValido: WideString;
begin
  aLoteValido := FormataXML(aLoteNotas);
  DM_Danfe.cdsGeral.Open;
  PreviewDanfe(PWideChar(aLoteValido), Pwidechar(''), Pwidechar(''));
  DM_Danfe.cdsGeral.Close;
end;

procedure ExportarDanfePdf(sXml: WideString);
var
  sNameFile : String;
begin
 sNameFile := vvDirTmp +'\'+ ObterNotaID(sXml) + '.pdf';
 ExportDanfe(PWideChar(sXml),PWideChar(sNameFile),'',1);
end;

procedure ImprimirDanfe(const aNumLote: string; const aLoteNotas: WideString; const aArquivoModelo: string = '');
var
  aLoteValido: WideString;
begin
  aLoteValido := FormataXML(aLoteNotas);
  DM_Danfe.cdsGeral.Open;
  PrintDanfe(PWideChar(aLoteValido), Pwidechar(''), Pwidechar(''));
  DM_Danfe.cdsGeral.Close;
end;

function ExisteNF(sNNF : Real; cds : TClientDataSet ) : Boolean;
begin
  cds.Close;
  cds.CommandText := 'SELECT COUNT(1) FROM TB_NFE_TRANS '+
                     ' WHERE CAST(NU_NFE AS NUMERIC(09)) = :NNF ';
  cds.Params.ParamByName('NNF').AsFloat := sNNF;
  cds.Open;
  Result := cds.Fields[0].AsFloat = 0;
end;

function ValidaCNPJ(sCNPJ : String ) : Boolean;
var
   n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
   d1,d2: integer;
   digitado, calculado: string;
begin

   n1:=StrToInt(sCNPJ[1]);
   n2:=StrToInt(sCNPJ[2]);
   n3:=StrToInt(sCNPJ[3]);
   n4:=StrToInt(sCNPJ[4]);
   n5:=StrToInt(sCNPJ[5]);
   n6:=StrToInt(sCNPJ[6]);
   n7:=StrToInt(sCNPJ[7]);
   n8:=StrToInt(sCNPJ[8]);
   n9:=StrToInt(sCNPJ[9]);
   n10:=StrToInt(sCNPJ[10]);
   n11:=StrToInt(sCNPJ[11]);
   n12:=StrToInt(sCNPJ[12]);

   d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
   d1:=11-(d1 mod 11);
   if d1>=10 then d1:=0;

 d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
   d2:=11-(d2 mod 11);
   if d2>=10 then d2:=0;
   calculado:=inttostr(d1)+inttostr(d2);
   digitado:=sCNPJ[13]+sCNPJ[14];
   if calculado = digitado then
      Result := true
   else
     Result := false;
end;

function ValidaAno(iAno : Integer) : Boolean;
begin
  Result := (iAno > 1900) and (iAno <= YearOf(Date));
end;

function GetIDProt(Nu_NF : Integer; sChave : String) : Integer; // obtem o valor do campo ID_NFE_TRANS da tabela de transmissão
begin
  dm_Princial.cdsAux.Close;
  dm_Princial.cdsAux.CommandText := 'SELECT ID_NFE_TRANS '+
                                    ' FROM TB_NFE_TRANS '+
                                    ' WHERE CAST(NU_NFE AS NUMERIC(09)) = :NU_NFE '+
                                    ' AND CHAVE_NFE = :CV_NFE ';
  dm_Princial.cdsAux.Params.ParamByName('NU_NFE').AsInteger := Nu_NF;
  dm_Princial.cdsAux.Params.ParamByName('CV_NFE').AsString := sChave;
  dm_Princial.cdsAux.Open;
  Result := dm_Princial.cdsAux.FieldByName('ID_NFE_TRANS').AsInteger;
  dm_Princial.cdsAux.Close;
end;

function GetXmlProtolocado(Nu_NF : Integer; sChave : String) : WideString; // Retorna o xml da nfe + o protocolo de autorização validando o xml
begin
  dm_Princial.cdsAux.Close;
  dm_Princial.cdsAux.CommandText := 'SELECT CAST(''<?xml version="1.0" encoding="UTF-8"?>'' || '+
                                     '''<nfeProc versao="2.00" xmlns="http://www.portalfiscal.inf.br/nfe">'' || '+
                                     ' TRANS.NFE_XML || '+
                                     '''<protNFe versao="2.00"><infProt>'' || '+
                                     '''<tpAmb>'' || (SELECT CASE FLG_AMBIENTE WHEN ''H'' THEN 2 WHEN ''P'' THEN 1 END FROM TB_NFE_CONF) || ''</tpAmb>'' || '+
                                     '''<verAplic>'' || PROT.veraplic || ''</verAplic>'' || '+
                                     '''<chNFe>'' || PROT.CHAVE_NFE || ''</chNFe>'' ||' +
                                     '''<dhRecbto>'' || EXTRACT(YEAR FROM PROT.DATA_PROT) || ''-'' || EXTRACT(MONTH FROM PROT.DATA_PROT) || ''-'' || EXTRACT(DAY FROM PROT.DATA_PROT) ||''T''|| '+
                                     ' EXTRACT(HOUR FROM PROT.HORA) ||'':''|| EXTRACT(MINUTE FROM PROT.HORA) ||'':''|| EXTRACT(SECOND FROM PROT.HORA) || ''</dhRecbto>'' || '+
                                     '''<nProt>'' || PROT.N_PROTOCOLO || ''</nProt>'' || '+
                                     '''<digVal>'' || PROT.DIGVALUE || ''</digVal>'' || '+
                                     '''<cStat>'' || PROT.CSTAT || ''</cStat>'' || '+
                                     '''<xMotivo>'' || PROT.MOTIVO || ''</xMotivo>'' || '+
                                    '''</infProt></protNFe></nfeProc>'' AS BLOB SUB_TYPE 1 SEGMENT SIZE 4096) XML_PROTOCOLADO '+
                                    ' FROM TB_NFE_TRANS TRANS '+
                                    ' INNER JOIN TB_NFE_PROT PROT ON TRANS.ID_NFE_TRANS = PROT.ID_NFE_TRANS AND CAST(TRANS.NU_NFE AS NUMERIC(09)) = CAST(PROT.NU_NF AS NUMERIC(09)) '+
                                    ' WHERE CAST(NU_NFE AS NUMERIC(09)) = :NU_NFE '+
                                    ' AND CHAVE_NFE = :CV_NFE ';
  dm_Princial.cdsAux.Params.ParamByName('NU_NFE').AsInteger := Nu_NF;
  dm_Princial.cdsAux.Params.ParamByName('CV_NFE').AsString := sChave;
  dm_Princial.cdsAux.Open;
  Result := dm_Princial.cdsAux.FieldByName('XML_PROTOCOLADO').Value;
  dm_Princial.cdsAux.Close;
end;

procedure ReprocessaRgt; // procedure que reprocessa notas regeitadas;
begin
  try
    dm_Princial.cdsAux.Close;
    dm_Princial.cdsAux.CommandText := 'DELETE FROM TB_NFE_TRANS ' +
                                      ' WHERE COD_SITUACAO >= 200 ';
    dm_Princial.cdsAux.Execute;
    frmPrincipal.Timer_MonitorTimer(Nil);
  except
    on E : Exception do
      msgErro('Erro no reprocessamento de notas regeitadas' + #10#13 + 'Erro : ' + E.Message);
  end;
end;

procedure GravaRegeitadas;
begin
  try
    dm_Princial.cdsAux.Close;
    dm_Princial.cdsAux.CommandText := ' INSERT INTO TB_NFE_REJEITADA ( ID_NF_REG '+
                                                                    ' ,DTA_EMISSAO '+
                                                                    ' ,CPF_CNPJ '+
                                                                    ' ,NOME_DEST '+
                                                                    ' ,CHAVE_NFE '+
                                                                    ' ,NU_NFE '+
                                                                    ' ,COD_SITUACAO) '+
                                       ' SELECT ID_NFE_TRANS '+
                                              ' ,DTA_EMISSAO '+
                                              ' ,CPF_CNPJ '+
                                              ' ,NOME_DEST '+
                                              ' ,CHAVE_NFE '+
                                              ' ,NU_NFE '+
                                              ' ,COD_SITUACAO '+
                                        ' FROM TB_NFE_TRANS '+
                                        ' WHERE COD_SITUACAO >= 200 '+
                                        '  AND ID_NFE_TRANS NOT IN (SELECT ID_NF_REG FROM TB_NFE_REJEITADA ) ';
    dm_Princial.cdsAux.Execute;
  except
    on E : Exception do
      msgErro('Erro na gravação de notas regeitadas' + #10#13 + 'Erro : ' + E.Message);
  end;
end;

procedure GravaMsg(sXML : WideString);
var
  sCodMsg,
  sMsg : String;
begin
  sCodMsg := IntToStr(GetCodMsgStatus(sXML));
  if Trim(GetMsgSolicitacao(StrToInt(sCodMsg),dm_Princial.cdsGeral)) = EmptyStr then begin
    dm_Princial.cdsAux.Close;
    dm_Princial.cdsAux.CommandText := 'INSERT INTO TB_NFE_MSG ' + sCodMsg + ',' + QuotedStr(ObterMotivo(sXML));
    dm_Princial.cdsAux.Execute;
  end;
end;

function ObterMotivo(const aXml: WideString): string;
var
  _Posini, _Posfim: integer;
  aTag, aEndTag: WideString;
begin
  Result := '';
  aTag := '<xMotivo';
  aEndTag := '</xMotivo';
  _Posini := POS(aTag, aXML);
  _Posfim := POS(aEndTag, aXML);
  if (_Posini > 0) then begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini + 1, (_PosFim - _PosIni) - 1);
  end;
end;

procedure AtualizaStatusNfe(cdStatus, nNF : String);
var
  sSql : String;
begin
 try
   if StrToInt(cdStatus) < 200 then begin
     sSql := ' UPDATE TB_NFE_TRANS SET COD_SITUACAO = :STATUS ';
     if StrToInt(cdStatus) <> 100 then
       sSql := sSql + ' ,NFE_XML = (CASE WHEN POSITION(''<NFe'' IN NFE_XML ) > 0 THEN DECODE(SUBSTRING(NFE_XML FROM POSITION(''<NFe'' IN NFE_XML ) FOR POSITION(''</NFe'' IN NFE_XML ) + 5),'','+
                                    'NFE_XML,SUBSTRING(NFE_XML FROM POSITION(''<NFe'' IN NFE_XML ) FOR POSITION(''</NFe'' IN NFE_XML ) + 5)) ELSE NFE_XML END)';
   end else begin
     sSql := ' UPDATE TB_NFE_TRANS SET COD_SITUACAO = :STATUS '+
             ' ,NFE_XML = (CASE WHEN POSITION(''<NFe'' IN NFE_XML ) > 0 THEN DECODE(SUBSTRING(NFE_XML FROM POSITION(''<NFe'' IN NFE_XML ) FOR POSITION(''</NFe'' IN NFE_XML ) + 5),'','+
                          'NFE_XML,SUBSTRING(NFE_XML FROM POSITION(''<NFe'' IN NFE_XML ) FOR POSITION(''</NFe'' IN NFE_XML ) + 5)) ELSE NFE_XML END)';
   end;

  dm_Princial.cdsAux.Close;
  dm_Princial.cdsAux.CommandText := sSql + ' WHERE CAST(NU_NFE AS NUMERIC(09)) = '+ nNF;
//  dm_Princial.cdsAux.FetchParams;
  dm_Princial.cdsAux.Params.ParamByName('STATUS').AsInteger := StrToInt(cdStatus);
  //dm_Princial.cdsAux.Params.ParamByName('nNF').AsInteger := StrToInt(nNF);
  dm_Princial.cdsAux.Execute;

 except
   on ex : Exception do begin
     msgErro('Erro ao atualizar o status da NF-e' + #10#13 + 'Erro Orig.' + ex.Message);
   end;
 end;

end;

function GetXML : WideString;
begin
  dm_Princial.cdsGeral.Close;
  dm_Princial.cdsGeral.CommandText := ' SELECT '+
                                      ' NFE_XML '+
                                      ' FROM TB_NFE_TRANS '+
                                      ' WHERE SERIE = :PSR '+
                                      ' AND CAST(NU_NFE AS NUMERIC(09)) = :PNF '+
                                      ' AND CHAVE_NFE = :PIDNFE ';
  dm_Princial.cdsGeral.Params.ParamByName('PSR').AsString := dmGeral.cdsConsulta.FieldByName('SERIE').AsString;
  dm_Princial.cdsGeral.Params.ParamByName('PNF').AsFloat := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsFloat;
  dm_Princial.cdsGeral.Params.ParamByName('PIDNFE').AsString := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
  dm_Princial.cdsGeral.Open;
  Result := dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString;
  dm_Princial.cdsGeral.Close;
end;

procedure consultaStatus(Sender: TObject);
var
  sXML : WideString;
  bkm : TBookmark;
begin
  try
    if Sender <> nil then
      StartWaint('Consultando situação da NF-e junto a SEFAZ'+ #10#13 + 'Aguarde...');
    // limpa variaveis
    vNFeXML := EmptyWideStr;
    vvXML_PROT_AUTO := EmptyWideStr;
    vvXML_PROTOCOLO := EmptyWideStr;
    sXMLProtocolado := EmptyWideStr;
    //
    if not dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').IsNull then begin
      sXML := dm_nfe.nfdNFe2.ConsultarNF2_01(dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString);
    end else begin
      sXML := dm_nfe.nfdNFe2.ConsultarRecibo(dmGeral.cdsConsulta.FieldByName('NRECIBO').AsString);
      vvnRecibo := dmGeral.cdsConsulta.FieldByName('NRECIBO').AsString;
    end;
    //
    vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(sXML));
    Application.ProcessMessages;
    GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
    Application.ProcessMessages;
    StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);
    if StrToInt(vvCOD_SITUACAO) >= 200 then begin
      EndWaint;
      if Sender <> nil then
        msgWarning(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
      if StrToInt(vvCOD_SITUACAO) = 656 then
        Exit;
      //dmGeral.cdsConsulta.Close;
      //dmGeral.cdsConsulta.Open;
      //exit;
    end;
    //
    if Length(Trim(sXML)) > 0 then begin
      vvCOD_SITUACAO    := IntToStr(GetCodMsgStatus(sXML));
      vvFLG_AUTORIZADA  := iff(vvCOD_SITUACAO = '100','S','N');
      vvDtaAutoriza     := formataDtaFb(ObterData(sXML));
      vvPROTOCOLO_ENVIO := ObterNroProtocolo(sXML);
      vvNU_NFE          := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsString;
      vvCHAVE_NFE       := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
      vvSERIE           := dmGeral.cdsConsulta.FieldByName('SERIE').AsString;
      vvCPF_CNPJ        := dmGeral.cdsConsulta.FieldByName('CPF_CNPJ').AsString;
      vvNOME_DEST       := dmGeral.cdsConsulta.FieldByName('NOME_DEST').AsString;
      vvFLG_IMPR        := dmGeral.cdsConsulta.FieldByName('DANFE_IMPRESSO').AsString[1];
      vvnRecibo         := dmGeral.cdsConsulta.FieldByName('NRECIBO').AsString;
      vvDtaEmissao      := dmGeral.cdsConsulta.FieldByName('DTA_EMISSAO').AsDateTime;
      vvNFE_XML         := GetXML;
      if (GetCodMsgStatus(sXML) = 100) and (GetCodMsgStatus(vvNFE_XML) <> 100) then begin
        vvXML_PROTOCOLO := sXML;
        vvXML_PROT_AUTO := sXML;
      end;
      if StrToInt(vvCOD_SITUACAO) = 101 then
        vvXML_CancProt := sXML;
      //
      AtualizaStatusNfe(vvCOD_SITUACAO,vvNU_NFE);
      //
      GravaTransNfe;
      //
      try
        dmGeral.cdsConsulta.DisableControls;
        bkm := dmGeral.cdsConsulta.GetBookmark;
        dmGeral.cdsConsulta.Close;
        dmGeral.cdsConsulta.Open;
        dmGeral.cdsConsulta.GotoBookmark(bkm);
        dmGeral.cdsConsulta.freebookmark(bkm);
        dmGeral.cdsConsulta.EnableControls;
      except
        dmGeral.cdsConsulta.freebookmark(bkm);
        dmGeral.cdsConsulta.EnableControls;
      end;
      //
    end;
    if Sender <> nil then
      EndWaint;
  except
    on E : exception do begin
      EndWaint;
      msgErro('Ocoreu um erro ao tentar consultar status da NF-e na Sefaz.' + #10#13 + E.Message);
      exit;
    end;
  end;
end;

procedure ClearLogs;
begin
  try
    dm_Princial.cdsGeral.Close;
    dm_Princial.cdsGeral.CommandText := ' DELETE FROM TB_NFE_LOG '+
                                        ' WHERE DATA_HORA <= (CURRENT_TIMESTAMP-30) ';
    dm_Princial.cdsGeral.Execute;
  except
    on E : exception do begin
      raise Exception.Create(E.Message);
      exit;
    end;
  end;
end;

function GetTZD : String;
var
  TimeZone: TTimeZoneInformation;
begin
  GetTimeZoneInformation(TimeZone);
  if (Pos('verão',TimeZone.DaylightName) > 0) or (vvHVerao) then
    Result := '-02:00'
  else
    Result := '-03:00';
end;

procedure ExecutaExe(sFileName : String);
var ProcInfo: TProcessInformation;
    StartInfo: TStartupInfo;
begin
  FillMemory(@StartInfo, sizeof(StartInfo), 0);
  StartInfo.cb := sizeof(StartInfo);
  CreateProcess(
                nil,
                PChar(sFileName),
                nil, Nil, False,
                NORMAL_PRIORITY_CLASS,
                nil, nil,
                StartInfo,
                ProcInfo);
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
end;

end.
