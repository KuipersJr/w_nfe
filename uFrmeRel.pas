unit uFrmeRel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmeConsultas = class(TFrame)
    PageControl1: TPageControl;
    tbsPesqLog: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
