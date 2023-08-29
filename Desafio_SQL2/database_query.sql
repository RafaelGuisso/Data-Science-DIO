use company;


insert into company.employee (Fname, Minit, Lname, Ssn, Address, sex, Salary, Dno)
		values	('James',null,'Smith',123456789,'Rua Andorinha 88','M','2000',4),
                ('Tiago','S','Gomes',223456789,'Rua das Laranjas 288','M','2000',4),
                ('Rodrigo',null,'Linhares',323456789,'Rua das Pombas 888','M','6000',2),
                ('Carlos',null,'Souza',423456789,'Rua das Rosas 868','M','2000',4),
                ('Ronaldo',null,'Aveiro',523456789,'Rua das Estrelas 818','M','15000',3),
                ('Cinthia',null,'Nazario',623456789,'Rua Gaviao 48','F','8000',1);
                
select * from company.employee;

insert into department (Dname, Dnumber, Mgr_ssn)
		values	('Rh', 1, 323456789),
				('Contabilidade', 2, 623456789),
				('Gerencia', 3, 523456789),
                ('Producao', 4, 123456789);

select * from department;


insert into dept_locations (Dnumber, Dlocation)
		values	(1, 'Office'),
				(2, 'Office'),
				(3, 'Main Building'),
                (4, 'Factory');

insert into project (Pname, Pnumber, Plocation, Dnum)
		values	('Contratar novo funcionario', 1, 'Office', 1),
				('Imposto de renda', 2, 'Office', 2),
                ('Verificar gastos', 3, 'Office', 2),
                ('Gerar relatorio de gasto/lucro', 4, 'Office', 2),
                ('Ler relatorio de gasto/lucro', 5, 'Main Building', 3),
                ('Comunicar Resultados aos Donos', 6, 'Main Building', 3),
                ('Concertar maquinas', 7, 'Factory', 4),
                ('Adicionar Materia prima', 8, 'Factory', 4);
                

select * from project;

select * from project where Dnum=2;

select Fname, Lname, Salary from company.employee order by Salary desc;

select Plocation, Dnum, count(*) as trabalhos_pendentes from project
		inner join department on Dnum = Dnumber
        group by Dnum, Plocation order by trabalhos_pendentes;
        
select Plocation, Fname, count(*) as trabalhos_pendentes from project
		inner join department on Dnum = Dnumber
        inner join company.employee on Dno = Dnum
        group by Dnum, Plocation, Fname order by trabalhos_pendentes;

select Plocation, Dnum, Fname, count(*) as trabalhos_pendentes from project
		inner join department on Dnum = Dnumber
        inner join company.employee on Dno = Dnum
        group by Dnum, Plocation, Fname
        having COUNT(*) > 2
        order by trabalhos_pendentes;

                
                