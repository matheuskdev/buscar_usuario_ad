Claro, aqui está um exemplo de um arquivo `README.md` que você pode usar para documentar o seu script PowerShell para o GitHub. Certifique-se de adaptar o conteúdo conforme necessário:

```markdown
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
   ./ad-lista.ps1
   ```

4. O script irá buscar informações de usuários no AD e gerar dois arquivos:
   - `ad-lista.html`: Um relatório em formato HTML que inclui informações dos usuários em uma tabela formatada.
   - `ad-lista.csv`: Um arquivo CSV contendo os dados dos usuários.

## Personalização

Você pode personalizar o script de acordo com suas necessidades, incluindo a seleção das propriedades de usuário que deseja buscar no AD e a formatação do relatório HTML.

## Contribuições

Contribuições são bem-vindas! Se você encontrar problemas ou tiver sugestões de melhorias, fique à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

**Aviso:** Este script foi desenvolvido apenas para fins de demonstração e pode requerer personalização para uso em ambientes de produção. Use-o com cuidado e responsabilidade.
```

Certifique-se de que a seção "Pré-requisitos" esteja atualizada com os requisitos necessários para executar o seu script. Adapte o conteúdo conforme necessário para refletir as características e finalidades do seu script específico.

Lembre-se de adicionar a licença apropriada ao seu repositório, caso ainda não tenha uma licença específica em uso. Você pode escolher uma licença adequada para o seu projeto e incluí-la no arquivo `LICENSE`.

Depois de criar o `README.md`, você pode fazer o commit e enviar o seu projeto para o GitHub. Certifique-se de seguir as práticas recomendadas para organização de repositórios e documentação para facilitar o uso e a contribuição por parte de outros desenvolvedores.
