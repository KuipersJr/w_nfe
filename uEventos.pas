unit uEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmEventos = class(TFrame)
    DBGrid1: TDBGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uDm_nfe;

procedure TfrmEventos.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(dm_nfe.cdsNFe_Log.RecNo) then begin
    DBGrid1.Canvas.Brush.Color := clYellow;
    DBGrid1.Canvas.Font.Color  := clBlack;
  end else begin
    DBGrid1.Canvas.Brush.Color := clWhite;
    DBGrid1.Canvas.Font.Color  := clBlack;
  end;
end;

end.
