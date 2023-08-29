
-- drop database company;
create schema if not exists company;
create table company.employee(
	Fname varchar(15) not null,
	Minit char,
	Lname varchar(15) not null,
	Ssn char(9),
	Address varchar(30),
	sex char,
	Salary decimal(10,2),
	Dno int not null,
	primary key (Ssn)
);

use company;
create table department(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references department(Dnumber)
    );
    
create table project(
	Pname varchar(50) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    unique (Pname),
    foreign key (Dnum) references department(Dnumber)
);

