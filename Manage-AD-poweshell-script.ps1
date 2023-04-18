//Generico
Import-Csv -Path C:\tmp\User.csv -Delimiter ";" |
foreach {New-ADUser -name $_.fullname -GivenName $_.firstname -Surname $_.lastname -DisplayName $_.fullname -Path "OU=USER,DC=ALLANCBS3,DC=LOCAL" -CannotChangePassword $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true -Enabled $true -SamAccountName $_.username -UserPrincipalName ($_.username +"@schwentek.local") -EmailAddress $_.email -AccountPassword (ConvertTo-SecureString $_.pwd -AsPlainText -Force

// Adiciona user a um grupo
Import-Csv -Path C:\temp\user.csv -Delimiter ";" -Encoding UTF8  | 
foreach { Add-ADGroupMember -Identity "Nome do Grupo AD" -Members $_.username}

//Determina o grupo como primary : precisa localizar a ID do grupo
Import-Csv -Path C:\temp\user.csv -Delimiter ";" -Encoding UTF8  |
foreach {Set-ADUser -Identity $_.username -Replace @{PrimaryGroupID=8851}}

//Remove o grupo do usuario
Import-Csv -Path C:\temp\user.csv -Delimiter ";" -Encoding UTF8  | 
foreach { Remove-ADGroupMember -Identity "Domain Users" -Members $_.username -Confirm:$false}
