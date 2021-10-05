/**
 Agenda de contatos
 @author Lucas Lima
*/
-- exibir banco de dados do servidor 
show databases;
-- criar um novo banco de dados
create database dbagenda;
-- excluir um banco de dados 
drop database dbteste;
-- selecionar o banco de dados
use dbagenda;

-- verificar tabelas existentes
show tables;

-- criando uma tabela 
-- toda tablema precisa ter uma chave primária (PK)
-- int (tipo de dados -> números inteiros
-- primary key -> transforma este campo em chave primária
-- auto_increment -> numeração automática
-- tipo de dados equivalente a String (50) numero maximo de caracteres
-- not null -> preenchimento obrigatório
-- unique -> não permite valores duplicados na tabela

create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50) unique
);

-- descrição da tabela
describe contatos;

-- alterar o nome de um campo na tabela
alter table contatos change nome contato varchar(50) not null;

-- adicionar novo campo(coluna) na tabela
alter table contatos add column obs varchar(250);

-- adicionar um novo campo(coluna) em um local especifico da tabela
alter table contatos add column fone2 varchar(15) after fone;

-- modificar tipo de dados e/ou validação na coluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir uma coluna da tabela
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos;

-- CRUD (Create Read Update Delete)
-- operações básicas do banco de dados

-- CRUD Create
insert into contatos(nome,fone,email)
values ('Lucas Lima', '9999-1111','lucas@lima.com');
insert into contatos(nome,fone,email)
values ('Roberta Lima', '1111-2222','roberta@lima.com');
insert into contatos(nome,fone,email)
values ('Silvana Silva', '3333-4444','silvana@silva.com');
insert into contatos(nome,fone,email)
values ('Gabriel Padovesi', '5555-6666','gabriel@padovesi.com');
insert into contatos(nome,fone,email)
values ('Igor Cazak', '7777-8888','igor@cazak.com');
insert into contatos(nome,fone,email)
values ('Ricardo Vandrel','9999-0000','ricardo@vandrel');
insert into contatos(nome,fone,email)
values ('Raquel Vanel','9999-1100','raquel@vanel');
insert into contatos(nome,fone,email)
values ('Roberto Justus','9999-0000','roberto@justus');
insert into contatos(nome,fone,email)
values ('Riquelme Lima','9999-0000','riquelme@lima');
insert into contatos(nome,fone,email)
values ('Ruth Oliver','9999-0000','ruth@oliver');
insert into contatos(nome,fone,email)
values ('Rafael Lima','9999-0000','rafael@lima');
insert into contatos(nome,fone,email)
values ('Rafaela Eduarda','9999-0000','rafaela@eduarda');




-- CRUD Read
-- selecionar todos os registros(dados) da tabela
select * from contatos; 

-- selecionar colunas especificas da tabela
select nome, fone from contatos;
select nome, email from contatos;

-- selecionar colunas em ordem crescente e decrescente
select * from contatos order by nome;
select id, nome from contatos order by id desc;

-- uso de filtros 
select * from contatos where id = 11;
select * from contatos where nome = 'Roberto Justus';
select * from contatos where nome like 'R%';

-- CRUD Update
-- ATENÇÃO! Não esqueça do 'where' e usar sempre o 'id' para evitar problemas
update contatos set email='ricardo@vandrel.com' where id = 7;
update contatos set fone='1234-5678' where id = 7;
update contatos set nome='Raquel Venel',fone='9874-5612',email='raquel@venel.com' where id = 8;

-- CRUD Delete
-- ATENÇÃO! Não esqueça do 'where' e usar sempre o 'id' para evitar problemas
delete from contatos where id=13;










