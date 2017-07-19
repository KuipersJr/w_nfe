unit uDM_Danfe;

interface

uses
  Windows, Graphics, SysUtils, Classes, DB, DBClient, frxExportMail, Grids,
  frxExportImage, frxCtrls, frxClass, frxExportPDF, frxCross, frxDBSet,
  frxBarcode, frxDesgn, Data.DBXFirebird, Data.SqlExpr, System.IniFiles,
  Data.FMTBcd, Datasnap.Provider;

type
  TDM_Danfe = class(TDataModule)
    dsNFE: TDataSource;
    dsCobranca: TDataSource;
    cdsNFE: TClientDataSet;
    cdsCobranca: TClientDataSet;
    cdsNFE_Itens: TClientDataSet;
    dsNFE_Itens: TDataSource;
    cdsNFECodBarra: TStringField;
    cdsNFENatOper: TStringField;
    cdsNFESerie: TStringField;
    cdsNFEDtEmissao: TDateField;
    cdsNFEDtSaida: TDateField;
    cdsNFEnNF: TStringField;
    cdsNFEnTpNF: TStringField;
    cdsNFEEmitNome: TStringField;
    cdsNFEEmitCNPJ: TStringField;
    cdsNFEEmitIE: TStringField;
    cdsNFEEmitIEST: TStringField;
    cdsNFEEmitEnd: TStringField;
    cdsNFEEmitBairro: TStringField;
    cdsNFEEmitMun: TStringField;
    cdsNFEEmitUF: TStringField;
    cdsNFEEmitCEP: TStringField;
    cdsNFEEmitIM: TStringField;
    cdsNFEEmitFone: TStringField;
    cdsNFEEmitMunUF: TStringField;
    cdsNFEEmitFoneStr: TStringField;
    cdsNFELogotipoEmitente: TStringField;
    cdsNFEDestNome: TStringField;
    cdsNFEDestCNPJ: TStringField;
    cdsNFEDestIE: TStringField;
    cdsNFEDestEnd: TStringField;
    cdsNFEDestBairro: TStringField;
    cdsNFEDestMun: TStringField;
    cdsNFEDestUF: TStringField;
    cdsNFEDestCEP: TStringField;
    cdsNFEDestFoneFax: TStringField;
    cdsNFEQtdeItem: TIntegerField;
    cdsNFEItem: TStringField;
    cdsNFEBaseCalcICMS: TCurrencyField;
    cdsNFEValorICMS: TCurrencyField;
    cdsNFEBaseCalcICMSSubs: TCurrencyField;
    cdsNFEValorICMSSubs: TCurrencyField;
    cdsNFEValorTotProd: TCurrencyField;
    cdsNFEValorFrete: TCurrencyField;
    cdsNFEValorSeguro: TCurrencyField;
    cdsNFEDesconto: TCurrencyField;
    cdsNFEOutrasDesp: TCurrencyField;
    cdsNFEValorIPI: TCurrencyField;
    cdsNFEValorTotNota: TCurrencyField;
    cdsNFEBaseCalcISSQN: TCurrencyField;
    cdsNFEValorTotServ: TCurrencyField;
    cdsNFEValorTotISSQN: TCurrencyField;
    cdsNFETraModFrete: TStringField;
    cdsNFETraCNPJ: TStringField;
    cdsNFETraNome: TStringField;
    cdsNFETraIE: TStringField;
    cdsNFETraEnd: TStringField;
    cdsNFETraMun: TStringField;
    cdsNFETraUF: TStringField;
    cdsNFEVeiCodigoANTT: TStringField;
    cdsNFEVeiPlaca: TStringField;
    cdsNFEVeiUF: TStringField;
    cdsNFEVolQuantidade: TStringField;
    cdsNFEVolEspecie: TStringField;
    cdsNFEVolMarca: TStringField;
    cdsNFEVolNumeracao: TStringField;
    cdsNFEVolPesoBruto: TCurrencyField;
    cdsNFEVolPesoLiquido: TCurrencyField;
    cdsNFEObsFisco: TStringField;
    cdsNFEObsContribuinte: TStringField;
    cdsNFEtpAmb: TIntegerField;
    cdsNFEtpEmis: TStringField;
    cdsCobrancanNF: TStringField;
    cdsCobrancaNumDuplicata: TStringField;
    cdsCobrancaDtVencimento: TDateField;
    cdsCobrancaValorDuplicata: TCurrencyField;
    RelDanfe: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxCrossObject1: TfrxCrossObject;
    cdsNFETextoCanhoto: TStringField;
    cdsNFENumProtocolo: TStringField;
    cdsNFEcUF: TIntegerField;
    RelDanfePais: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    Designer1: TfrxDesigner;
    cdsNFE_ItensnNF: TStringField;
    cdsNFE_ItensItemCodigo: TStringField;
    cdsNFE_ItensItemNCM: TStringField;
    cdsNFE_ItensItemDescricao: TStringField;
    cdsNFE_ItensItemCST: TStringField;
    cdsNFE_ItensItemCFOP: TStringField;
    cdsNFE_ItensItemUnidade: TStringField;
    cdsNFE_ItensItemQuantidade: TCurrencyField;
    cdsNFE_ItensItemVUnit: TCurrencyField;
    cdsNFE_ItensItemVTotal: TCurrencyField;
    cdsNFE_ItensItemBCalcIcms: TCurrencyField;
    cdsNFE_ItensItemVICMS: TCurrencyField;
    cdsNFE_ItensItemVIPI: TCurrencyField;
    cdsNFE_ItensItemAliqICMS: TCurrencyField;
    cdsNFE_ItensItemAliqIPI: TCurrencyField;
    cdsNFE_ItensinfAdProd: TStringField;
    frxDBDataset4: TfrxDBDataset;
    qryGeral: TSQLQuery;
    dspGeral: TDataSetProvider;
    cdsGeral: TClientDataSet;
    dsGeral: TDataSource;
    cdsGeralIMG_LOGO: TBlobField;
    cdsNFEvTotTrib: TFloatField;
    procedure cdsNFE_ItensNewRecord(DataSet: TDataSet);
    procedure RelDanfeBeforePrint(Sender: TfrxReportComponent);
    procedure RelDanfePaisBeforePrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
    sgDup: TStringGrid;
  public
    { Public declarations }
    ArqLogotipo: string;
    ImprimeHora, Demostracao, Homologacao, Contingencia: Boolean;
  end;

