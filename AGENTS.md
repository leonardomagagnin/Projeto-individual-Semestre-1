# AGENTS.md

## Visão geral

O projeto será um site com o tema Percy Jackson que, ao se cadastrar, o usuário será redirecionado para uma tela onde conseguirá realizar um quiz que o resultado indicará seu chalé de pertencimento. Além disso, também haverá uma tela de cadastro de novos chales com base em virtudes para estes também participarem dos resultados do quiz de semideus. Por fim, dados sobre o site como chalé com mais usuários, número de usuários cadastrados, assim como chalés cadastrados serão exibidos em uma dashboard.

## Tecnologias

Front-End: HTML, CSS e java Script
Banco de dados: MySQL
API com NodeJS para comunicação do Front-End com o Banco de Dados
Máquina Virtual Linux Lubuntu armazenando o banco de dados: MySQL
Chart.js para a criação de gŕaficos.

## Comandos

npm start: utilizar no terminal para iniciar a aplicação.
Ctrl+C: utilizar no terminal para interromper a execução da aplicação.

Para subir no GitHub:
git pull: atualizar a cópia local com as alterações do repositório remoto, quando necessário.
git status: verificar o estado atual dos arquivos e identificar alterações pendentes.
git add .: preparar as alterações para o próximo commit. Antes de executar, verificar quais arquivos serão incluídos.
git commit -m "": utilizado para nomear a alteração.
git push: utilizar para subir a alteração adicionada e nomeada nos comandos anteriores.

## Arquitetura
O projeto estará em um diretório principal nomeado "ProjetoPI", dentro dele haverão outros diretórios com as seguintes nomenclaturas e funcionalidades:

- assets/: esse diretório será responsável por armazenar todas as imagens e ícones utilizados durante o projeto;

- styles/: esse diretório será responsável por armazenar todos os arquivos de estilização utilizados no projeto;

- home/: esse diretório será responsável por armazenar as páginas HTML como home, cadastro e login;

- dashboard/: esse diretório armazenará as páginas de dashboard e home APÓS efetuado o login;

- js/: esse diretório armazenará os arquivos JavaScript utilizados no site

- src/: esse diretório armazenará os diretórios controllers, database, models e routs, responsáveis por definir o caminho que a API fará dentro do site.

Dessa forma, você deve levar em conta as funcionaldiades de cada diretŕoio antes de criar um novo arquivo, avaliando se o mesmo se encaixa no lugar em que você está fazendo.

## Padrões de desenvolvimento

- Utilizar nomes claros para arquivos, funções e váriaveis.
- Utilizar a convençaõ de commits com os prefixos feat, fix, refactor e style, conforme o tipo de alteração feita.
- Manter a formatação e a organização já adotadas no projeto.
- Evitar duplicação desnecessária de código.
- Implementar alterações de maneira objetiva, preservando as funcionalidades existentes.

## Cuidados e restrições

- Não apagar arquivos;
- Não alterar as configurações do banco de dados sem meu consentimento;
- Não expor senhas, tokens ou outras credenciais;
- Não utilizar quaisquer tecnologias que não sejam as especificadas;

## Regra geral: 
Antes de implementar uma alteração, siga as tecnologias, arquitetura, convenções e restrições descritas neste documento. Caso alguma informação esteja ausente, analise o código existente e siga os padrões já adotados no projeto.
