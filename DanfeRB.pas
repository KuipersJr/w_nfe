unit DanfeRB;

interface

uses
  System.SysUtils,
  System.Classes,
  MidasLib,
  uDM_Danfe,
  uDanfeUtils,
  nfeNFDXML,
  uFuncoesNFE;
//
procedure PrintDanfe(aXML: PWideChar; aReportPath, aLogotipoPath: PChar);
procedure ExportDanfe(aXML: PWideChar; aReportPath, aLogotipoPath: PChar; aFormat: Integer);
procedure PreviewDanfe(aXML: PWideChar; aReportPath, aLogotipoPath: Pchar);
procedure DesignDanfe(aXML, aReportPath, aLogotipoPath: pchar);
procedure SaveTemplate(aPath: pchar);
//
implementation

procedure PrintDanfe(aXML: PWideChar; aReportPath, aLogotipoPath: PChar);
var
  aDanfe: TDanfeUtils;
begin
  aDanfe := TDanfeUtils.Create;
  try
    aDanfe.LogotipoEmitente := aLogotipoPath;
    aDanfe.PrintDanfe(pvPrinter, aXml, aReportPath);
  finally
    aDanfe.Free;
  end;
end;

procedure ExportDanfe(aXML: PWideChar; aReportPath, aLogotipoPath: PChar; aFormat: Integer);
var
  aDanfe: TDanfeUtils;
begin
  aDanfe := TDanfeUtils.Create;
  try
    aDanfe.LogotipoEmitente := aLogotipoPath;
    case aFormat of
      1: aDanfe.PrintDanfe(pvPDF, aXml, aReportPath);
      2: aDanfe.PrintDanfe(pvJPG, aXml, aReportPath);
    else aDanfe.PrintDanfe(pvPDF, aXml, aReportPath);
    end;
  finally
    aDanfe.Free;
  end;
end;

procedure PreviewDanfe(aXML: PWideChar; aReportPath, aLogotipoPath: Pchar);
var
  aDanfe: TDanfeUtils;
begin
  aDanfe := TDanfeUtils.Create;
  try
    aDanfe.LogotipoEmitente := aLogotipoPath;
    aDanfe.PrintDanfe(pvPreview, aXml, aReportPath);
  finally
    aDanfe.Free;
  end;
end;

procedure DesignDanfe(aXML, aReportPath, aLogotipoPath: pchar);
var
  aDanfe: TDanfeUtils;
begin
  aDanfe := TDanfeUtils.Create;
  try
    aDanfe.LogotipoEmitente := aLogotipoPath;
    aDanfe.EditarDanfe(aReportPath, aXml);
  finally
    aDanfe.Free;
  end;
end;

procedure SaveTemplate(aPath: pchar);
var
  aDanfe: TDanfeUtils;
begin
  aDanfe := TDanfeUtils.Create;
  try
    aDanfe.SaveDanfeTemplate(aPath);
  finally
    aDanfe.Free;
  end;
end;

end.
