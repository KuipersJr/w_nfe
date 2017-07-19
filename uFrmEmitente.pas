unit uFrmEmitente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Data.DB, Vcl.ExtCtrls;

type
  TfrmEmitente = class(TFrame)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    dbedtIE: TDBEdit;
    Label3: TLabel;
    cmbUf: TComboBox;
    Label5: TLabel;
    Label2: TLabel;
    dbedtCNPJ: TDBEdit;
    pnlBtn: TPanel;
    lblMsg: TLabel;
    BitBtn1: TBitBtn;
    procedure dbedtIEKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uPrincipal, uDm_Princial, uDM_Emitente, uNfe_Utils, uDm_nfe, uFuncoes,
  uGlobalVar, uEventos;

procedure TfrmEmitente.BitBtn1Click(Sender: TObject);
var
  iCodSatus : Integer;
begin
try
  if (Length(Trim(dbedtIE.Text)) = 0) and (Length(Trim(dbedtCNPJ.Text)) = 0) then begin
    msgWarning('Sr(a) Operador entre com a Inscrição Estadual ou o CNPJ do emitente da NF-e');
    if dbedtIE.CanFocus then
      dbedtIE.SetFocus;
    exit;
  end;

  if cmbUf.ItemIndex = -1 then begin
    msgWarning('Sr(a) Operador entre com a UF do emitente da NF-e');
    if cmbUf.CanFocus then
      cmbUf.SetFocus;
  end;

  Screen.Cursor := crHourGlass;
  StatusMsg('Verificando status do serviço na SEFAZ',2);
  {
  iCodSatus := VerificaStatusServ;
  GeraEvento(GetMsgSolicitacao(iCodSatus,dm_Princial.cdsGeral));
  StatusMsg(GetMsgSolicitacao(iCodSatus,dm_Princial.cdsGeral),0);
  }
  StatusMsg('Consultando cadastro junto a sefaz aguarde...',2);
  iCodSatus := GetAutorizacao(cmbUf.Text,dbedtIE.Text,RemoveMascara(dbedtCNPJ.Text));
  StatusMsg(GetMsgSolicitacao(iCodSatus,dm_Princial.cdsGeral),0);
  GeraEvento(GetMsgSolicitacao(iCodSatus,dm_Princial.cdsGeral));
  Screen.Cursor := crDefault;
  vvAutorizado := (iCodSatus in [111,112]);
  if vvAutorizado then begin
    lblMsg.Font.Color := clGreen;
    lblMsg.Caption := GetMsgSolicitacao(iCodSatus,dm_Princial.cdsGeral);
  end else begin
    lblMsg.Font.Color := clRed;
    lblMsg.Caption := GetMsgSolicitacao(iCodSatus,dm_Princial.cdsGeral);
  end;

  if dm_Emitente.cdsEmitente.State in [dsInsert,dsEdit] then begin
    if vvAutorizado then
      dm_Emitente.cdsEmitente.FieldByName('FLG_AUTORIZADO').AsString := 'S';
  end;

  if dm_Emitente.cdsEndereco.State in [dsInsert,dsEdit] then begin
    dm_Emitente.cdsEndereco.FieldByName('UF').AsString := cmbUf.Text;
  end;
finally
  Screen.Cursor := crDefault;
end;

end;

procedure TfrmEmitente.dbedtIEKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0;
end;

end.
