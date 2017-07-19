unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Data.DB,
  Vcl.DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdIMAP4;

type
  TfrmPesquisa = class(TFrame)
    dbgPesq: TDBGrid;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNfAte: TEdit;
    edtNfDe: TEdit;
    edtSerie: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDe: TDateTimePicker;
    edtAte: TDateTimePicker;
    rbgTpNf: TRadioGroup;
    cmbStatusNfe: TComboBox;
    edtCpfCnpj: TEdit;
    edtChave: TEdit;
    btnPesq: TBitBtn;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox3: TGroupBox;
    btnConsSefaz: TBitBtn;
    btnVisualiza: TBitBtn;
    btnImprimir: TBitBtn;
    btnEmail: TBitBtn;
    pnlButton: TPanel;
    btnCCe: TSpeedButton;
    btnReprocessa: TSpeedButton;
    btnExportaXml: TSpeedButton;
    SaveDialog: TSaveDialog;
    procedure edtCpfCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesqClick(Sender: TObject);
    procedure edtChaveExit(Sender: TObject);
    procedure dbgPesqDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConsSefazClick(Sender: TObject);
    procedure btnVisualizaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnReprocessaClick(Sender: TObject);
    procedure btnExportaXmlClick(Sender: TObject);
    procedure dbgPesqDblClick(Sender: TObject);
  private
    { Private declarations }
    Myhint: THintWindow;
    function RevealHint (Control: TControl): THintWindow;
    procedure RemoveHint (var Hint: THintWindow);


  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses udm_Geral, uDm_nfe, uFuncoes, uGlobalVar, uNfe_Utils, uDm_Princial, uEmail;

procedure TfrmPesquisa.btnPesqClick(Sender: TObject);
Var
   sSQL : String;
