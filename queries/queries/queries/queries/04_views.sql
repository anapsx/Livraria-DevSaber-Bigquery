-- 1. VIEW: FATURAMENTO POR CATEGORIA
CREATE OR REPLACE VIEW `sturdy-plateau-470323-c3.livraria_devsaber.vw_faturamento_categoria` AS
SELECT 
  p.Categoria_Produto,
  COUNT(v.ID_Venda) AS Total_Vendas,
  SUM(v.Quantidade) AS Total_Itens_Vendidos,
  SUM(p.Preco_Produto * v.Quantidade) AS Faturamento_Total
FROM `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` v
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` p 
  ON v.ID_Produto = p.ID_Produto
GROUP BY p.Categoria_Produto
ORDER BY Faturamento_Total DESC;

-- 2. VIEW: CLIENTES DE SÃO PAULO (SP)
CREATE OR REPLACE VIEW `sturdy-plateau-470323-c3.livraria_devsaber.vw_clientes_sp` AS
SELECT 
  Nome_Cliente,
  Estado_Cliente
FROM `sturdy-plateau-470323-c3.livraria_devsaber.Clientes`
WHERE Estado_Cliente = 'SP';

-- 3. VIEW: VENDAS DETALHADAS (JOIN COMPLETO)
CREATE OR REPLACE VIEW `sturdy-plateau-470323-c3.livraria_devsaber.vw_vendas_detalhadas` AS
SELECT
  v.ID_Venda,
  c.Nome_Cliente,
  p.Nome_Produto,
  p.Categoria_Produto,
  v.Data_Venda,
  v.Quantidade,
  p.Preco_Produto,
  (p.Preco_Produto * v.Quantidade) AS Valor_Total
FROM `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` v
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Clientes` c ON v.ID_Cliente = c.ID_Cliente
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` p ON v.ID_Produto = p.ID_Produto;
