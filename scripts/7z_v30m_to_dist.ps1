param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path $_ -PathType Any})]
    [string]$file_path
)
$parent_dir = Split-Path -Parent $PSScriptRoot
$parent_name = Split-Path -Leaf $parent_dir
((Test-Path ..\dist) -eq $true) -or (mkdir ..\dist)
& 7z a -v30m "..\dist\$parent_name.7z" "$file_path"
Write-Host "package to $parent_dir\dist\$parent_name.7z" -ForegroundColor Green