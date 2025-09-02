-- Criação do dataset (execute primeiro)
CREATE SCHEMA IF NOT EXISTS `sturdy-plateau-470323-c3.livraria_devsaber`;

-- Tabela Clientes
CREATE OR REPLACE TABLE `sturdy-plateau-470323-c3.livraria_devsaber.Clientes` (
  ID_Cliente INT64,
  Nome_Cliente STRING,
  Estado_Cliente STRING
);

-- Tabela Produtos
CREATE OR REPLACE TABLE `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` (
  ID_Produto INT64,
  Nome_Produto STRING,
  Categoria_Produto STRING,
  Preco_Produto FLOAT64
);

-- Tabela Vendas
CREATE OR REPLACE TABLE `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` (
  ID_Venda INT64,
  ID_Cliente INT64,
  ID_Produto INT64,
  Data_Venda DATE,
  Quantidade INT64
);
