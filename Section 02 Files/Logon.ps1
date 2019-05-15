<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2018 v5.5.152
	 Created on:   	06.06.2018
	 Created by:   	Anton Romanyuk
	 Filename:     	Logon.ps1
	===========================================================================
	.DESCRIPTION
		Applies standard user specific (HKCU) settings that have to be applied 
		after initial Windows Explorer start
#>

# Determine where to do the logging 
$logPath = $env:TEMP
$logFile = "$logPath\$($myInvocation.MyCommand).log"

# Create Log folder
$testPath = Test-Path $logPath
If (!$testPath)
{
	New-Item -ItemType Directory -Path $logPath
}

# Create Logfile
Write-Output "$ScriptName - Create Logfile" > $logFile

function Logit
{
	param
	(
		[Parameter(Mandatory = $true)]
		[string]$Message,
		[ValidateSet('1', '2', '3')]
		[string]$LogLevel = '1'
	)
	
	$TimeGenerated = "$(Get-Date -Format HH:mm:ss).$((Get-Date).Millisecond)+000"
	$Line = '<![LOG[{0}]LOG]!><time="{1}" date="{2}" component="{3}" context="" type="{4}" thread="" file="">'
	$LineFormat = $Message, $TimeGenerated, (Get-Date -Format MM-dd-yyyy), "$($MyInvocation.ScriptName | Split-Path -Leaf):$($MyInvocation.ScriptLineNumber)", $LogLevel
	#$LineFormat = $Message, $TimeGenerated, (Get-Date -Format MM-dd-yyyy), "$($MyInvocation.ScriptName | Split-Path -Leaf)", $LogLevel
	$Line = $Line -f $LineFormat
	Add-Content -Value $Line -Path $ScriptLogFilePath
}
# Start Main Code Here
$ScriptName = $MyInvocation.MyCommand.Name

. Logit "Setting Windows Explorer default 'Open To' behavior to 'This PC'"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -PropertyType DWORD -Value "1" -Force

# Show Computer shortcut on desktop
. Logit "Enabling 'Computer' icon..."
New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons' -Name 'NewStartPanel' -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -PropertyType DWORD -Value "0" -Force

# Show known file extensions in Explorer
. Logit "Enabling file extensions..."
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -PropertyType DWORD -Value "0" -Force

# Disable "Default Printer" Feature
. Logit "Disabling 'Default Printer' Feature"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows" -Name "LegacyDefaultPrinterMode" -PropertyType DWORD -Value "1" -Force

# Privacy settings.
. Logit "Disabling 'Send Microsoft info about how I write to help us improving typing and writing in the future' functionality..."
New-Item -Path 'HKCU:\SOFTWARE\Microsoft\Input' -Name 'TIPC' -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Input\TIPC" -Name "Enabled" -PropertyType DWORD -Value "0" -Force

. Logit "Adjusting feedback frequency. A value of 0 indicates that user is never prompted to provide feedback about Windows 10 functionality by Microsoft."
New-Item -Path 'HKCU:\Software\Microsoft\Siuf' -Name 'Rules' -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -PropertyType DWORD -Value "0" -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -PropertyType DWORD -Value "0" -Force