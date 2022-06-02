$name = Read-Host -Pormpt "...."
$lastname = Read-Host -Pormpt "...."
$OU = Read-Host -Pormpt "...."
$logon = $name.chars(0)

New-ADUser `
 -SamAccountName "$logon$lastname"  `
 -UserPrincipalName "$logon$lastname" `
 -Name "$name" `
 -DisplayName "$name $lastname" `
 -GivenName "$name" `
 -SurName "$lastname" `
 -Company "..." `
 -Department "..." `
 -EmailAddress "$logon$lastname@domain.com"  `
 -Description "..." `
 -Country "..." `
 -Path "OU=$OU,DC=CONTOSO,DC=local" `
 -AccountPassword (ConvertTo-SecureString "P@ssword" -AsPlainText -force) `
 -Enabled $True `
 -PasswordNeverExpires $False `
 -ChangePasswordAtLogon $True -PassThru
