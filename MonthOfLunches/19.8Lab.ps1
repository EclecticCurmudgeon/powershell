<#
.Synopsis
Get drives based on percentage free space
.Description
This command will get all local drives that have less than the specified 
➥ percentage of free space available.
.Parameter Computername
The name of the computer to check. The default is localhost.
.Parameter MinimumPercentFree
The minimum percent free diskspace. This is the threshold. The default value 
➥ is 10. Enter a number between 1 and 100.
.Example
PS C:\> Get-DiskSize -minimum 20
Find all disks on the local computer with less than 20% free space.
.Example
PS C:\> Get-DiskSize -Computername SRV02 -minimum 25
Find all local disks on SRV02 with less than 25% free space.
#>

param (
    $computername = "localhost",
    $drivetype = "3",
    $MinimumPercentFree = "10"
)
Get-CimInstance -computername $computername -classname Win32_LogicalDisk -filter "drivetype=$drivetype" |
Where-Object { ($_.FreeSpace / $_.Size) -lt $MinimumPercentFree } |
Select-Object -Property DeviceID,FreeSpace,Size