-- create database restaurante;
-- use restaurante;
create table funcionarios (
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255),
cpf VARCHAR(14),
data_nascimento DATE,
endereco VARCHAR(255),
telefone VARCHAR(15),
email varchar(100),
cargo varchar(100),
salario decimal(10,2),
data_admissao date
);

desc funcionarios;

create table clientes (
id_cliente int primary key auto_increment,
nome varchar(255),
cpf varchar(14),
data_nascimento date,
endereco varchar(255),
telefone varchar(15),
email varchar(100),
data_cadastro date
);

desc clientes;

create table produtos (
id_produto int primary key auto_increment,
nome varchar(255),
descricao text,
preco decimal(10,2),
categoria varchar(100)
); 

desc produtos;

create table pedidos (
id_pedido int primary key auto_increment, 
id_cliente int,
 foreign key (id_cliente) references clientes (id_cliente),
id_funcionario int,
 foreign key (id_funcionario) references funcionarios (id_funcionario),
id_produto int,
 foreign key (id_produto) references produtos (id_produto),
quantidade int,
preco decimal(10,2),
data_pedido date, 
status varchar(50)
);

desc pedidos;

create table info_produtos (
id_info int primary key auto_increment,
id_produto int,
foreign key (id_produto) references produtos (id_produto),
ingredientes text,
fornecedor varchar(255)
);

desc info_produtos;