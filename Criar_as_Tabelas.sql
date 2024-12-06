CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Criar tabela cliente
CREATE TABLE Clients(
	idClient int AUTO_INCREMENT PRIMARY KEY,
    f_name varchar(10),
    m_init char(3),
    l_name varchar(20),
    cpf char(11) NOT NULL,
    address varchar(30),
    CONSTRAINT unique_cpf_cliente UNIQUE (cpf)
);
-- Criar tabela Produto
CREATE TABLE Products(
	idProduct int AUTO_INCREMENT PRIMARY KEY,
    p_name varchar(10),
    classification_kids bool DEFAULT false,
    category enum('Eletrônico','Vestimenta','Brinquedo','Alimentos','Móveis') NOT NULL,
    avaliacao float  DEFAULT 0,
    size varchar(10)
);
-- Pedido
CREATE TABLE Orders(
	idOrder int AUTO_INCREMENT PRIMARY KEY,
    idClient int,
    orderStatus enum('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em Processamento',
    orderDescription varchar(255),
    shippingCost float DEFAULT 10,
    CONSTRAINT fk_Order_client FOREIGN KEY (idClient) REFERENCES Clients(idClient)
);
-- Pagamentos
CREATE TABLE Payments(
	idPayment int AUTO_INCREMENT PRIMARY KEY,
    typePayment enum('Boleto','Cartões','Dois cartões'),
    limiteAvaliable float
);
-- Pagamentos/Pedidos
CREATE TABLE PaymentsOrders(
	idPayment int,
    idOrder int,
    idClient int,
    PRIMARY KEY (idPayment,idOrder,idClient),
    CONSTRAINT fk_payOrd_pay FOREIGN KEY (idPayment) REFERENCES Payments(idPayment),
    CONSTRAINT fk_payOrd_Ord FOREIGN KEY (idOrder) REFERENCES Orders(idOrder),
    CONSTRAINT fk_payOrd_client FOREIGN KEY (idClient) REFERENCES Clients(idClient)
);
-- Produto/Pedido
CREATE TABLE ProductsOrders(
	idProduct int,
    idOrder int,
    quantity int DEFAULT 1,
    poStatus enum('Disponível','Sem Estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idProduct,idOrder),
    CONSTRAINT fk_ProdOrder_product FOREIGN KEY (idProduct) REFERENCES Products(idProduct),
    CONSTRAINT fk_ProdOrder_order FOREIGN KEY (idOrder) REFERENCES Orders(idOrder)
);
-- Estoque
CREATE TABLE ProductStorages(
	idProductStorage int AUTO_INCREMENT PRIMARY KEY,
    location varchar(255),
    quantity int DEFAULT 0
);
-- Produto/Estoque
CREATE TABLE storagesLocations(
	idProduct int,
    idProductStorage int,
    location varchar(255) NOT NULL,
    PRIMARY KEY (idProduct,idProductStorage),
	CONSTRAINT fk_storagesLocations_product FOREIGN KEY (idProduct) REFERENCES Products(idProduct),
    CONSTRAINT fk_storagesLocations_ProStor FOREIGN KEY (idProductStorage) REFERENCES ProductStorages(idProductStorage)
);
-- Fornecedor
CREATE TABLE Suppliers(
	idSupplier int AUTO_INCREMENT PRIMARY KEY,
    socialName varchar(255) NOT NULL,
    cnpj char(15) NOT NULL,
    contact varchar(11) NOT NULL,
    CONSTRAINT unique_cnpj_supplier UNIQUE (cnpj)
);
-- Produto/Fornecedor
CREATE TABLE ProductsSuppliers(
	idProduct int,
    idSupplier int,
    PRIMARY KEY(idProduct,idSupplier),
    CONSTRAINT fk_ProductsSuppliers_product FOREIGN KEY (idProduct) REFERENCES Products(idProduct),
    CONSTRAINT fk_ProductsSuppliers_suppliers FOREIGN KEY (idSupplier) REFERENCES Suppliers(idSupplier)
);
-- Vendedor
CREATE TABLE Sallers(
	idSaller int AUTO_INCREMENT PRIMARY KEY,
    socialName varchar(255) NOT NULL,
    absName varchar(255),
    cnpj char(15),
    cpf char(11),
    location varchar(255),
    contact varchar(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (cnpj),
    CONSTRAINT unique_cpf_seller UNIQUE (cpf)
);
-- Produto/Vendedor
CREATE TABLE ProductsSellers(
	idSaller int,
    idProduct int,
    quantity int DEFAULT 1,
    PRIMARY KEY (idSaller, idProduct),
    CONSTRAINT fk_ProdSeller_seller FOREIGN KEY (idSaller) REFERENCES Sallers(idSaller),
    CONSTRAINT fk_ProdSeller_product FOREIGN KEY (idProduct) REFERENCES Products(idProduct)
);