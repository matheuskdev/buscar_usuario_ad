#-------------------------------------------------------------------#
#
# Query AD
# Extrair a lista de usuários do Active Directory.
# Executar: 
# ./QueryAD.ps1
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

# Obtém informações dos usuários do Active Directory, incluindo a propriedade MemberOf
$usuarios = @(Get-ADUser -Filter * -Properties Company, SamAccountName, Name, Mail, Department, Title, PasswordNeverExpires, Enabled, Created, Description, Office, MemberOf)

# Seleciona as propriedades desejadas e ordena pela Empresa (Company) A-Z
$resultado = $usuarios | Select-Object Company, SamAccountName, Name, Mail, Department, Title, PasswordNeverExpires, Enabled, Created, Description, Office, @{Name='MemberOf';Expression={$_.MemberOf -join ','}} | Sort-Object "Company"

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
    <h1>Relatório de Usuários do Active Directory</h1>
    <p>Data do Relatório: $data</p>
    <p>Total de Usuários no Domínio: $($resultado.Count)</p>

    <table class='table-users'>
        <tr>
            <th>Nome de Usuário</th>
            <th>Nome Completo</th>
            <th>E-mail</th>
            <th>Descrição</th>
            <th>Escritório</th>
            <th>Empresa</th>
            <th>Departamento</th>
            <th>Cargo</th>
            <th>Habilitado</th>
            <th>Data de Criação</th>
            <th>Membro de</th>
        </tr>
            $($resultado | ForEach-Object {
                $memberOf = $_.MemberOf -split ','  # Separar os DNs em uma lista
                $ouNames = $memberOf | ForEach-Object {
                    $ou = ($_ -split '---', 2)[0]  # Extrair apenas o nome da primeira OU
                     $ou -replace '^CN=|OU=|DC=fmsa|DC=recife', ''   # Remover "CN=", "OU=", "DC=fmsa" ou "DC=recife" do início do nome
                }
                $ouNamesString = $ouNames -join ', '  # Juntar os nomes das OUs em uma única string

                "<tr>
                    <td>$($_.SamAccountName)</td>
                    <td>$($_.Name)</td>
                    <td>$($_.Mail)</td>
                    <td>$($_.Description)</td>
                    <td>$($_.Office)</td>
                    <td>$($_.Company)</td>
                    <td>$($_.Department)</td>
                    <td>$($_.Title)</td>
                    <td>$($_.Enabled)</td>
                    <td>$($_.Created)</td>
                    <td>$ouNamesString</td>
                </tr>"
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
