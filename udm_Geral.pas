unit udm_Geral;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TdmGeral = class(TDataModule)
    qryLogin: TSQLQuery;
    dspLogin: TDataSetProvider;
    cdsLogin: TClientDataSet;
    cdsLoginID_USUARIO: TIntegerField;
    cdsLoginUSUARIO: TStringField;
    cdsLoginSENHA: TStringField;
    cdsLoginFLG_ATIVA: TStringField;
    dsLogin: TDataSource;
    qryConfEmail: TSQLQuery;
    cdsConfEmail: TClientDataSet;
    cdsConfEmailID_NFE_CONF_EMAIL: TIntegerField;
    cdsConfEmailSERVER_SMTP: TStringField;
    cdsConfEmailPORTA_SMTP: TSmallintField;
    cdsConfEmailEMAIL_REMETENTE: TStringField;
    cdsConfEmailASSUNTO: TStringField;
    cdsConfEmailMENSAGEM: TStringField;
    cdsConfEmailUSUARIO: TStringField;
    cdsConfEmailSENHA: TStringField;
    cdsConfEmailFLG_SSI: TStringField;
    cdsConfEmailFLG_DANFE: TStringField;
    cdsConfEmailFLG_EMAIL_AUTO: TStringField;
    dspConfEmail: TDataSetProvider;
    dsConfEmail: TDataSource;
    dsConsulta: TDataSource;
    cdsConsulta: TClientDataSet;
    dspConsulta: TDataSetProvider;
    qryConsulta: TSQLQuery;
    cdsConfEmailFLG_SSL: TStringField;
    cdsConsultaSERIE: TStringField;
    cdsConsultaNU_NFE: TFMTBCDField;
    cdsConsultaNRECIBO: TStringField;
    cdsConsultaCHAVE_NFE: TStringField;
    cdsConsultaPROTOCOLO_ENVIO: TStringField;
    cdsConsultaPROTOCOLO_CANCEL: TStringField;
    cdsConsultaDTA_EMISSAO: TDateField;
    cdsConsultaDTA_AUTORIZACAO: TDateField;
    cdsConsultaDTA_CANCELAMENTO: TDateField;
    cdsConsultaCPF_CNPJ: TStringField;
    cdsConsultaNOME_DEST: TStringField;
    cdsConsultaTIPO: TStringField;
    cdsConsultaCOD_SITUACAO: TIntegerField;
    cdsConsultaSITUACAO: TStringField;
    cdsConsultaDANFE_IMPRESSO: TStringField;
    dsInutilizaNFe: TDataSource;
    cdsInutilizaNFe: TClientDataSet;
    dspInutilizaNFe: TDataSetProvider;
    qryInutilizaNFe: TSQLQuery;
    cdsInutilizaNFeID_INUT: TIntegerField;
    cdsInutilizaNFeNU_NF: TFMTBCDField;
    cdsInutilizaNFeANO: TIntegerField;
    cdsInutilizaNFeMODELO: TStringField;
    cdsInutilizaNFeSERIE: TSmallintField;
    cdsInutilizaNFeJUSTIFICATIVA: TStringField;
    cdsInutilizaNFeXML_RET: TMemoField;
    cdsInutilizaNFeCNPJ: TStringField;
    cdsInutilizaNFePROTOCOLO: TStringField;
    procedure cdsLoginAfterInsert(DataSet: TDataSet);
    procedure cdsConfEmailAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsConsultaAfterScroll(DataSet: TDataSet);
    procedure cdsInutilizaNFeAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function CarregaConfEmail : Boolean;
  end;

var
  dmGeral: TdmGeral;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uDm_Princial, uFuncoes, uGlobalVar, uPesquisa, uPrincipal;

{$R *.dfm}

{ TdmGeral }

function TdmGeral.CarregaConfEmail: Boolean;
begin
  Result := False;
  cdsConfEmail.Close;
  cdsConfEmail.Open;
  if not cdsConfEmail.IsEmpty then begin
    try
      vvServSMTP := cdsConfEmail.FieldByName('SERVER_SMTP').AsString;
      vvPorta    := cdsConfEmail.FieldByName('PORTA_SMTP').AsInteger;
      vvEmailR   := cdsConfEmail.FieldByName('EMAIL_REMETENTE').AsString;
      vvAssunto  := cdsConfEmail.FieldByName('ASSUNTO').AsString;
      vvMsgEmail := cdsConfEmail.FieldByName('MENSAGEM').AsString;
      vvUsuario  := cdsConfEmail.FieldByName('USUARIO').AsString;
      vvSenha    := cdsConfEmail.FieldByName('SENHA').AsString;
      vvSSI      := cdsConfEmail.FieldByName('FLG_SSI').AsString = 'S';
      vvSSL      := cdsConfEmail.FieldByName('FLG_SSL').AsString = 'S';
      vvPdf      := cdsConfEmail.FieldByName('FLG_DANFE').AsString = 'S';
      vvEnvioAuto := cdsConfEmail.FieldByName('FLG_EMAIL_AUTO').AsString = 'S';
      Result := True;
    except
      on E : Exception do begin
        //gravalog(E.Message)
        raise Exception.Create('Erro ao carregar as configurações para envio da NF-e por email');
      end;
    end;
  end;
  end;

procedure TdmGeral.cdsConfEmailAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_NFE_CONF_EMAIL').Value := GetAutoNum('TB_NFE_CONF_EMAIL','ID_NFE_CONF_EMAIL');
end;

procedure TdmGeral.cdsConsultaAfterScroll(DataSet: TDataSet);
begin
  frmPrincipal.frmPesquisa1.btnConsSefaz.Enabled := ((not (DataSet.FieldByName('COD_SITUACAO').AsInteger in [100,150])) and (DataSet.RecordCount > 0) );
  frmPrincipal.frmPesquisa1.btnCCe.Enabled := (DataSet.FieldByName('COD_SITUACAO').AsInteger in [100,150]) and (DataSet.RecordCount > 0);
  frmPrincipal.frmPesquisa1.btnVisualiza.Enabled := (DataSet.FieldByName('COD_SITUACAO').AsInteger in [100,150]) and (DataSet.RecordCount > 0);
  frmPrincipal.frmPesquisa1.btnImprimir.Enabled := (DataSet.FieldByName('COD_SITUACAO').AsInteger in [100,150]) and (DataSet.RecordCount > 0);
  frmPrincipal.frmPesquisa1.btnEmail.Enabled := (DataSet.FieldByName('COD_SITUACAO').AsInteger in [100,150]) and (DataSet.RecordCount > 0);
  frmPrincipal.frmPesquisa1.btnExportaXml.Enabled := (DataSet.FieldByName('COD_SITUACAO').AsInteger in [100,150]) and (DataSet.RecordCount > 0);
end;

procedure TdmGeral.cdsInutilizaNFeAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_INUT').Value := GetAutoNum('TB_NFE_INUT','ID_INUT');
end;

procedure TdmGeral.cdsLoginAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_USUARIO').Value := GetAutoNum('TB_USUARIO','ID_USUARIO');
end;

procedure TdmGeral.DataModuleCreate(Sender: TObject);
begin
 CarregaConfEmail;
end;

end.
