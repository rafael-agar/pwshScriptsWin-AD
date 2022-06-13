$dir = C:\Users\youruser\Pictures

Get-ChildItem -Path $dir -File | `
Where-Object -FilterScript {$_.Extension -eq ".jpg" -and $_.LastWriteTime -gt [datetime]::Today} | `
Select-Object Name, LastWriteTime, CreationTime, Length | `
Sort-Object LastWriteTime -Descending | `
ft -AutoSize
