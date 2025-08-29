# Jogo de Vocabulário em Flutter

## Descrição
**Jogo de Vocabulário** é um aplicativo educativo desenvolvido em **Flutter** para treinar e aprender vocabulário em inglês de forma divertida e interativa. O usuário visualiza imagens e precisa selecionar o nome correto em inglês entre várias opções.

O jogo suporta:
- Categorias temáticas (Frutas, Roupas, Itens da casa, Geral)
- Quantidade de perguntas configurável
- Feedback imediato de acertos e erros
- Tela de pontuação final

---

## Funcionalidades
- **Seleção de categoria:** O usuário escolhe o tema do quiz, ou pode usar a categoria “Geral” que mistura todos os temas.  
- **Número de perguntas personalizável:** 5, 10 ou 15 perguntas por rodada.  
- **Feedback visual imediato:** Os botões ficam verdes ou vermelhos dependendo da resposta.  
- **Pontuação final:** Tela que mostra o total de acertos e permite voltar para a tela inicial.  
- **Banco de dados dinâmico:** Novas imagens e categorias podem ser adicionadas sem alterar a tela inicial.

---

## Estrutura do projeto
- `lib/main.dart` → Inicializa o aplicativo  
- `lib/pages/home_page.dart` → Tela inicial com seletores e botão “Começar”  
- `lib/pages/quiz_page.dart` → Tela principal do quiz  
- `lib/pages/result_page.dart` → Tela de resultados  
- `lib/models/item.dart` → Model de cada item do quiz (nome, imagem, categoria)  
- `lib/data/items.dart` → Banco de dados de imagens e categorias  
- `lib/widgets/option_button.dart` → Botão de opção customizado

---

## Tecnologias
- **Flutter**  
- **Dart**  
- **GitHub** para versionamento  

---

## Como executar
1. Clone o repositório:
```bash
git clone https://github.com/gellyorge/jogo_vocabulario.git


Entre na pasta do projeto:

cd jogo_vocabulario


Instale as dependências:

flutter pub get


Execute no seu dispositivo ou navegador:

flutter run

Ideias futuras

Adicionar níveis de dificuldade (Fácil, Médio, Difícil)

Implementar tempo limitado por pergunta

Salvar histórico de pontuação e progresso do usuário

Adicionar animações e efeitos sonoros

Criar ranking online para competição entre usuários

Desenvolvido por Gellyorge
Email: gellyorge23@gmail.com
GitHub: https://github.com/gellyorge