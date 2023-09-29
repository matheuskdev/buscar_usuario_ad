#-------------------------------------------------------------------#
#
# Query AD
# Extrair a lista de usuários do Active Directory.
# Executar: 
# ./ad-lista.ps1
# Dev: Matheus Guilherme
#
#-------------------------------------------------------------------#

# Define a codificação para UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Define variáveis
$data = Get-Date -Format "dd/MM/yyyy" # Data no formato DIA/MÊS/ANO
$arquivoHTML = "mk_query-lista.html" # Arquivo gerado em HTML
$arquivoCSV = "mk_query-lista.csv" # Arquivo gerado em CSV
$dominio = (Get-ADDomain).Forest # Nome do Domínio

# Importa o módulo Active Directory
Import-Module ActiveDirectory

# Obtém informações dos usuários do Active Directory
$usuarios = @(Get-ADUser -Filter * -Properties Company, SamAccountName, Name, Mail, Department, Title, PasswordNeverExpires, Enabled, Created)

# Seleciona as propriedades desejadas e ordena pelo nome de usuário (Name) A-Z
$resultado = $usuarios | Select-Object Company, SamAccountName, Name, Mail, Department, Title, PasswordNeverExpires, Enabled, Created | Sort-Object "Name"

# Gera o arquivo HTML
$relatorioHTML = @"
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        table.table-users {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        table.table-users th {
            background-color: #333;
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 8px;
        }

        table.table-users td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        table.table-users tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table.table-users tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <h1>Relatorio de Usuarios do Active Directory</h1>
    <p>Data do Relatorio: <b>$data</b></p>
    <p>Total de Usuarios no Dominio: <span style="color:red;"><b> $($resultado.Count) </b></span></p>

    <table class='table-users'>
        <tr>
            <th>Empresa</th>
            <th>Nome de Usuário</th>
            <th>Nome</th>
            <th>E-mail</th>
            <th>Departamento</th>
            <th>Titulo</th>
            <th>Senha Expira</th>
            <th>Habilitado</th>
            <th>Data de Criacao</th>
        </tr>
        $($resultado | ForEach-Object {
            "<tr><td>$($_.Company)</td><td>$($_.SamAccountName)</td><td>$($_.Name)</td><td>$($_.Mail)</td><td>$($_.Department)</td><td>$($_.Title)</td><td>$($_.PasswordNeverExpires)</td><td>$($_.Enabled)</td><td>$($_.Created)</td></tr>"
        })
    </table>

</body>
</html>
"@

# Gera o arquivo HTML
$relatorioHTML | Out-File $arquivoHTML -Encoding Utf8

# Exporta os resultados para um arquivo CSV
$resultado | Export-Csv $arquivoCSV -NoTypeInformation -Encoding Utf8

Write-Host "Relatorio HTML gerado em: $arquivoHTML"
Write-Host "Relatorio CSV gerado em: $arquivoCSV"
