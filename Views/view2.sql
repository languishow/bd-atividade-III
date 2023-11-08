create database view2;

 
 Create table view2.Produtos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Estoque int
 );
 
 insert into view2.Produtos(Nome,Estoque) values
 ("Sabonete",2),
 ("Xampu",4),
 ("Condicionador",6);
 
 Create View view2.vw_estoque_insuficiente as
 select Nome,Estoque
 From view2.Produtos
 where Estoque < 5;
 
 Select * from view2.vw_estoque_insuficiente;