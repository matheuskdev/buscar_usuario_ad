# Script PowerShell para Buscar Usuários no Active Directory

Este é um script PowerShell simples para buscar informações de usuários no Active Directory (AD) e gerar relatórios em HTML e CSV. O script utiliza o módulo Active Directory para realizar consultas no AD e gera relatórios formatados em HTML e CSV.

## Pré-requisitos

- PowerShell (versão 5.1 ou superior)
- Módulo Active Directory (importado usando `Import-Module ActiveDirectory`)
- Um ambiente de domínio do Active Directory

## Uso

1. Clone ou faça o download deste repositório.

2. Abra o PowerShell e navegue até o diretório onde o script está localizado.

3. Execute o script usando o seguinte comando:

   ```powershell
   ./QueryAD.ps1
   ```

4. O script irá buscar informações de usuários no AD e gerar dois arquivos:
   - `ad-lista.html`: Um relatório em formato HTML que inclui informações dos usuários em uma tabela formatada.
   - `ad-lista.csv`: Um arquivo CSV contendo os dados dos usuários.

## Personalização

Você pode personalizar o script de acordo com suas necessidades, incluindo a seleção das propriedades de usuário que deseja buscar no AD e a formatação do relatório HTML.

## Contribuições

Contribuições são bem-vindas! Se você encontrar problemas ou tiver sugestões de melhorias, fique à vontade para abrir uma issue ou enviar um pull request.

---

**Aviso:** Este script foi desenvolvido apenas para fins de demonstração e pode requerer personalização para uso em ambientes de produção. Use-o com cuidado e responsabilidade.
