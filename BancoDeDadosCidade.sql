create database BancoDeDados;

use BancoDeDados;

create table estado
(
cod_id int primary key auto_increment,
nome varchar(10) not null
);

create table cidade
(
cod_id int primary key auto_increment,
nome varchar(50) not null,
codEstado int not null,
foreign key (codEstado) references estado (cod_id)
);

create table pessoa
(
cod_id int primary key auto_increment,
nome varchar(10) not null,
altura float(10,2) not null,
nascimento date not null,
codCidade int not null,
foreign key (codCidade) references cidade (cod_id)
);

create table pedido 
(
cod_id int primary key auto_increment,
horario time not null,
endereco varchar(10) not null,
codCliente int ,
foreign key (codCliente) references pessoa(cod_id)
);

select p.nome, c.nome
from pessoa as p
join cidade as c
on c.cod_id = p.codCidade;