unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ImgList, Vcl.Menus,
  Vcl.ExtCtrls, uFrmEmitente, uConfiguracao, Vcl.StdCtrls, uEventos, uPesquisa,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, System.DateUtils, uCancela, uCCE,
  Vcl.AppEvnts, Vcl.Buttons, uInutiliza;

type
  TfrmPrincipal = class(TForm)
    pgcPrincipal: TPageControl;
    tbsAutorizacao: TTabSheet;
    tbsConfiguracao: TTabSheet;
    tbsConsulta: TTabSheet;
    mmPricipal: TMainMenu;
    Operaes1: TMenuItem;
    Configuraes1: TMenuItem;
    GerenciarNotas1: TMenuItem;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    PnlAutoriza: TPanel;
    frmEmitente1: TfrmEmitente;
    pnlConfig: TPanel;
    Timer_Monitor: TTimer;
    tbsEventos: TTabSheet;
    Panel1: TPanel;
    frmEventos1: TfrmEventos;
    pnlPesquisa: TPanel;
    tbsCancelaNfe: TTabSheet;
    tbsCCe: TTabSheet;
    frmConfiguracao1: TfrmConfiguracao;
    frmPesquisa1: TfrmPesquisa;
    Timer1: TTimer;
    pnlCancel: TPanel;
    frmCancelaNfe1: TfrmCancelaNfe;
    pnlCCe: TPanel;
    frmCCE1: TfrmCCE;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    Panel2: TPanel;
    Label1: TLabel;
    dtEventos: TDateTimePicker;
    BitBtn1: TBitBtn;
    btnVoltar: TBitBtn;
    tbsInutiliza: TTabSheet;
    CancelarNFe1: TMenuItem;
    CartadeCorreo1: TMenuItem;
    InutilizarNumerao1: TMenuItem;
    pnlInutiliza: TPanel;
    frmeInutiliza1: TfrmeInutiliza;
    Panel3: TPanel;
    btnRefreh: TSpeedButton;
    btnReprocessa: TSpeedButton;
    Consultas1: TMenuItem;
    procedure PnlAutorizaResize(Sender: TObject);
    procedure pnlConfigResize(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer_MonitorTimer(Sender: TObject);
    procedure frmEventos1DBGrid1DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure frmPesquisa1btnConsSefazClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure TrayIcon1Animate(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ApplicationEvents1Restore(Sender: TObject);
    procedure frmConfiguracao1btnCertificadoClick(Sender: TObject);
    procedure frmConfiguracao1btnApplicarClick(Sender: TObject);
    procedure frmEmitente1BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure frmEventos1DBGrid1DblClick(Sender: TObject);
    procedure frmPesquisa1btnVisualizaClick(Sender: TObject);
    procedure frmPesquisa1btnCCeClick(Sender: TObject);
    procedure frmPesquisa1BitBtn1Click(Sender: TObject);
    procedure GerenciarNotas1Click(Sender: TObject);
    procedure CancelarNFe1Click(Sender: TObject);
    procedure CartadeCorreo1Click(Sender: TObject);
    procedure InutilizarNumerao1Click(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure pnlInutilizaResize(Sender: TObject);
    procedure btnRefrehClick(Sender: TObject);
    procedure btnReprocessaClick(Sender: TObject);
    procedure frmCCE1btnTransCCeClick(Sender: TObject);
    procedure frmPesquisa1btnEmailClick(Sender: TObject);
    procedure frmCancelaNfe1btnCancelaNfeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFuncoes, uGlobalVar, uDM_Emitente, uDm_nfe, uDm_Princial, udm_Geral,
  uNfe_Utils;

procedure TfrmPrincipal.ApplicationEvents1Activate(Sender: TObject);
begin
  if vvTrayAtivado then
    Self.Hide;
end;

procedure TfrmPrincipal.ApplicationEvents1Minimize(Sender: TObject);
begin
  vvTrayAtivado := True;
end;

procedure TfrmPrincipal.ApplicationEvents1Restore(Sender: TObject);
begin
  vvTrayAtivado := False;
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  dm_nfe.cdsNFe_Log.Close;
  dm_nfe.cdsNFe_Log.CommandText := 'SELECT '+
                                   ' ID_LOG, '+
                                   ' DATA_HORA, '+
                                   ' DESC_EVENTO, '+
                                   ' NU_NF '+
                                   ' FROM '+
                                   ' TB_NFE_LOG '+
                                   ' WHERE CAST(DATA_HORA AS DATE) = :DATA '+
                                   ' ORDER BY DATA_HORA DESC ';
  dm_nfe.cdsNFe_Log.Params.ParamByName('DATA').AsDate := dtEventos.Date;
  dm_nfe.cdsNFe_Log.Open;
  btnVoltar.Visible := (not dm_nfe.cdsNFe_Log.IsEmpty);
  if dm_nfe.cdsNFe_Log.IsEmpty then begin
    msgWarning('Nenhum evento registrado nesta data!');
    dm_nfe.cdsNFe_Log.Close;
    dm_nfe.cdsNFe_Log.CommandText := dm_nfe.qryNFe_Log.SQL.GetText;
    dm_nfe.cdsNFe_Log.Open;
  end;
end;

procedure TfrmPrincipal.btnRefrehClick(Sender: TObject);
begin
  Timer_MonitorTimer(Sender);
end;

procedure TfrmPrincipal.btnReprocessaClick(Sender: TObject);
begin
  btnReprocessa.Enabled := False;
  btnReprocessa.Enabled := False;
  dmGeral.cdsConsulta.DisableControls;
  frmPesquisa1.btnPesqClick(Sender);
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
  btnReprocessa.Enabled := True;
end;

procedure TfrmPrincipal.btnVoltarClick(Sender: TObject);
begin
  dm_nfe.cdsNFe_Log.Close;
  dm_nfe.cdsNFe_Log.CommandText := dm_nfe.qryNFe_Log.SQL.GetText;;
  dm_nfe.cdsNFe_Log.Open;
  btnVoltar.Visible := False;
end;

procedure TfrmPrincipal.CancelarNFe1Click(Sender: TObject);
begin
pgcPrincipal.ActivePage := tbsCancelaNfe;
pgcPrincipalChange(Sender);
end;

procedure TfrmPrincipal.CartadeCorreo1Click(Sender: TObject);
begin
pgcPrincipal.ActivePage := tbsCCe;
pgcPrincipalChange(Sender);
end;

procedure TfrmPrincipal.Configuraes1Click(Sender: TObject);
begin
pgcPrincipal.ActivePage := tbsConfiguracao;
pgcPrincipalChange(Sender);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
//  pgcPrincipalChange(Sender);
  VerificaAutorizacao;
  OrdenaPageCtrl(pgcPrincipal);
  pgcPrincipalChange(Sender);
  OrdenaPageCtrl(frmConfiguracao1.pgcConfig);
  pnlConfigResize(Sender);
  frmConfiguracao1.pgcConfigChange(Sender);
  Timer_Monitor.Enabled := (dm_nfe.cdsConf.FieldByName('FLG_MONITORA').AsString = 'S');
  dm_nfe.cdsNFe_Log.Open;
  //vvTrayAtivado := True;
  CarregaConfBkp(frmConfiguracao1);
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ClearLogs;
  tbsConfiguracao.TabVisible := (not vvConfigurado);
  if vvConfigurado then begin
    pgcPrincipal.ActivePage := tbsEventos;
  end;
  dtEventos.Date := Date;
end;

procedure TfrmPrincipal.frmCancelaNfe1btnCancelaNfeClick(Sender: TObject);
begin
  frmCancelaNfe1.btnCancelaNfeClick(Sender);

end;

procedure TfrmPrincipal.frmCCE1btnTransCCeClick(Sender: TObject);
begin
  frmCCE1.btnTransCCeClick(Sender);
end;

procedure TfrmPrincipal.frmConfiguracao1btnApplicarClick(Sender: TObject);
begin
  frmConfiguracao1.btnApplicarClick(Sender);
end;

procedure TfrmPrincipal.frmConfiguracao1btnCertificadoClick(Sender: TObject);
begin
  frmConfiguracao1.btnCertificadoClick(Sender);
end;

procedure TfrmPrincipal.frmEmitente1BitBtn1Click(Sender: TObject);
begin
  frmEmitente1.BitBtn1Click(Sender);
end;

procedure TfrmPrincipal.frmEventos1DBGrid1DblClick(Sender: TObject);
begin
  Application.MessageBox(Pchar(frmEventos1.DBGrid1.Columns[1].Field.AsString),'Atenção',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmPrincipal.frmEventos1DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(dm_nfe.cdsNFe_Log.RecNo) then begin
    frmEventos1.DBGrid1.Canvas.Brush.Color := clCream;
    frmEventos1.DBGrid1.Canvas.Font.Color := clBlack;
  end else begin
    frmEventos1.DBGrid1.Canvas.Brush.Color := clWhite;
    frmEventos1.DBGrid1.Canvas.Font.Color := clBlack;
  end;
  frmEventos1.DBGrid1.Canvas.FillRect(Rect);
  frmEventos1.DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

procedure TfrmPrincipal.frmPesquisa1BitBtn1Click(Sender: TObject);
begin
  frmPesquisa1.btnPesqClick(Sender);
end;

procedure TfrmPrincipal.frmPesquisa1btnCCeClick(Sender: TObject);
var
  idUF : Integer;
begin
  pgcPrincipal.ActivePage := tbsCCe;
  pgcPrincipalChange(Sender);
  idUF := StrToInt(Copy(dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString,1,2));
  frmCCE1.cmbUFEnter(Sender);
  idUF := frmCCE1.cmbUF.Items.IndexOfObject(Pointer(idUF));
  frmCCE1.cmbUF.Text := frmCCE1.cmbUF.Items[idUF];
  frmCCE1.cmbUF.ItemIndex := frmCCE1.cmbUF.Items.IndexOf(frmCCE1.cmbUF.Items[idUF]);
  frmCCE1.btnTransCCe.Enabled := False;
  frmCCE1.edtChave.Text := dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString;
  frmCCE1.edtDOC.Text := Copy(dmGeral.cdsConsulta.FieldByName('CHAVE_NFE').AsString,7,14);
  if frmCCE1.mmCorrecao.CanFocus then
    frmCCE1.mmCorrecao.SetFocus;
end;

procedure TfrmPrincipal.frmPesquisa1btnConsSefazClick(Sender: TObject);
begin
  frmPesquisa1.btnConsSefazClick(Sender);
end;

procedure TfrmPrincipal.frmPesquisa1btnEmailClick(Sender: TObject);
begin
  frmPesquisa1.btnEmailClick(Sender);
end;

procedure TfrmPrincipal.frmPesquisa1btnVisualizaClick(Sender: TObject);
begin
  frmPesquisa1.btnVisualizaClick(Sender);
end;

procedure TfrmPrincipal.GerenciarNotas1Click(Sender: TObject);
begin
pgcPrincipal.ActivePage := tbsConsulta;
pgcPrincipalChange(Sender);
end;

procedure TfrmPrincipal.InutilizarNumerao1Click(Sender: TObject);
begin
pgcPrincipal.ActivePage := tbsInutiliza;
pgcPrincipalChange(Sender);
end;

procedure TfrmPrincipal.pgcPrincipalChange(Sender: TObject);
begin
  dm_Emitente.cdsEmitente.Active := (pgcPrincipal.ActivePage = tbsAutorizacao) or (pgcPrincipal.ActivePage = tbsConfiguracao);
  if dm_Emitente.cdsEmitente.Active then
    if dm_Emitente.cdsEmitente.IsEmpty then
      dm_Emitente.cdsEmitente.Append;
  dm_nfe.cdsConf.Active       := (pgcPrincipal.ActivePage = tbsConfiguracao);
  dm_nfe.cdsConf_Cont.Active  := (pgcPrincipal.ActivePage = tbsConfiguracao);
  dmGeral.cdsConfEmail.Active := (pgcPrincipal.ActivePage = tbsConfiguracao);
  dmGeral.cdsLogin.Active     := (pgcPrincipal.ActivePage = tbsConfiguracao);
  if pgcPrincipal.ActivePage = tbsConfiguracao then
    CarregaConfBkp(frmConfiguracao1);
 if (pgcPrincipal.ActivePage = tbsAutorizacao) then begin
   CarregaCmb(frmEmitente1.cmbUf,dm_Princial.cdsGeral,'COD_UF','SIGLA','TB_IBGE_UF');
  if not dm_Emitente.cdsEmitente.FieldByName('COD_UF').IsNull then
    frmEmitente1.cmbUf.ItemIndex := frmEmitente1.cmbUf.Items.IndexOfObject(Pointer(dm_Emitente.cdsEmitente.FieldByName('COD_UF').AsInteger));
 end;
 if pgcPrincipal.ActivePage = tbsConsulta then begin
   frmPesquisa1.edtDe.Date := StartOfTheMonth(Now);
   frmPesquisa1.edtAte.Date := Now;
 end;
 if pgcPrincipal.ActivePage = tbsCancelaNfe then begin
   dm_nfe.cdsCancelNFe.Close;
   dm_nfe.cdsCancelNFe.Open;
 end else
   dm_nfe.cdsCancelNFe.Close;
 if pgcPrincipal.ActivePage = tbsInutiliza then begin
   frmeInutiliza1.cdsInutilizaTmp.CreateDataSet;
   frmeInutiliza1.cdsInutilizaTmp.Append;
 end else begin
   if frmeInutiliza1.cdsInutilizaTmp.Active then
     frmeInutiliza1.cdsInutilizaTmp.EmptyDataSet;
   frmeInutiliza1.cdsInutilizaTmp.Close;
 end;

 if pgcPrincipal.ActivePage = tbsCCe then begin
   frmCCE1.edtDOC.Clear;
   frmCCE1.mmCorrecao.Clear;
   frmCCE1.edtChave.Clear;
 end;

 tbsAutorizacao.TabVisible := False;
 tbsConfiguracao.TabVisible := pgcPrincipal.ActivePage = tbsConfiguracao;

end;

procedure TfrmPrincipal.PnlAutorizaResize(Sender: TObject);
begin
  CentralizaForm(PnlAutoriza,frmEmitente1);
end;

procedure TfrmPrincipal.pnlConfigResize(Sender: TObject);
begin
  CentralizaForm(pnlConfig,frmConfiguracao1);
end;

procedure TfrmPrincipal.pnlInutilizaResize(Sender: TObject);
begin
  CentralizaForm(pnlInutiliza,frmeInutiliza1);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var
  iCodStatus : Integer;
  bContingencia : Boolean;
begin
    StatusMsg('Verificando status do serviço na SEFAZ...',2);
    if not vvStatusServ  then begin
      iCodStatus := VerificaStatusServ;
      vvStatusServ := iCodStatus = 107;
      StatusMsg(GetMsgSolicitacao(iCodStatus,dm_Princial.cdsGeral),3);
      Application.ProcessMessages;
      GeraEvento(GetMsgSolicitacao(iCodStatus,dm_Princial.cdsGeral));
      Application.ProcessMessages;
    end;

    bContingencia := (iCodStatus in [108,109]) or (iCodStatus = -1);
    if bContingencia then begin
      if not dm_nfe.cdsConf_Cont.Active then
        dm_nfe.cdsConf_Cont.Open;
      sJustificaDPEC := dm_nfe.cdsConf_Cont.FieldByName('MOTIVO').AsString;
      dm_nfe.cdsConf_Cont.Edit;
      dm_nfe.cdsConf_Cont.FieldByName('DTA_CONTI').AsDateTime := Date;
      dm_nfe.cdsConf_Cont.Post;
      sdhCont := FormatDateTime('YYYY-MM-DD',NOW) + 'T' + FormatDateTime('HH:NN:SS',NOW);
    end;
 {
 if vvTrayAtivado then
    Self.Hide;
  frmPrincipal.Repaint;
  }
end;

procedure TfrmPrincipal.Timer_MonitorTimer(Sender: TObject);
begin
  Timer_Monitor.Enabled := False;
  if vvTmpMed = 0 then
    GetTempMed;
  btnRefreh.Enabled := Timer_Monitor.Enabled;
  TransNFePendente;
  PreencheDadosNfe(vvDirTxt);
  Timer_Monitor.Interval := 60000;
  Timer_Monitor.Enabled := True;
  btnRefreh.Enabled := Timer_Monitor.Enabled;
end;

procedure TfrmPrincipal.TrayIcon1Animate(Sender: TObject);
begin
 // vvTrayAtivado := TrayIcon1.Animate;
end;

procedure TfrmPrincipal.TrayIcon1DblClick(Sender: TObject);
begin
  vvTrayAtivado := False;
  //TrayIcon1.Animate := False;
  Self.Show;
end;

end.
