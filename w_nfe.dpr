program w_nfe;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDm_nfe in 'uDm_nfe.pas' {dm_nfe: TDataModule},
  uFrmEmitente in 'uFrmEmitente.pas' {frmEmitente: TFrame},
  uDm_Princial in 'uDm_Princial.pas' {dm_Princial: TDataModule},
  uDM_Emitente in 'uDM_Emitente.pas' {dm_Emitente: TDataModule},
  uNfe_Utils in 'uNfe_Utils.pas',
  uFuncoes in 'uFuncoes.pas',
  uGlobalVar in 'uGlobalVar.pas',
  uConfiguracao in 'uConfiguracao.pas' {frmConfiguracao: TFrame},
  uSelectCertificate in 'uSelectCertificate.pas' {frmSelectCertificate},
  uSelecPrinter in 'uSelecPrinter.pas' {frmSelectPrinter},
  udm_Geral in 'udm_Geral.pas' {dmGeral: TDataModule},
  uEventos in 'uEventos.pas' {frmEventos: TFrame},
  uPesquisa in 'uPesquisa.pas' {frmPesquisa: TFrame},
  untTSendMail in 'untTSendMail.pas',
  uCancela in 'uCancela.pas' {frmCancelaNfe: TFrame},
  uCCE in 'uCCE.pas' {frmCCE: TFrame},
  uEmail in 'uEmail.pas' {frmEmail},
  uWaint in 'uWaint.pas' {frmWaint},
  nfeNFDXML in 'nfeNFDXML.pas',
  uDanfeUtils in 'uDanfeUtils.pas',
  uDM_Danfe in 'uDM_Danfe.pas' {DM_Danfe: TDataModule},
  uFuncoesNFe in 'uFuncoesNFe.pas',
  DanfeRB in 'DanfeRB.pas',
  uInutiliza in 'uInutiliza.pas' {frmeInutiliza: TFrame},
  uFrmeRel in 'uFrmeRel.pas' {frmeConsultas: TFrame},
  uDmRel in 'uDmRel.pas' {dmRel: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm_Princial, dm_Princial);
  Application.CreateForm(Tdm_Emitente, dm_Emitente);
  Application.CreateForm(Tdm_nfe, dm_nfe);
  Application.CreateForm(TdmGeral, dmGeral);
  Application.CreateForm(TDM_Danfe, DM_Danfe);
  Application.CreateForm(TdmRel, dmRel);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
