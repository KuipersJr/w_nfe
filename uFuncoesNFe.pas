{Utilitários NFe - Funções auxiliares e Exceções.}
unit UFuncoesNFe;

interface
{$I nfe4delphi.inc}

uses SysUtils, Classes, Controls, StrUtils, ShlObj, Windows, Forms, NfeNFDXML;

type
  NewString = WideString;

function RemoveAcentos(Str: WideString): WideString; // Remove os acentos da str passada
function ExisteAcento(VStr: WideString): Boolean; // Informa TRUE se tiver acento...
function ConverteData(Data: string): string; // Converte datas no formato AAAA-MM-DD para o formato DD/MM/YYYY.
function GerarChave(ADtEmissao, AUF, ACNPJ, AModelo, ASerie, ANRNota, ACodigo, ATpEmis: string): string; overload;
// Função que Gera a ID Nota
function GerarChave(ADtEmissao, AUF, ACNPJ, AModelo, ASerie, ANRNota, ACodigo: string): string; overload;
// Função que Gera a ID Nota
function Empty(VStr: string): Boolean; // Retorna True se a vStr estiver em branco
function RetornaCodUF(VUF: string): string; // Retorna o codigo referente à UF passada
function RemoveCharInvalidos(VStr: WideString): WideString;
function RemoveEspacosEntreTags(Str: WideString): WideString;

function EIgual(S1, S2: string): Boolean;

function ConverteString(const VTexto: string; const AoContrario: Boolean = False): string;

function StrZero(Str: string; Zeros: Integer): string;
function NfeObterNotaID(const aXml: WideString): string;
function ConvertString(const Valor: String): {$IFDEF D2009UP} AnsiString {$ELSE} String {$ENDIF};
function LimparTemplate(Template: String): String;
procedure RecortarStr(const Index, Qtd: integer; var Origem: String; out Recort: String); overload;
procedure RecortarWStr(const Index, Qtd: integer; var Origem: WideString; out Recort: WideString); overload;

implementation

function StrZero(Str: string; Zeros: Integer): string;
var
  Izeros: Integer;
  VStr: string;
begin
  for Izeros := 1 to (Zeros - Length(Str)) do
    VStr := VStr + '0';
  Result := VStr + Str;
end;

