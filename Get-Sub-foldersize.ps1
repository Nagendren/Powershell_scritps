#get specific sub folder size
function Get-Size{
param([string]$path)
"{0:n2}" -f ((gci -Path $path -Recurse | Measure-Object -Property length -Sum).sum /1Gb)
}

$folderlist = Get-ChildItem 'C:\Windows'

foreach($i in $folderlist){
    if($i.FullName -imatch 'assembly|debug'){
    $size = Get-Size $i.FullName
        if($size -gt 1){
            $foldername = $i.FullName.TrimEnd()
            Write-Output "$foldername total size is $size. Please review it"
            }
        }
    if($i.FullName -imatch 'System32'){
    $size = Get-Size $i.FullName
        if($size -gt 1){
            $foldername = $i.FullName.TrimEnd()
            Write-Output "$foldername total size is $size. Please review it"
            }
        }
}