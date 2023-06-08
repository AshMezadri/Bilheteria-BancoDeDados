-- exclui o banco e dados
Drop database if exists bilheteria; 

-- cria banco de dados 
CREATE Database  if not EXISTS bilheteria; 

-- usa o banco de dados bilheteria
USE bilheteria;

CREATE TABLE IF NOT EXISTS `Clientes` (
  `cpf_cliente` BIGINT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf_cliente`)
);

CREATE TABLE IF NOT EXISTS `Produtoras` (
  `id_produtora` INT NOT NULL AUTO_INCREMENT,
  `produtor` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nome_estudio` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NULL,  
  PRIMARY KEY (`id_produtora`)
);

CREATE TABLE IF NOT EXISTS `Filmes` (
  `id_filme` INT NOT NULL AUTO_INCREMENT,
  `nome_filme` VARCHAR(45) NOT NULL,
  `duracao` TIME NOT NULL,
  `genero_filme` VARCHAR(45) NOT NULL,
  `classificacao_etaria` VARCHAR(45) NOT NULL,
  `Produtoras_id_produtora` INT NOT NULL,
  PRIMARY KEY (`id_filme`, `Produtoras_id_produtora`),
 
  CONSTRAINT `fk_Filmes_Produtoras1`
    FOREIGN KEY (`Produtoras_id_produtora`)
    REFERENCES `Produtoras` (`id_produtora`)
);

CREATE TABLE IF NOT EXISTS `Sessoes` (
  `id_sessao` INT NOT NULL AUTO_INCREMENT,
  `horario` DATETIME NOT NULL,
  `sala` INT NOT NULL,
  `Filmes_id_filme` INT NOT NULL,
  `Filmes_Produtoras_id_produtora` INT NOT NULL,
  PRIMARY KEY (`id_sessao`, `Filmes_id_filme`, `Filmes_Produtoras_id_produtora`),
  CONSTRAINT `fk_Sessoes_Filmes1`
    FOREIGN KEY (`Filmes_id_filme` , `Filmes_Produtoras_id_produtora`)
    REFERENCES `Filmes` (`id_filme` , `Produtoras_id_produtora`)
);

CREATE TABLE IF NOT EXISTS `Ingressos` (
  `id_ingresso` INT NOT NULL AUTO_INCREMENT,
  `tipo_ingresso` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `quantidade` INT NOT NULL,
  `Clientes_cpf_cliente` BIGINT NOT NULL,
  `Sessoes_id_sessao` INT NOT NULL,
  `Sessoes_Filmes_id_filme` INT NOT NULL,
  `Sessoes_Filmes_Produtoras_id_produtora` INT NOT NULL,
  PRIMARY KEY (`id_ingresso`, `Clientes_cpf_cliente`, `Sessoes_id_sessao`, `Sessoes_Filmes_id_filme`, `Sessoes_Filmes_Produtoras_id_produtora`),
  CONSTRAINT `fk_Ingressos_Clientes1`
    FOREIGN KEY (`Clientes_cpf_cliente`)
    REFERENCES `Clientes` (`cpf_cliente`)
    ,
  CONSTRAINT `fk_Ingressos_Sessoes1`
    FOREIGN KEY (`Sessoes_id_sessao` , `Sessoes_Filmes_id_filme` , `Sessoes_Filmes_Produtoras_id_produtora`)
    REFERENCES `Sessoes` (`id_sessao` , `Filmes_id_filme` , `Filmes_Produtoras_id_produtora`)
);

