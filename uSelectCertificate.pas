unit uSelectCertificate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSelectCertificate = class(TForm)
    lbList: TListBox;
    btnSelect: TBitBtn;
    btnCancel: TBitBtn;
    pnlBody: TPanel;
    pnlMenu: TPanel;
    btnRemove: TBitBtn;
    procedure btnSelectClick(Sender: TObject);
    procedure lbListDblClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    FSelectedCertificateName: String;
    procedure UpdateSelectedCertificate;
  published
    property SelectedCertificateName : String read FSelectedCertificateName write FSelectedCertificateName;
  end;

var
  frmSelectCertificate: TfrmSelectCertificate;

implementation

{$R *.dfm}

{ TfrmSelectCertificate }

procedure TfrmSelectCertificate.btnSelectClick(Sender: TObject);
begin
  UpdateSelectedCertificate;
end;

procedure TfrmSelectCertificate.UpdateSelectedCertificate;
begin
  if lbList.ItemIndex = - 1 then
    SelectedCertificateName := ''
  else
    SelectedCertificateName := lbList.Items[lbList.ItemIndex];
end;

procedure TfrmSelectCertificate.lbListDblClick(Sender: TObject);
begin
  UpdateSelectedCertificate;
  ModalResult := mrOk;
end;

procedure TfrmSelectCertificate.btnRemoveClick(Sender: TObject);
begin
  UpdateSelectedCertificate;
  ModalResult := mrIgnore;
end;

end.
