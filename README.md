# Livraria-DevSaber-Bigquery
Projeto de Pipeline de Dados da Livraria DevSaber no BigQuery


A Livraria DevSaber, uma nova loja online, começou registrando suas vendas em planilhas simples. Porém, para crescer e tomar decisões estratégicas, a empresa precisa de análises mais profundas e consistentes.

Nossa missão foi transformar essa planilha em um mini data warehouse no Google BigQuery, construindo todo o pipeline:

criação da estrutura,

ingestão dos dados,

e consultas analíticas.

2. Estruturando o Armazenamento – Modelagem de Dados

As tabelas foram criadas com CREATE OR REPLACE TABLE, seguindo uma modelagem em dimensões e fato:

Clientes: informações únicas de cada cliente.

Produtos: informações únicas de cada produto.

Vendas: fatos que relacionam clientes e produtos.

+------------------------+                      +------------------------+
|        CLIENTES        |                      |        PRODUTOS        |
+------------------------+                      +------------------------+
| PK ID_Cliente          |                      | PK ID_Produto          |
| Nome_Cliente           |                      | Nome_Produto           |
| Email_Cliente          |                      | Categoria_Produto      |
| Estado_Cliente         |                      | Preco_Produto          |
+-----------+------------+                      +-----------+------------+
            |                                               |
            |                                               |
            v                                               v
+-----------------------------------------------------------------------+
|                               VENDAS                                  |
+-----------------------------------------------------------------------+
| PK ID_Venda                                                           |
| FK ID_Cliente  -----------------------> CLIENTES.ID_Cliente           |
| FK ID_Produto  -----------------------> PRODUTOS.ID_Produto           |
| Data_Venda                                                            |
| Quantidade                                                            |
+-----------------------------------------------------------------------+

3. Ingerindo os Dados

Os dados foram carregados usando INSERT INTO.

Clientes e Produtos foram inseridos sem duplicatas.

A tabela Vendas relaciona os IDs de clientes e produtos, garantindo consistência lógica.

4. Análise de Dados

Com consultas SQL, respondemos a perguntas de negócio, como:

Quais clientes são de SP?

Quais produtos são da categoria Ficção Científica?

Qual o valor total de cada venda?

Qual o produto mais vendido em quantidade?

5. Automação e Reuso: VIEW

Criamos a view v_relatorio_vendas_detalhado, que simplifica consultas recorrentes trazendo:

cliente,

produto,

preço,

quantidade,

valor total.

Assim, relatórios podem ser gerados rapidamente sem repetir código SQL.

6. Conclusão

O projeto resultou em um pipeline completo no BigQuery:

Criação de schema,

Ingestão de dados,

Análises com SELECT e JOIN,

Automação com VIEW.

Toda a lógica foi documentada neste repositório com scripts SQL e este README.

⚠️ Observação: No BigQuery, as chaves são lógicas (não há enforcement automático). Os relacionamentos são aplicados nas consultas via JOIN.
