cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -rollback all C:\db_empr_nfe\popkrok\WHCI_NFE.FDB -user SYSDBA -pas masterkey  > logBkp_etapa01_20131003.txt
cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -V -F C:\db_empr_nfe\popkrok\WHCI_NFE.FDB -user SYSDBA -pas masterkey  > logBkp_etapa02_20131003.txt
cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -m -i C:\db_empr_nfe\popkrok\WHCI_NFE.FDB -user SYSDBA -pas masterkey  > logBkp_etapa03_20131003.txt
cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -shut -force 0 C:\db_empr_nfe\popkrok\WHCI_NFE.FDB -user SYSDBA -pas masterkey  > logBkp_etapa04_20131003.txt
cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" -g -b -l -v -t  -user SYSDBA -pas masterkey C:\db_empr_nfe\popkrok\WHCI_NFE.FDB \WHCI_NFE.FDB_201310031555.FBK > logBkp_etapa05_20131003.txt
cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gbak.exe" -user sysdba -pas masterkey -r -k -L -v -o -REP -MO read_write  \WHCI_NFE.FDB_201310031555.FBK C:\db_empr_nfe\popkrok\WHCI_NFE.FDB> logBkp_etapa06_20131003.txt
cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -online C:\db_empr_nfe\popkrok\WHCI_NFE.FDB -user SYSDBA -pas masterkey > logBkp_etapa07_20131003.txt
cmd /c "C:\Program Files\Firebird\Firebird_2_5\bin\gfix.exe" -sweep C:\db_empr_nfe\popkrok\WHCI_NFE.FDB -user SYSDBA -pas masterkey > logBkp_etapa08_20131003.txt
