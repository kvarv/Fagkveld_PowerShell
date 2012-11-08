a change
#Help og discovery

help #vise help

help *service* #Finn alle commands som starter med service

help about* #powershell har hjelpefiler som startert med about_

help *reboot* #help søker også etter ord i hjelpeteksten 

help start-service

help start-service -examples

#Aliases
Get-Alias

Get-Alias -Definition Get-Content

#variabler
$a = "variable"
$a
$isTrue = $True
$isTrue

#working with strings
$a = "world"

"hello $a"

'hello $a'

"hello '$a'"

#arrays
$colors = @("blue","green")

#hashtables
$country_codes = @{norway = "no"; sweden = "se"}

$country_codes

#pipes
"hello world" | set-content hello_world.txt

notepad .\hello_world.txt

Get-Service | get-member

Get-Service -DisplayName *teamcity* | ForEach-Object $_.Stop
Get-Service -DisplayName *teamcity* | Stop-Service

#functions
function Say-Hello($text){Write-Output $text}
Say-Hello "hello!"

#running scripts
.\say_hello.ps1

#error handling
.\failing_script.ps1

$ErrorActionPreference = "SilentlyContinue"

.\failing_script.ps1

$ErrorActionPreference = "Stop" #stopper videre eksekvering, sett til denne for å få TeamCity til å feile.

.\failing_script.ps1

#dot sourcing
 . .\say_hello_function.ps1

#modules C:\Users\[user]\Documents\WindowsPowerShell\Modules
get-module -listavailable

$env:psmodulepath

import-module webadministration

get-command -module webadministration

import-module psget

get-command -module psget

#profile
$profile

test-path $profile

$profile | get-member -MemberType noteproperty

notepad $profile

osv.
new-item -path $profile -itemtype file -force

# PSDrives and generic commands
new-item "test.txt" -type file  # why not new-file?
New-PSDrive -name x -psprovider Registry -root HKCU:\Console\
set-location x
get-childitem
dir
new-item "test"  # more generic so we can use same commands for different providers
get-childitem

# -WhatIf
get-service | stop-service -WhatIf # :|

# Select-Object
Get-Process | Select-Object name,id # Trim down an object
Get-Process | Select-Object name,id | gm # Se the "trimmed down object"...
Get-Process | Select -First 3 # using alias Select and only choosing first three in list
Get-Process | Select @{Name="ProcessNameAndId";Expression={$_."Name" + $_."Id"}} # Trim down object and redefine fields (for example to be able to pass it to another CmdLet which accepts parameter by name)

# Output and Formatting
Get-Process  # Really Get-Process | Out-Default -> Get-Process | Out-Host

cd $pshome

Get-WmiObject Win32_OperatingSystem | GM # See all the members

notepad dotnettypes.format.ps1xml # Rule 1: Search for Process. NOTE! Digitally signed

Get-WmiObject Win32_OperatingSystem  # search for Win32_OperatingSystem in dotnettypes.

notepad types.ps1xml # Rule 2: Search for Win32_OperatingSystem. NOTE! Digitally signed

Get-WmiObject Win32_NTEventlogFile # Rule 3: Table for 4 objects or less (unless View) List otherwise

Get-WmiObject Win32_OperatingSystem | Format-Table -AutoSize

Get-Service | FL

# Comparison

5 -eq 5

"hello" -eq "help"

"Hello" -eq "hello" # Case insensitive

"Hello" -ceq "hello" # Case sensitive

"Hello" -like "*ll*" # -clike

(5 -gt 10) -and (10 -lt 100)
# etc... Don't ask!

# Filtering
Get-Service | Where-Object -Filter { $_.Status -eq 'Running' }

gsv | Where { $_.Status -eq 'Running' }

# Remoting
Enable-PSRemoting # Remoting must be enabled on computers that receive incoming commands

Enter-PSSession -ComputerName localhost # 1 to 1 remoting
Get-Process | Select -First 3 # Run any command on "remote computer"
Exit-PSSession

#andre ting
