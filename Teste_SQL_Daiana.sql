/*Construindo as tabelas*/

CREATE TABLE produto (
    ID int,
    codigo_de_barras VARCHAR(100),
    data_cadastro DATE
    );

CREATE TABLE fabricante (
    ID int,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    data_cadastro DATE,
    data_atualizacao DATE
    );
    
    CREATE TABLE produtoinfo (
    ID int,
    codigo_interno VARCHAR(100),
    dados_gerais VARCHAR(100),
    data_atualizacao DATE,
    data_cadastro DATE,
    descricao VARCHAR(100),
    imagem VARCHAR(100),
    idfabricante int,
    idorigem int,
    idproduto int
    );
    
    
    CREATE TABLE origem (
    ID int,
    nome VARCHAR(100),
   data_cadastro DATE,
   data_atualizacao DATE,
   preferencia VARCHAR(100)
    );
    
   /*Inserindo dados*/ 
insert into produto (ID, codigo_de_barras, data_cadastro)
values
('1', 7891234567890, '2023-10-30'),
('2', '7891234567891', '2013-09-25'),
('3', '7891234567887', '2023-09-30'),
('4', '789123456787', '2023-08-19');

insert into fabricante (ID, nome, cidade, estado, data_cadastro, data_atualizacao)
values
('32','Maria','Bauru','SP','2023-07-08','2023-07-10'),
('33','Antonio','Borborema','SP','2023-05-23','2023-05-30'),
('34','Augusto', 'Pederneiras','SP','2023-03-24','2023-04-01'),
('34','Jose', 'Botucatu','SP','2023-10-01','2023-10-05');


insert into produtoinfo (ID, codigo_interno, dados_gerais, data_atualizacao, data_cadastro, descricao,imagem, idfabricante, idorigem, idproduto)
values
('40','15678565970','dados','2023-04-09','2023-05-10','ipad','indisponível','356','357','367'),
('41','15678565980','dados','2023-04-07','2023-05-20','ipod','indisponível','357','358','369'),
('42','15672565960','dados','2023-04-10','2023-05-30','iphone','indisponível','360','361','370'),
('43','15678562994','dados','2023-10-01','2023-10-20','iphone','indisponível','369','450','470');

insert into origem (ID, nome, data_cadastro, data_atualizacao, preferencia)
values
('234','Distribuidora Ouro Preto','2020-03-07','2020-03-10','1'),
('245','Distribuidora  Norte','2020-03-27','2020-03-31','3'),
('247','Distribuidora Alvorada','2023-06-03','2023-07-15','2'),
('249','Distribuidora Araras','2023-08-23','2023-09-30','4');

/*verificando se as tabelas estão com as colunas que inseri*/
select*
From produto

select*
From fabricante

select*
From produtoinfo

select*
From origem

/*resposta da questao A) - Retornar os códigos de barras dos produtos cadastrados pela primeira vez nos últimos 10 dias*/

SELECT codigo_de_barras
FROM produto
WHERE data_cadastro >= DATE_SUB(CURDATE(), INTERVAL 10 DAY)
  AND id NOT IN (
    SELECT id
    FROM produto
    WHERE data_cadastro < DATE_SUB(CURDATE(), INTERVAL 10 DAY)
);

/*resposta da questao B)*/
SELECT *
FROM origem
WHERE data_cadastro >= '2020-03-01' AND data_cadastro <= '2020-03-31' AND data_atualizacao >= '2020-03-01' AND data_atualizacao <= '2020-03-31';

/*resposta da questao C)*/

UPDATE fabricante
SET nome = 'João'
WHERE nome = 'Maria';

/*resposta da questao D)*/
Select pi.descricao, pi.idfabricante, pi.codigo_interno
from produtoinfo pi
inner join(
SELECT codigo_de_barras
    FROM produto
    GROUP BY codigo_de_barras
);