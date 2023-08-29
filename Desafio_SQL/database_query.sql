use ecommerce;

insert into cliente (Fname, Minit, Lname, CPF, Adress)
		values	('James','J','Silva','987654321','Rua das Frutas 65, Madureira - Rio de Janeiro'),
				('Emily','E','Souza','123456789','Rua do Papa 253, Goiabeiras - Sorocaba'),
                ('Luke','L','Skywalker','111222333','Rua da Areia 7, Fort Tusken - Tatooine'),
                ('Frodo','F','Bolseiro','444555666','Rua de Cima 2, Vila dos Hobbits - Condado'),
                ('Harry','H','Potter','777888999','Rua dos Alfeneiros 4, Surrey - Londres');

insert into product (Pname, classification_kids, category, avaliacao, size)
		values	('Bicicleta',false,'brinquedo','4',null),
				('Boneca',true,'brinquedo','2',null),
                ('Cama',false,'moveis','5','Solteiro'),
                ('Anel',false,'vestimenta','5',null),
                ('Salada de Frutas',false,'alimentos','3',null),
                ('Celular',false,'eletronico','4',null),
                ('Sapato',false,'vestimenta','1','40');

select * from cliente;
select * from product;

insert into orders (idordersclient, ordersstatus, ordersdescription, sendvalue, paymentcash)
		values	(1, default,'compra pelo site',null,1),
				(2, default,'compra pelo aplicativo',50,0),
                (3, 'Confirmado', null, null, 1),
                (4, default, 'compra pelo aplicativo',150,0),
                (5, default, 'compra pelo aplicativo',50,0);
                
select * from orders;
insert into productorder (idPOproduct, idPOorder, poQuantity, poStatus)
		values	(1,1,2,null),
				(2,1,1,null),
                (3,2,1,null);

insert into productStorage (storageLocation, quantity)
		values	('Rio de Janeiro', 1000),
				('Sao Paulo', 2000),
                ('Belo Horizonte', 800),
                ('Londres', 3000),
                ('Tatooine', 320),
                ('Condado', 100);

insert into supplier(SocialName, CNPJ, contact)
		values	('Casas Ceara', 111112222233333, '00111222333'),
				('Magazine Thaiza', 444445555566666, '00444555666'),
                ('Gustavo Eletro', 777778888899999, '00777888999');

insert into productSupplier (idPsSupplier, idPsProduct, quantity)
		values	(1, 1, 500),
				(1, 2, 400),
                (2, 4, 633),
                (3, 3, 5),
                (2, 5, 10);
                
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact)
		values	('Eletronic Store', null, 123456789101234, 123456789, 'Cuiaba', '54123456789'),
				('Toy Store', null, 123456789876543, 987654321, 'Vitoria', '27123456789'),
                ('Fashion Store', 'FS', 423456789101234, 423456789, 'Campinas', '74123456789');

insert into productSeller (idPSeller, idProduct, prodQuantity)
		values	(1, 6, 80),
				(2, 7, 10);

select * from supplier;

select * from cliente c, orders o where c.idcliente = idordersclient;

select * from product order by avaliacao desc;

select idPsSupplier, count(*) as compras
	from productSupplier
    group by idPsSupplier
    having compras > 0;

select c.idcliente, Fname, count(*) as Number_of_orders from cliente c
			inner join orders o ON c.idcliente = o.idordersclient
			group by idcliente;

select c.idcliente, Fname, COUNT(*) as Number_of_orders
			from cliente c
			inner join orders o ON c.idcliente = o.idordersclient
			group by idcliente, Fname
			having COUNT(*) > 1;
    


		
                
                
                
                
                
        
	
			