-- insert into clientes
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (2192522278, 'Bette-ann', 'Bernard', 'bbernard0@netvibes.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (2478840783, 'Klement', 'Donoher', 'kdonoher1@rediff.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (4299279237, 'Nobe', 'Devaney', 'ndevaney2@over-blog.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (1251259305, 'Colby', 'Shipway', 'cshipway3@earthlink.net');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (4924545468, 'Haven', 'Mandres', 'hmandres4@answers.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (7117366372, 'La verne', 'Cheetam', 'lcheetam5@furl.net');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (5291283376, 'Ruprecht', 'Simmons', 'rsimmons6@is.gd');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (6940730841, 'Nobie', 'Heinish', 'nheinish7@nature.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (289498763, 'Cammy', 'Lemmer', 'clemmer8@aboutads.info');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (1073437253, 'Gilbertine', 'Shoebotham', 'gshoebotham9@ox.ac.uk');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (4540072158, 'Franz', 'Shellum', 'fshelluma@webs.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (8176180201, 'Colly', 'Bows', 'cbowsb@dot.gov');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (2798064140, 'Brian', 'Bette', 'bbettec@istockphoto.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (2764197079, 'Judie', 'Standbridge', 'jstandbridged@elegantthemes.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (9665685709, 'Mycah', 'Guppie', 'mguppiee@amazon.co.uk');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (5029400204, 'Ford', 'Ivashin', 'fivashinf@eepurl.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (7718100584, 'Allix', 'Arsey', 'aarseyg@eventbrite.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (6038105963, 'Donetta', 'Holdren', 'dholdrenh@sphinn.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (6597738200, 'Chelsy', 'McIntosh', 'cmcintoshi@rambler.ru');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (8834097939, 'Brockie', 'Cuerda', 'bcuerdaj@mysql.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (607190743, 'Goldina', 'Coules', 'gcoulesk@discovery.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (498481251, 'Stella', 'Dagleas', 'sdagleasl@bbb.org');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (2752760761, 'Sallie', 'Bugby', 'sbugbym@nydailynews.com');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (1892785644, 'Jase', 'Menilove', 'jmeniloven@ucsd.edu');
insert into Clientes (cpf_cliente, nome, sobrenome, email) values (4216579388, 'Rakel', 'Skace', 'rskaceo@nifty.com');

-- insert into produtoras
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Hinda Keam', 'China', 'McGlynn-Flatley', 71967471012);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Rosita Smithson', 'Greece', 'Durgan, Hyatt and Feest', 68777958193);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Pen Shaughnessy', 'Nigeria', 'Bradtke, Wiegand and Von', 65955405334);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Aylmar Phlippi', 'Indonesia', 'Hane-Monahan', 40722162005);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Shawn Soro', 'Poland', 'Thompson LLC', 37951503966);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Willabella Febvre', 'Swaziland', 'Lowe-Hickle', 79687151975);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Ulrikaumeko Shipsey', 'China', 'Kuhlman Inc', 91508861614);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Jermaine Lewerenz', 'Finland', 'Bartoletti-Howell', 41580720317);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Nana Nurden', 'China', 'O''Keefe LLC', 69894912195);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Stevie Pantry', 'Indonesia', 'Stiedemann-Rempel', 57721070455);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Minerva Fearick', 'China', 'Kshlerin Inc', 90261831226);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Goran Teliga', 'Peru', 'Hegmann, Jenkins and DuBuque', 73377297697);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Keelia Downer', 'Philippines', 'Thompson and Sons', 22941549649);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Joachim Bard', 'Sweden', 'McGlynn-Stanton', 33911209548);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Wilt Maytom', 'Indonesia', 'Dietrich-McDermott', 16078829259);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Junia Catherick', 'Peru', 'Kemmer, Cronin and MacGyver', 86291524655);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Aube Clyma', 'Portugal', 'Graham and Sons', 69026158561);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Domenico Sedgemond', 'China', 'Bruen Inc', 19146771242);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Monroe Porritt', 'Ireland', 'O''Keefe, Bartell and Greenholt', 64497943603);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Melanie Lossman', 'Indonesia', 'Shields, Daniel and Leffler', 31681700234);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Yves Rickis', 'Russia', 'Turner, Wilderman and Klein', 43187256535);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Samara Comi', 'Philippines', 'Hintz, Hansen and Krajcik', 74024714075);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Electra Lindsey', 'Poland', 'Doyle, Lebsack and Lehner', 99416853176);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Happy Johns', 'Portugal', 'Harber-Cremin', 37134067527);
insert into Produtoras (produtor, pais, nome_estudio, cnpj) values ('Norton Meriguet', 'China', 'Lind-Rutherford', 14707903858);

