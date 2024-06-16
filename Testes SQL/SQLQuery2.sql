-- Boraaa galeraaa APRENDER BANCO DE DADOS SQL :)

SELECT * FROM DimAccount

SELECT DISTINCT AccountName FROM DimAccount

SELECT TOP (10) PERCENT * FROM DimMachine

SELECT * FROM FactInventory

SELECT ProductKey, DaysInStock, MinDayInStock, MaxDayInStock FROM FactInventory
-----------------------
SELECT 
	ProductName AS "Nome do Produto", 
	BrandName AS "Nome da Marca", 
	ColorName AS "Nome da Cor"  
FROM 
	DimProduct
	--------------------------
SELECT 
	ProductName AS "Nome dos Produtos", 
	UnitPrice AS "Preço Unitário"
FROM 
	DimProduct
WHERE 
	UnitPrice >= 2000
ORDER BY 
	UnitPrice DESC

------------------------- 

SELECT * FROM DimProduct
WHERE ColorName = 'Blue' -- 200 produtos com a cor azul

SELECT * FROM DimProduct
WHERE ColorName = 'Silver' -- 417 produtor com a cor silver
	
SELECT * FROM DimCustomer -- 18.869 
WHERE BirthDate >= '1970-12-31' -- 4.474
ORDER BY BirthDate DESC

----- AND -------

SELECT * FROM DimProduct
WHERE BrandName = 'Litware' AND ColorName = 'Brown'


----- OR -----

SELECT * FROM DimSalesTerritory
WHERE SalesTerritoryGroup = 'Asia' OR SalesTerritoryCountry = 'Japan'

------- NOT -------

SELECT * FROM DimSalesTerritory
WHERE NOT SalesTerritoryGroup = 'North America' AND NOT SalesTerritoryRegion = 'Washington'

----- AND E OR ----

SELECT * FROM DimProduct
--- o ( ) é para o SQL entender quem ele deve executar primeiro 
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'

----- IN ------

SELECT * FROM DimProduct
WHERE ColorName IN ('Blue','Green', 'Orange')

------- LIKE ------
-- o % significa que pode ter texto ( no começo e no final)--
SELECT * FROM DimProduct
WHERE ProductName LIKE 'Contoso 8GB%'
-----------

SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%1080p 240Hz%'

-------------

---- BETWEEN (ENTRE) ----

SELECT * FROM DimProduct
WHERE Weight BETWEEN 55 AND 80
ORDER BY Weight 

---- NOT BETWEEN (NÃO ESTÁ ENTRE) ----
SELECT * FROM DimProduct
WHERE Weight NOT BETWEEN 55 AND 80 -- NUMEROS ANTES DE 55 E DEPOIS DE 80
ORDER BY Weight 

---- IS OU IS NOT ---

SELECT * FROM DimProduct
WHERE Status IS NOT NULL -- COLUNA SEM O NULL

SELECT * FROM DimProduct
WHERE Status IS NULL -- COLUNA COM OS VALORES NULL


---- SUM ----- 

SELECT 
	SUM(SalesQuantity)AS 'Quantidade Vendida', 
	SUM(ReturnQuantity) AS 'Quantidade Devolvida' 
FROM FactSales

--- COUNT --- (CONTA QUANTAS INFORMAÇOES TEM NA TABELA OU COLUNA ESPECIFICADA) 

SELECT 
	COUNT(ProductName) -- 2.517 linhas preenchidas 
FROM DimProduct

SELECT 
	COUNT(Status) -- 2.222 linhas, pois ele nao conta as linhas que tem NULL
FROM DimProduct

SELECT 
	COUNT(DISTINCT ProductDescription) AS 'Descrição do Produto' -- temos 717 produtos com descrições diferentes 
FROM DimProduct

---- MAX e MIN ----
SELECT 
	MAX(SalesQuantity)AS 'Maior valor das Vendas', 
	MIN(UnitPrice) AS 'Menor Preço Unitário' 
FROM 
	FactSales

--- AVG (Calcula a Media)--- 

SELECT 
	AVG(SalesAmount)AS 'Media de Quantidade de Vendas', -- 3.644 media 
	AVG(UnitPrice) AS 'Media do Preço Unitário' -- 320.486 
FROM 
	FactSales

---- GROUP BY + ORDER BY ---- 

SELECT 
	BrandName AS 'Nome da Marca',
	COUNT(*) AS 'Quantidade Total'
FROM 
	DimProduct
GROUP BY BrandName	-- agrupa


---- GROUP BY + ORDER BY ----

SELECT 
	StoreType, 
	SUM(EmployeeCount) AS 'Soma das vendas das Lojas'
FROM 
	DimStore
GROUP BY StoreType
ORDER BY SUM(EmployeeCount) DESC

--- 
---- GROUP BY + WHERE ----

SELECT 
	ColorName,
	COUNT(*)

FROM 
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName
SELECT * FROM DimProduct

---- GROUP BY + HAVING (fazer um filtro nos dados agrupados) ----

SELECT 
	BrandName AS 'Marca', 
	COUNT(BrandName)
FROM DimProduct

GROUP BY BrandName
HAVING COUNT(BrandName) >= 250 
