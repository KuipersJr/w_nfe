unit untTSendMail;

interface

uses
    comobj, mapi, ExtCtrls, IdComponent, IdTCPConnection,IdTCPClient,
    IdMessageClient, IdSMTP, IdBaseComponent, IdMessage, stdctrls, Vcl.ComCtrls,IdText,
    System.Classes, Vcl.Forms, Vcl.Dialogs, IdSSLOpenSSL,IdExplicitTLSClientServerBase, IdSASLLogin, IdUserPassProvider;

Type
    TSendMail = class(TObject)
    private
    mensagem    : TIdMessage;
    clientSmtp  : TIdSMTP;
    AuthSSL: TIdSSLIOHandlerSocketOpenSSL;
    IdSASLLogin : TIdSASLLogin;
    IdUserPassProvider : TIdUserPassProvider;
    FmailFrom: String;
    FmailDest: String;
    Fbody: TStringList;
    Ffrom: String;
    Fanexo: String;
    Fsenha: String;
    Fsmtp: String;
    Flogin: String;
    Fassunto: String;
    Fmemo: TMemo;
    Fport: Integer;

    private
    procedure Preenchelista(var sList : TStringList; sTr : String);
    procedure prepara;
    procedure status(msg : string);
    procedure StatusSmtp(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);

    public
    property sbody       : TStringList read Fbody write Fbody;
    property smtp        : String read Fsmtp write Fsmtp;
    property from        : String read Ffrom write Ffrom;
    property mailFrom    : String read FmailFrom write FmailFrom;
    property mailDest    : String read FmailDest write FmailDest;
    property login       : String read Flogin write Flogin;
    property senha       : String read Fsenha write Fsenha;
    property assunto     : String read Fassunto write Fassunto;
    property anexo       : String read Fanexo write Fanexo;
    property memo        : TMemo read Fmemo write Fmemo;
    property port        : Integer read Fport write Fport;

    procedure executa;

    constructor Create;
    end;

implementation

uses SysUtils, IdAttachmentFile, uGlobalVar, uFuncoes;

{ TSendMail }

constructor TSendMail.Create;
begin
    Fbody := TStringList.Create;
    Fbody.Clear;
    Fsmtp := '';
    Ffrom := '';
    FmailFrom := '';
    FmailDest := '';
    Flogin := '';
    Fsenha := '';
    Fassunto := '';
    Fanexo := '';
    mensagem := nil;
    Fport := 25; //Porta padrão
end;

procedure TSendMail.executa;
begin
    status('-----------------------------');
    status('');
    try
      try
        vvEnviou := False;
        GeraEvento('Preparando para envio de email...');
        StatusMsg('Preparando para envio de email...',3);
        prepara;
        status('Conectando...');
        GeraEvento('Conectando...');
        StatusMsg('Conectando...',3);
        clientSmtp.Connect;
        //clientSmtp.Authenticate;
        status('Enviando mensagem para: ' + mailDest);
        GeraEvento('Enviando mensagem para: ' + mailDest);
        StatusMsg('Enviando mensagem para: ' + mailDest,3);
        clientSmtp.Send(mensagem);
        GeraEvento('Email enviando para: ' + mailDest);
        StatusMsg('Email enviando para: ' + mailDest,3);
        status('Desconectando...');
        GeraEvento('Desconectando...');
        StatusMsg('Desconectando...',3);
        if clientSmtp.Connected then
          clientSmtp.Disconnect;
        vvEnviou := True;
      except
         on E : Exception do begin
           GeraEvento('Erro ao enviar nfe para o cliente...' + #13 + 'Erro ' + E.Message);
           StatusMsg('Desconectando...' + #13 + 'Erro ' + E.Message,1);
           if vvTrayAtivado then
             ExibeMsgTray('Erro ao enviar nfe para o cliente...' + #13 + 'Erro ' + E.Message,2);
           mensagem.Free;
           clientSmtp.Free;
           vvEnviou := False;
         end;
      end;
    finally
      mensagem.Free;
      clientSmtp.Free;
      if vvSSL then
        FreeAndNil(AuthSSL);
    end;
end;

procedure TSendMail.Preenchelista(var sList: TStringList; sTr: String);
var
    strAux : String;
    RecCount : Integer;
begin
  sList.Clear;
  strAux     := StringReplace(sTr,',',',#', [rfReplaceAll, rfIgnoreCase]);
  RecCount   := ExtractStrings([','],[' '],PChar(strAux),sList);
  sList.Text := StringReplace(sList.Text,'#','', [rfReplaceAll, rfIgnoreCase]);
  //sList.Delete(0);
  // sList.Delete(sList.Count-1);
end;


procedure TSendMail.prepara;
var
  body : TIdText;
  strMsg,
  sAnexos : TStringList;
  I : Integer;
begin
    status('Alocando memória para os componentes...');
    mensagem := TIdMessage.Create(nil);
    clientSmtp := TIdSMTP.Create(nil);

    clientSmtp.ConnectTimeout := 3000;

    status('Configurando os componentes...');
    clientSmtp.Host := Fsmtp;
    clientSmtp.Username := Flogin;
    clientSmtp.Password := Fsenha;
    clientSmtp.Port := Fport;
    clientSmtp.OnStatus := StatusSmtp;

    if vvSSL then begin
      AuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      clientSmtp.IOHandler := AuthSSL;
      AuthSSL.SSLOptions.Method := sslvSSLv3;
      AuthSSL.SSLOptions.Mode := sslmClient;
      if Fsmtp = 'smtp.live.com' then
        clientSmtp.UseTLS := utUseRequireTLS
      else
        clientSmtp.UseTLS := utUseExplicitTLS;
    end;

    if vvSSI then begin
      clientSmtp.AuthType := satDefault;
      clientSmtp.Authenticate;
    end else begin
      clientSmtp.AuthType := satNone;
      clientSmtp.Authenticate;
    end;

    mensagem.From.Address := mailFrom;
    mensagem.ReplyTo.EMailAddresses := mailFrom;
    mensagem.From.Name := from;
    mensagem.Recipients.EMailAddresses := mailDest;
    mensagem.Subject := assunto;

    mensagem.MessageParts.Clear;
    body := TIdText.Create(mensagem.MessageParts,sbody);
    body.ContentType:= 'text/html';
    mensagem.Encoding := meDefault;

    if (Trim(anexo) <> EmptyStr) then begin
       sAnexos := TStringList.Create;
       Preenchelista(sAnexos,anexo);
       for I := 0 to sAnexos.Count -1 do begin
         if FileExists(sAnexos.Strings[I]) then begin
           mensagem.Encoding := meMIME;
           mensagem.ContentType:= 'multipart/alternative';
           TIdAttachmentFile.Create(mensagem.MessageParts,sAnexos.Strings[I]);
         end;
       end;
       FreeAndNil(sAnexos);
    end;
    status('Componentes configurados...');
end;

procedure TSendMail.status(msg: string);
begin
    if memo <> nil then
        memo.Lines.Add(msg);
end;

procedure TSendMail.StatusSmtp(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  status(AStatusText);
end;

end.
