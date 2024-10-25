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

---------------------------------------------------- S E M A N A 02 ----------------------------------------------------

SELECT * FROM pg_tables WHERE schemaname = 'public'

CREATE TABLE obraDeArte_Artista (
	id SERIAL PRIMARY KEY,
	artista_id INTEGER NOT NULL,
	obra_de_arte_id INTEGER NOT NULL,
	FOREIGN KEY (artista_id) REFERENCES artista(id)
)

SELECT * FROM obraDeArte_Artista

ALTER TABLE obraDeArte_Artista
ADD CONSTRAINT fk_obra_arte_id 
FOREIGN KEY (obra_de_arte_id) REFERENCES obra_de_arte(id)

SELECT * FROM obraDeArte_Artista
SELECT * FROM obra_de_arte
SELECT * FROM artista

INSERT INTO artista (nome, data_nascimento, nascionalidade, biografia)
VALUES('VAN GOGH', '1999-02-10', 'Brasileiro', 'Criador de "a noite estrelada". ' );

UPDATE artista SET nome = 'VAN DOG' WHERE id = 2
UPDATE artista SET biografia = 'Copiador de "a noite estrelada". ' WHERE id = 2

INSERT INTO obraDeArte_Artista (artista_id, obra_de_arte_id) VALUES (1, 2),
INSERT INTO obraDeArte_Artista (artista_id, obra_de_arte_id) VALUES (2, 3)
INSERT INTO obraDeArte_Artista (artista_id, obra_de_arte_id) VALUES (2, 2)

SELECT COUNT (*) as total_obras_arte FROM obra_de_arte /*PARA SELECIONAR E CONTAR TODOS OS ITENS DA TABELA obra_de_arte*/

SELECT 
	obra_de_arte.titulo,
	obra_de_arte.anocriacao,
	obraDeArte_Artista.artista_id
FROM obra_de_arte
JOIN obraDeArte_Artista ON obra_de_arte.id = obraDeArte_Artista.obra_de_arte_id

JOIN artista ON obradearte_artista.artista_id = artista.id

SELECT 
	obra_de_arte.titulo,
	obra_de_arte.anocriacao,
	artista.nome,
	artista.nascionalidade
FROM obra_de_arte
JOIN obraDeArte_Artista ON obra_de_arte.id = obraDeArte_Artista.obra_de_arte_id

JOIN artista ON obradearte_artista.artista_id = artista.id

SELECT 
	o.titulo AS titulo_obra_de_arte,
	o.anocriacao AS ano_de_criacao_obra_de_arte,
	a.nome AS nome_artista,
	a.nascionalidade AS nascionalidade_artista
FROM obra_de_arte AS o
JOIN obraDeArte_Artista AS oa ON o.id = oa.obra_de_arte_id

JOIN artista AS a ON oa.artista_id = a.id

SELECT 
	a.nome AS nome_artista,
	COUNT(o.id) 
FROM obra_de_arte AS o
JOIN obraDeArte_Artista AS oa ON o.id = oa.obra_de_arte_id
JOIN artista AS a ON oa.artista_id = a.id
GROUP BY a.nome

SELECT 
* 
FROM obra_de_arte AS oa
JOIN obra_arte_exposicao AS oae ON oa.id = oae.obra_arte_id
JOIN exposicao AS e ON oae.exposicao_id = e.id