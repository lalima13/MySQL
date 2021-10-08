/**
	E-commerce
    @author Lucas Lima
*/

create database dbloja;

use dbloja;  

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(50) unique not null,
    senha varchar(250) not null
);

insert into clientes (nome,email,senha)
values ('José de Assis','jose@email.com',md5('123456'));

select * from clientes;
describe clientes;

create table produtos (
	codigo int primary key auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
    
);

describe produtos;

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Caneta BIC azul','BIC','20221231',100,10,'CX',28.75,'setor A p2');
insert into produtos(produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Pendrive 16GB','Kingston','20251231',50,5,'UN',24.99,'setor B p9');
insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Caneta Pilot','1111111111','Pilot','20211005',20,2,'CX',49.90,'setor A p3');
insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Caderno','2222222222','Espiral','20221231',50,5,'UN',19.90,'setor A p4');
insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Adaptador USB C','3333333333','Inova','20251231',150,15,'CX',89.90,'setor B p4');
insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Cabo Auxiliar','4444444444','Elgin','20261231',9,10,'UN',19.90,'setor B p5');
insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,medida,valor,loc)
values
('Cabo HDMI','5555555555','Samsung','20291231',20,2,'UN',24.90,'setor B p6');

select * from produtos;
-- Inventário do estoque (total)
select sum(estoque * valor) as total from produtos;

-- Relatório de reposição do estoque 1
select * from produtos where estoque < estoquemin;

-- Relatório de reposição do estoque 2
-- date_format() -> formatar a exibição da data
-- %d(dia) %m(mês) %y(ano 2 digítos) %Y(ano 4 digítos)
select codigo as código,produto,
date_format(dataval, '%d/%m/%Y') as data_validade,estoque, estoquemin as estoque_mínimo from produtos where estoque < estoquemin;

-- Relatório de validade dos produtos 1 
select codigo,produto,date_format(dataval, '%d/%m/%Y') as data_validade from produtos;

select codigo as código, produto, date_format(dataval, '%d/%m/%Y') as data_validade, datediff(dataval,curdate()) as dias_restantes from produtos;

/**
insert into estoque(produto,barcode,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values
('Cabo HDMI','5555555555','Samsung','20291231',20,2,'UN',24.90,'setor B p6');
*/

update produtos set loc='setor B p7' where codigo = 7;
select * from produtos where codigo = 7;
update produtos set produto='Som Bluetooth',barcode='6666666666',fabricante='Philips',dataval='20301010',estoque=10,estoquemin='1',medida='CX',
valor=89.90,loc='Setor B p9' where codigo = 5;
select * from produtos where codigo = 5;

delete from produtos where codigo = 4;

create table pedidos (
	pedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    total decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
);

insert into pedidos(idcli) values (1);

select * from pedidos;

-- abertura do pedido

select pedidos.pedido, date_format(pedidos.dataped,'%d/%m/%Y - %H:%i') as data_pedido,
clientes.nome as cliente, clientes.email as e_mail
from pedidos inner join clientes on pedidos.idcli = clientes.idcli;

create table carrinho (
	pedido int not null,
    codigo int not null,
    quantidade int not null,
    foreign key(pedido) references pedidos(pedido),
    foreign key(codigo) references produtos(codigo)
	); 