begin
 sSQL := 'SELECT '+
           ' SERIE, '+
           ' CAST(NU_NFE AS NUMERIC(09)) NU_NFE,'+
           ' NRECIBO, '+
           ' CHAVE_NFE, '+
           ' PROTOCOLO_ENVIO, '+
           ' PROTOCOLO_CANCEL, '+
           ' DTA_EMISSAO, '+
           ' DTA_AUTORIZACAO, '+
           ' DTA_CANCELAMENTO,'+
           ' CPF_CNPJ, '+
           ' NOME_DEST, '+
           ' CASE FLG_TP_TRANS '+
           ' WHEN ''N'' THEN ''Normal'' '+
           ' WHEN ''S'' THEN ''SCAN'' '+
           ' WHEN ''D'' THEN ''DPEC'' '+
           ' END AS TIPO,'+
           ' CASE WHEN COD_SITUACAO > 200 THEN 200 '+
           ' WHEN (XML_PROT_AUTO IS NULL) AND (COD_SITUACAO NOT IN (101,135)) THEN 105 '+
           ' ELSE COD_SITUACAO '+
           ' END AS COD_SITUACAO,'+
           ' CASE WHEN COD_SITUACAO = 100 THEN ''Autorizada'' '+
           ' WHEN COD_SITUACAO IN (110,301,302) THEN ''Denegada'' '+
           ' WHEN (COD_SITUACAO IN (103,104,105)) OR '+
           ' ((XML_PROT_AUTO IS NULL) AND (COD_SITUACAO NOT IN (101,135))) '+
           ' THEN ''Em Processo'' '+
           ' WHEN (COD_SITUACAO IN (101,135)) '+
           ' AND ((PROTOCOLO_CANCEL IS NOT NULL) OR (NFE_XML_CANC IS NOT NULL)) THEN ''Cancelada'' '+
           ' WHEN COD_SITUACAO > 200 THEN ''Rejeitada'' '+
           ' END AS SITUACAO, '+
           ' DECODE(FLG_IMPR,''S'',''Sim'',''Não'') DANFE_IMPRESSO '+
         ' FROM TB_NFE_TRANS '+
         ' WHERE DTA_EMISSAO BETWEEN :PDTAINI AND :PDTAFIM '+
           ' AND (SERIE = :PSR OR :PSR = ''-1'') '+
           ' AND (CAST(NU_NFE AS NUMERIC(09)) >= :PNFINI OR :PNFINI = -1) '+
           ' AND (CAST(NU_NFE AS NUMERIC(09)) <= :PNFFIM OR :PNFFIM = -1) '+
           ' AND (CPF_CNPJ = :PCPF_CNPJ OR :PCPF_CNPJ = ''-1'') '+
           ' AND (CHAVE_NFE = :PIDNFE OR :PIDNFE = ''-1'') '+
           ' AND (FLG_TP_TRANS = :PTPTRANS OR :PTPTRANS = ''T'')';
  {
  case cmbStatusNfe.ItemIndex of
    1 : sSQL :=  sSQL + ' AND COD_SITUACAO = 100 ';
    2 : sSQL :=  sSQL + ' AND COD_SITUACAO = 101 ';
    3 : sSQL :=  sSQL + ' AND COD_SITUACAO IN (110,301,302) ';
    4 : sSQL :=  sSQL + ' AND COD_SITUACAO IN (103,104,105) ';
    5 : sSQL :=  sSQL + ' AND COD_SITUACAO > 200 ';
  end;
  }

  sSQL :=  sSQL + ' ORDER BY NU_NFE DESC, DTA_EMISSAO DESC ';
  dmGeral.cdsConsulta.Close;
  dmGeral.cdsConsulta.CommandText := sSQL;
  dmGeral.cdsConsulta.Params.ParamByName('PDTAINI').AsDate := edtDe.Date;
  dmGeral.cdsConsulta.Params.ParamByName('PDTAFIM').AsDate := edtAte.Date;
  dmGeral.cdsConsulta.Params.ParamByName('PSR').AsString := Iff(Trim(edtSerie.Text) <> '',Trim(edtSerie.Text),'-1');
  dmGeral.cdsConsulta.Params.ParamByName('PNFINI').AsString := iff(Trim(edtNfDe.Text) <> '',  Trim(edtNfDe.Text),'-1');
  dmGeral.cdsConsulta.Params.ParamByName('PNFFIM').AsString := iff(Trim(edtNfAte.Text) <> '', Trim(edtNfAte.Text),'-1');
  dmGeral.cdsConsulta.Params.ParamByName('PCPF_CNPJ').AsString := iff(edtCpfCnpj.Text <> '',edtCpfCnpj.Text,'-1');
  dmGeral.cdsConsulta.Params.ParamByName('PIDNFE').AsString := iff(Trim(edtChave.Text) <> '',Trim(edtChave.Text),'-1');
  dmGeral.cdsConsulta.Params.ParamByName('PTPTRANS').AsString := rbgTpNf.Items[rbgTpNf.ItemIndex][1];
  dmGeral.cdsConsulta.Open;
  dmGeral.cdsConsulta.Filtered := False;

  case cmbStatusNfe.ItemIndex of
    1 : begin
          dmGeral.cdsConsulta.Filtered := False;
          dmGeral.cdsConsulta.Filter := ' COD_SITUACAO = 100 ';
          dmGeral.cdsConsulta.Filtered := True;
        end;
    2 : begin
          dmGeral.cdsConsulta.Filtered := False;
          dmGeral.cdsConsulta.Filter := ' COD_SITUACAO = 101 OR COD_SITUACAO = 135 ';
          dmGeral.cdsConsulta.Filtered := True;
        end;
    3 : begin
          dmGeral.cdsConsulta.Filtered := False;
          dmGeral.cdsConsulta.Filter := ' COD_SITUACAO = 110 '+
                                        ' OR COD_SITUACAO = 301 '+
                                        ' OR COD_SITUACAO = 302 ';
          dmGeral.cdsConsulta.Filtered := True;
        end;
    4 : begin
          dmGeral.cdsConsulta.Filtered := False;
          dmGeral.cdsConsulta.Filter := ' COD_SITUACAO = 103 '+
                                        ' OR COD_SITUACAO = 104 '+
                                        ' OR COD_SITUACAO = 105 ';
          dmGeral.cdsConsulta.Filtered := True;
        end;
    5 : begin
          dmGeral.cdsConsulta.Filtered := False;
          dmGeral.cdsConsulta.Filter := ' COD_SITUACAO >= 200 ';
          dmGeral.cdsConsulta.Filtered := True;
        end;
  end;

  pnlButton.Visible := not dmGeral.cdsConsulta.IsEmpty;

end;

procedure TfrmPesquisa.btnVisualizaClick(Sender: TObject);
var
  sXML,
  sXML_DPEC,
  nProt : WideString;
  sList : TStringList;
