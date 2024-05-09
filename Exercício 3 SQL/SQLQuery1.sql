--- Exercício 3 SQL Hashtag --- 

/*1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales.*/

SELECT 
	SUM(SalesQuantity) AS 'Quantidade Vendida',
	SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM 
	FactSales
WHERE channelKey = 1

/*2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse
resultado.*/

SELECT 
	AVG(YearlyIncome) AS 'Média Salarial'
FROM 
	DimCustomer
WHERE Occupation = 'Professional'


/*3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na
empresa. O seu gerente te pediu os seguintes números e informações:*/

--a) Quantos funcionários tem a loja com mais funcionários?

SELECT 
	MAX(EmployeeCount) AS 'Maior Quantidade de Funcionarios'
FROM DimStore

--b) Qual é o nome dessa loja?

SELECT 
	TOP(1) StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Quantidade de Funcionários'
FROM 
	DimStore
ORDER BY EmployeeCount DESC

--c) Quantos funcionários tem a loja com menos funcionários?
SELECT 
	MIN(EmployeeCount) AS 'Menor Quantidade de Funcionarios'
FROM DimStore

--d) Qual é o nome dessa loja?

SELECT 
	TOP(1) StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Quantidade de Funcionários'
FROM 
	DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC


/*4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade
total de funcionários do sexo Masculino e do sexo Feminino.*/

--a) Descubra essas duas informações utilizando o SQL.

SELECT 
	COUNT(FirstName)
FROM 
	DimEmployee
WHERE Gender = 'M'

-------
SELECT 
	COUNT(FirstName)
FROM 
	DimEmployee
WHERE Gender = 'F'

--b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as
--seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.

SELECT 
	TOP(1) FirstName AS 'Primeiro Nome Homem',
	EmailAddress AS 'Email',
	HireDate AS 'Data de Contratação'

FROM DimEmployee
WHERE Gender = 'M'
ORDER BY HireDate ASC -- vai mostrar a data de contratação mais antiga
 
 ---------

SELECT 
	TOP(1) FirstName AS 'Primeiro Nome Mulher',
	EmailAddress AS 'Email',
	HireDate AS 'Data de Contratação'

FROM DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate ASC
	

--5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes
--informações:

--a) Quantidade distinta de cores de produtos.

SELECT 
	COUNT(DISTINCT ColorName) AS 'Quantidade Distinta de Cores'
FROM 
	DimProduct

--b) Quantidade distinta de marcas

SELECT 
	COUNT(DISTINCT BrandName) AS 'Quantidade Distinta de Marca'
FROM 
	DimProduct

--c) Quantidade distinta de classes de produto

SELECT 
	COUNT(DISTINCT ClassName) AS 'Quantidade Distinta de Classe'
FROM 
	DimProduct
