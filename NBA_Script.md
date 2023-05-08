<div align="center">
    
![image](https://user-images.githubusercontent.com/114547875/236925249-1d9c14bd-43f1-43cd-af61-f8a3b3a02e05.png)
    
</div>

## SQL + Visualização de dados

Durante esse projeto, realizei um estudo em SQL com dados provenientes de um banco de dados proposto com dados da NBA. Para isso, carreguei os arquivos CSV no software DBeaver e conectei ao IP correspondente. Em seguida, elaborei as consultas a seguir para aprimorar minhas habilidades em SQL:

- Cálculo do salário médio ao longo das seasons (1990-2018);
- Obtenção da quantidade de jogadores com mais de 10 pontos de média na carreira;
- Identificação do jogador com o salário mais alto em cada season (1990-2018);
- Demonstração do custo acumulado ao longo dos anos (1990-2018) que os times Los Angeles Lakers, Toronto Raptors e Golden State Warriors tiveram com salário de jogadores.

Adicionalmente, com os dados extraídos dessas consultas, criei um dashboard com o objetivo de apresentar visualmente as informações obtidas. Através desse dashboard, pude demonstrar de maneira clara e objetiva a análise feita em relação aos dados da NBA.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

``` SQL

-- (1) Quantidade de jogadores com mais de 10 pontos de média (“career_PTS”) na carreira 

SELECT count(*) career_pts
FROM 
    public.nba_players
WHERE career_pts > 10;

```
``` SQL

-- (2) Salário Médio ao longo das seasons (1990 - 2018) 

SELECT 
    season AS Anos,
    ROUND(AVG(salary), 2) AS Media_Salario
FROM 
    public.nba_salaries
WHERE season BETWEEN '1990' AND '2018'
GROUP BY season
ORDER BY season ASC;

``` 

``` SQL
-- (3) Jogador com salário mais alto em cada season (1990-2018)
   
SELECT DISTINCT ON (nba_salaries.season)
    nba_players.name AS Jogadores,
    nba_salaries.salary AS Maximo_salario,
    nba_salaries.season AS Anos
FROM 
    public.nba_salaries
LEFT JOIN 
    public.nba_players
ON public.nba_players._id = public.nba_salaries.player_id
WHERE 
    nba_salaries.season BETWEEN '1990' AND '2018'
ORDER BY
    nba_salaries.season ASC, nba_salaries.salary DESC;
``` 
    
``` SQL
   
 -- (4) Mostre o custo acumulado ao longo dos anos - ano por ano (1990 - 2018) 
 --- que os times Los Angeles Lakers , Toronto Raptors , Golden State Warriors tiveram com salário de jogadores.
   
SELECT 
    nba_salaries.team AS Times,
    SUM(nba_salaries.salary) AS Custo_Acumulado,
    nba_salaries.season AS Anos
FROM 
    public.nba_salaries
WHERE team IN ('Los Angeles Lakers', 'Toronto Raptors', 'Golden State Warriors')
AND season BETWEEN '1990-91' AND '2017-18'
GROUP BY 
    nba_salaries.team, nba_salaries.season
 ORDER BY
    nba_salaries.season ASC;
    
 ```
## Visualização de dados

![DashSQL](https://user-images.githubusercontent.com/114547875/236927256-0558fd9d-64e7-4190-a7fd-d540aa951405.png)

