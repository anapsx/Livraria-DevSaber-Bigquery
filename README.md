
# Mini Projeto – Pipeline de Dados e Análise com SQL no BigQuery

## 1. Introdução: A Missão da Livraria DevSaber

A Livraria DevSaber, uma nova loja online, começou registrando suas vendas em planilhas simples. Porém, para crescer e tomar decisões estratégicas, a empresa precisa de análises mais profundas e consistentes.

Nossa missão foi transformar essa planilha em um mini data warehouse no Google BigQuery, construindo todo o pipeline:

- Criação da estrutura
- Ingestão dos dados
- Consultas analíticas

---

## 2. Estruturando o Armazenamento – Modelagem de Dados

As tabelas foram criadas com `CREATE OR REPLACE TABLE`, seguindo uma modelagem em dimensões e fato:

- **Clientes**: informações únicas de cada cliente  
- **Produtos**: informações únicas de cada produto  
- **Vendas**: fatos que relacionam clientes e produtos  

```

erDiagram
    CLIENTES {
        int ID_Cliente PK
        string Nome_Cliente
        string Email_Cliente
        string Estado_Cliente
    }

    PRODUTOS {
        int ID_Produto PK
        string Nome_Produto
        string Categoria_Produto
        decimal Preco_Produto
    }

    VENDAS {
        int ID_Venda PK
        int ID_Cliente FK
        int ID_Produto FK
        date Data_Venda
        int Quantidade
    }

    CLIENTES ||--o{ VENDAS : "realiza"
    PRODUTOS ||--o{ VENDAS : "compõe"

---
````markdown
## 3. Ingerindo os Dados

Os dados foram carregados usando `INSERT INTO`.

- Clientes e Produtos foram inseridos sem duplicatas.  
- A tabela **Vendas** relaciona os IDs de clientes e produtos, garantindo consistência lógica.

---

## Modelo de Dados

```mermaid
erDiagram
    CLIENTES {
        int ID_Cliente PK
        string Nome_Cliente
        string Email_Cliente
        string Estado_Cliente
    }

    PRODUTOS {
        int ID_Produto PK
        string Nome_Produto
        string Categoria_Produto
        decimal Preco_Produto
    }

    VENDAS {
        int ID_Venda PK
        int ID_Cliente FK
        int ID_Produto FK
        date Data_Venda
        int Quantidade
    }

    CLIENTES ||--o{ VENDAS : "realiza"
    PRODUTOS ||--o{ VENDAS : "compõe"
````

---

## 4. Análise de Dados

Com consultas SQL, respondemos a perguntas de negócio como:

* Quais clientes são de **SP**?
* Quais produtos são da categoria **Ficção Científica**?
* Qual o valor total de cada venda?
* Qual o produto mais vendido em quantidade?

---

## 5. Automação e Reuso: VIEW

Criamos a view **`v_relatorio_vendas_detalhado`**, que simplifica consultas recorrentes trazendo:

* cliente
* produto
* preço
* quantidade
* valor total

Assim, relatórios podem ser gerados rapidamente sem repetir código SQL.

---

## 6. Conclusão

O projeto resultou em um **pipeline completo no BigQuery**:

* Criação de schema
* Ingestão de dados
* Análises com `SELECT` e `JOIN`
* Automação com `VIEW`



