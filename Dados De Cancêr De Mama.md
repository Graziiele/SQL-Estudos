![image](https://user-images.githubusercontent.com/114547875/227610957-61408547-ea9a-4964-b938-6c8f84c37298.png)





# Dados de Câncer de Mama

🟪 ***Sobre:*** 

O objetivo é limpar e transformar os dados através de categorização, codificação e binarização e então gerar um novo dataset, Caso queira fazer o download [Clique Aqui](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer) - Esse conjunto de dados inclui 201 instâncias de uma classe e 85 instâncias de outra classe. As instâncias são descritas por 9 atributos, alguns dos quais são lineares e alguns são nominais.

-------------------------------------------------------------------------------------------------------------------------------------

🚀 ***Languages/Sites:*** 

* [SQL](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)
* [Dados](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer)
* [MYSQL](https://www.mysql.com/)
* [Material De Referência](https://www.w3schools.com/sql/sql_case.asp)

-------------------------------------------------------------------------------------------------------------------------------------
📋 ***Criando Tabelas***

``` SQL
CREATE TABLE `cap03`.`TB_DADOS` (
  `classe` VARCHAR(100) NULL,
  `idade` VARCHAR(45) NULL,
  `menopausa` VARCHAR(45) NULL,
  `tamanho_tumor` VARCHAR(45) NULL,
  `inv_nodes` VARCHAR(45) NULL,
  `node_caps` VARCHAR(3) NULL,
  `deg_malig` INT NULL,
  `seio` VARCHAR(5) NULL,
  `quadrante` VARCHAR(10) NULL,
  `irradiando` VARCHAR(3) NULL);
  
 ```
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ***Exemplo de Categorização*** 
 
``` SQL
#Aplicando Categorização da variável Tamanho Tumor (6 Categorias)

SELECT DISTINCT tamanho_tumor FROM Cap03.tb_dados;

SELECT #Reduzindo o número de Categorias
	CASE 
		    WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END as tamanho_tumor
FROM cap03.TB_DADOS;

```
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ***Exemolo de Binarização***
 
 ``` SQL
 #Binarização da variável classe(0/1)

SELECT DISTINCT classe FROM Cap03.TB_DADOS;

SELECT 
	CASE 
		WHEN classe ='no-recurrence-events' THEN 0
		WHEN classe ='recurrence-events' THEN 1
	END as classe
FROM Cap03.TB_DADOS;
```
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ***Exemplo de Codificação***
 
  ``` SQL
 #label Ecoding da Variável quadrante (1,2,3,4,5)

SELECT DISTINCT quadrante FROM Cap03.tb_dados;

SELECT 
	CASE 
		WHEN quadrante = 'left_low' THEN 1 
        WHEN quadrante = 'right_up' THEN 2 
        WHEN quadrante = 'left_up' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0
	END as quadrante
FROM cap03.TB_DADOS;
```
 

