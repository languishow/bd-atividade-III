create database view3; 

use view3;

create table Vendedor(
IDVendedor int primary key,
Nome varchar(255) not null,
Produto varchar(255) not null
);

Insert Into Vendedor (IDVendedor,Nome,Produto) values
(1, "Stenio", "Sabonete"),
(2, "Igor", "Condicionador"),
(3, "Caio", "Xampu");

create table Clientes(
Id int auto_increment primary key,
Nome varchar(255) not null,
DataNascimento date not null,
Telefone varchar(22) not null,
IDVendedor int,
foreign key (IDVendedor) references Vendedor(IDVendedor)
); 

Insert Into Clientes (Nome,DataNascimento,Telefone,IDVendedor) values
("Avner", "1990-06-09", "(11) 1111-1111", 1),
("Santyago", "2003-05-08", "(22) 2222-2222", 2),
("Carlos", "1999-04-12", "(33) 3333-3333", 3);

select * from Clientes;

select * from Vendedor;

 Create view vw_relacionamento_cliente_vendedor as
 select 
 C.Nome AS "Nome do Cliente",
 C.DataNascimento as "Data de Nascimento do Cliente",
 C.Telefone as "Telefone do Cliente",
 V.Nome as "Nome do Vendedor",
 V.Produto as "Produto do Vendedor"
 From Vendedor V
 inner join Clientes C 
 on V.IDVendedor = C.IDVendedor;

select * from vw_relacionamento_cliente_vendedor;