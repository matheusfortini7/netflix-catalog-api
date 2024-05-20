# README

Essa API permite realizar o cadastro e listagem de títulos da Netflix utilizando uma base CSV

## Endpoints

### 1. Cadastro de registros

- URL: '/movies'
- Método: POST
- Descrição: Esse endpoint realiza a leitura de um arquivo CSV e cadastra no banco de dados todos os registros do arquivo sem permitir duplicidade
- Parâmetros: É necessário um arquivo CSV na pasta do projeto com a estrutura do modelo para correto funcionamento

- Exemplo de requisição: curl -X POST http://dominio.com/movies
- Exemplo de sucesso: "{"status":"success"}"

### 2. Listagem de registros

- URL: '/movies'
- Método: GET
- Descrição: Esse endpoint retorna os registros que constam no BD. Caso nenhum parâmetro seja passado na URL será retornado por ordem de ano de lançamento dos títulos. Caso parâmetro seja fornecido então será ordenado de acordo com o parâmetro passado
- Exemplo de requisição: curl -X GET http://dominio.com/movies
- Exemplo de resposta de sucesso:
  [
    {
        "id": "840c7cfc-cd1f-4094-9651-688457d97fa4",
        "title": "13 Reasons Why",
        "genre": "TV Show",
        "year": "2020",
        "country": "United States",
        "published_at": "2020-05-07",
        "description": "A classmate receives a series of tapes that unravel the mystery of her tragic choice."
    }
  ]
  - Caso queira listar os títulos de acordo com um parâmetro específico da base CSV basta passar na URL conforme exemplo abaixo:
    - curl -X GET http://dominio.com/movies?search=parameter

### Configuração e execução

Pré-requisitos
- Ruby on Rails instalado
- Banco de dados configurado (MongoDB)

### Passo a passo

1. Clonar o repositório
2. Instale as dependências
  - bundle install
3. Configure o banco de dados
4. Execute o servidor
  - rails s
5. Teste os endpoints
  - Utilize curl para os testes
