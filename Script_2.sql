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
  
  SELECT COUNT(*) FROM cap03.tb_dados;
  
  SELECT DISTINCT classe FROM Cap03.TB_DADOS; #coluna binária
  
  SELECT 
	CASE 
		WHEN classe ='no-recurrence-events' THEN 0
		WHEN classe ='recurrence-events' THEN 1
	END as classe
FROM Cap03.TB_DADOS;

SELECT * FROM cap03.tb_dados;

SELECT DISTINCT irradiando FROM Cap03.tb_dados;

SELECT 
	CASE 
		WHEN irradiando ='no' THEN 0
		WHEN irradiando ='yes' THEN 1
	END as irradiando
FROM Cap03.TB_DADOS;

SELECT DISTINCT node_caps FROM Cap03.tb_dados; #Binarização da variável 

SELECT 
	CASE 
		WHEN node_caps ='no' THEN 0
		WHEN node_caps ='yes' THEN 1
	END as node_caps
FROM Cap03.TB_DADOS;

# Verificando e Tratando Valores Ausentes 
#Ajustando a variável node_caps aplicando codificação e não a binarização (Label Encoding)
#Codifiquei com 3 valores para remover valores ausentes 

SELECT 
	CASE 
		WHEN node_caps ='no' THEN 0
		WHEN node_caps ='yes' THEN 1
		ELSE 2 
	END as node_caps
FROM Cap03.TB_DADOS;

#Aplicando Categorização da variável Seio (E/D)

SELECT DISTINCT seio FROM Cap03.tb_dados;


SELECT 
	CASE 
		WHEN seio ='left' THEN 'E'
		WHEN seio ='right' THEN 'D'
	END as seio
FROM Cap03.TB_DADOS;

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


#label Ecoding da Variável quadrante (1,2,3,4,5)

SELECT DISTINCT quadrante FROM Cap03.tb_dados;

SELECT 
	CASE 
		WHEN quadrante = 'left_low' THEN 1 
        WHEN quadrante = 'right_up' THEN 2 
        WHEN quadrante = 'left_up' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0 # Valor Nulo
	END as quadrante
FROM cap03.TB_DADOS;

#Criando Um Novo Dataset Após as Transformações

CREATE TABLE cap03.TB_DADOS2
AS
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0 
        WHEN classe = 'recurrence-events' THEN 1
	END as classe,
	idade,
	menopausa,
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
        WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
        WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
        WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
        WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
        WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END as tamanho_tumor,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0 
        WHEN node_caps = 'yes' THEN 1
        ELSE 2
	END as node_caps,
	deg_malig,
	CASE 
		WHEN seio = 'left' THEN 'E' 
        WHEN seio = 'right' THEN 'D'
	END as seio,
	CASE 
		WHEN quadrante = 'left_low' THEN 1 
        WHEN quadrante = 'right_up' THEN 2 
        WHEN quadrante = 'left_up' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0
	END as quadrante,
	CASE 
		WHEN irradiando = 'no' THEN 0 
        WHEN irradiando = 'yes' THEN 1
	END as irradiando
FROM cap03.TB_DADOS;


SELECT * FROM cap03.tb_dados2;
SELECT COUNT(*) FROM cap03.TB_DADOS2;








  
