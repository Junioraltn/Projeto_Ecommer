# 📚Projeto Lógico de 
Bem-vindo(a) ao _challenge_ que resolvi. Espero que lhe seja útil!
## Sobre o Desafio

### Descrição do Desafio
Replique a modelagem do projeto lógico de banco de dados para o cenário de e-commerce.
Fique atento:
- As definições de chave primária e estrangeira;
- As constraints presentes no cenário modelado.

### DIRETRIZES
- Não há um mínimo de queries a serem realizadas;
- Elabore perguntas que podem ser respondidas pelas consultas;
- O projeto deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto.
- Adicione ao Readme a descrição do projeto lógico para fornecer o contexto sobre seu esquema lógico apresentado.

### AÇÕES:
- Trate os relacionamentos presentes no modelo EER.
- Aplique o mapeamento de modelos aos refinamentos propostos no módulo de modelagem conceitual.
- Realize a criação do Script SQL para criação do esquema do banco de dados.
- Realize a persistência de dados para realização de testes.
- Especifique ainda queries mais complexas, com as cláusulas abaixo:
- Recuperações simples com SELECT Statement;
- Filtros com WHERE Statement;
- Crie expressões para gerar atributos derivados;
- Defina ordenações dos dados com ORDER BY;
- Condições de filtros aos grupos – HAVING Statement;
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados.

### OBJETIVO:
- “Refine o modelo apresentado acrescentando os seguintes pontos”
- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
- Entrega – Possui status e código de rastreio;
- Para embasar as queries SQL responda perguntas como:
- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos fornecedores e estoques;
- Relação de nomes dos fornecedores e nomes dos produtos;

### Requisitos:

#### Técnicos

|           |                      |
|-----------|----------------------|
| MySQL: | versão: 8.0 em diante |


## 🏁Sobre o Projeto

### 📝Descrição


### 🛠️Funcionalidades:
* **Pesquisa:** São feitas consultas ao banco de dados para responder algumas questões relevantes ao negocio, como a quantidade de pedidos pelo seu status. 
* **Relacionamentos:** Para representar relacionamentos n:m, foram criadas tabelas de junção cujos atributos são as chaves primárias das tabelas que possuem relacionamento entre si.

### 🛰️Tecnologias utilizadas:
* **MySQL Workbench:** Ferramenta visual para gerenciamento de banco de dados.
* **MySQL Shell:** Uma interface de linha de comando para se conectar e gerir instâncias do MySQL.

### 🏛️Estrutura do projeto:
O projeto está organizado da seguinte forma:

* **EER_Diagrama:** É o modelo de Entidade Relacionamento Estendido - EER.
* **Criar as Tabelas.sql:** É o script para criar o banco de dados.
* **QUERYs.sql:** É o script de consultas ao banco de dados.