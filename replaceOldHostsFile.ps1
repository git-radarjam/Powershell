#########################################################################################################################
#                          Author: Jamaica Noriel (IT Operations Specialist - BPI)  2020-01-06                          #
#########################################################################################################################
################# If you get an Execution Policy error, open Powershell (w/ ADMINISTRATOR) and type the following: ######
#########################################################################################################################
###################################### RUN THE THING BELOW THIS!!!!!!!!!!!!!! ###########################################
#########################################################################################################################
#              PowerShell.exe -ExecutionPolicy Bypass -File $env:HOMEPATH\Desktop\replaceOldHostsFile.ps1               #
#########################################################################################################################

#Create a multiline variable that is the default hosts file
$defaultHostFile = "# Copyright (c) 1993-2006 Microsoft Corp.
#
# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.
#
# This file contains the mappings of IP addresses to host names. Each
# entry should be kept on an individual line. The IP address should
# be placed in the first column followed by the corresponding host name.
# The IP address and the host name should be separated by at least one
# space.
#
# Additionally, comments (such as these) may be inserted on individual
# lines or following the machine name denoted by a '#' symbol.
#
# For example:
#
#      102.54.94.97     rhino.acme.com          # source server
#       38.25.63.10     x.acme.com              # x client host
# localhost name resolution is handle within DNS itself.
#       127.0.0.1       localhost
#       ::1             localhost"

#The hosts file location we are writing to
$dir = "$env:SystemRoot\System32\drivers\etc\hosts"

#Write to the file
$defaultHostFile > $dir

$newHosts = Get-Content $dir

if ( Compare-Object $newHosts $defaultHostFile ){
    Write-Host "SUCCESS: Hosts file has been restored to default"
} else {
    Write-Host "ERROR: Hosts file was not restored to default"
}
Start-Sleep -s 5