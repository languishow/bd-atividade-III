create database trigger4;

use trigger4;

CREATE TABLE tb_funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cargo VARCHAR(255) NOT NULL
);

CREATE TABLE tb_funcionarios_demitidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cargo VARCHAR(255) NOT NULL,
  data_demissao TIMESTAMP
);

INSERT INTO tb_funcionarios (id, nome, cargo) values
(1, 'Jadson', 'Gerente'),
(2, 'Daniel', 'Diretor');

DELIMITER //

CREATE TRIGGER tr_exclusao_funcionario
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO tb_funcionarios_demitidos (nome, cargo, datademissao)
    VALUES (OLD.nome, OLD.cargo, NOW());
END //

DELIMITER ;

SELECT * FROM tb_funcionarios_demitidos;
;
