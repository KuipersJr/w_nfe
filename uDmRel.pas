unit uDmRel;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, frxClass, frxDBSet;

type
  TdmRel = class(TDataModule)
    qryPesqLog: TSQLQuery;
    dspPesqLog: TDataSetProvider;
    cdsPesqLog: TClientDataSet;
    cdsPesqLogDESC_EVENTO: TStringField;
    PesqLog: TDataSource;
    frxdbdtsLog: TfrxDBDataset;
    frxRLog: TfrxReport;
    cdsPesqLogNU_NF: TFMTBCDField;
    cdsPesqLogDATA: TDateField;
    cdsPesqLogHORA: TTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRel: TdmRel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
