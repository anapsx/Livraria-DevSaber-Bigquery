Perfeito, segue o README em **Markdown** formatado e **sem emojis**:

```markdown
# Mini Projeto – Pipeline de Dados e Análise com SQL no BigQuery  

## 1. Introdução – A Missão da Livraria DevSaber  

A Livraria DevSaber, uma loja online em expansão, iniciou suas operações registrando vendas em planilhas simples.  
Para sustentar o crescimento e embasar decisões estratégicas, tornou-se necessário evoluir para uma arquitetura de dados mais robusta.  

A missão deste projeto foi transformar a planilha inicial em um mini data warehouse no Google BigQuery, construindo um pipeline completo que contemplasse:  

- Criação da estrutura de armazenamento  
- Ingestão dos dados  
- Consultas analíticas e relatórios  

---

## 2. Modelagem e Estrutura de Armazenamento  

A modelagem segue o padrão de esquema estrela (star schema), com tabelas de dimensão e tabela fato.  

- Clientes: informações únicas de cada cliente  
- Produtos: informações únicas de cada produto  
- Vendas: fatos que relacionam clientes e produtos  

```

+------------------------+                      +------------------------+
\|        CLIENTES        |                      |        PRODUTOS        |
+------------------------+                      +------------------------+
\| PK ID\_Cliente          |                      | PK ID\_Produto          |
\| Nome\_Cliente           |                      | Nome\_Produto           |
\| Email\_Cliente          |                      | Categoria\_Produto      |
\| Estado\_Cliente         |                      | Preco\_Produto          |
+-----------+------------+                      +-----------+------------+
\|                                               |
\|                                               |
v                                               v
+-----------------------------------------------------------------------+
\|                               VENDAS                                  |
+-----------------------------------------------------------------------+
\| PK ID\_Venda                                                           |
\| FK ID\_Cliente  -----------------------> CLIENTES.ID\_Cliente           |
\| FK ID\_Produto  -----------------------> PRODUTOS.ID\_Produto           |
\| Data\_Venda                                                            |
\| Quantidade                                                            |
+-----------------------------------------------------------------------+

````

---

## 3. Ingestão de Dados  

Os dados foram carregados usando o comando `INSERT INTO`.  

### Exemplo – Inserção de Clientes  
```sql
INSERT INTO devsaber.clientes (ID_Cliente, Nome_Cliente, Email_Cliente, Estado_Cliente)
VALUES 
  (1, 'Maria Silva', 'maria@email.com', 'SP'),
  (2, 'João Santos', 'joao@email.com', 'RJ');
````

### Exemplo – Inserção de Produtos

```sql
INSERT INTO devsaber.produtos (ID_Produto, Nome_Produto, Categoria_Produto, Preco_Produto)
VALUES
  (101, 'Livro A', 'Ficção Científica', 59.90),
  (102, 'Livro B', 'Romance', 39.90);
```

### Exemplo – Inserção de Vendas

```sql
INSERT INTO devsaber.vendas (ID_Venda, ID_Cliente, ID_Produto, Data_Venda, Quantidade)
VALUES
  (1001, 1, 101, '2025-08-01', 2),
  (1002, 2, 102, '2025-08-03', 1);
```

---

## 4. Consultas Analíticas

Com SQL, foi possível responder a perguntas de negócio:

### Clientes de São Paulo

```sql
SELECT Nome_Cliente, Estado_Cliente
FROM devsaber.clientes
WHERE Estado_Cliente = 'SP';
```

### Produtos de Ficção Científica

```sql
SELECT Nome_Produto, Categoria_Produto
FROM devsaber.produtos
WHERE Categoria_Produto = 'Ficção Científica';
```

### Valor total de cada venda

```sql
SELECT v.ID_Venda,
       c.Nome_Cliente,
       p.Nome_Produto,
       v.Quantidade * p.Preco_Produto AS Valor_Total
FROM devsaber.vendas v
JOIN devsaber.clientes c ON v.ID_Cliente = c.ID_Cliente
JOIN devsaber.produtos p ON v.ID_Produto = p.ID_Produto;
```

### Produto mais vendido (em quantidade)

```sql
SELECT p.Nome_Produto,
       SUM(v.Quantidade) AS Total_Vendido
FROM devsaber.vendas v
JOIN devsaber.produtos p ON v.ID_Produto = p.ID_Produto
GROUP BY p.Nome_Produto
ORDER BY Total_Vendido DESC
LIMIT 1;
```

---

## 5. Automação com Views

Para simplificar análises recorrentes, foi criada a view `v_relatorio_vendas_detalhado`:

```sql
CREATE OR REPLACE VIEW devsaber.v_relatorio_vendas_detalhado AS
SELECT v.ID_Venda,
       c.Nome_Cliente,
       p.Nome_Produto,
       p.Preco_Produto,
       v.Quantidade,
       v.Quantidade * p.Preco_Produto AS Valor_Total,
       v.Data_Venda
FROM devsaber.vendas v
JOIN devsaber.clientes c ON v.ID_Cliente = c.ID_Cliente
JOIN devsaber.produtos p ON v.ID_Produto = p.ID_Produto;
```


