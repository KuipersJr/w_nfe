unit uDm_Princial;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Data.DBXFirebird, System.IniFiles, FindFile, Winapi.ShellAPI, Vcl.Forms,
  Winapi.Windows;

type
  Tdm_Princial = class(TDataModule)
    SQLConnect: TSQLConnection;
    qryGeral: TSQLQuery;
    qryAux: TSQLQuery;
    dspGeral: TDataSetProvider;
    dspAux: TDataSetProvider;
    cdsGeral: TClientDataSet;
    cdsAux: TClientDataSet;
    dsGeral: TDataSource;
    dsAux: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure FindFileFound(Sender: TObject; Folder: string; var FileInfo: TSearchRec);
  private
    procedure AbreConexao;
    { Private declarations }
  public
    { Public declarations }
   function LocalizaArquivo(nFile : String; var sPath : String) : Boolean;
   procedure GeraBkp(dbFile,PathBkp : String);
   procedure ExScriptSql; // PROCEDURE QUE EXECUTA SCRIPT SQL PARA ATUALIZAÇÃO DO BANCO DE DADOS
  end;

var
  dm_Princial: Tdm_Princial;
  vvPathFiles : String;
implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uFuncoes, uGlobalVar, uPrincipal;

{$R *.dfm}

{ Tdm_Princial }

procedure Tdm_Princial.AbreConexao;
var
   arqConf : TIniFile;
   sdbName,
   sUser,
   sPWS  : String;
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + INI_WCHI_CONF) then begin
    arqConf := TIniFile.Create(ExtractFilePath(ParamStr(0)) + INI_WCHI_CONF);
    sdbName := arqConf.ReadString('DB','Database','');
    sUser := arqConf.ReadString('DB','User','');
    sPWS := arqConf.ReadString('DB','PWS','');
    pathDB := sdbName;
    SQLConnect.Close;
    SQLConnect.Params.Clear;
    SQLConnect.Params.Add('DriverName=Firebird');
    SQLConnect.Params.Add('Database='+ {ExtractFilePath(ParamStr(0)) +} sdbName );
    SQLConnect.Params.Add('RoleName=RoleName');
    SQLConnect.Params.Add('User_Name='+ sUser );
    SQLConnect.Params.Add('Password='+ sPWS );
    SQLConnect.Params.Add('ServerCharSet=');
    SQLConnect.Params.Add('SQLDialect=3');
    SQLConnect.Params.Add('ErrorResourceFile=');
    SQLConnect.Params.Add('LocaleCode=0000');
    SQLConnect.Params.Add('BlobSize=-1');
    SQLConnect.Params.Add('CommitRetain=False');
    SQLConnect.Params.Add('WaitOnLocks=True');
    SQLConnect.Params.Add('IsolationLevel=ReadCommitted');
    SQLConnect.Params.Add('Trim Char=False');

    SQLConnect.Open;

  end;
end;

procedure Tdm_Princial.DataModuleCreate(Sender: TObject);
begin
  ExScriptSql;
  SQLConnect.Close;
  AbreConexao;
end;

procedure Tdm_Princial.ExScriptSql;
var
  vISql,
  sPath : String;
