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

#functions

#running scripts

#profile
$profile

notepad $profile

#modules C:\Users\[user]\Documents\WindowsPowerShell\Modules
get-module -listavailable

import-module webadministration

get-command -module webadministration

import-module psget

get-command -module psget

#error handling
get-content does_not_exist.txt

$ErrorActionPreference = "SilentlyContinue"

get-content does_not_exist.txt

$ErrorActionPreference = "Stop" #stopper videre eksekvering, sett til denne for å få TeamCity til å feile.

osv.

#andre ting