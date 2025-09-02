-- Inserir dados na tabela Clientes
INSERT INTO `sturdy-plateau-470323-c3.livraria_devsaber.Clientes` (ID_Cliente, Nome_Cliente, Estado_Cliente)
VALUES
  (1, 'Ana Silva', 'SP'),
  (2, 'Carlos Oliveira', 'RJ'),
  (3, 'Mariana Santos', 'SP'),
  (4, 'João Pereira', 'MG');

-- Inserir dados na tabela Produtos
INSERT INTO `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` (ID_Produto, Nome_Produto, Categoria_Produto, Preco_Produto)
VALUES
  (1, 'Fundamentos de SQL', 'Dados', 60.0),
  (2, 'Duna', 'Ficção Científica', 80.5),
  (3, 'Python para Dados', 'Programação', 75.0),
  (4, 'O Guia do Mochileiro das Galáxias', 'Ficção Científica', 42.0);

-- Inserir dados na tabela Vendas
INSERT INTO `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` (ID_Venda, ID_Cliente, ID_Produto, Data_Venda, Quantidade)
VALUES
  (1, 1, 1, '2024-01-15', 1),
  (2, 2, 2, '2024-01-18', 1),
  (3, 3, 3, '2024-02-02', 2),
  (4, 1, 2, '2024-02-10', 1),
  (5, 4, 1, '2024-02-20', 1),
  (6, 2, 4, '2024-03-05', 1);
