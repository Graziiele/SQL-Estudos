# Dados de Câncer de Mama

🟪 ***Sobre:*** 

O objetivo é limpar e transformar os dados através de categorização, codificação e binarização e então gerar um novo dataset, Caso queira fazer o download [Clique Aqui](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer) - Esse conjunto de dados inclui 201 instâncias de uma classe e 85 instâncias de outra classe. As instâncias são descritas por 9 atributos, alguns dos quais são lineares e alguns são nominais.

-------------------------------------------------------------------------------------------------------------------------------------

🚀***Languages/Sites:*** 

* [SQL](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)
* [Dados](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer)
* [MYSQL](https://www.mysql.com/)
* [Material De Referência](https://www.w3schools.com/sql/sql_case.asp)

-------------------------------------------------------------------------------------------------------------------------------------
***Criando Tabelas***

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
 
 

