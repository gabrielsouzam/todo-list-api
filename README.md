# TodoList - Back-End

## Descrição
O **TodoList Back-End** é a API que suporta o aplicativo de gerenciamento de tarefas **TodoList**. Desenvolvida em **Ruby on Rails**, a aplicação lida com autenticação de usuários, gerenciamento de listas de tarefas e armazenamento de dados. A arquitetura do back-end foi projetada para ser modular e fácil de manter, utilizando práticas como divisão em services e controllers.

## Ferramenta de organização 

- [Link para o trello](https://trello.com/b/T5HLHIam/todo-list)

## Decisões Técnicas
- **Framework:** Desenvolvido com **Ruby on Rails**, aproveitando sua rapidez no desenvolvimento e a escalabilidade para APIs RESTful.
- **Autenticação:** Implementada com **Devise** e complementada com **JWT (JSON Web Tokens)** para autenticação baseada em tokens.
- **Banco de Dados:** PostgreSQL foi utilizado como banco de dados relacional, garantindo alta performance e suporte a transações complexas.
- **Estrutura Modular:** O back-end adota uma arquitetura baseada em **services**, que desacopla a lógica de negócios dos controllers, promovendo um código limpo e de fácil manutenção.
- **Segurança:** Uso de CORS para controle de acesso e validação de tokens JWT para proteger os endpoints da API.

## Funcionalidades
- **Autenticação de Usuários:**
  - Cadastro de novos usuários com validação de email e senha.
  - Login seguro com retorno de um token JWT para autenticação.
  - Logout com invalidação de sessão.

- **Gerenciamento de Todo Lists:**
  - Criar, atualizar e excluir listas de tarefas.
  - Atribuir escopos (Trabalho, Estudo, etc.) e prioridades (Alta, Média, Baixa) às listas.
  - Filtro de listas por usuário autenticado.

- **Gerenciamento de Tarefas:**
  - Criar, editar e excluir tarefas dentro de uma lista.
  - Marcar tarefas como concluídas.
  - Consultar progresso da conclusão das tarefas em cada lista.

## Diferenciais
- **Arquitetura em Services:** Todas as operações de lógica de negócios, como criação e atualização de listas e tarefas, foram desacopladas dos controllers e implementadas em services. Isso facilita a manutenção e os testes.
- **Autenticação JWT:** Tokens de longa duração (7 dias) para autenticação segura, permitindo que o front-end acesse a API de forma simples e eficiente.
- **Validação de Dados:** Implementação de validações em nível de modelo e integração com o front-end para mensagens de erro claras.
- **Integração com PostgreSQL:** Uso de UUIDs para identificação única de registros e facilidade de integração em ambientes distribuídos.
- **Endpoints Protegidos:** Uso de middleware para garantir que somente usuários autenticados possam acessar determinados endpoints.

## Estrutura de Pastas
- **app/controllers:** Contém os controllers responsáveis por lidar com as requisições HTTP e delegar a lógica para os services.
- **app/services:** Implementa toda a lógica de negócios, garantindo separação de responsabilidades.
- **app/models:** Contém os modelos de dados e as validações.
- **config/initializers:** Configurações específicas para JWT, CORS, Devise e banco de dados.


## Exemplos de Endpoints
- **Autenticação:**
  - `POST /users/sign_in`: Login do usuário.
  - `POST /users`: Cadastro de novos usuários.
- **Todo Lists:**
  - `GET /todo_lists/:user_id`: Lista todas as todo lists do usuário autenticado.
  - `GET /todo_lists/:id`: Busca uma task por id.
  - `POST /todo_lists`: Cria uma nova todo list.
  - `UPDATE /todo_lists/:id`: Atualiza uma todo list existente.
  - `DELETE /todo_lists/:id`: Exclui uma todo list.
- **Tarefas:**
  - `GET /todo_lists/:todoListId/tasks`: Lista todas as tarefas de uma lista.
  - `POST /tasks`: Cria uma nova tarefa.
  - `UPDATE /tasks/:id`: Atualiza uma task existente.
  - `PATCH /tasks/:taskId/update_status`: Atualiza o status de uma task.
  - `DELETE /tasks/:id`: Exclui uma tarefa.

## Autores
- Gabriel Mendes


