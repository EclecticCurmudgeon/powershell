<#
.Synopsis
Get physical network adapters
.Description
Display all physical adapters from the Win32_NetworkAdapter class.
.Parameter Computername
The name of the computer to check.
.Example
PS C:\> c:\scripts\Get-PhysicalAdapters -computer SERVER01
#>
[Cmdletbinding()]
param (
    [parameter(mandatory=$True)]
    [alias('host')]
    [string]$computername
)
write-verbose "getting network adapters on $computername"
Get-CimInstance win32_networkadapter -ComputerName localhost |
 where-object { $_.PhysicalAdapter } |
 select-object MACAddress,AdapterType,DeviceID,Name,Speed
write-verbose "finished gathering network info"