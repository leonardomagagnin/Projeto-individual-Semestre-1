# Plano de Implementação

Este documento define o plano para implementar a funcionalidade de páginas dinâmicas de chalés descrita em docs/especificacao.md (atualizado). Siga estritamente as instruções visuais de `chales-info.css` e use `texto-descricao.txt` como fonte única das informações dos 20 chalés — não inventar conteúdo.

Sumário rápido
- Objetivo: usar uma única página `chale-info.html` para exibir dinamicamente os dados dos 20 chalés via parâmetro `?id=` na URL.
- Local principal de implementação: front-end (JavaScript) — sem criar 20 páginas distintas.

1. Arquivos a criar ou alterar

1.1 Arquivos a criar
- js/chales-data.js — objeto `const chales = { ... }` com as 20 entradas preenchidas a partir de `texto-descricao.txt` (IDs como chaves numéricas). Cada entrada conterá: `nome`, `numero`, `frase`, `imagem`, `descricao`, `caracteristicas` (string ou array) e `semideuses` (array de {nome, descricao}).
- js/chale-info.js — script que roda em `chale-info.html`: recupera `id` da URL, busca `chales[id]`, popula DOM usando textContent e criação de elementos (não usar innerHTML para conteúdo do texto). Verifica caminhos de imagem antes de inserir e trata ID inválido.

1.2 Arquivos a alterar (integração mínima)
- chale-info.html — confirmar que os elementos com os IDs listados no especificação existem (ex.: `nomeDivindade`, `numeroChale`, `fraseChale`, `descricaoChale`, `semideusChale`, `.img-god`). Se necessário, adicionar elementos contêineres (ex.: `ul` para semideuses) preservando classes e IDs e sem modificar a identidade visual.
- chale.html — ajustar os links/ações dos cards para apontarem para `chale-info.html?id=<ID>` (se os cards atualmente não fazem isso). Preferir ajustar apenas os atributos `href` dos elementos já existentes ou adicionar `data-id` + listener que redireciona para a URL com o id.

1.3 Arquivos a não alterar
- chales-info.css — NÂO modificar; usar suas regras existentes. Novos elementos devem seguir a mesma nomenclatura e padrão visual.

2. Componentes e responsabilidades

- chales-data.js — fonte única de dados para o front-end. Deve ser fiel ao `texto-descricao.txt` (cada string copiada conforme arquivo). Comentários no arquivo podem indicar a origem (linha/trecho do txt) para rastreabilidade.
- chale-info.js — lógica UX e DOM:
  - parseQuery(): recuperar `id` da URL (Number).
  - validateId(id): checar se `chales[id]` existe; senão, tratar (ver seção Erros).
  - renderChale(chale): preencher elementos existentes: `textContent` para textos; criar nó(s) para `caracteristicas` e `semideuses` (lista `<ul>`/`<li>`), inserção de `img` em `.img-god` usando caminho verificado.
  - safeInsertText(node, text): wrapper que usa textContent.

3. Fluxo de interação (usuário)

1. Usuário vê `chale.html` com cards dos chalés.
2. Ao clicar em um card (ou link), navegador abre `chale-info.html?id=<ID>`.
3. `chale-info.html` carrega scripts na ordem: primeiro `js/chales-data.js`, depois `js/chale-info.js`.
4. `chale-info.js` lê `id`, valida e chama renderChale.
5. Página exibe: imagem, nome da divindade, número do chalé, frase, descrição, características e lista de semideuses com suas descrições.

4. Regras de negócio (implementação prática)

- Utilizar exatamente os 20 registros do `texto-descricao.txt` para preencher `chales`.
- Não criar páginas separadas por chalé.
- IDs usados no front devem corresponder aos IDs reais do banco (confirmar com a tabela se necessário). Caso haja discrepância, documentar antes de implementar.
- Cada chalé sempre terá: `nome`, `numero`, `descricao`. Alguns chalés (ex.: Hera, Ártemis) podem não ter filhos semideuses listados — tratar adequadamente (ex.: texto "Semideuses relacionados: nenhum cadastro conhecido").
- Exibir todos os semideuses listados no `texto-descricao.txt` para cada chalé.
- Não inserir HTML não confiável vindo do texto — usar textContent e criação de elementos para evitar XSS.

5. Decisões técnicas e justificativas

- Processamento: client-side (front-end) — motivo: tarefa é exclusivamente de apresentação; evita criar endpoints no backend e mantém a página estática reutilizável. Se no futuro for necessário persistir ou buscar dados do DB, migrar para endpoint REST (POST/GET) em src/.
- Estrutura de dados: objeto plano `chales` em js/chales-data.js para garantir carregamento simples e ordenado.
- Carregamento de scripts: chales-data.js deve ser importado antes de chale-info.js (ordem no HTML ou via `defer` e import statements). Risco se ordem invertida: `chales` undefined.
- Inserção no DOM: sempre via textContent e criação de elementos (createElement, appendChild). Evitar innerHTML.
- Imagens: não assumir caminhos; antes de definir `src` do `<img>`, verificar se arquivo existe no projeto (etapa de verificação manual) e manter fallback (imagem genérica ou ocultar bloco) se não existir.
- Estilização: não alterar chales-info.css. Novos elementos devem receber classes que respeitem o padrão da página (ex.: `.texto-semideus ul`, `.texto-semideus li`) para aproveitar estilos existentes.
- Acessibilidade: usar tags semânticas (ul/li para listas), atributos alt nas imagens (ex.: `alt="Imagem de <nome>"`).

6. Etapas numeradas com forma de validar cada uma

