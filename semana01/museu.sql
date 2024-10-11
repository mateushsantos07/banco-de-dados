 CREATE TYPE TIPO_OBRA AS ENUM('PINTURA', 'ESCULTURA')

 CREATE TABLE obra_de_arte (
 	id SERIAL PRIMARY KEY NOT NULL,
 	titulo VARCHAR(100) NOT NULL,
 	descricao VARCHAR(200) NOT NULL,
 	anocriacao INTEGER NOT NULL, 
 	tipo_de_obra TIPO_OBRA NOT NULL
 );
SELECT * FROM obra_de_arte

CREATE TABLE artista (
	id SERIAL PRIMARY KEY NOT NULL,
	nome VARCHAR(100) NOT NULL,
	data_nascimento	DATE NOT NULL,
	nascionalidade VARCHAR(50) NOT NULL,
	biografia VARCHAR(200) NOT NULL
)
SELECT * FROM artista

CREATE TABLE exposicao (
	id SERIAL PRIMARY KEY NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	data_inicio DATE NOT NULL, 
	data_fim DATE NOT NULL,
	local VARCHAR(50) NOT NULL
)
SELECT * FROM exposicao

CREATE TABLE visitante (
	id SERIAL PRIMARY KEY NOT NULL, 
	nome VARCHAR(100) NOT NULL, 
	email VARCHAR(100) UNIQUE NOT NULL
)
SELECT * FROM visitante

CREATE TABLE visita(
	id SERIAL PRIMARY KEY,
	data_visita DATE NOT NULL,
	exposicao_id INTEGER NOT NULL,
	visitante_id INTEGER NOT NULL,
	FOREIGN KEY (exposicao_id) REFERENCES exposicao(id) ON DELETE CASCADE,
	FOREIGN KEY (visitante_id) REFERENCES visitante(id) ON DELETE CASCADE
)
SELECT * FROM visita

INSERT INTO visitante(nome,email) VALUES ('Mateus', 'mateus@gmail.com')
INSERT INTO visitante(nome,email) VALUES ('Maria', 'maria@gmail.com')
INSERT INTO visitante(nome,email) VALUES ('Joao', 'joao@gmail.com')
INSERT INTO visitante(nome,email) VALUES ('Pedrin', 'pedrin@gmail.com')

SELECT * FROM exposicao

INSERT INTO exposicao(titulo, data_inicio, data_fim, local) VALUES ('EXPOSIÇÃO 01', '2024-10-10', '2024-10-12', 'ADEC');
INSERT INTO exposicao(titulo, data_inicio, data_fim, local) VALUES ('EXPOSIÇÃO 02', '2024-10-12', '2024-10-14', 'CRUZ E SOUSA');
INSERT INTO exposicao(titulo, data_inicio, data_fim, local) VALUES ('EXPOSIÇÃO 03', '2024-10-14', '2024-10-16', 'VALÉRIO GOMES');
INSERT INTO exposicao(titulo, data_inicio, data_fim, local) VALUES ('EXPOSIÇÃO 04', '2024-10-16', '2024-10-18', 'ONDINA');
INSERT INTO exposicao(titulo, data_inicio, data_fim, local) VALUES ('EXPOSIÇÃO 05', '2024-10-18', '2024-10-20', 'SENAI')

SELECT * FROM visita


INSERT INTO visita (data_visita, exposicao_id, visitante_id) VALUES ('2024-10-10', 1, 4);
INSERT INTO visita (data_visita, exposicao_id, visitante_id) VALUES ('2024-10-10', 1, 3);
INSERT INTO visita (data_visita, exposicao_id, visitante_id) VALUES ('2024-10-10', 1, 2);
INSERT INTO visita (data_visita, exposicao_id, visitante_id) VALUES ('2024-10-10', 1, 1);

CREATE TABLE obra_arte_exposicao (
	id SERIAL PRIMARY KEY,
	obra_arte_id INTEGER NOT NULL,
	exposicao_id INTEGER NOT NULL
)

SELECT * FROM obra_arte_exposicao

ALTER TABLE obra_arte_exposicao
ADD CONSTRAINT fk_obra_arte_id_key
FOREIGN KEY (obra_arte_id) REFERENCES obra_de_arte(id)

ALTER TABLE obra_arte_exposicao
ADD CONSTRAINT fk_exposicao_id_key
FOREIGN KEY (exposicao_id) REFERENCES exposicao(id)

SELECT * FROM obra_de_arte

INSERT INTO obra_de_arte (titulo, descricao, anocriacao, tipo_de_obra) VALUES ('BLABLABLA1', 'BLABALBALBABA LA', 2024, 'PINTURA');
INSERT INTO obra_de_arte (titulo, descricao, anocriacao, tipo_de_obra) VALUES ('BLABLABLA2', 'BLABALWERHERHBA LA', 2023, 'ESCULTURA');
INSERT INTO obra_de_arte (titulo, descricao, anocriacao, tipo_de_obra) VALUES ('BLABLABLA3', 'BLABALBALAGIA', 2025, 'ESCULTURA');

SELECT * FROM obra_arte_exposicao

INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (1, 1);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (1, 2);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (2, 2);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (2, 3);
INSERT INTO obra_arte_exposicao (obra_arte_id, exposicao_id) VALUES (3, 1);