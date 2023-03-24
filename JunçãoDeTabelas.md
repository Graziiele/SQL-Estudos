![banner](http://www.keysys.com/wp-content/uploads/2015/12/Microsoft-Banner.png)



<h1> Conjunto de dados de demonstração de BI da Microsoft Contoso para o setor de varejo!</h1>


🟪 ***About:***    

O conjunto de dados Contoso BI Demo é usado para demonstrar as funcionalidades DW/BI em toda a família de produtos Microsoft Office. Este conjunto de dados inclui cenários C-level, vendas/marketing, TI e finanças comuns para o setor de varejo e integração de mapa de suporte. Além disso, esse conjunto de dados oferece grandes volumes de transações de OLTP e agregações bem estruturadas de OLAP, juntamente com dados de referência e dimensão.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
![image](https://user-images.githubusercontent.com/114547875/226966914-70bb8e28-7ea3-4569-9382-f05fd0f5e6a0.png)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 📋***Utiliandoo SQL SERVER Para Estudar Junção de Tabelas (JOIN):***  
 
``` SQL 
-- Utilizando o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela DimProductSubcategory para a tabela DimProduct --

SELECT * FROM DimProduct
SELECT * FROM DimProductSubcategory

SELECT 
	DimProduct.ProductKey AS 'ID Produto',
	DimProduct.ProductName AS 'Produto',
	ProductSubcategoryName AS 'SubCategoria'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
ON DimProduct.ProductSubcategorykey = DimProductSubcategory.ProductSubcategoryKey

```
