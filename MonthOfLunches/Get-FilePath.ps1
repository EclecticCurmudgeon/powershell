$filepath = 'C:\code\'
Get-ChildItem -path $filepath | Get-FileHash |
Sort-Object hash | Select-Object -first 10