var
  DM_Danfe: TDM_Danfe;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

uses uDm_Princial;

procedure TDM_Danfe.cdsNFE_ItensNewRecord(DataSet: TDataSet);
begin
  cdsNFE_ItensItemQuantidade.AsCurrency := 0;
  cdsNFE_ItensItemVUnit.AsCurrency := 0;
  cdsNFE_ItensItemVTotal.AsCurrency := 0;
  cdsNFE_ItensItemBCalcIcms.AsCurrency := 0;
  cdsNFE_ItensItemVICMS.AsCurrency := 0;
  cdsNFE_ItensItemVIPI.AsCurrency := 0;
  cdsNFE_ItensItemAliqICMS.AsCurrency := 0;
end;


procedure TDM_Danfe.RelDanfeBeforePrint(Sender: TfrxReportComponent);
var
  picLogo: TfrxPictureView;
  memHora, memDemonst: TfrxMemoView;
begin
  if Sender is TfrxMemoView then
  begin
    memDemonst := TfrxMemoView(Sender);
    if AnsiSameText(memDemonst.Name, 'memDemonst') then
{$IFDEF DEMO}
      memDemonst.Visible := True;
{$ELSE}
      memDemonst.Visible := False;
{$ENDIF}
    memHora := TfrxMemoView(Sender);
    if AnsiSameText(memHora.Name, 'memHora') then
      memHora.Visible := False;
  end;

  if Sender is TfrxPictureView then
  begin
    picLogo := TfrxPictureView(Sender);

    if (Trim(ArqLogotipo) <> EmptyStr) then
      picLogo.Picture.LoadFromFile(ArqLogotipo);

  end;
end;

procedure TDM_Danfe.RelDanfePaisBeforePrint(Sender: TfrxReportComponent);
var
  picLogo: TfrxPictureView;
  memHora, memDemonst: TfrxMemoView;
begin
  if Sender is TfrxMemoView then
  begin
    memDemonst := TfrxMemoView(Sender);
    if AnsiSameText(memDemonst.Name, 'memDemonst') then
{$IFDEF DEMO}
      memDemonst.Visible := True;
{$ELSE}
      memDemonst.Visible := False;
{$ENDIF}
    memHora := TfrxMemoView(Sender);
    if AnsiSameText(memHora.Name, 'memHora') then
      memHora.Visible := False;
  end;

  if Sender is TfrxPictureView then
  begin
    picLogo := TfrxPictureView(Sender);

    if (Trim(ArqLogotipo) <> EmptyStr) then
      picLogo.Picture.LoadFromFile(ArqLogotipo);

  end;
end;

end.

