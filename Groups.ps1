#NEW GROUP
New-ADGroup -Name myGroup -SamAccountName myGroup -GroupCategory Security -GroupScope Global -DisplayName myGroup -Path “OU=MYOU,DC=MYDOMAIN,DC=COM”

#ADD SOMEONE TO A GROUP
Add-ADGroupMember -Identity myGroup -Members USER1,USER2

