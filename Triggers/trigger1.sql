create database trigger1;

use trigger1;

CREATE TABLE Produtos (
id INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(255) not null,
validade date not null,
preco DECIMAL(10, 2) NOT NULL
 );

insert into Produtos (nome,validade,preco) values
('fone', '2023-09-26', 50.00),
('microfone', '2023-10-05', 75.00),
('fio dental', '2023-11-15', 100.00);

DELIMITER //
CREATE TRIGGER valida_data_validade
BEFORE INSERT ON produtos
FOR EACH ROW
BEGIN
    IF NEW.validade < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Produto com data de validade vencida não pode ser inserido';
    END IF;
END;
//

DELIMITER ;

SELECT * FROM produtos;











