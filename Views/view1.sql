create database view1;
 
 Create table view1.Funcionarios(
 ID int primary key auto_increment,
 Nome varchar(255)
 );
 
 insert into view1.Funcionarios(Nome) values
 ("Matheus"),
 ("João"),
 ("Jadson"),
 ("Guedes"),
 ("Eneilton");
 
 Create table view1.Departamento(
 ID int primary key auto_increment,
 Cargo Varchar(255) not null,
 Id_Funcionarios int,
 foreign key (Id_Funcionarios) references view1.Funcionarios(ID)
 );
 
 insert into view1.Departamento(Cargo,Id_Funcionarios) values
 ('Administrativo', 1),
 ('Financeiro', 2),
 ('Administrativo', 3),
 ('Administrativo', 4),
 ('Comerciante', 5);
 
 Create view view1.vw_funcionarios_departamento as
 select
 F.Nome,
 D.Cargo
 From view1.Funcionarios F
 inner join view1.Departamento D
 on F.ID = Id_Funcionarios
 where D.Cargo='Administrativo';
 
 SELECT * FROM view1.vw_funcionarios_departamento;