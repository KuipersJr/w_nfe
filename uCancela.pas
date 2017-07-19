unit uCancela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, nfdNFe2, Vcl.FileCtrl;

type
  TfrmCancelaNfe = class(TFrame)
    GroupBox1: TGroupBox;
    dbgCancelaNFe: TDBGrid;
    GroupBox2: TGroupBox;
    mmJustCancela: TMemo;
    pnlBotoes: TPanel;
    btnCancelaNfe: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    fListXml: TFileListBox;
    procedure mmJustCancelaChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnCancelaNfeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDm_nfe, uFuncoes, uNfe_Utils, uGlobalVar, uDm_Princial;

const
  StrAmbiente: array[TTipoAmbiente] of string = ('2', '1');

procedure TfrmCancelaNfe.BitBtn2Click(Sender: TObject);
begin
  mmJustCancela.Clear;
  mmJustCancelaChange(Sender);
end;

procedure TfrmCancelaNfe.btnCancelaNfeClick(Sender: TObject);
var
  CancelamentoAssinado: String;
  RetSefaz: WideString;
  ProtocoloEvento: WideString;
  I : integer;
  strArqRet : TStringList;
  sNameFile : String;
begin
try
  {
  if InputBox('Atenção','Entre com a senha de autorização'+#10#13,'') <> 'hcinfe' then begin
    msgWarning('Senha de inválida' + #10#13 + 'Operador(a), entre em contato com o suporte da HCI');
    BitBtn2Click(Sender);
    exit;
  end;
  }
  dm_nfe.NfdNFECancelamentoEvent1.CriarDataSet;
  try
    dm_nfe.NfdNFECancelamentoEvent1.IncluirCancelamentoEvt;
    dm_nfe.NfdNFECancelamentoEvent1.IncluirEvento;
    dm_nfe.NfdNFECancelamentoEvent1.Campo['versao_HP02'].AsString := '1.00';
    dm_nfe.NfdNFECancelamentoEvent1.Campo['idLote_HP03'].AsString := dm_nfe.cdsCancelNFe.FieldByName('NU_NFE').AsString;
    dm_nfe.NfdNFECancelamentoEvent1.Campo['versao_HP05'].AsString := '1.00'; //versão do layout do evento
    dm_nfe.NfdNFECancelamentoEvent1.Campo['Id_HP07'].AsString := 'ID';  //Identificador da Tag a ser assinada. Não é necessário atribuir valores a ela. O componente realiza esta tarefa. Regra de formação da tag => "ID" + tpEvento + chave da nfe + nSeqEvento. Ver Nt2011.03 pág 10 campo Id
    dm_nfe.NfdNFECancelamentoEvent1.Campo['cOrgao_HP08'].AsString := Copy(dm_nfe.cdsCancelNFe.FieldByName('CHAVE_NFE').AsString,1,2); //Código do orgão de recepção do evento. Tabela do IBGE. Ver Nt2011.03 pág 10 campo cOrgao
    dm_nfe.NfdNFECancelamentoEvent1.Campo['tpAmb_HP09'].AsString := StrAmbiente[dm_nfe.nfdNFe2.Ambiente];  //tipo de ambiente. 1- Produção, 2- homologação.
    dm_nfe.NfdNFECancelamentoEvent1.Campo['CNPJ_HP10'].AsString := Copy(dm_nfe.cdsCancelNFe.FieldByName('CHAVE_NFE').AsString,7,14);// dm_nfe.cdsCancelNFe.FieldByName('CPF_CNPJ').AsString; // CNPJ do emissor. Deve ser informado o CNPJ (Pessoa jurídica) ou o CPF (Pessoa Física), nunca os dois. Ver Nt2011.03 pág 10 campo CNPJ CPF
     //nfdnfcnclmntvnt1.Campo['CPF_HP11'].AsString := '';// CPF do emissor. Deve ser informado o CNPJ (Pessoa jurídica) ou o CPF (Pessoa Física), nunca os dois. Ver Nt2011.03 pág 10 campo CNPJ CPF
    dm_nfe.NfdNFECancelamentoEvent1.Campo['chNFe_HP12'].AsString := dm_nfe.cdsCancelNFe.FieldByName('CHAVE_NFE').AsString; // Chave de acesso da Nfe vinculada à carta de correção. Ver Nt2011.03 pág 10 campo chNfe
    dm_nfe.NfdNFECancelamentoEvent1.Campo['dhEvento_HP13'].AsString := Format(FormatDateTime('YYYY-MM-DD"T"HH:NN:SS"%s"', Now), [GetTZD]); // data e hora do evento. Formato AAAA-MM-DDTHH:NN:SSTZD. Esse campo deve incluir o UTC utilizado pela região do emissor. Ver Nt2011.03 pág 10 campo dhEvento
    dm_nfe.NfdNFECancelamentoEvent1.Campo['tpEvento_HP14'].AsString := '110111'; //Tipo de evento. Ver Nt2011.06 pág 10 campo tpEvento.
    dm_nfe.NfdNFECancelamentoEvent1.Campo['nSeqEvento_HP15'].AsString := '1'; //Numero sequencial das carta de correções. Este controle é de responsabilidade do emissor. Ver Nt2011.03 pág 10 campo nSeqEvento
    dm_nfe.NfdNFECancelamentoEvent1.Campo['verEvento_HP16'].AsString := '1.00'; //versão do evento. mesmo valor da versão do layout do evento. Ver Nt2011.06 pág 04 campo verEvento
    dm_nfe.NfdNFECancelamentoEvent1.Campo['versao_HP18'].AsString := '1.00'; //versão do detalhe do evento. Ver Nt2011.06 pág 10 campo versao.
    dm_nfe.NfdNFECancelamentoEvent1.Campo['descEvento_HP19'].AsString := 'Cancelamento'; //Literal. Ver Nt2011.06 pág 10 campo descEvento;
    dm_nfe.NfdNFECancelamentoEvent1.Campo['nProt_HP20'].AsString := dm_nfe.cdsCancelNFe.FieldByName('PROTOCOLO_ENVIO').AsString; // protocolo de autorização
    dm_nfe.NfdNFECancelamentoEvent1.Campo['xJust_HP21'].AsString := mmJustCancela.Text; //Condições de uso da carta de correção. Pode ser utilizada um versão com acentos. Aconselha-se a não usar acentos. Ver Nt2011.06 pág 04 campo xCondUso

    dm_nfe.NfdNFECancelamentoEvent1.SalvarEvento;
    dm_nfe.NfdNFECancelamentoEvent1.SalvarCancelamentoEvt;

    CancelamentoAssinado := dm_nfe.nfdNFe2.AssinarCancelamentoEvt(dm_nfe.NfdNFECancelamentoEvent1.ConverterDataSetParaXml);
    {
    mOutput.Lines.Add(CancelamentoAssinado);
    mOutput.Lines.Add(DupeString('=', 50));
    mOutput.Lines.Add('Retorno WebService');
    XmlToTreeView1.XML := CancelamentoAssinado;
    XmlToTreeView1.Convert;
    }
    StartWaint('Enviando solicitação de cancelamento da nota nº'+ dm_nfe.cdsCancelNFe.FieldByName('NU_NFE').AsString + #10#13 + 'Aguarde...');
    vvNU_NFE := dm_nfe.cdsCancelNFe.FieldByName('NU_NFE').AsString;
    vvCHAVE_NFE := dm_nfe.cdsCancelNFe.FieldByName('CHAVE_NFE').AsString;
    GeraEvento('Enviando solicitação de cancelamento da nota nº'+ dm_nfe.cdsCancelNFe.FieldByName('NU_NFE').AsString + #10#13 + 'Aguarde...');
    RetSefaz := dm_nfe.nfdNFe2.EnviaCancelaNfeEvt(CancelamentoAssinado);
    //Sleep(vvTmpMed);
    vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(RetSefaz));
    if StrToInt(vvCOD_SITUACAO) <> 135 then begin
      fListXml.Directory := dm_nfe.nfdNFe2.DiretorioLog;
      fListXml.Mask := '*' + vvNU_NFE +'-evtCancNFe-retEnv.xml';
      fListXml.Selected[fListXml.Count-1] := True;
      if fListXml.Count > 0 then begin
        strArqRet := TStringList.Create;
        strArqRet.LoadFromFile(fListXml.Directory + '\'+ fListXml.Items[fListXml.ItemIndex]);
        if AnsiCompareStr(RetSefaz,strArqRet.Text) <> 0 then
          RetSefaz := strArqRet.Text;
        FreeAndNil(strArqRet);
      end;
    end;
    vvCOD_SITUACAO := IntToStr(GetCodMsgStatus(RetSefaz));
    EndWaint;
    vvPROTOCOLO_CANCEL := ObterNroProtocolo(RetSefaz);
    vvDtaCancela := formataDtaFb(ObterData(RetSefaz));
    dm_nfe.nfdNFe2.ProcEvento(CancelamentoAssinado, RetSefaz,vvXML_CancProt);
    Application.ProcessMessages;
    if StrToInt(vvCOD_SITUACAO) = 135 then
      GravaNFeCanc
    else begin
      vvCOD_SITUACAO := '103';
      GravaTransNfe;
    end;

    Application.ProcessMessages;
    GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
    StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);
    Application.ProcessMessages;

    if StrToInt(vvCOD_SITUACAO) = 135 then begin
      msgInformation(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),'Cancelamento');
      GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
      Application.ProcessMessages;
      StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);
      Application.ProcessMessages;
    end else begin
      msgWarning(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
      GeraEvento(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral));
      Application.ProcessMessages;
      StatusMsg(GetMsgSolicitacao(StrToInt(vvCOD_SITUACAO),dm_Princial.cdsGeral),3);
      Application.ProcessMessages;
    end;
    {
    mOutput.Lines.Add(RetSefaz);
    mOutput.Lines.Add(DupeString('=', 50));
    mOutput.Lines.Add('Protocolo de distibuição');
    }
    //inicia processo de montagem do protocolo(xml) de distribuição da cce.
    //Apesar de ser possivel adicionar até 20(vinte) eventos à CCe, o protocolo
    //de distribuição só pode conter um evento e um retorno.
    //Para permitir tratar este retorno escolhido utilizar enventos. Onde fica mais
    //simples o processamento do mesmo.
    //

  finally
    dm_nfe.NfdNFECancelamentoEvent1.LiberarDataSet;
    EndWaint;
  end;
  {
  vvNU_NFE := FormatFloat('000000000',dm_nfe.cdsCancelNFe.FieldByName('NU_NFE').AsFloat);
  vvCHAVE_NFE := dm_nfe.cdsCancelNFe.FieldByName('CHAVE_NFE').AsString;
  CancelaNFe(dm_nfe.cdsCancelNFe.FieldByName('CHAVE_NFE').AsString,dm_nfe.cdsCancelNFe.FieldByName('PROTOCOLO_ENVIO').AsString,mmJustCancela.Text);
  }
  dm_nfe.cdsCancelNFe.Close;
  dm_nfe.cdsCancelNFe.Open;
  mmJustCancela.Clear;
  mmJustCancelaChange(nil);
except
  on E : Exception do begin
    EndWaint;
    dm_nfe.NfdNFECancelamentoEvent1.LiberarDataSet;
    dm_nfe.cdsCancelNFe.Close;
    dm_nfe.cdsCancelNFe.Open;
    mmJustCancelaChange(nil);
    msgErro(E.Message);
  end;
end;
end;

procedure TfrmCancelaNfe.mmJustCancelaChange(Sender: TObject);
begin
  btnCancelaNfe.Enabled := (Length(Trim(mmJustCancela.Text)) >= 15);
end;

end.
