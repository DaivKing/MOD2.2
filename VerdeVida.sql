CREATE DATABASE verdeVida;

USE verdeVida;

CREATE TABLE
    voluntario (
        idvoluntario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(100) not null,
        cpf varchar(15) not null unique
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
    colheita (
        idcolheita INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        datacolheita DATE NOT NULL,
        quantidadecolhida(KG) DECIMAL NOT NULL,
        idplantio int UNSIGNED,
        FOREIGN KEY (idplantio) REFERENCES plantio (idplantio)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    plantio (
        idplantio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        dataplantio DATE NOT NULL,
        quantidadeplantada(KG) decimal not null,
        idvoluntario int UNSIGNED,
        idcanteiro int UNSIGNED,
        idplanta int UNSIGNED,
        FOREIGN KEY (idvoluntario) REFERENCES voluntario (idvoluntario),
        FOREIGN KEY (idcanteiro) REFERENCES canteiro (idcanteiro),
        FOREIGN KEY (idplanta) REFERENCES planta (idplanta)
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
        quantidadedoada(KG) int not null,
        datadoacao date not null,
        FOREIGN KEY (idcolheita) REFERENCES colheita (idcolheita),
        FOREIGN KEY (idinstituicao) REFERENCES instituicao (idinstituicao)
    ) ENGINE = INNODB DEFAULT CHARSET = utf8mb4;

insert into
    voluntario (nome, cpf)
VALUES
    ('Davi', '111.222.333-11'),
    ('Vinicius', '444.555.666-22'),
    ('Clara', '777.888.999-33');

insert into
    planta (especie, tipo)
VALUES
    ('Inhame', 'Tuberculo'),
    ('Cenoura', 'Legume'),
    ('Tomate', 'Fruta');

insert into
    canteiro (localizacao)
VALUES
    ('Canteiro 1'),
    ('Canteiro 2'),
    ('Canteiro 3');

INSERT INTO colheita(datacolheita,quantidadecolhida,idplantio)
VALUES('2025-10-30','1.5',1),
('2025-11-1','2',2),
('2025-11-3','3.4',3);

insert INTO plantio(dataplantio,quantidadeplantada,idvoluntario,idcanteiro,idplanta)
VALUES('2025-08-20','0.4',1,3,3),
('2025-08-19','0.5',1,2,2),
('2025-05-30','0.3',3,2,1);

insert into insituicao(nomeinsituicao,endereco)
VALUES('Casa Esperança Verde','Rua Cosme e Damião,321'),
('Lar de Idosos Nossa senhora','Rua Dom Bosco,982'),
('Escola São Raimundo','Rua Visconde de Sapucahy,132');

insert into doacao(idcolheita,idinstituicao,quantidadedoada,datadocao)
VALUES(3,1,'1.6','2025-11-4'),
(2,2,'0.5','2025-11-3'),
(1,3,'1','2025-10-31');

