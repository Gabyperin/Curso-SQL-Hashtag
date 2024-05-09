--- Exerc�cio 3 SQL Hashtag --- 

/*1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa
an�lise considerando a tabela FactSales.*/

SELECT 
	SUM(SalesQuantity) AS 'Quantidade Vendida',
	SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM 
	FactSales
WHERE channelKey = 1

/*2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes
da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse
resultado.*/

SELECT 
	AVG(YearlyIncome) AS 'M�dia Salarial'
FROM 
	DimCustomer
WHERE Occupation = 'Professional'


/*3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na
empresa. O seu gerente te pediu os seguintes n�meros e informa��es:*/

--a) Quantos funcion�rios tem a loja com mais funcion�rios?

SELECT 
	MAX(EmployeeCount) AS 'Maior Quantidade de Funcionarios'
FROM DimStore

--b) Qual � o nome dessa loja?

SELECT 
	TOP(1) StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Quantidade de Funcion�rios'
FROM 
	DimStore
ORDER BY EmployeeCount DESC

--c) Quantos funcion�rios tem a loja com menos funcion�rios?
SELECT 
	MIN(EmployeeCount) AS 'Menor Quantidade de Funcionarios'
FROM DimStore

--d) Qual � o nome dessa loja?

SELECT 
	TOP(1) StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Quantidade de Funcion�rios'
FROM 
	DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount ASC


/*4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade
total de funcion�rios do sexo Masculino e do sexo Feminino.*/

--a) Descubra essas duas informa��es utilizando o SQL.

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

--b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as
--seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.

SELECT 
	TOP(1) FirstName AS 'Primeiro Nome Homem',
	EmailAddress AS 'Email',
	HireDate AS 'Data de Contrata��o'

FROM DimEmployee
WHERE Gender = 'M'
ORDER BY HireDate ASC -- vai mostrar a data de contrata��o mais antiga
 
 ---------

SELECT 
	TOP(1) FirstName AS 'Primeiro Nome Mulher',
	EmailAddress AS 'Email',
	HireDate AS 'Data de Contrata��o'

FROM DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate ASC
	

--5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes
--informa��es:

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
