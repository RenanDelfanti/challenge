# Challenge - Just popular movies

# Problema

- Uma aplicação para listar os filmes populares atualmente, com a possibilidade de ver detalhes do filme escolhido, como um breve resumo, porcentagem de popularidade entre os usuários e também os idiomas disponíveis. Também é possível visitar mais filmes clicando no último ícone do grid para que ele busque mais. Todos os dados são extraídos através das APIs do The Movie DB. A aplicação utiliza o framework Flutter para criar a interface.

# Solução
- O aplicativo segue os princípios da arquitetura limpa, com um pacote externo que separa as interfaces mais relevantes, que poderiam ser reutilizadas em um projeto maior com suas respectivas implementações. 
- Pacotes externos facilita a manutenção, a testabilidade e a escalabilidade do código, além de promover a separação de responsabilidades.

- Para consumo de apis, utilizei o Dio, porém com uma implementação totalmente simples para que seja possivel alterar o pacote que faz requisição.
- Gerencia de estado, utilizei o Cubit.
- Injeção de dependencia, utilizei o GetIt.
- Testes unitarios, utilizei o Mocktail.

- DEMO: ![](https://github.com/RenanDelfanti/just-movies/blob/demo.gif)

# TODOS: 
- Adicionar responsividade para telas maiores
- Segregar Core 
- Vantagens: Uma das vantagens de usar o Core como um pacote é que ele pode ser integrado em diferentes tipos de projetos, desde microfrontends até microapps. Isso permite que o Core seja reutilizado, mantido e atualizado de forma mais fácil e eficiente. Além disso, o Core pode oferecer uma implementação consistente e padronizada para os devs, independentemente do contexto em que ele é usado. 

- Finalizar cobertura de testes na parte do presenter.
- Adicionar esquema de translations, para que os textos não fique perdido por telas/widgets.

- Uma forma de otimizar o desempenho da aplicação seria implementar um mecanismo de cache que armazena os dados mais frequentes ou recentes da api em uma memória temporária. Assim, você evita o acúmulo desnecessário de chamadas na api, que podem sobrecarregar o servidor e aumentar o tempo de resposta. O cache também permite que o usuário acesse os dados mais rapidamente, pois eles já estão disponíveis na memória.

- Acrescentar E2E com integration_test