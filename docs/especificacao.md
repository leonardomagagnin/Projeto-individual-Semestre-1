Preciso implementar uma funcionalidade de páginas dinâmicas para os chalés do meu projeto individual, inspirado no universo de Percy Jackson.

### 1. Contexto atual do projeto

- `chale.html`: página que apresenta os ícones/cards dos 20 chalés.
- `chale-info.html`: página que apresenta as informações de um chalé específico.
- `chales-info.css`: arquivo CSS responsável pela estilização da página de informações dos chalés.
- `texto-descricao.txt`: arquivo que contém os textos dos deuses, descrições dos chalés, características e semideuses relacionados.

**Leia integralmente o arquivo `texto-descricao.txt` antes de implementar a funcionalidade.** Utilize seu conteúdo como fonte para preencher as informações dos 20 chalés. Não invente descrições, personagens ou informações que não estejam presentes no arquivo.

### 2. Objetivo

Quero utilizar uma única página `chale-info.html` para apresentar todos os 20 chalés, alterando seu conteúdo dinamicamente de acordo com o ID do chalé selecionado.

Quando o usuário clicar em um dos cards em `chale.html`, deverá ser redirecionado para `chale-info.html`, enviando o ID correspondente pela URL.

Exemplo: `chale-info.html?id=3`.

Na página de informações, o JavaScript deverá:

1. Recuperar o ID do chalé pelos parâmetros da URL.
2. Identificar o chalé correspondente.
3. Buscar suas informações em um objeto JavaScript chamado `chales`, organizado com o ID como chave principal.
4. Preencher os elementos HTML existentes com os dados correspondentes.

### 3. Estrutura dos dados

Crie um arquivo JavaScript separado para armazenar os dados dos chalés.

Utilize um objeto com o ID de cada chalé como chave, contendo as seguintes propriedades:

- `nome`: nome da divindade.
- `numero`: número do chalé.
- `frase`: frase de assinatura.
- `imagem`: caminho da imagem da divindade.
- `descricao`: contexto e descrição do chalé.
- `caracteristicas`: principais características dos filhos da divindade.
- `semideuses`: array de objetos contendo `nome` e `descricao` de cada personagem relacionado.

Exemplo conceitual:

`chales[1]` deverá conter as informações de Zeus, enquanto `chales[2]` deverá conter as informações de Hera.

### 4. Estrutura HTML existente

Atualmente, `chale-info.html` possui a seguinte estrutura:

```html
<div class="lado-direito">
    <div class="img-god"></div>
    <div class="texto-container">
        <div class="texto-chale">
            <h2 id="nomeDivindade"></h2>
            <h4 id="numeroChale"></h4>
            <p id="fraseChale"></p>
            <p id="descricaoChale"></p>
        </div>
        <div class="texto-semideus">
            <p id="semideusChale"></p>
        </div>
    </div>
</div>
```

Utilize essa estrutura como base. Caso seja necessário adicionar elementos para apresentar as características e vários semideuses, faça as adaptações preservando o layout existente.

### 5. Estilização — muito importante

O arquivo `chales-info.css` já possui a identidade visual e a estilização estabelecidas para essa página.

**Leia o arquivo `chales-info.css` e siga rigorosamente os padrões visuais já implementados.**

- Não crie uma identidade visual nova.
- Não substitua as cores, fontes ou espaçamentos existentes.
- Não altere desnecessariamente as classes e os seletores já definidos.
- Preserve a sidebar, o layout, os tamanhos e a organização visual.
- Caso precise criar novos elementos para os semideuses ou características, estilize-os seguindo o padrão visual já estabelecido no CSS.

### 6. Requisitos técnicos

- Não crie 20 páginas HTML diferentes.
- Não duplique a estrutura da página para cada chalé.
- Preserve funcionalidades existentes.
- Utilize os IDs reais dos chalés cadastrados no banco de dados, respeitando a correspondência entre cada divindade e seu registro.
- Verifique os caminhos das imagens existentes no projeto antes de utilizá-los.
- Apresente todos os semideuses relacionados ao chalé.
- Caso o ID recebido não corresponda a um chalé existente, apresente uma mensagem de erro adequada ou redirecione para `chale.html`.
- Garanta que os arquivos JavaScript sejam carregados na ordem correta.
- Prefira `textContent` e criação de elementos DOM para inserir os dados, evitando inserir conteúdo não confiável diretamente com `innerHTML`.

### 7. Antes de implementar

Analise a estrutura atual do projeto, especialmente:

- `chale.html`;
- `chale-info.html`;
- `chales-info.css`;
- arquivos JavaScript relacionados;
- `texto-descricao.txt`;
- tabela de chalés no banco de dados.

Verifique como os cards estão organizados e como seus IDs se relacionam com o banco de dados.

Implemente a funcionalidade respeitando os padrões de organização, nomenclatura e programação já utilizados no projeto.

**Não refaça o projeto. O objetivo é adicionar a funcionalidade dinâmica aproveitando ao máximo o código existente.**