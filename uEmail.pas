unit uEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Winapi.ShellAPI;

type
  TfrmEmail = class(TForm)
    Label2: TLabel;
    edt_AddressTo: TLabeledEdit;
    edt_Subject: TLabeledEdit;
    mm_Mensagens: TMemo;
    pnlBtn: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure edt_AddressToExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmail: TfrmEmail;

implementation

{$R *.dfm}

uses uFuncoes, uGlobalVar, untTSendMail;

procedure TfrmEmail.BitBtn1Click(Sender: TObject);
var
  eMail : TSendMail;
  sParam,
  sBody : String;
  sEmail : TStringList;
begin
  if Length(Trim(edt_AddressTo.Text)) > 0 then
    if consiste(edt_AddressTo,ValidaEmail(edt_AddressTo.Text) = False,'Email Inválido',nil,nil) then
      exit;
  if (not FileExists(vvFileXml)) or (not FileExists(vvFilePdf)) then begin
    msgErro('Os Arquivos.:'+ vvFileXml + #10#13 + 'e' + #10#13 + vvFilePdf + #10#13 + 'Não encontrados.');
    exit;
  end;

  eMail := TSendMail.Create;
  eMail.smtp := vvServSMTP;
  eMail.login := vvUsuario;
  eMail.senha := vvSenha;
  eMail.port := vvPorta;
  eMail.mailFrom := vvEmailR;;
  eMail.from := vvEmailR;
  eMail.mailDest := Trim(edt_AddressTo.Text);
  eMail.assunto := Trim(edt_Subject.Text);
  eMail.sbody.Add(StringReplace(mm_Mensagens.Text,#13,'<br>',[rfReplaceAll,rfIgnoreCase]) + '<br><br> Chave da NF-e ' + vvCHAVE_NFE + ' ');
  eMail.sbody.Add('Como verificar a concessão da Autorização de Uso da NF-e?. <br>');
  eMail.sbody.Add('Acesse <a target="_blank" href="www.nfe.fazenda.gov.br">www.nfe.fazenda.gov.br</a> e clique em "Consultas > Resumo de uma Nota Fiscal Eletrônica". <br>');
  eMail.sbody.Add('Digite a chave de acesso da Nota Fiscal Eletrônica, informada acima e que pode ser também encontrada');
  eMail.sbody.Add(' no DANFE (Documento Auxiliar da Nota Fiscal Eletrônica, impresso e entregue ao destinatário junto à mercadoria).');
  eMail.sbody.Add('O campo "Situação Atual" deve estar preenchido como AUTORIZADO');
  eMail.sbody.Add('<br>');
  eMail.sbody.Add('<br>');
  eMail.sbody.Add('<b><font size=1>Essa NF-e foi transmitida pelo WHCI NF-e da HCI Sistemas Integrados.');
  eMail.sbody.Add('<br>');
  eMail.sbody.Add('Site: <a target="_blank" href="http://www.hci.com.br">www.hci.com.br</a>');
  eMail.sbody.Add('<br> Capitais e regioes metropolitanas: 11 3288.4522');
  eMail.sbody.Add('<br> Demais localidades: 0800.77 23 424 </font></b>');
  eMail.anexo := vvFileXml + ',' + vvFilePdf;
  StartWaint('Enviando email com os arquivos xml e pdf da nota ' + vvNU_NFE + #10#13 + 'Aguarde...' );
  eMail.executa;
  EndWaint;

  vvNU_NFE := EmptyStr;
  //DeleteFile(PWideChar(vvFileXml));
  Self.Close;
end;

procedure TfrmEmail.BitBtn3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmEmail.edt_AddressToExit(Sender: TObject);
begin
  if Length(Trim(edt_AddressTo.Text)) > 0 then
    if consiste(edt_AddressTo,ValidaEmail(edt_AddressTo.Text) = False,'Email Inválido',nil,nil) then
      exit;
end;

procedure TfrmEmail.FormShow(Sender: TObject);
begin
  edt_Subject.Text := vvAssunto;
end;

end.
