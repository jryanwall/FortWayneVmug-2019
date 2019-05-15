<#
 
************************************************************************************************************************
 
Created:    2017-06-26
Version:    1.0
 
Author:     Anton Romanyuk, Login Consultants Germany GmbH (C) 2016

Purpose:    Enable RDP
 
************************************************************************************************************************
 
#>

# Determine where to do the logging 
$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
$logPath = $tsenv.Value("LogPath") 
$logFile = "$logPath\$($myInvocation.MyCommand).log"
 
# Start the logging 
Start-Transcript $logFile
Write-Host "Logging to $logFile"
 
# Start Main Code Here

# Enable RDP
# -> GPO
Write-Host "Enabling RDP..."
$rdp = Get-WmiObject -Class Win32_TerminalServiceSetting -Namespace root\CIMV2\TerminalServices -Authentication PacketPrivacy
$tmp_rdp = $rdp.SetAllowTSConnections(1,1) #first parameter rdp enable, second parameter firewall ports config

If ($tmp_rdp.ReturnValue -eq 0){
	Write-Host "Remote Connection settings changed sucessfully"
} 
Else {
	Write-Host ("Failed to change Remote Connections setting(s), return code "+$tmp_rdp.ReturnValue)
}

# Stop logging 
Stop-Transcript