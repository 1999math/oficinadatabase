-- criação de banco de dados para oficina mecânica

-- drop database mechanical_workshop;
show tables;
create database mechanical_workshop;
use mechanical_workshop;

-- criar tabela veículo
create table vehicle(
     idClient int auto_increment primary key,
     FullName varchar(45),
     CPF char(11),
     Address varchar(30),
     vType enum('Espécie','Tração','Categoria','Frota') not null
);


-- criar tabela serviço
create table service(
     idService int auto_increment primary key,
	 mQuantity varchar(3),
     sType enum('Revisão','Concerto') default'Revisão'
);

-- criar tabela
create table mechanic(
     idMechanic int auto_increment primary key,
     nMechanic varchar(45),
	 adMechanic varchar(30),
     Especiality enum('Manutenção','Montador','Auxilia') default 'Manutenção'
);

-- criar tabela equipe 1
create table team_1(
     idTeam_1 int auto_increment primary key,
     nMechanic_1 varchar(45),
     nMechanic_2 varchar(45),
     nMechanic_3 varchar(45)
);

-- criar tabela equipe 2
create table team_2(
	 idTeam_2 int auto_increment primary key,
     nMechanic_1 varchar(45),
     nMechanic_2 varchar(45),
     nMechanic_3 varchar(45)
);

-- criara tabela avaliação da equipe
create table team_evaluation(
     idEteam_1 int,
     idEteam_2 int,
     parts varchar(255),
     tLabor enum('Tipo 1','Tipo 2','Tipo 3') default 'Tipo 1',
     constraint fk_team_evaluation_team_1 foreign key (idEteam_1) references team_1(idTeam_1),
     constraint fk_team_evaluation_team_2 foreign key (idEteam_2) references team_2(idTeam_2)
);

-- criar tabela OS
create table OS(
     idOS_t1 int,
     idOS_t2 int,
     OSnumber char(25),
     issue_date date,
     Sstatus enum('Aguardando','Em andamento','Concluído') default 'Aguardando',
     Svalue char(25),
     completion_date date,
     constraint fk_OS_team_1 foreign key (idOS_t1) references team_evaluation(idEteam_1),
     constraint fk_OS_team_2 foreign key (idOS_t2) references team_evaluation(idEteam_2)
);