function ConverteString(const VTexto: string; const AoContrario: Boolean = False): string;
const
  {vChars: array[0..74, 0..1] of string = (
   ('&lt;', '<'), ('&gt;', '>'), ('&amp;', '&'),
   ('&quot;', '"'), ('&#39;', ''''), ('&Aacute;', 'Á'),
   ('&aacute;', 'á'), ('&Acirc;', 'Â'), ('&acirc;', 'â'),
   ('&Agrave;', 'À'), ('&agrave;', 'à'), ('&Aring;', 'Å'),
   ('&aring;', 'å'), ('&Atilde;', 'Ã'), ('&atilde;', 'ã'),
   ('&Auml;', 'Ä'), ('&auml;', 'ä'), ('&AElig;', 'Æ'),
   ('&aelig;', 'æ'), ('&Eacute;', 'É'), ('&eacute;', 'é'),
   ('&Ecirc;', 'Ê'), ('&ecirc;', 'ê'), ('&Egrave;', 'È'),
   ('&egrave;', 'è'), ('&Euml;', 'Ë'), ('&euml;', 'ë'),
   ('&ETH;', 'Ð'), ('&eth;', 'ð'), ('&Iacute;', 'Í'),
   ('&iacute;', 'í'), ('&Icirc;', 'Î'), ('&icirc;', 'î'),
   ('&Igrave;', 'Ì'), ('&igrave;', 'ì'), ('&Iuml;', 'Ï'),
   ('&iuml;', 'ï'), ('&Oacute;', 'Ó'), ('&oacute;', 'ó'),
   ('&Ocirc;', 'Ô'), ('&ocirc;', 'ô'), ('&Ograve;', 'Ò'),
   ('&ograve;', 'ò'), ('&Oslash;', 'Ø'), ('&oslash;', 'ø'),
   ('&Otilde;', 'Õ'), ('&otilde;', 'õ'), ('&Ouml;', 'Ö'),
   ('&ouml;', 'ö'), ('&Uacute;', 'Ú'), ('&uacute;', 'ú'),
   ('&Ucirc;', 'Û'), ('&ucirc;', 'û'), ('&Ugrave;', 'Ù'),
   ('&ugrave;', 'ù'), ('&Uuml;', 'Ü'), ('&uuml;', 'ü'),
   ('&Ccedil;', 'Ç'), ('&ccedil;', 'ç'), ('&Ntilde;', 'Ñ'),
   ('&ntilde;', 'ñ'), ('&reg;', '®'), ('&copy;', '©'),
   ('&Yacute;', 'Ý'), ('&yacute;', 'ý'), ('&THORN;', 'Þ'),
   ('&thorn;', 'þ'), ('&szlig;', 'ß'), ('&deg;', '°'),
   ('&plusmn;', '±'), ('&sup1;', '¹'), ('&sup2;', '²'),
   ('&sup3;', '³'), ('&ordm;', 'º'), ('&para;', '¶')
   );}
  VChars: array [0 .. 74, 0 .. 1] of string = (('&lt;', '<'), ('&gt;', '>'), ('&amp;', '&'), ('&quot;', '"'),
    ('&#39;', ''''), ('A', 'Á'), ('a', 'á'), ('A', 'Â'), ('a', 'â'), ('A;', 'À'), ('a', 'à'), ('A', 'Å'), ('a', 'å'),
    ('A', 'Ã'), ('a', 'ã'), ('A', 'Ä'), ('a', 'ä'), ('&AElig;', 'Æ'), ('&aelig;', 'æ'), ('E', 'É'), ('e', 'é'),
    ('E', 'Ê'), ('e', 'ê'), ('E', 'È'), ('e', 'è'), ('E', 'Ë'), ('e', 'ë'), ('&ETH;', 'Ð'), ('&eth;', 'ð'), ('I', 'Í'),
    ('i', 'í'), ('I', 'Î'), ('i', 'î'), ('I', 'Ì'), ('i', 'ì'), ('I', 'Ï'), ('i', 'ï'), ('O', 'Ó'), ('o', 'ó'),
    ('O', 'Ô'), ('o', 'ô'), ('O', 'Ò'), ('o', 'ò'), ('&Oslash;', 'Ø'), ('o', 'ø'), ('O', 'Õ'), ('o', 'õ'), ('O', 'Ö'),
    ('o', 'ö'), ('U', 'Ú'), ('u', 'ú'), ('U', 'Û'), ('u', 'û'), ('U', 'Ù'), ('u', 'ù'), ('U', 'Ü'), ('u', 'ü'),
    ('C', 'Ç'), ('c', 'ç'), ('N', 'Ñ'), ('n', 'ñ'), ('&reg;', '®'), ('&copy;', '©'), ('Y', 'Ý'), ('y', 'ý'),
    ('&THORN;', 'Þ'), ('&thorn;', 'þ'), ('&szlig;', 'ß'), ('&deg;', '°'), ('&plusmn;', '±'), ('&sup1;', '¹'),
    ('&sup2;', '²'), ('&sup3;', '³'), ('', 'º'), ('&para;', '¶'));
var
  VNewText: string;
  I: Integer;
begin
  VNewText := VTexto;

  for I := 0 to 74 do
  begin
    if AoContrario then
      VNewText := StringReplace(VNewText, VChars[I, 1], VChars[I, 0], [RfReplaceAll])
    else
      VNewText := StringReplace(VNewText, VChars[I, 0], VChars[I, 1], [RfReplaceAll]);
  end;
  Result := VNewText
end;

function EIgual(S1, S2: string): Boolean;
begin
  Result := AnsiSameText(S1, S2);
end;

function RemoveCharInvalidos(VStr: WideString): WideString;
var
  Mensagem: WideString;
begin
  Mensagem := VStr;
  Mensagem := StringReplace(Mensagem, '&', '&amp;', [RfReplaceAll]);
  Mensagem := StringReplace(Mensagem, '<', '&lt;', [RfReplaceAll]);
  Mensagem := StringReplace(Mensagem, '>', '&gt;', [RfReplaceAll]);
  Mensagem := StringReplace(Mensagem, '"', '&quot;', [RfReplaceAll]);
  Mensagem := StringReplace(Mensagem, #39, '''', [RfReplaceAll]);
  Result := Mensagem;
end;

function ExisteAcento(VStr: WideString): Boolean;
const
  VAcentos = 'áéíóúàèìòùâêîôûäëïöüãõñçÁÉÍÓÚÀÈÌÒÙÂÊÎÔÛÄËÏÖÜÃÕÑÇ';
var
  I: Integer;
begin
  Result := False;
  for I := 1 to Length(VStr) do
    Result := (Pos(VStr[I], VAcentos) > 0);
end;

function RetornaCodUF(VUF: string): string;
begin
  Result := EmptyStr;
  // Ver Código do Estado na Tabela do IBGE
  if AnsiSameText(VUF, 'AC') then
    Result := '12';
  if AnsiSameText(VUF, 'AL') then
    Result := '27';
  if AnsiSameText(VUF, 'AP') then
    Result := '16';
  if AnsiSameText(VUF, 'AM') then
    Result := '13';
  if AnsiSameText(VUF, 'BA') then
    Result := '29';
  if AnsiSameText(VUF, 'CE') then
    Result := '23';
  if AnsiSameText(VUF, 'DF') then
    Result := '53';
  if AnsiSameText(VUF, 'ES') then
    Result := '32';
  if AnsiSameText(VUF, 'GO') then
    Result := '52';
  if AnsiSameText(VUF, 'MA') then
    Result := '21';
  if AnsiSameText(VUF, 'MT') then
    Result := '51';
  if AnsiSameText(VUF, 'MS') then
    Result := '50';
  if AnsiSameText(VUF, 'MG') then
    Result := '31';
  if AnsiSameText(VUF, 'PA') then
    Result := '15';
  if AnsiSameText(VUF, 'PB') then
    Result := '25';
  if AnsiSameText(VUF, 'PR') then
    Result := '41';
  if AnsiSameText(VUF, 'PE') then
    Result := '26';
  if AnsiSameText(VUF, 'PI') then
    Result := '22';
  if AnsiSameText(VUF, 'RJ') then
    Result := '33';
  if AnsiSameText(VUF, 'RN') then
    Result := '24';
  if AnsiSameText(VUF, 'RS') then
    Result := '43';
  if AnsiSameText(VUF, 'RO') then
    Result := '11';
  if AnsiSameText(VUF, 'RR') then
    Result := '14';
  if AnsiSameText(VUF, 'SC') then
    Result := '42';
  if AnsiSameText(VUF, 'SP') then
    Result := '35';
  if AnsiSameText(VUF, 'SE') then
    Result := '28';
  if AnsiSameText(VUF, 'TO') then
    Result := '17';

  if Empty(Result) or (Result = '00') then
    raise Exception.Create('UF Inválida. Impossível retornar o código');
end;

function Empty(VStr: string): Boolean;
begin
  Result := (Trim(VStr) = EmptyStr);
end;

function RemoveAcentos(Str: WideString): WideString;
const
  VAcentos = 'áéíóúàèìòùâêîôûäëïöüãõñçÁÉÍÓÚÀÈÌÒÙÂÊÎÔÛÄËÏÖÜÃÕÑÇ';
  VSemAcentos = 'aeiouaeiouaeiouaeiouaoncAEIOUAEIOUAEIOUAEIOUAONC';
var
  I: Integer;
  SStr: string;
begin
  for I := 1 to Length(Str) do
  begin
    if Pos(Str[I], VAcentos) > 0 then
      SStr := SStr + WideChar(VSemAcentos[Pos(Str[I], VAcentos)])
    else
      SStr := SStr + Str[I];
  end;
  SStr := StringReplace(SStr, #13#10, '', [RfReplaceAll]);
  Result := SStr;
end;

function ConverteData(Data: string): string;
var
  ADia, AMes, AAno: string;
begin
  Result := '';

  if Trim(Data) <> '' then
  begin
    if Length(Trim(Data)) <> 10 then
      raise Exception.Create('Erro na conversão de datas: data inválida');

    AAno := Copy(Data, 0, 4);
    try
      if Length(AAno) <> 4 then
        raise Exception.Create('Erro na conversão de datas: ano inválido');
      StrToInt(AAno);
    except
      on E: Exception do
        raise Exception.Create('Erro na conversão de datas: ano inválido');
    end;

    AMes := Copy(Data, 6, 2);
    try
      if Length(AMes) <> 2 then
        raise Exception.Create('Erro na conversão de datas: mês inválido');
      StrToInt(AMes);
    except
      on E: Exception do
        raise Exception.Create('Erro na conversão de datas: mês inválido');
    end;

    ADia := Copy(Data, 9, 2);
    try
      if Length(ADia) <> 2 then
      begin
        if Length(ADia) = 1 then
        begin
          if StrToInt(ADia) in [1, 2, 3, 4, 5, 6, 7, 8, 9] then
            ADia := '0' + ADia;
        end
        else
          raise Exception.Create('Erro na conversão de datas: dia inválido');
      end;
    except
      on E: Exception do
        raise Exception.Create('Erro na conversão de datas: dia inválido');
    end;

    Result := Format('%s/%s/%s', [ADia, AMes, AAno]);
  end;
end;

function BrowseDialog(const Title: string; const Flag: Integer): string;
var
  LpItemID: PItemIDList;
  BrowseInfo: TBrowseInfo;
  DisplayName: array [0 .. MAX_PATH] of Char;
  TempPath: array [0 .. MAX_PATH] of Char;
begin
  Result := '';
  FillChar(BrowseInfo, Sizeof(TBrowseInfo), #0);
  with BrowseInfo do
  begin
    HwndOwner := Application.Handle;
    PszDisplayName := @DisplayName;
    LpszTitle := PChar(Title);
    UlFlags := Flag;
  end;
  LpItemID := SHBrowseForFolder(BrowseInfo);
  if LpItemId <> nil then
  begin
    SHGetPathFromIDList(LpItemID, TempPath);
    Result := TempPath;
    GlobalFreePtr(LpItemID);
  end;
end;

function DigVerificador(AValor: string; ABase: Integer = 9; AResto: Boolean = False): string;
var
  _Soma: Integer;
  _Contador, _Peso, _Digito: Integer;
begin
  _Soma := 0;
  _Peso := 2;
  for _Contador := Length(AValor) downto 1 do
  begin
    _Soma := _Soma + (StrToInt(AValor[_Contador]) * _Peso);
    if _Peso < ABase then
      _Peso := _Peso + 1
    else
      _Peso := 2;
  end;

  if AResto then
    Result := IntToStr(_Soma mod 11)
  else
  begin
    _Digito := 11 - (_Soma mod 11);
    if (_Digito > 9) then
      _Digito := 0;
    Result := IntToStr(_Digito);
  end

end;

function GerarChave(ADtEmissao, AUF, ACNPJ, AModelo, ASerie, ANRNota, ACodigo: string): string;
var
  Agora_: TDateTime;
  Ano_, Mes_, Dia_: Word;
  Mes, Ano, DV: string;
begin
  Result := '';
  Agora_ := Now;
  DecodeDate(Agora_, Ano_, Mes_, Dia_);
  Mes := StrZero(IntToStr(Mes_), 2);
  Ano := Copy(IntToStr(Ano_), 3, 2);

  Mes := Copy(ADtEmissao, 6, 2);
  Ano := Copy(ADtEmissao, 3, 2);

  if Length(ADtEmissao) <> 10 then
    raise Exception.CreateFmt('%s Data de Emissão no Formato inválido. Utilizar YYYY-MM-DD', [ADtEmissao]);

  if (AUF = '') or (ACNPJ = '') or (AModelo = '') or (ANRNota = '') or (ACodigo = '') then
    raise Exception.CreateFmt('Os Campos: Código da UF Emitente =  %s' + #13 + 'CNPJ do Emitente = %s ' + #13 +
        'Código do Modelo do Documento Fiscal = %s ' + #13 + 'Número da Nota Fiscal = %s' + #13 +
        'Código (controle do sistema) Nota Fiscal = %s' + #13 +
        'são campos obrigatórios para o cálculo do dígito verificador.', [AUF, ACNPJ, AModelo, ANRNota, ACodigo]);

  try
    StrToInt64(ACNPJ);
  except
    raise Exception.CreateFmt('O campo CNPJ: %s deve ser um número Inteiro', [ACNPJ]);
  end;

  DV := DigVerificador(StrZero(AUF, 2) + Ano + Mes + ACNPJ + AModelo + StrZero(ASerie, 3) + StrZero(ANRNota, 9)
      + StrZero(ACodigo, 9));
  // celso - permitir gerar id de nota com cpf (tamanho 11)
  Result := (StrZero(AUF, 2) + Ano + Mes + StrZero(ACNPJ, 14) + AModelo + StrZero(ASerie, 3) + StrZero(ANRNota, 9) + StrZero
      (ACodigo, 9)) + DV;
end;

function GerarChave(ADtEmissao, AUF, ACNPJ, AModelo, ASerie, ANRNota, ACodigo, ATpEmis: string): string;
var
  Agora_: TDateTime;
  Ano_, Mes_, Dia_: Word;
  IDNota, Mes, Ano, DV: string;
begin
  Result := '';
  Agora_ := Now;
  DecodeDate(Agora_, Ano_, Mes_, Dia_);
  Mes := StrZero(IntToStr(Mes_), 2);
  Ano := Copy(IntToStr(Ano_), 3, 2);

  Mes := Copy(ADtEmissao, 6, 2);
  Ano := Copy(ADtEmissao, 3, 2);

  if Length(ADtEmissao) <> 10 then
    raise Exception.CreateFmt('%s Data de Emissão no Formato inválido. Utilizar YYYY-MM-DD', [ADtEmissao]);

  if (AUF = '') or (ACNPJ = '') or (AModelo = '') or (ANRNota = '') or (ACodigo = '') then
    raise Exception.CreateFmt('Os Campos: Código da UF Emitente =  %s' + #13 + 'CNPJ do Emitente = %s ' + #13 +
        'Código do Modelo do Documento Fiscal = %s ' + #13 + 'Número da Nota Fiscal = %s' + #13 +
        'Código (controle do sistema) Nota Fiscal = %s' + #13 + 'Tipo Ambiente (1 ou 2) = %s' + #13 +
        'são campos obrigatórios para o cálculo do dígito verificador.', [AUF, ACNPJ, AModelo, ANRNota, ACodigo,
      ATpEmis]);
  (*
   try
   StrToInt64(aCNPJ);
   except
   raise Exception.CreateFmt('O campo CNPJ: %s deve ser um número Inteiro', [aCNPJ]);
   end;
   *)

  IDNota := StrZero(AUF, 2) + Ano + Mes + StrZero(ACNPJ, 14) + AModelo + StrZero(ASerie, 3) + StrZero(ANRNota, 9) + ATpEmis + StrZero
    (ACodigo, 8);

  DV := DigVerificador(IDNota);

  Result := IDNota + DV;
end;

function RemoveEspacosEntreTags(Str: WideString): WideString;
var
  CheckEspaco: Boolean;
  Cont: Integer;
begin
  CheckEspaco := False;
  Result := EmptyStr;
  Str := StringReplace(Str, #13#10, EmptyStr, [rfReplaceAll]);
  Str := StringReplace(Str, #13, EmptyStr, [rfReplaceAll]);
  Str := StringReplace(Str, #10, EmptyStr, [rfReplaceAll]);
  Str := StringReplace(Str, #9, EmptyStr, [rfReplaceAll]);
  for Cont := 1 to Length(Str) do
  begin
    CheckEspaco := CheckEspaco or (Str[Cont] = '>');
    if CheckEspaco and (Str[Cont] = #32) then
      Continue;
    Result := Result + Str[Cont];
    CheckEspaco := CheckEspaco and (Str[Cont + 1] = #32);
  end;
end;

function NfeObterNotaID(const aXml: WideString): string;
var
  _Posini: integer;
  aTag: WideString;
begin
  Result := '';
  aTag := '<infNFe Id="NFe';
  _Posini := POS(aTag, aXML);
  if (_Posini > 0) then
  begin
    inc(_PosIni, Length(aTag));
    Result := Copy(aXml, _Posini, 44);
  end;
end;

function ConvertString(const Valor: String): {$IFDEF D2009UP} AnsiString {$ELSE} String {$ENDIF};
begin
  {$IFDEF D2009UP}
  Result := AnsiString(Valor);
  {$ELSE}
  Result := Valor;
  {$ENDIF}
end;

function LimparTemplate(Template: String): String;
var
  vPosIni, vPosFim: integer;
  AText: string;
begin
  AText := Template;
  AText := StringReplace(AText, #13#10, EmptyStr, [rfReplaceAll]);
  AText := StringReplace(AText, #9, EmptyStr, [rfReplaceAll]);

  vPosIni := Pos('<%', AText);
  while (vPosIni > 0) do
  begin
    vPosFim := PosEx('%>', AText, vPosIni);
    if vPosFim > 0 then
    begin
      Delete(AText, vPosIni, vPosFim - vPosIni + 2);
      vPosIni := Pos('<%', AText);
    end
    else
      vPosIni := 0;
  end;
  Result := AText;
end;

procedure RecortarStr(const Index, Qtd: integer; var Origem: String; out Recort: String);
begin
  Recort := copy(Origem, Index, Qtd);
  Delete(Origem, Index, Qtd);
end;

procedure RecortarWStr(const Index, Qtd: integer; var Origem: WideString; out Recort: WideString);
begin
  Recort := Copy(Origem, Index, Qtd);
  Delete(Origem, Index, Qtd);
end;

end.