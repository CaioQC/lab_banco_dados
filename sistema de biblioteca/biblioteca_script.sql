CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE cliente (
    idade SMALLINT,
    id_cliente VARCHAR(10) PRIMARY KEY,
    cpf VARCHAR(15),
    nome VARCHAR(50),
    telefone VARCHAR(14),
    email VARCHAR(50)
);

CREATE TABLE autor (
    id_autor VARCHAR(10) PRIMARY KEY,
    telefone VARCHAR(14),
    email VARCHAR(50),
    idade SMALLINT,
    nome VARCHAR(50)
);

CREATE TABLE editora (
    id_editora VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(50),
    telefone VARCHAR(14),
    email VARCHAR(50),
    cnpj VARCHAR(15),
    endereco VARCHAR(50)
);

CREATE TABLE livro (
    isbn VARCHAR(10),
    genero VARCHAR(20),
    data_de_publicacao DATE,
    id_livro VARCHAR(10) PRIMARY KEY,
    titulo VARCHAR(50),
    id_editora VARCHAR(10),
    id_autor VARCHAR(10),
    estoque int,
    FOREIGN KEY (id_editora) REFERENCES editora(id_editora),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

CREATE TABLE funcionario (
    id_funcionario VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(50),
    idade SMALLINT
);

CREATE TABLE emprestimo (
    data_de_retorno DATE,
    duracao_emprestimo VARCHAR(50),
    data_de_emprestimo DATE,
    id_emprestimo VARCHAR(10) PRIMARY KEY,
    id_cliente VARCHAR(10),
    id_funcionario VARCHAR(10),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE itens_emprestimo_contem (
    id_livro VARCHAR(10),
    id_emprestimo VARCHAR(10),
    qtd_de_itens int,
    titulo_do_item VARCHAR(50),
    PRIMARY KEY (id_livro, id_emprestimo),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo)
);