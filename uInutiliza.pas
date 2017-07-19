unit uInutiliza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, Datasnap.DBClient, frxClass, frxDBSet;

type
  TfrmeInutiliza = class(TFrame)
    Panel1: TPanel;
    Label1: TLabel;
    dbedtNuNf: TDBEdit;
    Label2: TLabel;
    dbedtAno: TDBEdit;
    Label3: TLabel;
    dbedtModelo: TDBEdit;
    Label4: TLabel;
    dbedtSerie: TDBEdit;
    Label5: TLabel;
    dbmmJustifica: TDBMemo;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    cdsInutilizaTmp: TClientDataSet;
    cdsInutilizaTmpNU_NF: TFMTBCDField;
    cdsInutilizaTmpANO: TIntegerField;
    cdsInutilizaTmpMODELO: TStringField;
    cdsInutilizaTmpSERIE: TSmallintField;
    cdsInutilizaTmpJUSTIFICATIVA: TStringField;
    dsInutilizaTmp: TDataSource;
    btnIncluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnItulizar: TSpeedButton;
    ProgressBar1: TProgressBar;
    cdsInutilizaTmpCnpj: TStringField;
    pnlButton: TPanel;
    btnsair: TSpeedButton;
    SpeedButton2: TSpeedButton;
    edtCnpj: TDBEdit;
    Label6: TLabel;
    procedure btnItulizarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure dbmmJustificaChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsInutilizaTmpStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CriaDataSet;
  end;

implementation

{$R *.dfm}

uses uDm_nfe, uNfe_Utils, uFuncoes, uGlobalVar, udm_Geral, uDm_Princial;

procedure TfrmeInutiliza.btnCancelarClick(Sender: TObject);
begin
  if (cdsInutilizaTmp.Active) and (cdsInutilizaTmp.IsEmpty) then begin
    if cdsInutilizaTmp.State in [dsInsert,dsEdit] then
      cdsInutilizaTmp.Cancel
    else
      cdsInutilizaTmp.Delete;
  end;
end;

procedure TfrmeInutiliza.btnIncluirClick(Sender: TObject);
begin
  if consiste(edtCnpj,(Trim(RemoveMascara(edtCnpj.Text)) = EmptyStr) and (ValidaCNPJ(RemoveMascara(edtCnpj.Text)) = False), 'CNPJ Inválido',  nil,nil ) then begin
    if edtCnpj.CanFocus then
      edtCnpj.SetFocus;
    exit;
  end;
  if consiste(dbedtNuNf,Trim(dbedtNuNf.Text) = EmptyStr,'Número da NF Inválido',nil,nil ) then begin
    if dbedtNuNf.CanFocus then
      dbedtNuNf.SetFocus;
    exit;
  end;
  if consiste(dbedtAno,ValidaAno(StrToInt(dbedtAno.Text)) = False,'Ano da nota inválido',nil,nil ) then begin
    if dbedtAno.CanFocus then
      dbedtAno.SetFocus;
    exit;
  end;
  if cdsInutilizaTmp.State in [dsInsert,dsEdit] then
    cdsInutilizaTmp.Post
  else
    cdsInutilizaTmp.Append;
  if edtCnpj.CanFocus then
   edtCnpj.SetFocus;

end;

procedure TfrmeInutiliza.btnItulizarClick(Sender: TObject);
var
  sAno,
  sModelo,
  sSerie,
  sNota,
  sJustificativa,
  sCNPJ,
  sSaida : string;
  wXml_ret : WideString;
