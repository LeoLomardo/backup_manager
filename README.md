# Gerenciador de Backup de Arquivos com Shell Script

## Objetivo

Desenvolver uma ferramenta para gerenciamento de backup de arquivos utilizando Shell script, preferencialmente bash.

## Implementação

Este script implementa um menu com as seguintes opções para gerenciar backups de arquivos:

### Opções do Menu

1. **Selecionar um diretório**
2. **Listar o conteúdo do diretório atual**
3. **Fazer backup incremental do diretório atual**
4. **Fazer backup total do diretório atual**
5. **Restaurar backup para o diretório atual**
6. **Sair**

### Detalhes das Funções

#### Selecionar um diretório

O script deve mostrar o nome completo do diretório atual e listar seus subdiretórios. O usuário pode escolher um subdiretório, subir um nível ou permanecer no diretório atual. Este processo continua até que o usuário decida permanecer no diretório atual, que será usado como origem do backup.

#### Listar o conteúdo do diretório atual

O programa lista o conteúdo do diretório atual, apresentando primeiro os subdiretórios e, em seguida, os outros arquivos, mostrando apenas os nomes.

#### Fazer backup incremental do diretório atual

Permite ao usuário selecionar o diretório destino navegando pelos diretórios. Após a seleção, o script mostra os nomes completos dos diretórios atual e destino e solicita confirmação antes de proceder com o backup incremental, que copia apenas os arquivos mais recentes ou que não existem no backup atual.

#### Fazer backup total do diretório atual

Funciona de forma semelhante ao backup incremental, mas, após a seleção do diretório destino, realiza a cópia de todos os arquivos para o backup.

#### Restaurar backup para o diretório atual

Permite ao usuário selecionar o diretório de onde o backup será restaurado. Após a seleção, o script mostra os nomes dos diretórios atual e do backup e pede confirmação antes de restaurar o backup.

#### Sair

O script pede confirmação de término e termina a execução, se confirmado.

## Uso

```
$ chmod +x backupMan.sh
$ .\backupMan.sh
```
