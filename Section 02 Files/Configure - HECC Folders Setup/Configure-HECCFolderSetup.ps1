<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2016 v5.2.119
	 Created on:   	4/24/2016 4:48 PM
	 Created by:   	J Ryan Wall
	 Organization: 	HCCSC
	 Filename:     	Configure-HCCSCFolderSetup
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>


function Create-TempDir
{
	
	$TempFolderDestination = 'C:\Temp'
	
	if (Test-Path $TempFolderDestination)
	{
		Write-Host "Folder already exists"
	}
	Else
	{
		New-Item -ItemType directory -Path $TempFolderDestination
		
	}
}


# Determine where to do the logging 
$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment
$logPath = $tsenv.Value("LogPath")
$logFile = "$logPath\$($myInvocation.MyCommand).log"

# Start the logging 
Start-Transcript $logFile
Write-Host "Logging to $logFile"

Create-TempDir

# Stop logging 
Stop-Transcript

