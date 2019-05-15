<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2018 v5.5.155
	 Created on:   	11/3/2018 6:06 PM
	 Created by:   	J Ryan Wall
	 Organization: 	HECC OSD Workshop
	 Filename:     	Configure-Win10Optimizations.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

Function Logit
{
	param (
		[Parameter(Mandatory = $true)]
		[string]$Message,
		[Parameter()]
		[ValidateSet(1, 2, 3)]
		[string]$LogLevel = 1
	)
	
	$TimeGenerated = "$(Get-Date -Format HH:mm:ss).$((Get-Date).Millisecond)+000"
	$Line = '<![LOG[{0}]LOG]!><time="{1}" date="{2}" component="{3}" context="" type="{4}" thread="" file="">'
	$LineFormat = $Message, $TimeGenerated, (Get-Date -Format MM-dd-yyyy), "$($MyInvocation.ScriptName | Split-Path -Leaf):$($MyInvocation.ScriptLineNumber)", $LogLevel
	#$LineFormat = $Message, $TimeGenerated, (Get-Date -Format MM-dd-yyyy), "$($MyInvocation.ScriptName | Split-Path -Leaf)", $LogLevel
	$Line = $Line -f $LineFormat
	Add-Content -Value $Line -Path $ScriptLogFilePath
	
	if ($writetoscreen -eq $true)
	{
		switch ($LogLevel)
		{
			'1'{
				Write-Host $Message -ForegroundColor Gray
			}
			'2'{
				Write-Host $Message -ForegroundColor Yellow
			}
			'3'{
				Write-Host $Message -ForegroundColor Red
			}
			Default { }
		}
	}
	
	if ($writetolistbox -eq $true)
	{
		$result1.Items.Add("$Message")
	}
}

# Determine where to do the logging 
Try
{
	$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment
	$logPath = $tsenv.Value("LogPath")
}
Catch
{
	Write-Warning "TS environment not detected. Assuming stand-alone mode."
	$logPath = $env:TEMP
}

$logFile = "$logPath\$($myInvocation.MyCommand).log"

# Create Log folder
$testPath = Test-Path $logPath
If (!$testPath)
{
	New-Item -ItemType Directory -Path $logPath
}

# Create Logfile
Write-Output "$ScriptName - Create Logfile" > $logFile


<#

What needs changed
reg.exe load HKEY_LOCAL_MACHINE\defuser c:\users\default\ntuser.dat
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows Defender" /V UIFirstRun /T REG_DWORD /D 00000000 /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /V RotatingLockScreenOverlayEnabled /T REG_DWORD /D 00000000 /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V LaunchTo /T REG_DWORD /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /V TaskbarSmallIcons /T reg_dword /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /V ThisPCPolicy /T REG_SZ /D Hide /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag" /V ThisPCPolicy /T REG_SZ /D Hide /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag" /V ThisPCPolicy /T REG_SZ /D Hide /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /V {20D04FE0-3AEA-1069-A2D8-08002B30309D} /T REG_DWORD /D 0 /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /V SearchboxTaskbarMode /T REG_DWORD /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V ShowRunasDifferentuserinStart /T REG_DWORD /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V LockScreenImage /T REG_SZ /D C:\_Support\background\HCCSC_Wallpaper_Gray.jpg /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V LockScreenOverlaysDisabled /T reg_dword /D 1 /F
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /V NoChangingLockScreen /T reg_dword /D 1 /F
reg.exe unload HKEY_LOCAL_MACHINE\defuser


#>

<# 

Script


#>




# load default hive
Start-Process -FilePath "reg.exe" -ArgumentList "LOAD HKLM\DEFAULT C:\Users\Default\NTUSER.DAT"

# Disable Windows Defender First Run (Win 10)
New-ItemProperty -Path 'HKLM:\Default\Software\Microsoft\Windows Defender' -Name 'AllowTelemetry' -PropertyType DWORD -Value $TelemetryLevel -Force



# unload default hive
Start-Process -FilePath "reg.exe" -ArgumentList "UNLOAD HKLM\DEFAULT"


