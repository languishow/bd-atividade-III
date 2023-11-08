create database trigger3;

use trigger3;

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
    estoque INT NOT NULL
  );
  
INSERT INTO produtos (nome,estoque) VALUES
 ("Computador", 100),
 ("Mouse", 50),
 ("Televisão", 200);  


DELIMITER //
CREATE TRIGGER diminuir_estoque
before INSERT ON 
Produtos
FOR EACH ROW
BEGIN
    SET new.estoque = new.estoque - 1;
END //
DELIMITER ;
 
 select nome,estoque from Produtos;








