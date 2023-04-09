<#
.SYNOPSIS
    A short unnatended installation script for CheckPoint Harmony EndPoint Protection.
.DESCRIPTION
    Executes PsExec64.exe and EndpointSetup.exe silently. 
.NOTES
    This program has only been tested on a Windows x64 machine.  Please alter the variables on lines 14-15 to meet your needs, and run with the .ps1 elevated privileges.
    You need to manually inject or place the EndpointSetup.exe file from Harmoney into the users /Downloads folder, unless you have a file repository.
.LINK
    https://sc1.checkpoint.com/documents/Infinity_Portal/WebAdminGuides/EN/Harmony-Endpoint-Admin-Guide/Topics-HEP/Automatic-Deployment-of-Endpoint-Clients.htm?Highlight=psexec.exe
.EXAMPLE
    Start-Process $psExecLoc $endPointSetupLoc
#>


$adminUserName = "CatVideos"
$endPointSetupLoc = "C:\Users\$adminUserName\Downloads\endPointSetup.exe"
$psToolsURL = "https://download.sysinternals.com/files/PSTools.zip"
$extractLoc = "C:\Users\$adminUserName\Downloads\avTemp"
$psZipLoc = "$extractLoc\PSTools.zip"

# Create Directory
new-Item -Path $extractLoc -ItemType Directory

# Download the PsExec
Invoke-WebRequest -Uri $psToolsURL -Outfile $psZipLoc

# Extract zip
Expand-Archive -LiteralPath $psZipLoc -DestinationPath $extractLoc

# Install the CheckPoint Harmony Endpoint software.
$psExecLoc = "C:\Users\$adminUsername\Downloads\avTemp\PsExec.exe"

#$psExecParams = "-accepteula, -nobanner"

Start-Process $psExecLoc $endPointSetupLoc


# REFS
    # https://sc1.checkpoint.com/documents/Infinity_Portal/WebAdminGuides/EN/Harmony-Endpoint-Admin-Guide/Topics-HEP/Automatic-Deployment-of-Endpoint-Clients.htm?Highlight=psexec.exe
    # https://dotnet-helpers.com/powershell/how-to-extract-specific-files-from-zip-archive-using-powershell/
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/expand-archive?view=powershell-7.3
    # https://stackoverflow.com/questions/57947150/where-is-the-downloads-folder-located
