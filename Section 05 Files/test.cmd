cls
del C:\MININT\SMSOSD\OSDLOGS\BDD.log /q
del C:\MININT\SMSOSD\OSDLOGS\variables.dat /q
cscript \\HCCSC-WDS-01\MDTProdLab$\Scripts\ZTIGather.wsf /inifile:\\HCCSC-WDS-01\MDTProdLab$\Control\CustomSettings.ini
\\HCCSC-WDS-01\MDTProdLab$\HCCSC\CMTrace.exe C:\MININT\SMSOSD\OSDLOGS\BDD.log
