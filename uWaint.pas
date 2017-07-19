unit uWaint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmWaint = class(TForm)
    pnlMsg: TPanel;
    lblMsg: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    strMsg : String;
  published
    property sMsg : String read strMsg write strMsg;
    //property SelectedCertificateName : String read FSelectedCertificateName write FSelectedCertificateName;
  public
    { Public declarations }
  end;

var
  frmWaint: TfrmWaint;

implementation

{$R *.dfm}

procedure TfrmWaint.FormShow(Sender: TObject);
begin
  lblMsg.Caption := sMsg;
  Self.Repaint;
end;

end.
