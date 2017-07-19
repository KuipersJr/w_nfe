gfix.exe -rollback all WHCI_NFE.FDB -user SYSDBA -pas masterkey 
gfix.exe -V -F WHCI_NFE.FDB -user SYSDBA -pas masterkey  
gfix.exe -m -i WHCI_NFE.FDB -user SYSDBA -pas masterkey  
gfix.exe -shut -force 0 WHCI_NFE.FDB -user SYSDBA -pas masterkey  
gbak.exe -g -b -l -v -t -user SYSDBA -pas masterkey WHCI_NFE.FDB WHCI_NFE.FBK
gbak.exe -user sysdba -pas masterkey -r -k -L -v -o -REP -MO read_write WHCI_NFE.FBK WHCI_NFE.FDB
gfix.exe -online WHCI_NFE.FDB -user SYSDBA -pas masterkey 
gfix.exe -sweep WHCI_NFE.FDB -user SYSDBA -pas masterkey
