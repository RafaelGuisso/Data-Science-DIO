-- criacao de um banco de dados para e-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

create table cliente(
			idcliente int auto_increment primary key,
            Fname varchar(10),
            Minit char(3),
            Lname varchar(20),
            CPF char(11) not null,
            Adress varchar(50),
            constraint unique_cpf_cliente unique (CPF)
);

alter table cliente auto_increment=1;

create table product(
			idProduct int auto_increment primary key,
            Pname varchar(30) not null,
            classification_kids bool default false,
            category enum('eletronico','vestimenta','brinquedo','alimentos','moveis') not null,
            avaliacao float default 0,
            size varchar(10)
);

create table payments(
	idcliente int,
    id_payment int,
    payment_method enum('Boleto','Cartao','Dois cartoes') not null,
    limitavaiable float,
    primary key(idcliente, id_payment)
);

create table orders(
			idorders int auto_increment primary key,
            idordersclient int,
            ordersstatus enum('Cancelado','Confirmado','Em Processamento') default 'Em Processamento',
            ordersdescription varchar(255),
            sendvalue float default 10,
            paymentcash bool default false,
            constraint fk_orders_client foreign key (idordersclient) references cliente (idcliente)
);

create table productStorage(
            idProdStorage int auto_increment primary key,
            storageLocation varchar(255),
            quantity int default 0
);

create table supplier(
            idSupplier int auto_increment primary key,
            SocialName varchar(255) not null,
            CNPJ char(15) not null,
            contact char(11) not null,
            constraint unique_supplier unique (CNPJ)
);


create table seller(
			idSeller int auto_increment primary key,
            SocialName varchar(255) not null,
            AbstName varchar(255),
            CNPJ char(15),
            CPF char(9) not null,
            location varchar(255),
            contact char(11) not null,
            constraint unique_cnpj_seller unique (CNPJ),
            constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
			idPSeller int,
            idProduct int,
            prodQuantity int default 1,
            primary key (idPseller, idProduct),
            constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
            constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productOrder(
			idPOproduct int,
            idPOorder int,
            poQuantity int default 1,
            poStatus enum('Disponivel','Sem Estoque') default 'Disponivel',
            primary key (idPOproduct, idPOorder),
            constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
            constraint fk_productorder_product foreign key (idPOorder) references orders(idorders)
);

create table storageLocation(
			idLproduct int,
            idLstorage int,
            location varchar(255) not null,
            primary key (idLproduct, idLstorage),
            constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
            constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
			idPsSupplier int,
            idPsProduct int,
            quantity int not null,
            primary key (idPsSupplier, idPsProduct),
            constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
            constraint fk_product_supplier_prodcut foreign key (idPsProduct) references product(idProduct)
);