begin
  try
    if FileExists('Nfe_Script.sql') then begin
      StartWaint('VERIFICANDO ATUALIZAÇÕES' + #10#13 + 'Aguarde...');
      sPath := ExtractFilePath(ParamStr(0));
      if LocalizaArquivo('isql.exe',vISql) then
        vISql := vISql + '\isql.exe';
       ExecutaExe(vISql + ' -i Nfe_Script.sql');
       DeleteFile('Nfe_Script.sql');
    end;
  finally
    EndWaint;
  end;
end;

procedure Tdm_Princial.FindFileFound(Sender: TObject; Folder: string;
  var FileInfo: TSearchRec);
begin
  if Folder <> EmptyStr then begin
    vvPathFiles := Folder;
    TFindFile(Sender).Abort;
  end;
end;

procedure Tdm_Princial.GeraBkp(dbFile, PathBkp: String);
var
  strBat : TStringList;
  sGfix,
  sGak,
  sFile,
  FileBkp : String;
begin
  try
   //-----------------------------
   frmPrincipal.Timer_Monitor.Enabled := False;
   SQLConnect.Close;
   //-----------------------------
   strBat := TStringList.Create;
   if LocalizaArquivo('gfix.exe',sGfix) then
     sGfix := sGfix + '\gfix.exe';
   if LocalizaArquivo('gbak.exe',sGak) then
     sGak := sGak + '\gbak.exe';
   FileBkp := PathBkp + '\' + Copy(ExtractFileName(dbFile),1,Pos('.',dbFile)-1) +'_'+FormatDateTime('YYYYMMDDHHNN',Now) + '.FBK';
   if not FileExists(FileBkp) then begin
     StartWaint('Executando rotina de BackUp do Bando de Dados' + #10#13 + 'Aguarde...');
     sFile := ExtractFilePath(ParamStr(0))+'BKPFB.BAT';
     if (Trim(sGak) <> EmptyStr) and (Trim(sGfix) <> EmptyStr) then begin
       strBat.Add('cmd /c "' + sGfix + '" -rollback all '+ dbFile +' -user SYSDBA -pas masterkey ' + ' > logBkp_etapa01_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt');
       strBat.Add('cmd /c "' + sGfix + '" -V -F '+ dbFile +' -user SYSDBA -pas masterkey ' + ' > logBkp_etapa02_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt');
       strBat.Add('cmd /c "' + sGfix + '" -m -i '+ dbFile +' -user SYSDBA -pas masterkey ' + ' > logBkp_etapa03_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt'); //
       strBat.Add('cmd /c "' + sGfix + '" -shut -force 0 '+ dbFile +' -user SYSDBA -pas masterkey ' + ' > logBkp_etapa04_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt'); // da um shutdown no banco de dados
       strBat.Add('cmd /c "' + sGak + '" -g -b -l -v -t ' + ' -user SYSDBA -pas masterkey '+ dbFile + ' ' + FileBkp + ' > logBkp_etapa05_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt'); // gera o BackUp do banco de dados
       strBat.Add('cmd /c "' + sGak + '" -user sysdba -pas masterkey -r -k -L -v -o -REP -MO read_write  '+ FileBkp + ' ' + dbFile + '> logBkp_etapa06_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt'); // retaura o banco de dados
       strBat.Add('cmd /c "' + sGfix + '" -online ' + dbFile + ' -user SYSDBA -pas masterkey ' + '> logBkp_etapa07_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt'); // deixa o banco de dados online
       strBat.Add('cmd /c "' + sGfix + '" -sweep ' + dbFile + ' -user SYSDBA -pas masterkey ' + '> logBkp_etapa08_'+ FormatDateTime('YYYYMMDD',DATE) +'.txt'); // start garbage colletion
       strBat.SaveToFile(ExtractFilePath(ParamStr(0))+'BKPFB.BAT');
     end;
     if FileExists(sFile) then begin
       ShellExecute(Application.Handle,nil,PChar(sFile),nil,nil,SW_HIDE);
       Sleep(30000);
     end;
     EndWaint;
     msgInformation('BackUp efetuado com sucesso.','BackUp');
   end;
  finally
    FreeAndNil(strBat);
    AbreConexao;
    frmPrincipal.Timer_Monitor.Enabled := True;
  end;
end;

function Tdm_Princial.LocalizaArquivo(nFile: String;
  var sPath: String): Boolean;
var
  Find : TFindFile;
begin
 try
  try
    Find := TFindFile.Create(Application);
    Find.Subfolders := True;
    Find.Filename := nFile;
    Find.OnFound := FindFileFound;
    Find.Location := 'C:\';
    Find.Execute;
    sPath := vvPathFiles;
    Result := True;
  Except
    Result := False;
    FreeAndNil(Find);
  end;
 finally
   FreeAndNil(Find);
 end;
end;

end.
