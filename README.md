# Inspeções Sanitárias em Navios de Cruzeiro

🟪 ***Sobre:*** 

Os dados ([download](https://dados.gov.br/dataset/dados-abertos-de-inspecao-em-navios-de-cruzeiro)) representam informações sobre as Inspeções realizadas pelo Programa Nacional de Vigilância em Saúde para Navios de Cruzeiro. Usaremos SQL básico para analisar através de Consulta, Filtro, Ordenação e Operadores inspeções dos dados sanitários em navios de cruzeiro, com dados reais disponíveis publicamente. 

-----------------------------------------------------------------------------------------------------------------------------

🚀***Languages/Sites:*** 

 * [SQL](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads)
 * [Dados](https://dados.gov.br/dataset/dados-abertos-de-inspecao-em-navios-de-cruzeiro)
 * [MYSQL](https://www.mysql.com/)
 
 ----------------------------------------------------------------------------------------------------------------------------

📋***Documentação e dicionário de dados: [Link](https://dados.anvisa.gov.br/dados/Documentacao_e_Dicionario_de_Dados_Navios_Cruzeiro.pdf)***

Dados | Descrição |
------|-----------|
Nome do Navio | Nome do Navio de Cruzeiro
Nome do Navio de Cruzeiro | Mês e ano da inspeção realizada 
CLASSIFICACAO_RISCO       | Classificação de risco <br/><br/> A ANVISA classifica as embarcações em quatro níveis (A, B, C e D).<br/> • ***Padrão A:*** pontuação de risco até 150: Embarcações em excelentes condições sanitárias; <br/> • ***Padrão B:*** pontuação de risco entre 151 e 300: Embarcações em condições sanitárias satisfatórias <br/> • ***Padrão C:*** pontuação de risco entre 301 e 450: Embarcações em condições sanitárias aceitáveis;<br/> • ***Padrão D:*** pontuação de risco acima de 450: Embarcações em condições sanitárias insatisfatórias com exigências a cumprir imediatamente.
PONTUACAO_RISCO (PSR)     | É o somatório dos valores de risco de cada item do roteiro de inspeção. A pontuação de risco está associada à ausência ou falhas dos controles (ação, medida ou dispositivo empregado para mitigação do risco). Assim, quanto mais controle não implementados a embarcação possuir, maior o risco sanitário e consequentemente a pontuação do navio.
INDICE_CONFORMIDADE       | Porcentagem dos itens do roteiro de inspeção que foram atendidos pela embarcação
TEMPORADA                 | Temporada do Programa Nacional de Vigilância em Saúde para Navios de Cruzeiros. As temporadas iniciam-se em outubro e prosseguem até o mês abril do ano seguinte

------------------------------------------------------------------------------------------------------------------------------------------

### Criando Tabela no MYSQL workbencch:

``` SQL
CREATE TABLE `cap02`.`TB_NAVIOS` (
  `nome_navio` VARCHAR(50) NULL,
  `mes_ano` VARCHAR(10) NULL,
  `classificacao_risco` VARCHAR(15) NULL,
  `indice_conformidade` VARCHAR(15) NULL,
  `pontuacao_risco` INT NULL,
  `temporada` VARCHAR(200) NULL);
  
  ``` 
 ### Selecionando algumas tabelas:
  
``` SQL
SELECT * FROM cap02.TB_NAVIOS;

SELECT nome_navio, mes_ano FROM cap02.TB_NAVIOS;

SELECT DISTINCT classificacao_risco FROM cap02.TB_NAVIOS;

``` 
### Usando WHERE AND ORDER BY

``` SQL

SELECT nome_navio, temporada FROM cap02.TB_NAVIOS WHERE classificacao_risco = 'D'

SELECT nome_navio, classificacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D'
ORDER BY nome_navio

SELECT nome_navio, classificacao_risco, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D'
ORDER BY nome_navio

SELECT nome_navio, classificacao_risco, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D' AND pontuacao_risco > 1000
ORDER BY nome_navio

SELECT nome_navio, classificacao_risco, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D' OR pontuacao_risco > 3000
ORDER BY nome_navio

SELECT nome_navio, classificacao_risco, indice_conformidade, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco IN ('A', 'B') AND indice_conformidade > 90
ORDER BY nome_navio

SELECT nome_navio, classificacao_risco, indice_conformidade, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco IN ('A', 'B') AND indice_conformidade > 90
ORDER BY indice_conformidade 
LIMIT 10
``` 

### Algunas perguntas:
Em Abril de 2018 alguma embarcação teve índice de conformidade de 100% e pontuação de risco igual a 0?
``` SQL
SELECT nome_navio, classificacao_risco, indice_conformidade, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE indice_conformidade > 90 AND pontuacao_risco = 0 AND mes_ano = '04/2018'
ORDER BY indice_conformidade 
```
Em Abril de 2018 alguma embarcação teve índice de conformidade de 100% e pontuação de risco igual a 0?
``` SQL

SELECT nome_navio, classificacao_risco, indice_conformidade, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE indice_conformidade IN (SELECT indice_conformidade 
								FROM cap02.TB_NAVIOS 
							   WHERE indice_conformidade > 90)
                                 AND pontuacao_risco = 0 
                                 AND mes_ano = '04/2018'
ORDER BY indice_conformidade 

``` 


 



