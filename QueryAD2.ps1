# Importa o módulo Active Directory
Import-Module ActiveDirectory

# Obtém informações dos usuários do Active Directory, incluindo as propriedades desejadas e ordena por Name
$usuarios = Get-ADUser -Filter * -Properties Name, StreetAddress, Mail, Title, Department | Sort-Object Name

# Exporta os resultados para um arquivo CSV
$usuarios | Select-Object Name, StreetAddress, Mail, Title, Department | Export-Csv -Path "mk_query-lista2.csv" -NoTypeInformation -Encoding UTF8

Write-Host "Relatório CSV gerado em: mk_queryAD.csv"
