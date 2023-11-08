create database trigger2;

use trigger2;

CREATE TABLE Produtos (
id INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(255) not null,
preco decimal(10,2) not null
 );
 
 insert into Produtos (nome,preco) values
('Condicionador','150.00'),
('Xampu','200.00'),
('Sabonete', '250.00');

DELIMITER //

CREATE TRIGGER aumenta_preco_produto
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    SET NEW.preco = NEW.preco * 1.1; -- Aumenta o preço em 10%
END;
//

DELIMITER ;

select * from Produtos;