Etapa 0 — Pré-condições (investigação) (VALIDAR ANTES DE ALTERAR)
- Ação: localizar os arquivos atuais: `chale.html`, `chale-info.html`, `chales-info.css`, diretório de imagens (assets/images ou similar), e verificar se já existem scripts JS relacionados.
- Validação: listar caminhos e confirmar com `git status`/inspeção. Registrar discrepâncias.

Etapa 1 — Preparar fonte de dados (criação de js/chales-data.js)
- Ação: converter `texto-descricao.txt` em um objeto `chales` (do 1 ao 20). Usar exatamente os textos presentes; quebrar em campos conforme especificado.
- Validação: abrir o arquivo no console do navegador (ou node) e executar `Object.keys(chales).length === 20` e checar por `chales[1].nome`, `chales[1].semideuses.length` (se aplicável). Conferir amostra de 3 entradas.

Etapa 2 — Ajustar links dos cards em chale.html (se necessário)
- Ação: garantir que cada card leve a `chale-info.html?id=<ID>`. Implementar alteração apenas nos href/data-id existentes, sem recriar o layout.
- Validação: no navegador, clicar em 3 cards distintos e verificar URL correta com param `id`. Ex.: `chale-info.html?id=3`.

Etapa 3 — Preparar marcação mínima em chale-info.html (se necessário)
- Ação: confirmar que os IDs do DOM listados no documento de especificação existem; se faltar, adicionar containers neutros (divs/ul) com IDs/ classes novos mínimos exigidos (sem alterar CSS existente).
- Validação: carregar a página estática no browser e inspecionar pelo DevTools: os elementos com `id="nomeDivindade"`, `id="numeroChale"`, `id="fraseChale"`, `id="descricaoChale"`, `id="semideusChale"`, e `.img-god` existem.

Etapa 4 — Implementar e ligar js/chale-info.js
- Ação: implementar parseQuery, validateId, renderChale e handlers; assegurar que chales-data.js é carregado primeiro.
- Validação:
  - Caso válido: abrir `chale-info.html?id=1` → verificar que `nomeDivindade` mostra "Zeus" (exemplo), `numeroChale` mostra "Chalé 01" ou o número adequado, `fraseChale` mostra a frase, `descricaoChale` exibe o parágrafo correto.
  - Semideuses: verificar que a lista em `semideusChale` contém os nomes e descrições presentes em `texto-descricao.txt` para vários chalés (ex.: Percy em Poseidon).

Etapa 5 — Tratar imagens e fallback
- Ação: validar caminhos de imagem referenciados em chales-data.js; se imagem não existir, mostrar imagem de placeholder ou esconder `.img-god` respeitando layout.
- Validação: carregar páginas de 3 chalés diferentes; confirmar que a imagem aparece ou o fallback é exibido, sem quebrar layout.

Etapa 6 — Tratar ID inválido / erros
- Ação: se `id` ausente ou inválido, redirecionar (ou oferecer link) para `chale.html` com uma mensagem curta (ex.: "Chalé não encontrado. Você será redirecionado."). Preferência: redirecionamento suave após 3s ou botão imediato.
- Validação: acessar `chale-info.html?id=999` e `chale-info.html` (sem id) e verificar comportamento.

Etapa 7 — Testes funcionais e critérios de aceitação final
- Ação: executar checklist completo (itens baseados em especificação):
  - 15? (neste caso 20) chalés disponíveis via id 1..20.
  - Cada chalé mostra nome, número, frase, descrição, características e lista de semideuses conforme texto.
  - Avançar de chalé para chalé (alterar param id) atualiza conteúdo sem recarregar scripts (apenas reload da página é suficiente).
  - Estilos do `chales-info.css` mantidos.
- Validação: Manual. Testar amostras (IDs 1, 2, 3, 8, 13, 20). Confirmar textos correspondem CHAR POR CHAR ao `texto-descricao.txt`.

Etapa 8 — Documentação e entrega
- Ação: adicionar comentário no topo de `js/chales-data.js` apontando origem (`texto-descricao.txt`) e a data da conversão; atualizar README breve (ou comentário em docs) com instruções para verificação (`chale-info.html?id=...`).
- Validação: abrir README/docs e confirmar que instruções para testar existem.

7. Observações, riscos e recomendações

- O arquivo `texto-descricao.txt` deve ser a única fonte para textos descritivos. Se houver inconsistências entre o banco de dados e o TXT (números/IDs), confirmar antes de implementar.
- Dependência de imagens: confirme o diretório de imagens e padronize nomes (recomenda-se `chale-01-zeus.png` etc.).
- Manter a ordem de carregamento dos scripts: chales-data.js antes de chale-info.js. Preferir `defer` em scripts no HTML para evitar problemas de bloqueio.
- Evitar innerHTML para qualquer conteúdo vindo do TXT — use textContent e elementos DOM.
- Se for requerido suporte a internacionalização futura, manter chales-data.js em formato que permita extração (JSON separado) e não hardcode strings no próprio código funcional.

8. Checklist mínimo antes de finalizar implementação

1. chales-data.js contém 20 chaves (1..20) com campos corretos.
2. chale-info.js valida `id` e popula todos os elementos listados no spec.
3. As alterações no HTML são mínimas (apenas contêineres necessários) e não alteram `chales-info.css`.
4. Testes manuais de 6 chalés mostram textos idênticos ao `texto-descricao.txt`.
5. Caso de ID inválido redireciona para `chale.html` ou mostra mensagem clara.

---

Quando autorizar a implementação, posso converter `texto-descricao.txt` para `js/chales-data.js` (com fidelidade total ao conteúdo), criar `js/chale-info.js` e preparar as alterações de pequena escala em `chale.html` / `chale-info.html` seguindo este plano. Neste momento concluo apenas a fase de planejamento, sem alterar código.
