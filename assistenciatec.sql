/**
	Assistência técnica de eletrodomésticos
    @author Lucas A Lima
*/

create database dbAssistec;

use dbAssistec;

drop table usuarios;

create table usuarios(
	id int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(50) not null unique,
    senha varchar(250) not null,
    funcao varchar(50) not null
);

insert into usuarios (nome,email,senha,funcao)
values ('Leandro Ramos','leandro@email.com',md5('123456'),'Administrador');
insert into usuarios (nome,email,senha,funcao)
values ('Vivian Carvalho','vivian@email.com',md5('123456'),'Atendente');
insert into usuarios (nome,email,senha,funcao)
values ('Gustavo Carvalho','gustavo@email.com',md5('456789'),'Técnico');
insert into usuarios (nome,email,senha,funcao)
values ('Lucas Ferreira','lucas@email.com',md5('457896'),'Técnico');
insert into usuarios (nome,email,senha,funcao)
values ('Rodrigo Lima','rodrigo@email.com',md5('455691'),'Técnico');
insert into usuarios (nome,email,senha,funcao)
values ('Isabela Araújo','isabela@email.com',md5('167798'),'Técnico');
insert into usuarios (nome,email,senha,funcao)
values ('Luana Oliveira','luana@email.com',md5('167798'),'Técnico');


describe usuarios;
select * from usuarios;

create table clientes(
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    cep char(9),
    endereço varchar(50) not null,
    numero varchar(12) not null,
    complemento varchar(30) not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    uf char(2) not null,
    fone varchar(15) not null
);

insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Lucas Lima','03572-070','Rua Lessa','3A','Casa 1','JD Santa Terezinha','São Paulo','SP','(11)96461-5367');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Antonio Elvis','03572-020','Rua Olga Fadel Abarca','183','Casa 2','JD Santa Terezinha','São Paulo','SP','(11)98537-6679');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Laissa Cazak','08041-730','Rua Erva Grossa','170','Casa 1','JD Lageado','São Paulo','SP','(11)96461-5399');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Roberto Justus','15370-496','Avenida Paulista','1510','Apartamento 45','Bela Vista','São Paulo','SP','(11)96541-5599');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Letícia Oliveira','32017-240','Rua Presidente Kennedy','170','Apartamento 33','Arcadia','Minas Gerais','MG','(31)97045-4050');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Raissa costa','08051-730','Rua Kennedy','130','Apartamento 15','Carrão','São Paulo','SP','(11)97045-4150');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Roberto Stan','03541-730','Rua Novais Andrade','1546','Apartamento 36','Tatuapé','São Paulo','SP','(11)95582-4150');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Ricardo Fostana','08051-456','Rua Luan Lins','5555','Casa 2','Itaquera','São Paulo','SP','(11)97045-4796');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Leila Butter','45782-730','Avenida Roberson','456','Apartamento 1','Republica','São Paulo','SP','(11)98855-4677');
insert into clientes(nome,cep,endereço,numero,complemento,bairro,cidade,uf,fone)
values('Henrique Robserson','08051-555','Rua Izilda','1566','Apartamento 66','Bela Vista','São Paulo','SP','(11)95566-4477');

describe clientes;
select * from clientes;

update clientes set fone='(11)97045-7777' where idcli = 5;
update clientes set bairro='Bela Vista' where idcli = 5;
update clientes set cidade='São Paulo' where idcli = 5;
update clientes set uf='SP' where idcli = 5;

create table servicos (
	os int primary key auto_increment,
    dataos timestamp default current_timestamp,
    produto varchar(50) not null,
    defeito varchar(150) not null,
    statusos varchar(30) not null,
    tecnico varchar(50),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
);

insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Lavadora Eletrolux 9KG','Não Liga','Aguardando','Luana Oliveira','399.00',10);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Lavadora Brastemp 12KG','Botões quebrados','Em reparo','Gustavo Carvalho','99.00',8);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Geladeira Eletrolux','Placa queimada','Em reparo','Luana Oliveira','499.00',5);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Microondas LG','Não Liga','Aguardando','Lucas Ferreira','199.00',7);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Fogão GE','Tomada quebrada','Em reparo','Rodrigo Lima','99.00',4);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Geladeira Brastemp','Não refrigera','Aguardando','Isabela Araújo','00.00',9);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Microondas Samsung','Não esquenta','Em reparo','Rodrigo Lima','159.00',2);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Lavadora GE 10KG','Não Centrifuga','Aguardando','Lucas Ferreira','299.00',6);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Geladeira GE','Tomada com defeito','Aguardando','Luana Oliveira','99.00',3);
insert into servicos (produto,defeito,statusos,tecnico,valor,idcli)
values ('Lavadora Eletrolux 12KG','Não enxagua','Em reparo','Isabela Araújo','499.00',1);

describe servicos;
select * from servicos;