begin
  try
   try
    ProgressBar1.Max := cdsInutilizaTmp.RecordCount;
    if cdsInutilizaTmp.State in [dsInsert,dsEdit] then
      cdsInutilizaTmp.Cancel;
    cdsInutilizaTmp.DisableControls;
    cdsInutilizaTmp.First;
    while not cdsInutilizaTmp.Eof do begin
      sAno    := Copy(cdsInutilizaTmp.FieldByName('ANO').AsString,3,2);
      sModelo := cdsInutilizaTmp.FieldByName('MODELO').AsString;
      sSerie  := cdsInutilizaTmp.FieldByName('Serie').AsString;
      sNota   := cdsInutilizaTmp.FieldByName('NU_NF').AsString;
      sJustificativa := RemoveAcentos(RemoveEspecial(RemoveMascara(cdsInutilizaTmp.FieldByName('JUSTIFICATIVA').AsString)));
      sCNPJ   := cdsInutilizaTmp.FieldByName('Cnpj').AsString;
      StartWaint('Enviando Solicitação de Inutilização da Nota Nº' + sNota + ', aguarde...');
      wXml_ret := dm_nfe.nfdNFe2.InutilizarNF(sAno,sCNPJ,sModelo,sSerie,sNota,sNota,sJustificativa,sSaida); // transmite solicitação de inutilização d
      Application.ProcessMessages;
      GeraEvento(GetMsgSolicitacao(GetCodMsgStatus(wXml_ret),dm_Princial.cdsGeral));
      StatusMsg(GetMsgSolicitacao(GetCodMsgStatus(wXml_ret),dm_Princial.cdsGeral),3);
      if GetCodMsgStatus(wXml_ret) = 102 then begin
        msgInformation(GetMsgSolicitacao(102,dm_Princial.cdsGeral),'Inutilização de numeração de NF-e');
        // grava dados no banco de dados
        if not dmGeral.cdsInutilizaNFe.Active then
          dmGeral.cdsInutilizaNFe.Open;
        dmGeral.cdsInutilizaNFe.Insert;
        dmGeral.cdsInutilizaNFe.FieldByName('NU_NF').AsInteger := StrToInt(sNota);
        dmGeral.cdsInutilizaNFe.FieldByName('ANO').AsInteger := StrToInt(sAno);
        dmGeral.cdsInutilizaNFe.FieldByName('MODELO').AsString := sModelo;
        dmGeral.cdsInutilizaNFe.FieldByName('SERIE').AsInteger := StrToInt(sSerie);
        dmGeral.cdsInutilizaNFe.FieldByName('JUSTIFICATIVA').AsString := sJustificativa;
        dmGeral.cdsInutilizaNFe.FieldByName('XML_RET').Value := wXml_ret;
        dmGeral.cdsInutilizaNFe.FieldByName('CNPJ').AsString := sCNPJ;
        dmGeral.cdsInutilizaNFe.FieldByName('PROTOCOLO').AsString := ObterNroProtocolo(wXml_ret);
        dmGeral.cdsInutilizaNFe.Post;
        dmGeral.cdsInutilizaNFe.ApplyUpdates(-1);
        Application.ProcessMessages;
      end;
      EndWaint;
      ProgressBar1.Position := cdsInutilizaTmp.RecNo;
      cdsInutilizaTmp.Next;
    end;
    cdsInutilizaTmp.EnableControls;
   except
    on E : Exception do begin
      cdsInutilizaTmp.EnableControls;
      EndWaint;
      msgWarning(E.Message);
    end;
   end;
  finally
    EndWaint;
    cdsInutilizaTmp.EmptyDataSet;
    //cdsInutilizaTmp.Close;
  end;
end;

procedure TfrmeInutiliza.CriaDataSet;
begin
  cdsInutilizaTmp.CreateDataSet;
end;

procedure TfrmeInutiliza.dbmmJustificaChange(Sender: TObject);
begin
 btnIncluir.Enabled := Length(dbmmJustifica.Text) >= 15;
end;

procedure TfrmeInutiliza.dsInutilizaTmpStateChange(Sender: TObject);
begin
  if cdsInutilizaTmp.State in [dsInsert,dsEdit] then
    btnCancelar.Hint := 'Cancelar Operação'
  else
    btnCancelar.Hint := 'Excluir item do Grid';
  btnItulizar.Enabled := ((cdsInutilizaTmp.Active) and (cdsInutilizaTmp.RecordCount > 0));
end;

end.