-- insert into filmes
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Holes in My Shoes', '02:40:00', 'Documentary', 10, 1);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Have Dreams, Will Travel', '02:21:00', 'Drama|Romance', 16, 2);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Kinbaku', '01:038:00', 'Documentary', 12, 3);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Kahaani', '03:11:00', 'Crime|Drama|Thriller', 10, 4);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Reservoir Dogs', '02:09:00', 'Crime|Mystery|Thriller', 16, 5);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('History Is Made at Night', '01:20:00', 'Drama|Romance', 18, 6);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Princess and the Pony', '01:50:00', 'Children|Drama', 14, 7);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Carpetbaggers, The', '02:10:00', 'Drama', 14, 8);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Smilla''s Sense of Snow', '01:45:00', 'Drama|Thriller', 12, 9);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Crazy/Beautiful', '02:35:00', 'Drama|Romance', 14, 10);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Face of Another, The (Tanin no kao)', '02:20:00', 'Drama|Sci-Fi', 10, 11);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Moon in the Gutter, The', '01:56:00', 'Drama', 16, 12);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Udaan', '02:10:00', 'Drama', 16, 13);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Christmas in August (Palwolui Christmas)', '02:17:00', 'Drama|Romance', 10, 14);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Hear No Evil', '01:45:00', 'Thriller', 10, 15);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Charleston', '02:10:00', 'Comedy|Crime', 18, 16);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Anderson Tapes, The', '01:30:00', 'Crime|Drama|Thriller', 18, 17);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Mr. Magorium''s Wonder Emporium', '01:45:00', 'Children|Comedy|Fantasy', 14, 18);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Dry Summer (Susuz yaz) (Reflections)', '02:13:00', 'Drama', 14, 19);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Drummer-Crab (Le Crabe-Tambour)', '03:10:00', 'Adventure|Drama|War', 18, 20);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Yertle the Turtle and Other Stories', '01:37:00', 'Animation|Children', 10, 21);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Gentlemen', '01:58:00', 'Drama|Romance|Thriller', 14, 22);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Bullhead (Rundskop)', '01:43:00', 'Crime|Drama', 18, 23);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('First Love', '02:27:00', 'Comedy|Musical', 12, 24);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria, Produtoras_id_produtora) values ('Mummy, The', '02:15:00', 'Action|Adventure|Comedy', 16, 25);

-- insert into sessões
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-05 10:00:00', 1, 1, 1);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-05 12:00:00', 2, 2, 2);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-05 14:00:00', 3, 3, 3);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-05 16:00:00', 4, 4, 4);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-05 18:00:00', 5, 5, 5);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-06 10:00:00', 1, 6, 6);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-06 12:00:00', 2, 7, 7);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-06 14:00:00', 3, 8, 8);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-06 16:00:00', 4, 9, 9);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-06 18:00:00', 5, 10, 10);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-07 10:00:00', 1, 11, 11);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-07 12:00:00', 2, 12, 12);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-07 14:00:00', 3, 13, 13);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-07 16:00:00', 4, 14, 14);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-07 18:00:00', 5, 15, 15);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-08 10:00:00', 1, 16, 16);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-08 12:00:00', 2, 17, 17);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-08 14:00:00', 3, 18, 18);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-08 16:00:00', 4, 19, 19);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-08 18:00:00', 5, 20, 20);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-09 10:00:00', 1, 21, 21);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-09 12:00:00', 2, 22, 22);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-09 14:00:00', 3, 23, 23);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-09 16:00:00', 4, 24, 24);
INSERT INTO Sessoes (horario, sala, Filmes_id_filme, Filmes_Produtoras_id_produtora) VALUES ('2023-06-09 18:00:00', 5, 25, 25);

-- insert into ingressos
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora)
	values ('Inteiro', 25, 1, 2192522278, 1, 1, 1);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 1, 2478840783, 2, 2, 2);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 3, 4299279237, 3, 3, 3);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 5, 1251259305, 4, 4, 4);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 2, 4924545468, 5, 5, 5);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 7, 7117366372, 6, 6, 6);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 3, 5291283376, 7, 7, 7);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 7, 6940730841, 8, 8, 8);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 6, 289498763, 9, 9, 9);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 5, 1073437253, 10, 10, 10);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 4, 4540072158, 11, 11, 11);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 8, 2798064140, 12, 12, 12);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 6, 2764197079, 13, 13, 13);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 4, 9665685709, 14, 14, 14);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 7, 5029400204, 15, 15, 15);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 4, 7718100584, 16, 16, 16);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 1, 6038105963, 17, 17, 17);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 4, 6597738200, 18, 18, 18);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Meia-entrada', 15, 7, 8834097939, 19, 19, 19);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 8, 607190743, 20, 20, 20);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 6, 498481251, 21, 21, 21);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 8, 2752760761, 22, 22, 22);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 4, 1892785644, 23, 23, 23);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 7, 4216579388, 24, 24, 24);
insert into Ingressos (tipo_ingresso, preco, quantidade, Clientes_cpf_cliente, Sessoes_id_sessao, Sessoes_Filmes_id_filme, Sessoes_Filmes_Produtoras_id_produtora) 
	values ('Inteiro', 25, 8, 8176180201, 25, 25, 25);

-- selects
SELECT COUNT(*) FROM Clientes; 
SELECT * FROM Clientes order by cpf_cliente ;

SELECT COUNT(*) FROM Produtoras; 
SELECT * FROM Produtoras order by id_produtora;

SELECT COUNT(*) FROM Filmes;
SELECT * FROM Filmes order by id_filme;

SELECT COUNT(*) FROM Sessoes;
Select * From Sessoes order by id_sessao;

