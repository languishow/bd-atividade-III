create database view4;

use view4;

create table Produtos (
Id int auto_increment primary key,
Nome varchar(255) not null,
preco float
);

insert into Produtos(nome,preco) values
('Sabonete','50.00'),
('Condicionador','80.00'),
('Xampu','120.00'),
('Desodorante','150.00');

CREATE VIEW vw_produtos_caros AS
SELECT nome , preco 
FROM Produtos
WHERE preco > 100;

select*from vw_produtos_caros;
