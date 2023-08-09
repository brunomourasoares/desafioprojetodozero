drop database if exists pizzaria;
create database pizzaria;

use pizzaria;

create table cliente (
	codigo int primary key auto_increment,
	nome varchar(40) not null,
    endereco varchar(60) not null,
    telefone varchar(11) not null
);
alter table cliente auto_increment=1;
    
create table estoque(
	codigo int primary key,
    descricao varchar(30) not null,
	quantidade int not null,
    preco double not null
);

create table pizza(
	codigo int primary key,
	descricao varchar(30) not null,
    preco_peq double not null,
    preco_med double not null,
    preco_grd double not null,
    tempomedio time
);
    
create table ingredientes(
	codpizza int,
	codestoque int,
    primary key (codpizza, codestoque),
    foreign key (codpizza) references pizza(codigo),
    foreign key (codestoque) references estoque(codigo)
);

create table bebida(
	codigo int primary key,
    descricao varchar(30) not null,
    tipo char(1) not null,
    quantidade int,
    preco double
);

create table conta(
	codigo int primary key auto_increment,
    situacao boolean not null,
    tipo char(1) not null,
    cliente int,
    horario datetime not null,
    foreign key (cliente) references cliente(codigo)
);
alter table conta auto_increment=1;

create table conta_pizza(
	codigo int not null,
    pizza int not null,
    quantidade int not null,
    preco double not null,
    foreign key(codigo) references conta(codigo),
    foreign key(pizza) references pizza(codigo)
);

create table conta_bebida(
	codigo int not null,
    bebida int not null,
    quantidade int not null,
    preco double not null,
    foreign key (codigo) references conta(codigo),
    foreign key (bebida) references bebida(codigo)
);

create table compra(
	codigo int primary key auto_increment,
    dia date not null
);
alter table compra auto_increment=1;

create table fornecedor(
	codigo int primary key auto_increment,
	cnpj varchar(15),
    nome varchar(20),
    telefone varchar(11),
    endereco varchar(40),
    constraint unique_cnpj_fornecedor unique (cnpj)
);
alter table fornecedor auto_increment=1;

create table compra_bebida(
	compra int,
    bebida int,
    quantidade int,
    fornecedor int,
    primary key (compra, bebida),
    foreign key (compra) references compra(codigo),
    foreign key (bebida) references bebida(codigo),
    foreign key (fornecedor) references fornecedor(codigo)
);

create table compra_estoque(
	compra int,
    estoque int,
    quantidade int,
    fornecedor int,
    primary key (compra, estoque),
    foreign key (compra) references compra(codigo),
    foreign key (fornecedor) references fornecedor(codigo),
    foreign key (estoque) references estoque(codigo)
);