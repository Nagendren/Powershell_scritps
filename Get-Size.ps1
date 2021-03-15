function Get-Size{
param([string]$path)
"{0:n2}" -f ((gci -Path $path -Recurse | Measure-Object -Property length -Sum).sum /1Gb)
}

Get-Size "C:\Program Files"
