-- Quantos pedidos foram feitos por cada cliente?
SELECT f_name, COUNT(*) as OrderCount
	FROM Clients c
    INNER JOIN Orders o ON c.idClient = o.idClient
			GROUP BY c.f_name;
-- Algum vendedor também é fornecedor?
SELECT sa.socialName
	FROM Sallers AS sa, Suppliers AS su
		WHERE sa.cnpj = su.cnpj;
-- Relação de produtos:
SELECT * FROM Products;
-- Relação de fornecedores:
SELECT * FROM Suppliers;
-- Relação de estoques:
SELECT * FROM ProductStorages;
-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT p.p_name, s.socialName
	FROM Products AS p, Suppliers AS s, ProductsSuppliers AS pSu
		WHERE (pSu.idProduct = p.idProduct) AND (pSu.idSupplier = s.idSupplier);
-- Crie expressões para gerar atributos derivados;
SELECT CONCAT(f_name,m_init,l_name) AS Full_Name, cpf, address FROM Clients;
-- Defina ordenações dos dados com ORDER BY;
SELECT CONCAT(f_name,' ',m_init,' ',l_name) AS Full_Name, cpf, address
	FROM Clients
		ORDER BY Full_Name;
-- Condições de filtros aos grupos – HAVING Statement;
SELECT CONCAT(c.f_name,' ',c.m_init,' ',c.l_name) AS Full_Name, O.orderStatus, COUNT(*) AS OrderCount
	FROM Clients AS c, Orders AS o
		WHERE (o.idClient = c.idClient)
			GROUP BY Full_Name, O.orderStatus
				HAVING COUNT(*) >=5;
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados.
SELECT CONCAT(c.f_name,' ',c.m_init,' ',c.l_name) AS Full_Name, O.orderStatus, COUNT(*) AS OrderCount
	FROM Clients c
        INNER JOIN Orders o ON c.idClient = o.idClient
        GROUP BY Full_Name, O.orderStatus
        ORDER BY Full_name, OrderCount;

-- Relação de Produtos em estoque por fornecedor |MINHA QUERY|
SELECT p.p_name AS Produtct, pSt.quantity AS Quantity ,pSt.location AS Location, s.cnpj
	FROM Products p
    INNER JOIN ProductsSuppliers pSu ON p.idProduct = pSu.idProduct
    INNER JOIN Suppliers s ON pSu.idSupplier = s.idSupplier
    INNER JOIN storagesLocations sL ON p.idProduct = sL.idProduct
	INNER JOIN ProductStorages pSt ON sL.idProductStorage = pSt.idProductStorage
            
-- Qual a quantidade de produtos em estoque por localização?
-- ESTOQUE - pSt.location
-- Qual a quantidade de produtos em estoque por fornecedor?
-- FORNECEDOR - s.cnpj
-- Qual a quantidade de produtos em estoque por produto?
-- PRODUTO - p.p_name