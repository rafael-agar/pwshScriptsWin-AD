$users = Get-ADUser -Filter *
foreach ($i in $users) {
  if (-not $i.Enabled){
    "$($i.SamAccountName) is disabled."
  }
}
