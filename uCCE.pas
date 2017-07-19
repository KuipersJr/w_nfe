unit uCCE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmCCE = class(TFrame)
    cmbUF: TComboBox;
    Label1: TLabel;
    edtDOC: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtChave: TEdit;
    edtDesc: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    mmCorrecao: TMemo;
    GroupBox2: TGroupBox;
    mmCodUso: TMemo;
    pnlBtn: TPanel;
    btnTransCCe: TBitBtn;
    btnCancelar: TBitBtn;
    procedure edtDOCKeyPress(Sender: TObject; var Key: Char);
    procedure btnTransCCeClick(Sender: TObject);
    procedure cmbUFEnter(Sender: TObject);
    procedure edtDOCExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure mmCorrecaoChange(Sender: TObject);
    procedure edtChaveExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uFuncoes, uNfe_Utils, uDm_Princial, uGlobalVar;

procedure TfrmCCE.btnCancelarClick(Sender: TObject);
begin
  cmbUF.ItemIndex := -1;
  edtDOC.Clear;
  edtChave.Clear;
  mmCorrecao.Clear;
  mmCorrecaoChange(Sender);
end;

procedure TfrmCCE.btnTransCCeClick(Sender: TObject);
begin

  if consiste(cmbUF,cmbUF.ItemIndex = -1,'Selecione a UF do evendo',nil,nil) then
    Exit;
  if consiste(edtDOC,Length(Trim(edtDOC.Text)) = 0 ,'Informe o CNPJ ou CPF do autor do evento.',nil,nil) then
    Exit
  else
    vvCNPJ := edtDOC.Text;
  if consiste(edtChave,Length(Trim(edtChave.Text)) < 44,'Informe a Chave de Acesso da NF-e vinculada ao Evento.',nil,nil) then
    Exit;
  if consiste(mmCorrecao,Length(Trim(mmCorrecao.Text)) = 0 ,'Informe a Correção a ser considerada.',nil,nil) then
    Exit;

  TransCCe; // procedure que transmite a carta de correção para sefaz
  btnCancelarClick(Sender);
end;

procedure TfrmCCE.cmbUFEnter(Sender: TObject);
begin
  CarregaCmb(cmbUF,dm_Princial.cdsGeral,'COD_UF','SIGLA','TB_IBGE_UF');
end;

procedure TfrmCCE.edtChaveExit(Sender: TObject);
begin
 edtDOC.Text := Copy(edtChave.Text,7,14);
end;

procedure TfrmCCE.edtDOCExit(Sender: TObject);
begin
  if Length(Trim(edtDOC.Text)) = 14 then
    vvCNPJ := Trim(RemoveMascara(edtDOC.Text))
  else
    vvCPF := Trim(RemoveMascara(edtDOC.Text));
end;

procedure TfrmCCE.edtDOCKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then begin
    key := #0;
    msgWarning('Digitem somente numeros');
  end;
end;

procedure TfrmCCE.mmCorrecaoChange(Sender: TObject);
begin
  btnTransCCe.Enabled := Length(mmCorrecao.Text) >= 15;
end;

end.
