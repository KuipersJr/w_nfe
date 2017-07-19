unit uSelecPrinter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, vcl.printers;

type
  TfrmSelectPrinter = class(TForm)
    lstImprLocal: TListBox;
    lstImprRede: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    pnlBtn: TPanel;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure lstImprRedeEnter(Sender: TObject);
    procedure lstImprLocalEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ImpressoraDanfe : String;
    procedure ListaImpr;
    procedure SelecionaImpr;
  published
    property GetImprDanfe : String read ImpressoraDanfe write ImpressoraDanfe;
  public
    { Public declarations }
  end;

var
  frmSelectPrinter: TfrmSelectPrinter;

implementation

{$R *.dfm}

uses uFuncoes;

procedure TfrmSelectPrinter.btnOkClick(Sender: TObject);
begin
  SelecionaImpr;
  if Length(trim(ImpressoraDanfe)) > 0 then
    ModalResult := mrOk
  else
    ModalResult := mrIgnore;
end;

procedure TfrmSelectPrinter.FormShow(Sender: TObject);
begin
  ListaImpr;
end;

procedure TfrmSelectPrinter.ListaImpr;
var
   I : Integer;
begin
  for I := 0 to Printer.Printers.Count -1 do begin
    if Pos('\\',Printer.Printers[I]) <> 0 then
      lstImprRede.Items.Add(Printer.Printers[I])
    else
      lstImprLocal.Items.Add(Printer.Printers[I]);
  end;
end;

procedure TfrmSelectPrinter.lstImprLocalEnter(Sender: TObject);
var
   I : Integer;
begin
  for I := 0 to lstImprRede.Items.Count -1 do
    if lstImprRede.Selected[I] then
      lstImprRede.Selected[I] := False;
end;

procedure TfrmSelectPrinter.lstImprRedeEnter(Sender: TObject);
var
   I : Integer;
begin
  for I := 0 to lstImprLocal.Items.Count -1 do
    if lstImprLocal.Selected[I] then
      lstImprLocal.Selected[I] := False;
end;

procedure TfrmSelectPrinter.SelecionaImpr;
var
   I : Integer;
begin
  for I := 0 to lstImprLocal.Items.Count -1 do begin
    if lstImprLocal.Selected[I] then
      ImpressoraDanfe := lstImprLocal.Items[I];
  end;
  for I := 0 to lstImprRede.Items.Count -1 do begin
    if lstImprRede.Selected[I] then
      ImpressoraDanfe := lstImprRede.Items[I];
  end;
end;

end.