begin
  dm_Princial.cdsGeral.Close;
  dm_Princial.cdsGeral.CommandText := ' SELECT '+
                                      '  NFE_XML '+
                                      ' ,XML_PROT_AUTO '+
                                      ' FROM TB_NFE_TRANS '+
                                      ' WHERE SERIE = :PSR '+
                                      ' AND CAST(NU_NFE AS NUMERIC(09)) = :PNF '+
                                      ' AND CHAVE_NFE = :PIDNFE ';
  dm_Princial.cdsGeral.Params.ParamByName('PSR').AsString := dmGeral.cdsConsulta.FieldByName('SERIE').AsString;
  dm_Princial.cdsGeral.Params.ParamByName('PNF').AsFloat := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsFloat;
  dm_Princial.cdsGeral.Params.ParamByName('PIDNFE').AsString := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
  dm_Princial.cdsGeral.Open;
  if not dm_Princial.cdsGeral.IsEmpty then begin
    sXML := dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString;
    nProt := 'nfeProc';
    if (Pos(nProt,sXML) = 0) and (not dm_Princial.cdsGeral.FieldByName('XML_PROT_AUTO').IsNull) then
      sXML := dm_nfe.nfdNFe2.RetXMLNFeProc(sXML,dm_Princial.cdsGeral.FieldByName('XML_PROT_AUTO').AsWideString);

    dm_Princial.cdsGeral.Close;
    dm_Princial.cdsGeral.CommandText := 'SELECT '+
                                        ' PROTOCOLO_DPEC, '+
                                        ' DPEC_XML '+
                                        ' FROM TB_NFE_DPEC '+
                                        ' WHERE CAST(NU_NFE AS NUMERIC(09)) = :NNF '+
                                        ' AND CHAVE_NFE = :CHNFE ';
    dm_Princial.cdsGeral.Params.ParamByName('NNF').AsFloat := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsFloat;
    dm_Princial.cdsGeral.Params.ParamByName('CHNFE').AsString := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
    dm_Princial.cdsGeral.Open;
    if not dm_Princial.cdsGeral.IsEmpty then begin
      sXML_DPEC := dm_Princial.cdsGeral.FieldByName('DPEC_XML').AsWideString;
      vvDtaDPEC := formataDtaFb(ObterDataDPEC(sXML_DPEC));
      vvNRegDPEC := ObterNroDPEC(sXML_DPEC);
      vvNRegDPEC := vvNRegDPEC + ' ' + FormatDateTime('DD/MM/YYYY HH:nn:ss',vvDtaDPEC);
      sXML := RetXMLNFeDPEC(sXML,vvNRegDPEC);
    end;
    try
      VisualizarDanfe(dmGeral.cdsConsulta.FieldByName('NU_NFE').AsString,sXML);
    except
      dm_nfe.nfdNFe2.VisualizarDanfe(dmGeral.cdsConsulta.FieldByName('NU_NFE').AsString,sXML);
    end;
  end;
  dm_Princial.cdsGeral.Close;
end;



procedure TfrmPesquisa.btnImprimirClick(Sender: TObject);
var
  sXML,
  sXML_DPEC : WideString;
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
  if not dm_Princial.cdsGeral.IsEmpty then begin
    sXML := dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString;
    dm_Princial.cdsGeral.Close;
    dm_Princial.cdsGeral.CommandText := 'SELECT '+
                                         ' PROTOCOLO_DPEC, '+
                                         ' DPEC_XML '+
                                        ' FROM TB_NFE_DPEC '+
                                        ' WHERE CAST(NU_NFE AS NUMERIC(09)) = :NNF '+
                                        ' AND CHAVE_NFE = :CHNFE ';
    dm_Princial.cdsGeral.Params.ParamByName('NNF').AsFloat := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsFloat;
    dm_Princial.cdsGeral.Params.ParamByName('CHNFE').AsString := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
    dm_Princial.cdsGeral.Open;
    if not dm_Princial.cdsGeral.IsEmpty then begin
      sXML_DPEC := dm_Princial.cdsGeral.FieldByName('DPEC_XML').AsWideString;
      vvDtaDPEC := formataDtaFb(ObterDataDPEC(sXML_DPEC));
      vvNRegDPEC := ObterNroDPEC(sXML_DPEC);
      vvNRegDPEC := vvNRegDPEC + ' ' + FormatDateTime('DD/MM/YYYY HH:nn:ss',vvDtaDPEC);
      sXML := RetXMLNFeDPEC(sXML,vvNRegDPEC);
    end;
    try
      ImprimirDanfe(dmGeral.cdsConsulta.FieldByName('NU_NFE').AsString,sXML);
    except
      dm_nfe.nfdNFe2.ImprimirDanfe(dmGeral.cdsConsulta.FieldByName('NU_NFE').AsString,sXML);
    end;
  end;
  dm_Princial.cdsGeral.Close;
