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

-- timestamp default current_timestamp (data e hora automático)
-- "Date" tipo de dados relacionado a data (YYYYMMDD)
create table estoque (
	codigo int primary key auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    quantidade int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
    
);

describe estoque;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Caneta BIC azul','BIC','20221231',100,10,'CX',28.75,'setor A p2');
insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Pendrive 16GB','Kingston','20251231',50,5,'UN',24.99,'setor B p9');
insert into estoque(produto,barcode,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Caneta Pilot','1111111111','Pilot','20211005',20,2,'CX',49.90,'setor A p3');
insert into estoque(produto,barcode,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Caderno','2222222222','Espiral','20221231',50,5,'UN',19.90,'setor A p4');
insert into estoque(produto,barcode,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Adaptador USB C','3333333333','Inova','20251231',150,15,'CX',89.90,'setor B p4');
insert into estoque(produto,barcode,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Cabo Auxiliar','4444444444','Elgin','20261231',9,10,'UN',19.90,'setor B p5');
insert into estoque(produto,barcode,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Cabo HDMI','5555555555','Samsung','20291231',20,2,'UN',24.90,'setor B p6');

select * from estoque;
-- Inventário do estoque (total)
select sum(quantidade * valor) as total from estoque;

-- Relatório de reposição do estoque 1
select * from estoque where quantidade < estoquemin;

-- Relatório de reposição do estoque 2
-- date_format() -> formatar a exibição da data
-- %d(dia) %m(mês) %y(ano 2 digítos) %Y(ano 4 digítos)
select codigo as código,produto,
date_format(dataval, '%d/%m/%Y') as data_validade,quantidade, estoquemin as estoque_mínimo from estoque where quantidade < estoquemin;

-- Relatório de validade dos produtos 1 
select codigo,produto,date_format(dataval, '%d/%m/%Y') as data_validade from estoque;

select codigo as código, produto, date_format(dataval, '%d/%m/%Y') as data_validade, datediff(dataval,curdate()) as dias_restantes from estoque;

/**
insert into estoque(produto,barcode,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Cabo HDMI','5555555555','Samsung','20291231',20,2,'UN',24.90,'setor B p6');
*/

update estoque set loc='setor B p7' where codigo = 7;
select * from estoque where codigo = 7;
update estoque set produto='Som Bluetooth',barcode='6666666666',fabricante='Philips',dataval='20301010',quantidade=10,estoquemin='1',medida='CX',
valor=89.90,loc='Setor B p9' where codigo = 5;
select * from estoque where codigo = 5;

delete from estoque where codigo = 4;










