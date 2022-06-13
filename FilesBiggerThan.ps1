$dir = "C:\Users\All Users\Documents"

Get-ChildItem -Path $dir -File | `
Where-Object -Property Length -gt 900KB | `
Sort-Object -Property Length -Descending | `
Select-Object Name, Length
