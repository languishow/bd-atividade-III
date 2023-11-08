create database trigger5;

use trigger5;

CREATE TABLE tb_funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cargo VARCHAR(255) NOT NULL
);

INSERT INTO tb_funcionarios (id, nome, cargo) VALUES
(1, 'Fabricio', 'Administrativo');

CREATE TABLE tb_dependentes (
    id INT PRIMARY KEY,
    id_funcionario INT,
    nome VARCHAR(255),
    parentesco VARCHAR(255),
    FOREIGN KEY (id_funcionario) REFERENCES tb_funcionarios(id) ON DELETE CASCADE
);

INSERT INTO tb_dependentes (id, id_funcionario, nome, parentesco) VALUES
(1, 1, 'Jemerson', 'Pai do Fabricio');

DELIMITER //

CREATE TRIGGER tr_excluir_dependentes
AFTER DELETE ON tb_funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM tb_dependentes WHERE funcionarioid = OLD.id;
END //

DELIMITER ;

SELECT f.id AS id_funcionario, f.nome AS nome_funcionario, f.cargo, d.id AS id_dependente, d.nome AS nome_dependente, d.parentesco
FROM tb_funcionarios f
LEFT JOIN tb_dependentes d ON f.id = d.id_funcionario;
