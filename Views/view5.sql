create database view5;

use view5;

create table Pedidos (
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Estatus varchar(255) not null
);

Insert Into Pedidos(Nome,Estatus) values
('Boné','Entregue'),
('Camisa','Pendente'),
('Tenis','Entregue'),
('Chinelo','Pendente');

CREATE VIEW vw_pedidos_pendentes AS
SELECT Nome, Estatus
FROM Pedidos
WHERE Estatus = 'Pendente';

select*from vw_pedidos_pendentes;


