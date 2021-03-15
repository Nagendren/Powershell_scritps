$output = @() #initialzing empty array
$host_name = hostname
$jenkinsuser = "DESKTOP-25AB67V\jenkins"
$localuser = "DESKTOP-25AB67V\Nag"

$lag = Get-LocalGroupMember -Group Administrators
foreach($i in $lag){
if($i.Name -icontains $jenkinsuser){#check for individual user present
$output += $i.Name + " " + "present"
}
}

#check for mandatory user in Admin grp
$laggrp = Get-LocalGroupMember -Group Administrators | select -ExpandProperty Name

if($localuser -notin $laggrp){
$output += $i.Name + " " + "ADD"
}

$output