SELECT COUNT(*) FROM Ingressos;
Select * From Ingressos order by id_ingresso;

SELECT Ingressos.id_ingresso, Ingressos.tipo_ingresso, Ingressos.preco, Ingressos.quantidade,
       Clientes.cpf_cliente, Clientes.email, Clientes.nome, Clientes.sobrenome
FROM Ingressos
INNER JOIN Clientes ON Ingressos.Clientes_cpf_cliente = Clientes.cpf_cliente;

-- updates
-- update clientes
UPDATE Clientes set nome='Stella',sobrenome= 'Bradbrook', email= 'sbradbrook0@wikipedia.org' Where cpf_cliente = 2192522278;
UPDATE Clientes set nome='Conny',sobrenome= 'Schorah', email= 'cschorah1@gravatar.com' Where cpf_cliente = 2478840783;
UPDATE Clientes set nome='Bicheno',sobrenome= 'Wat', email= 'wbicheno2@newyorker.com' Where cpf_cliente = 4299279237;
UPDATE Clientes set nome='Reinold',sobrenome= 'WaWilliamsont', email= 'rwilliamson3@ameblo.jp' Where cpf_cliente = 1251259305;
UPDATE Clientes set nome='Emmalynn',sobrenome= 'Exley', email= 'eexley4@state.tx.us' Where cpf_cliente = 4924545468;
UPDATE Clientes set nome='Roxy',sobrenome= 'Dawidowicz', email= 'rdawidowicz5@domainmarket.com' Where cpf_cliente = 7117366372;
UPDATE Clientes set nome='Kristi',sobrenome= 'Stubbe', email= 'kstubbe6@1688.com' Where cpf_cliente = 5291283376;
UPDATE Clientes set nome='Brig',sobrenome= 'Bariball', email= 'bbariball7@earthlink.net' Where cpf_cliente = 6940730841;
UPDATE Clientes set nome='Arv',sobrenome= 'Bourget', email= 'abourget8@ow.ly' Where cpf_cliente = 289498763;
UPDATE Clientes set nome='Uriah',sobrenome= 'Haysey', email= 'uhaysey9@ustream.tv' Where cpf_cliente = 1073437253;

-- update proutoras
UPDATE Produtoras set produtor='Jocelyn Dingate' , pais='Indonesia' WHERE id_produtora=1;
UPDATE Produtoras set produtor='Aurie Grinnikov' , pais='Slovenia' WHERE id_produtora=2;
UPDATE Produtoras set produtor='Sonni Lexa' , pais='Portugal' WHERE id_produtora=3;
UPDATE Produtoras set produtor='Kristoffer Frew' , pais='Sweden' WHERE id_produtora=4;
UPDATE Produtoras set produtor='Mariam Haughey' , pais='Kazakhstan' WHERE id_produtora=5;
UPDATE Produtoras set produtor='Mile Bidewell' , pais='Serbia' WHERE id_produtora=6;
UPDATE Produtoras set produtor='Felipa Elderton' , pais='China' WHERE id_produtora=7;
UPDATE Produtoras set produtor='Vinny MacKenney' , pais='Indonesia' WHERE id_produtora=8;
UPDATE Produtoras set produtor='Kerby Ciccarelli' , pais='Sweden' WHERE id_produtora=9;
UPDATE Produtoras set produtor='Logan Treherne' , pais='France' WHERE id_produtora=10;

-- update filmes
UPDATE Filmes set nome_filme = 'Shrek', duracao = '02:10:00', genero_filme = 'Animation', classificacao_etaria = '12' WHERE id_filme = 1;
UPDATE Filmes set nome_filme = 'Barbie e o Castelo de Diamantes', duracao = '01:10:00', genero_filme = 'Animation|Adventure', classificacao_etaria = '10' WHERE id_filme = 2;
UPDATE Filmes set nome_filme = 'Cinderela', duracao = '01:50:00', genero_filme = 'Animation|Romance', classificacao_etaria = '12' WHERE id_filme = 3;
UPDATE Filmes set nome_filme = 'Hereditário', duracao = '02:30:00', genero_filme = 'Horror', classificacao_etaria = '18' WHERE id_filme = 4;
UPDATE Filmes set nome_filme = 'Garota Exemplar', duracao = '02:13:00', genero_filme = 'Crime|Horror|Drama', classificacao_etaria = '18' WHERE id_filme = 5;
UPDATE Filmes set nome_filme = 'It: A Coisa', duracao = '02:27:00', genero_filme = 'Horror', classificacao_etaria = '16' WHERE id_filme = 6;
UPDATE Filmes set nome_filme = 'Tartarugas Ninja', duracao = '01:19:00', genero_filme = 'Adventure', classificacao_etaria = '10' WHERE id_filme = 7;
UPDATE Filmes set nome_filme = 'Monster High', duracao = '02:29:00', genero_filme = 'Animation', classificacao_etaria = '12' WHERE id_filme = 8;
UPDATE Filmes set nome_filme = 'A Bela e a Fera', duracao = '01:17:00', genero_filme = 'Romance', classificacao_etaria = '12' WHERE id_filme = 9;
UPDATE Filmes set nome_filme = 'O Gato de Botas', duracao = '02:20:00', genero_filme = 'Animation|Adventure', classificacao_etaria = '12' WHERE id_filme = 10;

