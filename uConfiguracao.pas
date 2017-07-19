unit uConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtDlgs, Data.DB,
  Vcl.Clipbrd, System.DateUtils, System.Math, JvTimerList;

type
  TfrmConfiguracao = class(TFrame)
    pgcConfig: TPageControl;
    tbsGeral: TTabSheet;
    tbsProxy: TTabSheet;
    tbsImpressao: TTabSheet;
    Label1: TLabel;
    dbrbAmbiente: TDBRadioGroup;
    gbDiretorios: TGroupBox;
    dbedtDirXml: TDBEdit;
    lblDirXml: TLabel;
    btnDirXml: TSpeedButton;
    lblDirLog: TLabel;
    dbedtDirLog: TDBEdit;
    btnDirLog: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    gbLogo: TGroupBox;
    dbimgLogo: TDBImage;
    BitBtn1: TBitBtn;
    opnLogo: TOpenPictureDialog;
    gbCertifidado: TGroupBox;
    Label4: TLabel;
    dbedtCertificado: TDBEdit;
    btnCertificado: TSpeedButton;
    dbcmbTpCertificado: TDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    dbedtProxy: TDBEdit;
    Label8: TLabel;
    dbedtProxyS: TDBEdit;
    Label9: TLabel;
    dbedtUsuproxy: TDBEdit;
    pnlBtn: TPanel;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    dbedtImprPadrao: TDBEdit;
    SpeedButton1: TSpeedButton;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    dbedtQtdeCopias: TDBEdit;
    tbsEmail: TTabSheet;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    DBMemo1: TDBMemo;
    Label16: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    tbsRepositorio: TTabSheet;
    GroupBox5: TGroupBox;
    BitBtn2: TBitBtn;
    edtDirBkp: TEdit;
    Label18: TLabel;
    SpeedButton2: TSpeedButton;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    tbsProtecao: TTabSheet;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    DBCheckBox5: TDBCheckBox;
    Label21: TLabel;
    dbedtUsuario: TDBEdit;
    Label22: TLabel;
    dbedtSenha: TDBEdit;
    rdbDiario: TRadioButton;
    rdbSemanal: TRadioButton;
    rdbMensal: TRadioButton;
    cmbDia: TComboBox;
    btnApplicar: TBitBtn;
    DBCheckBox6: TDBCheckBox;
    upHora: TUpDown;
    edtHora: TEdit;
    Label5: TLabel;
    edtMin: TEdit;
    upMin: TUpDown;
    Label23: TLabel;
    dbedtDirTxt: TDBEdit;
    Label17: TLabel;
    SpeedButton3: TSpeedButton;
    tbsContingencia: TTabSheet;
    dbrbTpContig: TDBRadioGroup;
    Label24: TLabel;
    dbedtMotCont: TDBEdit;
    tbsEmitente: TTabSheet;
    cmbUf: TComboBox;
    Label25: TLabel;
    dbedtCNPJ: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    dbEdtNome: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    dbchkAtvMonitor: TDBCheckBox;
    Timer1: TTimer;
    dbrbValida: TDBCheckBox;
    dbchkSimples: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label28: TLabel;
    DBCheckBox7: TDBCheckBox;
    chkBxAutorizadas: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    ComboBox1: TComboBox;
    UpDown1: TUpDown;
    Edit1: TEdit;
    Edit2: TEdit;
    UpDown2: TUpDown;
    GroupBox3: TGroupBox;
    btnExporta: TSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    dtaIni: TDateTimePicker;
    dtaFim: TDateTimePicker;
    GroupBox9: TGroupBox;
    chkAutorizadas: TCheckBox;
    chkCancelada: TCheckBox;
    chkProtAut: TCheckBox;
    chkProtCancel: TCheckBox;
    chkProtInutilizada: TCheckBox;
    tmBkp: TTimer;
    btnBkpFdb: TSpeedButton;
    SpeedButton4: TSpeedButton;
    dbChkHrVerao: TDBCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCertificadoClick(Sender: TObject);
    procedure btnDirLogClick(Sender: TObject);
    procedure btnDirXmlClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure pgcConfigChange(Sender: TObject);
    procedure rdbDiarioClick(Sender: TObject);
    procedure rdbSemanalClick(Sender: TObject);
    procedure rdbMensalClick(Sender: TObject);
    procedure btnApplicarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtHoraChange(Sender: TObject);
    procedure edtMinChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cmbUfSelect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure dbcmbTpCertificadoChange(Sender: TObject);
    procedure dbrbValidaChange(Sender: TObject);
    procedure dbchkAtvMonitorClick(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnBkpFdbClick(Sender: TObject);
    procedure tmBkpTimer(Sender: TObject);
    procedure btnExportaClick(Sender: TObject);
    procedure chkAutorizadasClick(Sender: TObject);
  private
    { Private declarations }
    procedure MudaStatuscds;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDm_nfe, uSelectCertificate, uFuncoes, uDm_Princial, uGlobalVar,
  uSelecPrinter, udm_Geral, uDM_Emitente, uEventos, uPrincipal;

procedure TfrmConfiguracao.BitBtn1Click(Sender: TObject);
var
  Img : TPicture;
begin
  MudaStatuscds;
  if opnLogo.Execute then begin
    if FileExists(opnLogo.FileName) then
     try
       Img := TPicture.Create;
       Img.LoadFromFile(opnLogo.FileName);
       clipboard.Assign(Img);
       dbimgLogo.PasteFromClipboard;
     finally
       FreeAndNil(Img);
     end;
  end;
end;

procedure TfrmConfiguracao.BitBtn2Click(Sender: TObject);
begin
  if msgQuestion('Deseja realmente, Descartar as Notas em Homologação','Atenção') then begin
    try
      dm_Princial.cdsGeral.Close;
      dm_Princial.cdsGeral.CommandText := 'DELETE FROM TB_NFE_TRANS WHERE FLG_AMBIENTE = ''2''';
      dm_Princial.cdsGeral.Execute;
    except on E : Exception do begin
       msgErro('Erro ao excluir as notas em homogação.'+ #13 + E.Message);
       exit;
    end;
    end;
  end;
end;

procedure TfrmConfiguracao.btnApplicarClick(Sender: TObject);
begin

  if consiste(dbrbAmbiente,dbrbAmbiente.ItemIndex = -1,'Ambiente de para envío campo obrigatório',pgcConfig,tbsGeral) then
    Exit;
  if consiste(dbedtDirTxt,Length(Trim(dbedtDirTxt.Text))=0,'Diretório de monitoramento dos arquivos txt é campo obrigatório',pgcConfig,tbsGeral) then
    Exit;
  if consiste(dbedtCertificado,Length(Trim(dbedtCertificado.Text))=0,'Nome do Certificado é campo obrigatório',pgcConfig,tbsGeral) then
    Exit;
  if consiste(dbcmbTpCertificado,dbcmbTpCertificado.ItemIndex = -1 ,'Tipo do Certificado é campo obrigatório',pgcConfig,tbsGeral) then
    Exit;
  if consiste(dbedtImprPadrao,length(trim(dbedtImprPadrao.Text))=0,'Selecione uma impressora para impressão do DANFE',pgcConfig,tbsImpressao) then
    Exit;
  if consiste(dbedtCNPJ,length(trim(dbedtCNPJ.Text))=0,'Entre com o CNPJ da empressa',pgcConfig,tbsEmitente) then
    Exit;
  if consiste(cmbUf,Length(Trim(cmbUf.Text)) = 0,'A Uf da empressa é campo obrigatório',pgcConfig,tbsEmitente) then
    Exit;
  {
  if consiste(dbrbTpContig,dbrbTpContig.Field.AsString = '','Selecione um tipo de contigência padrão',pgcConfig,tbsContingencia) then
    Exit;
  if consiste(dbrbTpContig,dbchkAtvMonitor.Field.AsString = '','Selecione um tipo de contigência padrão',pgcConfig,tbsGeral) then
    Exit;
  }
  if dmGeral.cdsLogin.State in [dsInsert,dsEdit] then begin
    dmGeral.cdsLogin.Post;
    dmGeral.cdsLogin.ApplyUpdates(-1);
  end;
  if dm_nfe.cdsConf.State in [dsInsert,dsEdit] then begin
    dm_nfe.cdsConf.Post;
    dm_nfe.cdsConf.ApplyUpdates(-1);
  end;
  if dmGeral.cdsConfEmail.State in [dsInsert,dsEdit] then begin
    dmGeral.cdsConfEmail.Post;
    dmGeral.cdsConfEmail.ApplyUpdates(-1);
  end;
  if dm_Emitente.cdsEmitente.State in [dsInsert,dsEdit] then begin
    dm_Emitente.cdsEmitente.Post;
    dm_Emitente.cdsEmitente.ApplyUpdates(-1);
  end;
  if dm_nfe.cdsConf_Cont.State in [dsInsert,dsEdit] then begin
    dm_nfe.cdsConf_Cont.Post;
    dm_nfe.cdsConf_Cont.ApplyUpdates(-1);
  end;

  if pgcConfig.ActivePage = tbsRepositorio then begin
    if length(trim(edtDirBkp.Text)) > 0 then
      WriteToIni('BACKUP','DIR_BKP',trim(edtDirBkp.Text),INI_WCHI_CONF);
    if rdbDiario.Checked then
      WriteToIni('BACKUP','PERIODO','D',INI_WCHI_CONF);
    if rdbSemanal.Checked then
      WriteToIni('BACKUP','PERIODO','S',INI_WCHI_CONF);
    if rdbMensal.Checked then
      WriteToIni('BACKUP','PERIODO','M',INI_WCHI_CONF);
    if cmbDia.ItemIndex <> -1 then begin
      if rdbSemanal.Checked then
        WriteToIni('BACKUP','DIA',IntToStr(cmbDia.ItemIndex+1),INI_WCHI_CONF);
      if rdbMensal.Checked then
        WriteToIni('BACKUP','DIA',cmbDia.Text,INI_WCHI_CONF);
      if Trim(edtHora.Text) <> '00' then
        WriteToIni('BACKUP','HORA',Trim(edtHora.Text) + ':' + Trim(edtMin.Text),INI_WCHI_CONF);
    end;

  end;
  if pgcConfig.ActivePage = tbsImpressao then begin
    if Length(Trim(dbedtImprPadrao.Text)) > 0 then
      WriteToIni('DANFE','Impressora',Trim(dbedtImprPadrao.Text),INI_NFeConf);
    if Length(Trim(dbedtQtdeCopias.Text)) > 0 then
      WriteToIni('DANFE','Vias',Trim(dbedtQtdeCopias.Text),INI_NFeConf);
  end;

  frmPrincipal.Timer_Monitor.Enabled := dbchkAtvMonitor.Checked;
  dm_nfe.CarregaConfNfe;

end;

procedure TfrmConfiguracao.btnBkpFdbClick(Sender: TObject);
begin
Try
  dm_Princial.GeraBkp(pathDB,vvDirBkp);
except
  on E : Exception do begin
    msgErro(E.Message);
  end;
End;
end;

procedure TfrmConfiguracao.btnCertificadoClick(Sender: TObject);
var
  frmSelectCertificate: TfrmSelectCertificate;
  aModal: integer;
  CertificateName : string;
begin
  MudaStatuscds;
  frmSelectCertificate := TfrmSelectCertificate.Create(Self);
  try
    dm_nfe.nfdNFe2.ListarCertificados(frmSelectCertificate.lbList.Items);
    aModal := frmSelectCertificate.ShowModal;
    if aModal = mrOk then begin
      CertificateName := frmSelectCertificate.SelectedCertificateName;
      dm_nfe.cdsConf.FieldByName('NOME_CERTIFICADO').AsString := CertificateName;
      WriteToIni('NFE','NomeCertificado',CertificateName,INI_NFeConf);
    end;
    if aModal = mrIgnore then begin
      dm_nfe.nfdNFe2.RemoverCertificado(frmSelectCertificate.SelectedCertificateName);
      WriteToIni('NFE','NomeCertificado','',INI_NFeConf);
    end;
  finally
    frmSelectCertificate.Free;
  end;
end;

procedure TfrmConfiguracao.btnDirLogClick(Sender: TObject);
begin
  MudaStatuscds;
  dm_nfe.cdsConf.FieldByName('DIR_LOG').AsString := SelectDir('',lblDirLog.Caption);
end;

procedure TfrmConfiguracao.btnDirXmlClick(Sender: TObject);
begin
  MudaStatuscds;
  dm_nfe.cdsConf.FieldByName('DIR_EXPORTACAO').AsString := SelectDir('',lblDirXml.Caption);  
end;

procedure TfrmConfiguracao.btnExportaClick(Sender: TObject);
var
  sListXml : TStringList;
  wsXML : WideString;
  bErro : Boolean;
begin
  try
    try
      sListXml := TStringList.Create;
      //exporta xml das notas autorizadas
      if chkAutorizadas.Checked then begin
        dm_Princial.cdsGeral.Close;
        dm_Princial.cdsGeral.CommandText := 'SELECT NFE_XML, XML_PROT_AUTO, CHAVE_NFE '+
                                            ' ,XML_PROT_AUTO '+
                                            ' FROM TB_NFE_TRANS '+
                                            ' WHERE COD_SITUACAO = 100 '+
                                            ' AND PROTOCOLO_ENVIO IS NOT NULL '+
                                            ' AND XML_PROT_AUTO IS NOT NULL'+
                                            ' AND DTA_EMISSAO BETWEEN :DTAINI AND :DTAFIM ';
        dm_Princial.cdsGeral.Params.ParamByName('DTAINI').AsDate := dtaIni.Date;
        dm_Princial.cdsGeral.Params.ParamByName('DTAFIM').AsDate := dtaFim.Date;
        dm_Princial.cdsGeral.Open;
        if not dm_Princial.cdsGeral.IsEmpty then begin
          StartWaint('Exportando arquivos XML das notas autorizadas'+ #10#13 + 'Aguarde...');
          while not dm_Princial.cdsGeral.Eof do begin
            sListXml.Clear;
            wsXML := dm_nfe.nfdNFe2.RetXMLNFeProc(dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString,dm_Princial.cdsGeral.FieldByName('XML_PROT_AUTO').AsString);
            sListXml.Add(wsXML);
            if not DirectoryExists(vvDirExport + '\' + vvDirAuto) then
              CreateDir(vvDirExport + '\' + vvDirAuto);
            sListXml.SaveToFile(vvDirExport + '\' + vvDirAuto + '\' + dm_Princial.cdsGeral.FieldByName('CHAVE_NFE').AsString + '-nfe.xml');
            dm_Princial.cdsGeral.Next
          end;
          EndWaint;
        end;
      end;
      //exporta xml das notas canceladas
      if chkCancelada.Checked then begin
        dm_Princial.cdsGeral.Close;
        dm_Princial.cdsGeral.CommandText := 'SELECT NFE_XML, CHAVE_NFE '+
                                            ' FROM TB_NFE_TRANS '+
                                            ' WHERE COD_SITUACAO in (101,135) '+
                                            ' AND PROTOCOLO_CANCEL IS NOT NULL '+
                                            //' AND (POSITION(''<nfeProc'' IN NFE_XML) > 0) '+
                                            ' AND DTA_EMISSAO BETWEEN :DTAINI AND :DTAFIM ';
        dm_Princial.cdsGeral.Params.ParamByName('DTAINI').AsDate := dtaIni.Date;
        dm_Princial.cdsGeral.Params.ParamByName('DTAFIM').AsDate := dtaFim.Date;
        dm_Princial.cdsGeral.Open;
        if not dm_Princial.cdsGeral.IsEmpty then begin
          StartWaint('Exportando arquivos XML das notas Canceladas'+ #10#13 + 'Aguarde...');
          dm_Princial.cdsGeral.First;
          while not dm_Princial.cdsGeral.Eof do begin
            sListXml.Clear;
            sListXml.Add(dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString);
            if not DirectoryExists(vvDirExport + '\' + vvDirCanc) then
              CreateDir(vvDirExport + '\' + vvDirCanc);
            sListXml.SaveToFile(vvDirExport + '\' + vvDirCanc + '\' + dm_Princial.cdsGeral.FieldByName('CHAVE_NFE').AsString + '-Can.xml');
            dm_Princial.cdsGeral.Next
          end;
          EndWaint;
        end;
      end;
      //exporta xml dos protocolos de autorização
      if chkProtAut.Checked then begin
        dm_Princial.cdsGeral.Close;
        dm_Princial.cdsGeral.CommandText := 'SELECT XML_PROT_AUTO, PROTOCOLO_ENVIO '+
                                            ' FROM TB_NFE_TRANS '+
                                            ' WHERE COD_SITUACAO = 100 '+
                                            ' AND PROTOCOLO_ENVIO IS NOT NULL '+
                                            //' AND (POSITION(''<nfeProc'' IN NFE_XML) > 0) '+
                                            ' AND DTA_EMISSAO BETWEEN :DTAINI AND :DTAFIM ';
        dm_Princial.cdsGeral.Params.ParamByName('DTAINI').AsDate := dtaIni.Date;
        dm_Princial.cdsGeral.Params.ParamByName('DTAFIM').AsDate := dtaFim.Date;
        dm_Princial.cdsGeral.Open;
        if not dm_Princial.cdsGeral.IsEmpty then begin
          StartWaint('Exportando arquivos XML dos Protocolos de Autorização'+ #10#13 + 'Aguarde...');
          dm_Princial.cdsGeral.First;
          while not dm_Princial.cdsGeral.Eof do begin
            sListXml.Clear;
            sListXml.Add(dm_Princial.cdsGeral.FieldByName('XML_PROT_AUTO').AsWideString);
            if not DirectoryExists(vvDirExport + '\' + vvDirPrtAuto) then
              CreateDir(vvDirExport + '\' + vvDirPrtAuto);
            sListXml.SaveToFile(vvDirExport + '\' + vvDirPrtAuto + '\' + dm_Princial.cdsGeral.FieldByName('PROTOCOLO_ENVIO').AsString + '.xml');
            dm_Princial.cdsGeral.Next
          end;
          EndWaint;
        end;
      end;
      //exporta xml dos protocolos de notas canceladas
      if chkProtCancel.Checked then begin
        dm_Princial.cdsGeral.Close;
        dm_Princial.cdsGeral.CommandText := 'SELECT NFE_XML_CANC, PROTOCOLO_CANCEL '+
                                            ' FROM TB_NFE_TRANS '+
                                            ' WHERE COD_SITUACAO in (101,135) '+
                                            ' AND PROTOCOLO_CANCEL IS NOT NULL '+
                                            //' AND (POSITION(''<nfeProc'' IN NFE_XML) > 0) '+
                                            ' AND DTA_EMISSAO BETWEEN :DTAINI AND :DTAFIM ';
        dm_Princial.cdsGeral.Params.ParamByName('DTAINI').AsDate := dtaIni.Date;
        dm_Princial.cdsGeral.Params.ParamByName('DTAFIM').AsDate := dtaFim.Date;
        dm_Princial.cdsGeral.Open;
        if not dm_Princial.cdsGeral.IsEmpty then begin
          StartWaint('Exportando arquivos XML dos Protocolos de Cancelamento'+ #10#13 + 'Aguarde...');
          dm_Princial.cdsGeral.First;
          while not dm_Princial.cdsGeral.Eof do begin
            sListXml.Clear;
            sListXml.Add(dm_Princial.cdsGeral.FieldByName('NFE_XML_CANC').AsWideString);
            if not DirectoryExists(vvDirExport + '\' + vvDirPrtCanc) then
              CreateDir(vvDirExport + '\' + vvDirPrtCanc);
            sListXml.SaveToFile(vvDirExport + '\' + vvDirPrtCanc + '\' + dm_Princial.cdsGeral.FieldByName('PROTOCOLO_CANCEL').AsString + '.xml');
            dm_Princial.cdsGeral.Next
          end;
          EndWaint;
        end;
      end;
      //exporta xml dos protocolos de notas inutilizadas
      if chkProtInutilizada.Checked then begin
        dm_Princial.cdsGeral.Close;
        dm_Princial.cdsGeral.CommandText := 'SELECT XML_RET, PROTOCOLO '+
                                            ' FROM TB_NFE_INUT '+
                                            ' WHERE DTA_INUT BETWEEN :DTAINI AND :DTAFIM ';
        dm_Princial.cdsGeral.Params.ParamByName('DTAINI').AsDate := dtaIni.Date;
        dm_Princial.cdsGeral.Params.ParamByName('DTAFIM').AsDate := dtaFim.Date;
        dm_Princial.cdsGeral.Open;
        if not dm_Princial.cdsGeral.IsEmpty then begin
          StartWaint('Exportando arquivos XML dos Protocolos de Notas Inutilizadas'+ #10#13 + 'Aguarde...');
          dm_Princial.cdsGeral.First;
          while not dm_Princial.cdsGeral.Eof do begin
            sListXml.Clear;
            sListXml.Add(dm_Princial.cdsGeral.FieldByName('XML_RET').AsWideString);
            if not DirectoryExists(vvDirExport + '\' + vvDirPrtCanc) then
              CreateDir(vvDirExport + '\' + vvDirPrtCanc);
            sListXml.SaveToFile(vvDirExport + '\' + vvDirPrtCanc + '\' + dm_Princial.cdsGeral.FieldByName('PROTOCOLO').AsString + '.xml');
            dm_Princial.cdsGeral.Next
          end;
          EndWaint;
        end;
      end;
    except
      on Ex : Exception do begin
        dm_Princial.cdsGeral.Close;
        FreeAndNil(sListXml);
        chkBxAutorizadas.Checked := False;
        chkCancelada.Checked := False;
        chkProtAut.Checked := False;
        chkProtCancel.Checked := False;
        chkProtInutilizada.Checked := False;
        EndWaint;
        msgErro('Erro na exportação dos arquivos'+ #10#13 + 'Erro orig.:'+ Ex.Message);
        bErro := True;
      end;
    end;
  finally
    dm_Princial.cdsGeral.Close;
    FreeAndNil(sListXml);
    chkBxAutorizadas.Checked := False;
    chkCancelada.Checked := False;
    chkProtAut.Checked := False;
    chkProtCancel.Checked := False;
    chkProtInutilizada.Checked := False;
    if not bErro then
      msgInformation('Arquivos Exportados','Atenção');
  end;
end;

procedure TfrmConfiguracao.Button1Click(Sender: TObject);
begin
  dbimgLogo.Picture.SaveToFile(GetCurrentDir + '\logo1.jpg');
end;

procedure TfrmConfiguracao.chkAutorizadasClick(Sender: TObject);
begin
  btnExporta.Enabled := TCheckBox(Sender).Checked;
end;

procedure TfrmConfiguracao.cmbUfSelect(Sender: TObject);
begin
  dm_Emitente.cdsEmitente.FieldByName('COD_UF').AsInteger := GetValueCmb(cmbUf);
end;

procedure TfrmConfiguracao.DBCheckBox1Click(Sender: TObject);
begin
  MudaStatuscds;
end;

procedure TfrmConfiguracao.DBCheckBox2Click(Sender: TObject);
begin
  MudaStatuscds;
end;

procedure TfrmConfiguracao.dbchkAtvMonitorClick(Sender: TObject);
begin
  MudaStatuscds;
end;

procedure TfrmConfiguracao.dbcmbTpCertificadoChange(Sender: TObject);
begin
  MudaStatuscds;
end;

procedure TfrmConfiguracao.dbrbValidaChange(Sender: TObject);
begin

  MudaStatuscds;
end;

procedure TfrmConfiguracao.edtHoraChange(Sender: TObject);
begin
  edtHora.Text := FormatFloat('00',StrToFloatDef(edtHora.Text,0));
end;

procedure TfrmConfiguracao.edtMinChange(Sender: TObject);
begin
  edtMin.Text := FormatFloat('00',StrToFloatDef(edtMin.Text,0));
end;

procedure TfrmConfiguracao.MudaStatuscds;
begin
  {
  dm_nfe.cdsConf.Cancel;
  dm_nfe.cdsConf_Cont.Cancel;
  dmGeral.cdsConfEmail.Cancel;
  dmGeral.cdsLogin.Cancel;
  dm_Emitente.cdsEmitente.Cancel;
  }
  if (pgcConfig.ActivePageIndex in [tbsGeral.TabIndex,tbsProxy.TabIndex,tbsImpressao.TabIndex,tbsImpressao.TabIndex]) then
    if dm_nfe.cdsConf.Active then
      if (not (dm_nfe.cdsConf.State in [dsInsert,dsEdit])) and (dm_nfe.cdsConf.IsEmpty) then
        dm_nfe.cdsConf.Append
      else
        dm_nfe.cdsConf.Edit;
  if (pgcConfig.ActivePage = tbsEmail) then
    if dmGeral.cdsConfEmail.Active then
      if (not (dmGeral.cdsConfEmail.State in [dsInsert,dsEdit])) and (dmGeral.cdsConfEmail.IsEmpty) then
        dmGeral.cdsConfEmail.Append
      else
        dmGeral.cdsConfEmail.Edit;
  if (pgcConfig.ActivePage = tbsProtecao) then
    if dmGeral.cdsLogin.Active then
      if (not (dmGeral.cdsLogin.State in [dsInsert,dsEdit])) and (dmGeral.cdsLogin.IsEmpty) then
        dmGeral.cdsLogin.Append
      else
        dmGeral.cdsLogin.Edit;
  if (pgcConfig.ActivePage = tbsEmitente ) then
    if dm_Emitente.cdsEmitente.Active then
      if (not (dm_Emitente.cdsEmitente.State in [dsInsert,dsEdit])) and (dm_Emitente.cdsEmitente.IsEmpty) then
        dm_Emitente.cdsEmitente.Append
      else
        dm_Emitente.cdsEmitente.Edit;
  if pgcConfig.ActivePage = tbsContingencia then
    if dm_nfe.cdsConf_Cont.Active then
      if (not (dm_nfe.cdsConf_Cont.State in [dsInsert,dsEdit])) and (dm_nfe.cdsConf_Cont.IsEmpty) then
        dm_nfe.cdsConf_Cont.Append
      else
        dm_nfe.cdsConf_Cont.Edit;
end;

procedure TfrmConfiguracao.pgcConfigChange(Sender: TObject);
begin
  MudaStatuscds;
  if pgcConfig.ActivePage = tbsRepositorio then begin
    dtaIni.Date := StrToDate(FormatDateTime('01/MM/YYYY',DATE));
    dtaFim.Date := DATE;
  end;
end;

procedure TfrmConfiguracao.rdbDiarioClick(Sender: TObject);
begin
  cmbDia.Enabled := not rdbDiario.Checked;
  edtHora.Enabled := rdbDiario.Checked;
  edtMin.Enabled := rdbDiario.Checked;
end;

procedure TfrmConfiguracao.rdbMensalClick(Sender: TObject);
var
  Dia : Integer;
begin
  cmbDia.Enabled := rdbMensal.Checked;
  edtHora.Enabled := rdbMensal.Checked;
  edtMin.Enabled := rdbMensal.Checked;
  if rdbMensal.Checked then begin
    cmbDia.Clear;
    Dia := 0;
    while Dia <= DaysInMonth(Date)-1 do begin
      Inc(Dia);
      cmbDia.Items.Add(FormatFloat('00',Dia));
    end;
  end;
end;

procedure TfrmConfiguracao.rdbSemanalClick(Sender: TObject);
var
  I : Integer;
begin
  cmbDia.Enabled := rdbSemanal.Checked;
  edtHora.Enabled := rdbSemanal.Checked;
  edtMin.Enabled := rdbSemanal.Checked;
  if rdbSemanal.Checked then begin
    cmbDia.Clear;
    cmbDia.Items.Add('Domingo');
    cmbDia.Items.Add('Segunda');
    cmbDia.Items.Add('Terça');
    cmbDia.Items.Add('Quarta');
    cmbDia.Items.Add('Quinta');
    cmbDia.Items.Add('Sexta');
    cmbDia.Items.Add('Sabado');
  end;
end;

procedure TfrmConfiguracao.SpeedButton1Click(Sender: TObject);
var
  aModal : Integer;
begin
  MudaStatuscds;
  frmSelectPrinter := TfrmSelectPrinter.Create(Self);
  try
   aModal := frmSelectPrinter.ShowModal;
   if aModal = mrOK then begin
     vvNomeImpr := frmSelectPrinter.GetImprDanfe;
     dm_nfe.cdsConf.FieldByName('IMP_PADRAO').AsString := vvNomeImpr;
     WriteToIni('DANFE','Impressora',vvNomeImpr,INI_NFeConf);
   end;
  finally
    FreeAndNil(frmSelectPrinter);
  end;
end;

procedure TfrmConfiguracao.SpeedButton2Click(Sender: TObject);
begin
  edtDirBkp.Text := SelectDir('','Selecione o diretório de BackUp');
end;

procedure TfrmConfiguracao.SpeedButton3Click(Sender: TObject);
begin
  MudaStatuscds;
  dm_nfe.cdsConf.FieldByName('DIR_TXTNFE').AsString := SelectDir('','Selecione o diretório dos arquivos txt');
end;

procedure TfrmConfiguracao.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  pgcConfigChange(Sender);
  CarregaCmb(cmbUf,dm_Princial.cdsGeral,'COD_UF','SIGLA','TB_IBGE_UF');
  if not dm_Emitente.cdsEmitente.FieldByName('COD_UF').IsNull then
    cmbUf.ItemIndex := cmbUf.Items.IndexOfObject(Pointer(dm_Emitente.cdsEmitente.FieldByName('COD_UF').AsInteger));
end;

procedure TfrmConfiguracao.tmBkpTimer(Sender: TObject);
begin
  tmBkp.Enabled := False;
  if vvPeriodo <> EmptyStr then begin
    case vvPeriodo[1] of
      'D' : if vvHoraBkp = FormatDateTime('HH:NN', Now) then
              btnBkpFdbClick(Sender);
      'S' : if (StrToInt(vvDiaBkp) = DayOfWeek(Date)) and (vvHoraBkp = FormatDateTime('HH:NN', Now)) then
              btnBkpFdbClick(Sender);
      'M' : if (StrToInt(vvDiaBkp) = DayOfTheMonth(Date)) and (vvHoraBkp = FormatDateTime('HH:NN', Now)) then
              btnBkpFdbClick(Sender);
    end;
  end;
  tmBkp.Enabled := True;
end;

end.
