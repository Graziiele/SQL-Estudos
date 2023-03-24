![banner](http://www.keysys.com/wp-content/uploads/2015/12/Microsoft-Banner.png)



<h1> Conjunto de dados de demonstração de BI da Microsoft Contoso para o setor de varejo!</h1>


🟪 ***About:***    

O conjunto de dados Contoso BI Demo é usado para demonstrar as funcionalidades DW/BI em toda a família de produtos Microsoft Office. Este conjunto de dados inclui cenários C-level, vendas/marketing, TI e finanças comuns para o setor de varejo e integração de mapa de suporte. Além disso, esse conjunto de dados oferece grandes volumes de transações de OLTP e agregações bem estruturadas de OLAP, juntamente com dados de referência e dimensão.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
![image](https://user-images.githubusercontent.com/114547875/226966914-70bb8e28-7ea3-4569-9382-f05fd0f5e6a0.png)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 📋***Utiliandoo SQL SERVER Para Estudar Junção de Tabelas (JOIN):***  
 
``` SQL 
/* Utilizando o INNER JOIN para trazer os nomes das subcategorias dos produtos,
da tabela DimProductSubcategory para a tabela DimProduct 
*/

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
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

``` SQL 

/* Identifique uma coluna em comum entre as tabelas DimProductSubcategory e DimProductCategory.
Utilize essa coluna para complementar informações na tabela DimProductSubcategory apartir da DimProductCategory.
Utilize o LEFT JOIN.
*/

SELECT * FROM DimProductCategory
SELECT * FROM DimProductSubcategory

SELECT
	ProductSubcategoryKey AS 'ID SubCategoria',
	ProductSubcategoryName AS 'SubCategoria',
	ProductCategoryName AS 'Nome Categoria'
FROM
	DimProductSubcategory
LEFT JOIN DimProductCategory
ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey

```
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

``` SQL

/* Para cada loja da tabela DimStore, descubra qual o Continente e o Nome
do País associados (de acordo com DimGeography). 

Seu SELECT finaldeve conter apenas as seguintes colunas: StoreKey, StoreName,
EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT
JOIN neste exercício 
*/

SELECT * FROM DimStore
SELECT * FROM DimGeography

SELECT	
	DimStore.StoreKey AS 'ID Loja',
	StoreName AS 'Loja',
	DimStore.GeographyKey AS 'Qtd. Funcionários',
	EmployeeCount AS 'Continente',
	ContinentName AS 'País',
	RegionCountryName
FROM 
	DimStore
LEFT JOIN DimGeography
ON DimStore.GeographyKey = DimGeography.GeographyKey

```
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

``` SQL

/* Complementa a tabela DimProduct com a informação de
ProductCategoryDescription. Utilize o LEFT JOIN e retorne em seu
SELECT apenas as 2 colunas que considerar mais relevantes 

*/

SELECT * FROM DimProduct
SELECT * FROM DimProductCategory

SELECT
	ProductName,
	ProductCategoryDescription
FROM 
	DimProduct
LEFT JOIN DimProductSubCategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey 
lEFT JOIN DimProductCategory
	ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
	
```

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
