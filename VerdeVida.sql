CREATE DATABASE verdeVida;

USE verdeVida;

CREATE TABLE
    voluntario (
        idvoluntario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(100) not null,
        cpf varchar(15) not null unique,
        funcao varchar(50) not null
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    planta (
        idplanta INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        especie VARCHAR(20) not null,
        tipo VARCHAR(20) not null
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    canteiro (
        idcanteiro INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        localizacao varchar(100) not null
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    plantio (
        idplantio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        dataplantio DATE NOT NULL,
        quantidadeplantada decimal(5, 2) not null,
        idvoluntario int UNSIGNED,
        idcanteiro int UNSIGNED,
        idplanta int UNSIGNED,
        FOREIGN KEY (idvoluntario) REFERENCES voluntario (idvoluntario),
        FOREIGN KEY (idcanteiro) REFERENCES canteiro (idcanteiro),
        FOREIGN KEY (idplanta) REFERENCES planta (idplanta)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    colheita (
        idcolheita INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        datacolheita DATE NOT NULL,
        quantidadecolhida decimal(5, 2) NOT NULL,
        idplantio int UNSIGNED,
        FOREIGN KEY (idplantio) REFERENCES plantio (idplantio)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    instituicao (
        idinstituicao int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nomeinstituicao VARCHAR(100) NOT NULL,
        endereco VARCHAR(100) NOT NULL
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    doacao (
        iddoacao int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        idcolheita INT UNSIGNED,
        idinstituicao INT UNSIGNED,
        quantidadedoada decimal(5, 2) not null,
        datadoacao date not null,
        FOREIGN KEY (idcolheita) REFERENCES colheita (idcolheita),
        FOREIGN KEY (idinstituicao) REFERENCES instituicao (idinstituicao)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

insert into
    voluntario (nome, cpf, funcao)
VALUES
    ('Davi', '111.222.333-11', 'Agricultor'),
    ('Vinicius', '444.555.666-22', 'Coordenador'),
    ('Clara', '777.888.999-33', 'Assistente');

insert into
    planta (especie, tipo)
VALUES
    ('Inhame', 'Tuberculo'),
    ('Cenoura', 'Legume'),
    ('Tomate', 'Fruta'),
    ('Alface', 'Folha'),
    ('Morango', 'Fruta');

insert into
    canteiro (localizacao)
VALUES
    ('Canteiro 1'),
    ('Canteiro 2'),
    ('Canteiro 3'),
    ('Canteiro 4'),
    ('Canteiro 5');

insert INTO
    plantio (
        dataplantio,
        quantidadeplantada,
        idvoluntario,
        idcanteiro,
        idplanta
    )
VALUES
    ('2025-08-20', 0.4, 1, 3, 3),
    ('2025-08-19', 0.5, 1, 2, 2),
    ('2025-05-30', 0.3, 3, 2, 1),
    ('2025-09-15', 0.6, 3, 1, 2),
    ('2025-09-18', 0.2, 1, 4, 4),
    ('2025-07-22', 0.7, 2, 5, 1);

INSERT INTO
    colheita (datacolheita, quantidadecolhida, idplantio)
VALUES
    ('2025-10-30', '1.5', 1),
    ('2025-11-1', '2', 2),
    ('2025-11-3', '3.4', 3),
    ('2025-11-5', '0.8', 1),
    ('2025-9-7', '3.5', 5);

insert into
    instituicao (nomeinstituicao, endereco)
VALUES
    ('Casa Esperança Verde', 'Rua Cosme e Damião,321'),
    (
        'Lar de Idosos Nossa senhora',
        'Rua Dom Bosco,982'
    ),
    (
        'Escola São Raimundo',
        'Rua Visconde de Sapucahy,132'
    ),
    (
        'Centro Comunitário Vida Nova',
        'Avenida Brasil,456'
    ),
    (
        'ONG Verde Vale',
        'Rua Da Vida,666'
    );

insert into
    doacao (
        idcolheita,
        idinstituicao,
        quantidadedoada,
        datadocao
    )
VALUES
    (3, 1, 1.6, '2025-11-4'),
    (2, 2, 0.5, '2025-11-3'),
    (1, 3, 1, '2025-10-31'),
    (5, 4, 2.5, '2025-9-9'),
    (5, 2, 2.5, '2025-9-10');


-- 1.
select
    *
from
    voluntario;

-- 2.
select
    pl.especie as Especies,
    c.localizacao as NomeCanteiro,
    p.dataplantio as DataPlantada
from
    plantio p
    inner join canteiro c on p.idcanteiro = c.idcanteiro
    inner join planta pl on p.idplanta = pl.idplanta;

-- 3.
select
    v.nome as Nome,
    pl.especie as Especie
from
    plantio p
    inner join voluntario v on p.idvoluntario = v.idvoluntario
    inner join planta pl on p.idplanta = pl.idplanta;

-- 4.
select
    co.idcolheita as Colheita,
    co.datacolheita as DataColhida,
    co.quantidadecolhida as QuantidadeEmKG,
    c.localizacao as NomeCanteiro
from
    colheita co
    inner join plantio p on co.idplantio = p.idplantio
    inner join canteiro c on p.idcanteiro = c.idcanteiro;

-- 5.
select
    i.nomeinstituicao as Instituicao,
    d.quantidadedoada as QuantidadeDoadaEmKG
from
    doacao d
    inner join instituicao i on d.idinstituicao = i.idinstituicao;

-- 6.
select
    i.nomeinstituicao as Instituicao,
    sum(d.quantidadedoada) as TotalDoadoEmKG
from
    doacao d
    inner join instituicao i on d.idinstituicao = i.idinstituicao
group by
    nomeinstituicao;

-- 7.
select
c.localizacao as Canteiro,
sum(co.idcolheita) as ColheitasRealizadas
from canteiro c
left join pantio p on p.idcanteiro = c.idcanteiro
left join colheita co on co.colheita = p.idcolheita;

