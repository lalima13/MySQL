/**
	Carrinho de compras
    @author Lucas Lima
*/

create database dbloja;

use dbloja;

create table carrinho(
	codigo int primary key auto_increment,
    produto varchar(50) not null,
    quantidade int not null,
    valor varchar(20) not null
);

alter table carrinho modify column valor decimal(10,2) not null;
alter table carrinho modify column produto varchar(250) not null;

show tables;
describe carrinho;

-- CRUB Create
insert into carrinho(produto,quantidade,valor)
values ('Caneta bic CX30',10,17.50);
insert into carrinho(produto,quantidade,valor)
value ('Pilha AA CX10',30,10.70);
insert into carrinho(produto,quantidade,valor)
value ('Agenda CX15',5,39.90);
insert into carrinho(produto,quantidade,valor)
value ('Mouse Wireless CX1',20,49.90);
insert into carrinho(produto,quantidade,valor)
value ('Teclado Wireless CX1',20,49.90);
insert into carrinho(produto,quantidade,valor)
value ('Mousepad CX1',20,15.99);

-- CRUB Read
select * from carrinho;

-- Operações matemáticas no banco de dados
select sum(valor * quantidade) as total from carrinho;

update carrinho set quantidade=10 where codigo = 4;
update carrinho set valor=79.80 where codigo = 4;
select * from carrinho where codigo = 4;
update carrinho set quantidade=40 where codigo = 3;
select * from carrinho where codigo = 3;


