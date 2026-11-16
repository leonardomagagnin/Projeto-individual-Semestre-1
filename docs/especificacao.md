

## 1. Contexto

O sistema Acampamento Meio-Sangue tem como proposta transportar o universo da saga Percy Jackson e os Olimpianos para uma aplicação web interativa, na qual os usuários assumem o papel de semideuses e podem descobrir sua ascendência divina.

Nesse contexto, o Quiz de Reivindicação representa uma das principais funcionalidades do sistema. Por meio de uma sequência de perguntas relacionadas a comportamentos, escolhas e características pessoais, o usuário terá seu perfil analisado para identificar as virtudes predominantes e determinar qual divindade do Olimpo apresenta maior compatibilidade com suas respostas.

Atualmente, a estrutura e a lógica do questionário já estão desenvolvidas. Portanto, esta etapa do projeto será direcionada à estilização das interfaces, à integração dos elementos visuais e à apresentação dos resultados, seguindo a identidade visual estabelecida no protótipo do Figma.

## 2. Objetivo

Desenvolver a experiência visual e interativa do Quiz de Reivindicação, permitindo que o usuário responda às perguntas e descubra sua ascendência divina de maneira intuitiva e imersiva.

Ao concluir o questionário, o sistema deverá apresentar a divindade responsável por sua reivindicação, o respectivo chalé e uma representação visual das virtudes mais fortes identificadas durante as respostas.

O resultado esperado é proporcionar uma experiência coerente com o universo de Percy Jackson, tornando o processo de reivindicação mais envolvente e apresentando as informações de maneira clara e organizada.
## 3. Escopo

Dentro do escopo:

Estilização da tela de perguntas conforme o protótipo desenvolvido no Figma.

Apresentação do progresso do questionário, indicando a pergunta atual e a quantidade total de perguntas.

Organização visual das alternativas de resposta.

Implementação dos estados de seleção das alternativas.

Estilização dos botões de navegação entre as perguntas.

Aplicação da identidade visual do Acampamento Meio-Sangue.

Estilização da tela de resultado da reivindicação.

Exibição da divindade identificada e do respectivo número do chalé.

Apresentação das virtudes predominantes por meio de um gráfico.

Adaptação das interfaces para diferentes resoluções de tela.

Fora do escopo:

Desenvolvimento de um novo questionário, uma vez que sua estrutura já está definida.

Alteração dos critérios de associação entre respostas, virtudes e divindades, salvo a necessidade de correções durante os testes.

Implementação de novas funcionalidades administrativas relacionadas aos chalés.

Desenvolvimento de um sistema de inteligência artificial para interpretar respostas.

Implementação de funcionalidades sociais, como compartilhamento de resultados entre usuários.

## 4. Funcionalidades

Exibição das perguntas: apresentar as perguntas do questionário individualmente, acompanhadas de suas respectivas alternativas.

Seleção de respostas: permitir que o usuário selecione uma alternativa por pergunta, destacando visualmente a opção escolhida.

Navegação pelo questionário: permitir o avanço entre as perguntas por meio de um botão de próxima etapa, respeitando a sequência estabelecida.

Indicador de progresso: apresentar a posição atual do usuário no questionário, indicando o número da pergunta e o progresso total.

Validação das respostas: impedir o avanço para a próxima pergunta caso nenhuma alternativa tenha sido selecionada.

Processamento das respostas: utilizar as respostas fornecidas para identificar as virtudes predominantes do usuário e determinar a divindade correspondente.

Apresentação da reivindicação: exibir a divindade identificada, seu respectivo chalé e uma mensagem temática que represente o momento da reivindicação.

Visualização das virtudes: apresentar um gráfico que permita visualizar a intensidade das virtudes identificadas no perfil do usuário.

## 5. Regras de negócio

O questionário será composto por 15 perguntas.

Cada pergunta deverá apresentar três alternativas de resposta.

O usuário deverá selecionar obrigatoriamente uma alternativa antes de avançar.

Cada alternativa deverá estar associada a uma ou mais virtudes previamente definidas na lógica do questionário.

As respostas deverão ser utilizadas para calcular as virtudes predominantes do usuário.

A divindade responsável pela reivindicação deverá ser determinada com base na correspondência entre as virtudes identificadas e as características associadas a cada deus.

O resultado deverá apresentar apenas a divindade definida pelo processamento das respostas.

A tela de resultado deverá apresentar o nome da divindade, o número de seu chalé e as virtudes predominantes.

O gráfico deverá representar os valores calculados para as virtudes, sem apresentar esses valores como probabilidades de ascendência divina.

Caso o usuário ainda não tenha sido reivindicado, deverá permanecer identificado como semideus não reclamado até a conclusão do questionário.

## 6. Interface

A interface deverá seguir o protótipo desenvolvido no Figma, mantendo a identidade visual estabelecida para o projeto Acampamento Meio-Sangue.

Tela de perguntas:

Cabeçalho superior contendo uma saudação personalizada e a identificação do usuário.

Barra lateral de navegação com acesso às páginas Home, Oráculo, Chalés e Casa Grande.

Área principal contendo a identificação da pergunta atual e o indicador de progresso.

Alternativas organizadas em cartões individuais, com destaque visual para a opção selecionada.

Botão de próxima etapa posicionado na parte inferior da área de perguntas.

Tela de resultado:

Cabeçalho com a saudação personalizada e a identificação da divindade reivindicadora.

Mensagem temática anunciando a conclusão da reivindicação.

Imagem ilustrativa da divindade identificada.

Nome da divindade e número do respectivo chalé em destaque.

Descrição relacionada às características e virtudes da divindade.

Área destinada à apresentação das virtudes predominantes, utilizando um gráfico de visualização.

Identidade visual:

Predominância de azul-marinho e tons de dourado, seguindo a temática do Acampamento Meio-Sangue.

Utilização de tons claros, inspirados em pergaminhos, para os fundos das áreas principais.

Tipografia temática nos títulos e elementos de destaque, preservando a legibilidade dos textos.

Cartões com bordas arredondadas, sombras sutis e detalhes dourados.

Ícones e elementos gráficos relacionados à mitologia grega.

A interface deverá priorizar a clareza das informações, a facilidade de navegação e a continuidade visual entre as telas do questionário e do resultado.

## 7. Critérios de aceitação

O questionário deverá apresentar corretamente as 15 perguntas, cada uma com suas três alternativas.

O indicador de progresso deverá ser atualizado conforme o usuário avança no questionário.

O sistema deverá impedir o avanço quando nenhuma alternativa estiver selecionada.

A alternativa selecionada deverá apresentar um destaque visual perceptível.

O usuário deverá conseguir concluir o questionário sem erros de navegação.

O processamento das respostas deverá identificar corretamente as virtudes predominantes e a divindade correspondente, conforme as regras estabelecidas.

A tela de resultado deverá exibir corretamente a divindade, o número do chalé e as informações relacionadas às virtudes.

O gráfico deverá apresentar os valores calculados para as virtudes do usuário.

As interfaces deverão manter consistência com o protótipo do Figma e com a identidade visual do projeto.

Os elementos da interface deverão permanecer organizados e funcionais em diferentes resoluções de tela.

A navegação entre as páginas deverá funcionar corretamente, sem comprometer o fluxo de reivindicação.