end;

procedure TfrmPesquisa.btnReprocessaClick(Sender: TObject);
begin
  btnReprocessa.Enabled := False;
  dmGeral.cdsConsulta.DisableControls;
  dmGeral.cdsConsulta.Filtered := False;
  dmGeral.cdsConsulta.Filter := ' COD_SITUACAO = 103 '+
                                ' OR COD_SITUACAO = 104 '+
                                ' OR COD_SITUACAO = 105 ';
  dmGeral.cdsConsulta.Filtered := True;
  dmGeral.cdsConsulta.First;
  while not dmGeral.cdsConsulta.Eof do begin
    consultaStatus(nil);
    dmGeral.cdsConsulta.Next;
  end;
  dmGeral.cdsConsulta.Filtered := False;
  ReprocessaRgt;
  btnPesqClick(Sender);
  btnReprocessa.Enabled := True;
end;

procedure TfrmPesquisa.btnConsSefazClick(Sender: TObject);
var
  sXML : WideString;
  bkm : TBookmark;
begin
  consultaStatus(Sender);
 {
  try
    try
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
          btnPesqClick(Sender);
          //dmGeral.cdsConsulta.Close;
          //dmGeral.cdsConsulta.Open;
          dmGeral.cdsConsulta.GotoBookmark(bkm);
          dmGeral.cdsConsulta.freebookmark(bkm);
          dmGeral.cdsConsulta.EnableControls;
        except
          dmGeral.cdsConsulta.freebookmark(bkm);
          dmGeral.cdsConsulta.EnableControls;
        end;
        //
      end;
      EndWaint;
    except
      on E : exception do begin
        EndWaint;
        msgErro('Ocoreu um erro ao tentar consultar status da NF-e na Sefaz.' + #10#13 + E.Message);
      end;
    end;
  finally
    EndWaint;
  end;
  }
end;

procedure TfrmPesquisa.btnEmailClick(Sender: TObject);
var
  sLstFXML : TStringList;
begin
  vvCHAVE_NFE := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
  dm_Princial.cdsGeral.Close;
  dm_Princial.cdsGeral.CommandText := ' SELECT NFE_XML FROM  TB_NFE_TRANS '+
                                      ' WHERE CHAVE_NFE = :CHNFE '+
                                      ' AND CAST(NU_NFE AS NUMERIC(09)) = :NNF ';
  dm_Princial.cdsGeral.Params.ParamByName('CHNFE').AsString := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
  dm_Princial.cdsGeral.Params.ParamByName('NNF').AsFloat := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsFloat;
  dm_Princial.cdsGeral.Open;
  if not dm_Princial.cdsGeral.IsEmpty then  begin
    sLstFXML := TStringList.Create;
    sLstFXML.Add(dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString);
    if vvPdf then
      ExportarDanfePdf(dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString);
    dm_Princial.cdsGeral.Close;
    sLstFXML.SaveToFile(vvDirTmp +'\'+ vvCHAVE_NFE + '.xml');
    vvFileXml := vvDirTmp +'\'+ vvCHAVE_NFE + '.xml';
    vvFilePdf := vvDirTmp +'\'+ vvCHAVE_NFE + '.pdf';
    FreeAndNil(sLstFXML);
    if (not FileExists(vvFileXml)) or (not FileExists(vvFilePdf)) then begin
      msgErro('Os Arquivos.:'+ vvFileXml + #10#13 + 'e' + #10#13 + vvFilePdf + #10#13 + 'Não encontrados.');
      dm_Princial.cdsGeral.Close;
      exit;
    end else
    if frmEmail = nil then begin
      try
        frmEmail := TfrmEmail.Create(Self);
        vvNU_NFE := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsString;
        frmEmail.ShowModal;
      finally
        FreeAndNil(frmEmail);
      end;
    end;
  end;
  dm_Princial.cdsGeral.Close;
end;

procedure TfrmPesquisa.btnExportaXmlClick(Sender: TObject);
var
  sDirXml : String;
  sltXml : TStringList;
begin
  try
    SaveDialog.InitialDir := ExtractFileDir(ParamStr(0));
    vvCHAVE_NFE := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
    dm_Princial.cdsGeral.Close;
    dm_Princial.cdsGeral.CommandText := ' SELECT NFE_XML FROM TB_NFE_TRANS '+
                                        ' WHERE CHAVE_NFE = :CHNFE '+
                                        ' AND CAST(NU_NFE AS NUMERIC(09)) = :NNF ';
    dm_Princial.cdsGeral.Params.ParamByName('CHNFE').AsString := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
    dm_Princial.cdsGeral.Params.ParamByName('NNF').AsFloat := dmGeral.cdsConsulta.FieldByName('NU_NFE').AsFloat;
    dm_Princial.cdsGeral.Open;
    SaveDialog.FileName := vvCHAVE_NFE + '-nfe';
    if SaveDialog.Execute then begin
      try
        sltXml := TStringList.Create;
        sltXml.Add(dm_Princial.cdsGeral.FieldByName('NFE_XML').AsWideString);
        sltXml.SaveToFile(SaveDialog.FileName);
      finally
        sltXml.Free;
      end;
    end;
  finally
    dm_Princial.cdsGeral.Close;
  end;
end;

procedure TfrmPesquisa.dbgPesqDblClick(Sender: TObject);
begin
 TDBGrid(Sender).Options := TDBGrid(Sender).Options + [dgEditing];
 TDBGrid(Sender).Options := TDBGrid(Sender).Options - [dgRowSelect];
end;

procedure TfrmPesquisa.dbgPesqDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if odd(dmGeral.cdsConsulta.RecNo) then begin
    dbgPesq.Canvas.Brush.Color := clCream;
    dbgPesq.Canvas.Font.Color := clBlack;
  end else begin
    dbgPesq.Canvas.Brush.Color := clWhite;
    dbgPesq.Canvas.Font.Color := clBlack;
  end;

  dbgPesq.Canvas.FillRect(Rect);
  if Column.Field <> nil then
    dbgPesq.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);

  if Column.Field <> nil then
    if Column.Field.FieldName = 'COD_SITUACAO' then begin
      case Column.Field.AsInteger of
        100,
        150 : begin
                dbgPesq.Canvas.Brush.Color := $0040FF00;
                dbgPesq.Canvas.Font.Color := $0040FF00;
              end;
        103,
        104,
        105 : begin
                dbgPesq.Canvas.Brush.Color := $00FF8000;
                dbgPesq.Canvas.Font.Color := $00FF8000;
              end;
        101,
        135 : begin
                dbgPesq.Canvas.Brush.Color := clRed;
                dbgPesq.Canvas.Font.Color := clRed;
              end;
        110,
        301,
        302 : begin
                dbgPesq.Canvas.Brush.Color := $004080FF;
                dbgPesq.Canvas.Font.Color := $004080FF;
              end;
        200 : begin
                dbgPesq.Canvas.Brush.Color := clNavy;
                dbgPesq.Canvas.Font.Color := clNavy;
              end;
      end;
      dbgPesq.Canvas.FillRect(Rect);
      dbgPesq.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmPesquisa.edtChaveExit(Sender: TObject);
begin
  if Length(Trim(edtChave.Text)) > 0 then
    if Length(Trim(edtChave.Text)) < 44 then begin
      msgWarning('Chave de Acesso NF-e Inválida');
      if edtChave.CanFocus then
        edtChave.SetFocus;
    end;
end;

procedure TfrmPesquisa.edtCpfCnpjKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
end;

procedure TfrmPesquisa.RemoveHint(var Hint: THintWindow);
begin
  Hint.ReleaseHandle;
  Hint.Free;
  Hint := nil;
end;

function TfrmPesquisa.RevealHint(Control: TControl): THintWindow;
var
  ShortHint: string;
  AShortHint: array[0..255] of Char;
  HintPos: TPoint;
  HintBox: TRect;
begin
  Result := THintWindow.Create(Control);
  ShortHint := GetShortHint(Control.Hint);
  HintPos := Control.ClientOrigin;
  Inc(HintPos.Y, Control.Height + 6);
  HintBox := Bounds(0, 0, Screen.Width, 0);
  DrawText(Result.Canvas.Handle, StrPCopy(AShortHint, ShortHint), -1, HintBox, DT_CALCRECT or DT_LEFT or DT_WORDBREAK or DT_NOPREFIX);
  OffsetRect(HintBox, HintPos.X, HintPos.Y);
  Inc(HintBox.Right, 6);
  Inc(HintBox.Bottom, 2);
  Result.ActivateHint(HintBox, ShortHint);
end;

end.