-- update sessoes
UPDATE Sessoes set horario= '2023-06-05 22:40:00', sala= 2  Where id_sessao= 1 ;
UPDATE Sessoes set horario= '2023-06-05 17:00:00', sala= 1  Where id_sessao= 2 ;
UPDATE Sessoes set horario= '2023-06-06 12:30:00', sala= 4  Where id_sessao= 3 ;
UPDATE Sessoes set horario= '2023-06-06 19:00:00', sala= 3  Where id_sessao= 4 ;
UPDATE Sessoes set horario= '2023-06-07 13:30:00', sala= 3  Where id_sessao= 5 ;
UPDATE Sessoes set horario= '2023-06-07 16:30:00', sala= 5  Where id_sessao= 6 ;
UPDATE Sessoes set horario= '2023-06-08 13:30:00', sala= 2  Where id_sessao= 7 ;
UPDATE Sessoes set horario= '2023-06-08 12:30:00', sala= 8  Where id_sessao= 8 ;
UPDATE Sessoes set horario= '2023-06-09 16:40:00', sala= 3  Where id_sessao= 9 ;
UPDATE Sessoes set horario= '2023-06-09 12:00:00', sala= 6  Where id_sessao= 10 ;

-- update ingressos
UPDATE Ingressos set quantidade= '1' Where id_ingresso = 1 ;
UPDATE Ingressos set quantidade= '2' Where id_ingresso = 2 ;
UPDATE Ingressos set quantidade= '3' Where id_ingresso = 3 ;
UPDATE Ingressos set quantidade= '7' Where id_ingresso = 4 ;
UPDATE Ingressos set quantidade= '5' Where id_ingresso = 5 ;
UPDATE Ingressos set quantidade= '2' Where id_ingresso = 6 ;
UPDATE Ingressos set quantidade= '8' Where id_ingresso = 7 ;
UPDATE Ingressos set quantidade= '1' Where id_ingresso = 8 ;
UPDATE Ingressos set quantidade= '6' Where id_ingresso = 9 ;
UPDATE Ingressos set quantidade= '3' Where id_ingresso = 10 ;

-- deletes
-- delete ingressos
  DELETE FROM Ingressos WHERE id_ingresso = 1;
  DELETE FROM Ingressos WHERE id_ingresso = 2;
  DELETE FROM Ingressos WHERE id_ingresso= 3;
  DELETE FROM Ingressos WHERE id_ingresso = 4;
  DELETE FROM Ingressos WHERE id_ingresso = 5;
  
 -- delete sessoes
  DELETE FROM Sessoes WHERE id_sessao = 1;
  DELETE FROM Sessoes WHERE id_sessao = 2;
  DELETE FROM Sessoes WHERE id_sessao= 3;
  DELETE FROM Sessoes WHERE id_sessao = 4;
  DELETE FROM Sessoes WHERE id_sessao = 5;
  
-- delete from filmes
  DELETE FROM Filmes WHERE id_filme = 1;
  DELETE FROM Filmes WHERE id_filme = 2;
  DELETE FROM Filmes WHERE id_filme = 3;
  DELETE FROM Filmes WHERE id_filme = 4;
  DELETE FROM Filmes WHERE id_filme = 5;
  
-- delete from produtoras
  DELETE FROM Produtoras WHERE  id_produtora = 1;
  DELETE FROM Produtoras WHERE id_produtora=2;
  DELETE FROM Produtoras WHERE id_produtora=3;
  DELETE FROM Produtoras WHERE  id_produtora=4;
  DELETE FROM Produtoras WHERE id_produtora=5;
  
  -- delete from clientes
 DELETE FROM Clientes WHERE cpf_cliente = 2192522278;
 DELETE FROM Clientes WHERE cpf_cliente = 2478840783;
 DELETE FROM Clientes WHERE cpf_cliente = 4299279237;
 DELETE FROM Clientes WHERE cpf_cliente = 4924545468;
 DELETE FROM Clientes WHERE cpf_cliente = 1251259305;