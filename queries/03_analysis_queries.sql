-- 1. FATURAMENTO POR CATEGORIA
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

-- 2. TOP 5 PRODUTOS MAIS VENDIDOS
SELECT 
  p.Nome_Produto,
  p.Categoria_Produto,
  SUM(v.Quantidade) AS Total_Vendido,
  SUM(p.Preco_Produto * v.Quantidade) AS Faturamento
FROM `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` v
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` p 
  ON v.ID_Produto = p.ID_Produto
GROUP BY p.Nome_Produto, p.Categoria_Produto
ORDER BY Total_Vendido DESC
LIMIT 5;

-- 3. CLIENTES QUE MAIS GASTARAM (TOP 3)
SELECT 
  c.Nome_Cliente,
  c.Estado_Cliente,
  COUNT(v.ID_Venda) AS Total_Compras,
  SUM(p.Preco_Produto * v.Quantidade) AS Total_Gasto
FROM `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` v
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Clientes` c 
  ON v.ID_Cliente = c.ID_Cliente
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` p 
  ON v.ID_Produto = p.ID_Produto
GROUP BY c.Nome_Cliente, c.Estado_Cliente
ORDER BY Total_Gasto DESC
LIMIT 3;

-- 4. VENDAS POR MÊS
SELECT 
  FORMAT_DATE("%Y-%m", v.Data_Venda) AS Mes,
  COUNT(v.ID_Venda) AS Total_Vendas,
  SUM(v.Quantidade) AS Total_Itens_Vendidos,
  SUM(p.Preco_Produto * v.Quantidade) AS Faturamento
FROM `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` v
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` p 
  ON v.ID_Produto = p.ID_Produto
GROUP BY Mes
ORDER BY Mes;

-- 5. TICKET MÉDIO POR VENDA
SELECT 
  ROUND(AVG(p.Preco_Produto * v.Quantidade), 2) AS Ticket_Medio
FROM `sturdy-plateau-470323-c3.livraria_devsaber.Vendas` v
JOIN `sturdy-plateau-470323-c3.livraria_devsaber.Produtos` p 
  ON v.ID_Produto = p.ID_Produto;
