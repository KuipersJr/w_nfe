unit uDM_Emitente;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient;

type
  Tdm_Emitente = class(TDataModule)
    dsEmitente: TDataSource;
    cdsEmitente: TClientDataSet;
    dspEmitente: TDataSetProvider;
    qryEmitente: TSQLQuery;
    qryEndereco: TSQLQuery;
    dspEndereco: TDataSetProvider;
    cdsEndereco: TClientDataSet;
    dsEndereco: TDataSource;
    cdsEmitenteNOME_RZ: TStringField;
    cdsEmitenteFANTASIA: TStringField;
    cdsEmitenteCNPJ: TStringField;
    cdsEmitenteIE: TStringField;
    cdsEmitenteCNAE: TStringField;
    cdsEmitenteIM: TStringField;
    cdsEmitenteIE_ST: TStringField;
    cdsEmitenteCRT: TSmallintField;
    cdsEmitenteFLG_AUTORIZADO: TStringField;
    cdsEnderecoID_ENDERECO: TIntegerField;
    cdsEnderecoID_EMITENTE: TIntegerField;
    cdsEnderecoLOGRADOURO: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCEP: TStringField;
    cdsEnderecoPAIS: TStringField;
    cdsEnderecoCOD_PAIS: TStringField;
    cdsEnderecoUF: TStringField;
    cdsEnderecoCOD_UF: TStringField;
    cdsEnderecoMUNICIPIO: TStringField;
    cdsEnderecoCOD_MUNICIPIO: TIntegerField;
    cdsEnderecoTELEFONE: TStringField;
    cdsEmitenteID_EMITENTE: TIntegerField;
    cdsEmitenteCOD_UF: TSmallintField;
    procedure cdsEmitenteAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Emitente: Tdm_Emitente;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uDm_Princial, uFuncoes, uGlobalVar;

{$R *.dfm}

procedure Tdm_Emitente.cdsEmitenteAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_EMITENTE').Value := GetAutoNum('TB_NFE_EMITENTE','ID_EMITENTE');
end;

procedure Tdm_Emitente.DataModuleCreate(Sender: TObject);
begin
  dm_Emitente.cdsEmitente.Open;
  vvUf := getSiglaUF(dm_Emitente.cdsEmitente.FieldByName('COD_UF').AsInteger);
  dm_Emitente.cdsEmitente.Close;
end;

end.
