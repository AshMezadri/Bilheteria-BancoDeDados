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
  `id_produtora` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `produtor` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nome_estudio` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NULL,  
  PRIMARY KEY (`id_produtora`)
);

CREATE TABLE IF NOT EXISTS `Filmes` (
  `id_filme` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome_filme` VARCHAR(45) NOT NULL,
  `duracao` TIME NOT NULL,
  `traducao_nome` VARCHAR(45) NOT NULL,
  `classificacao_etaria` VARCHAR(45) NOT NULL,
  `Produtoras_id_produtora` BIGINT NOT NULL,
  PRIMARY KEY (`id_filme`, `Produtoras_id_produtora`),
 
  CONSTRAINT `fk_Filmes_Produtoras1`
    FOREIGN KEY (`Produtoras_id_produtora`)
    REFERENCES `Produtoras` (`id_produtora`)
);

CREATE TABLE IF NOT EXISTS `Sessoes` (
  `id_sessao` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `horario` DATETIME NOT NULL,
  `sala` INT NOT NULL,
  `Filmes_id_filme` INT NOT NULL,
  `Filmes_Produtoras_id_produtora` BIGINT NOT NULL,
  PRIMARY KEY (`id_sessao`, `Filmes_id_filme`, `Filmes_Produtoras_id_produtora`),
  CONSTRAINT `fk_Sessoes_Filmes1`
    FOREIGN KEY (`Filmes_id_filme` , `Filmes_Produtoras_id_produtora`)
    REFERENCES `Filmes` (`id_filme` , `Produtoras_id_produtora`)
);

CREATE TABLE IF NOT EXISTS `Ingressos` (
  `id_ingresso` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tipo_ingresso` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `quantidade` INT NOT NULL,
  `Clientes_cpf_cliente` BIGINT NOT NULL,
  `Sessoes_id_sessao` INT NOT NULL,
  `Sessoes_Filmes_id_filme` INT NOT NULL,
  `Sessoes_Filmes_Produtoras_id_produtora` BIGINT NOT NULL,
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
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Hinda Keam', 'China', 'McGlynn-Flatley', 71967471012);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Rosita Smithson', 'Greece', 'Durgan, Hyatt and Feest', 68777958193);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Pen Shaughnessy', 'Nigeria', 'Bradtke, Wiegand and Von', 65955405334);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Aylmar Phlippi', 'Indonesia', 'Hane-Monahan', 40722162005);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Shawn Soro', 'Poland', 'Thompson LLC', 37951503966);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Willabella Febvre', 'Swaziland', 'Lowe-Hickle', 79687151975);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Ulrikaumeko Shipsey', 'China', 'Kuhlman Inc', 91508861614);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Jermaine Lewerenz', 'Finland', 'Bartoletti-Howell', 41580720317);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Nana Nurden', 'China', 'O''Keefe LLC', 69894912195);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Stevie Pantry', 'Indonesia', 'Stiedemann-Rempel', 57721070455);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Minerva Fearick', 'China', 'Kshlerin Inc', 90261831226);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Goran Teliga', 'Peru', 'Hegmann, Jenkins and DuBuque', 73377297697);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Keelia Downer', 'Philippines', 'Thompson and Sons', 22941549649);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Joachim Bard', 'Sweden', 'McGlynn-Stanton', 33911209548);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Wilt Maytom', 'Indonesia', 'Dietrich-McDermott', 16078829259);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Junia Catherick', 'Peru', 'Kemmer, Cronin and MacGyver', 86291524655);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Aube Clyma', 'Portugal', 'Graham and Sons', 69026158561);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Domenico Sedgemond', 'China', 'Bruen Inc', 19146771242);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Monroe Porritt', 'Ireland', 'O''Keefe, Bartell and Greenholt', 64497943603);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Melanie Lossman', 'Indonesia', 'Shields, Daniel and Leffler', 31681700234);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Yves Rickis', 'Russia', 'Turner, Wilderman and Klein', 43187256535);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Samara Comi', 'Philippines', 'Hintz, Hansen and Krajcik', 74024714075);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Electra Lindsey', 'Poland', 'Doyle, Lebsack and Lehner', 99416853176);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Happy Johns', 'Portugal', 'Harber-Cremin', 37134067527);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Norton Meriguet', 'China', 'Lind-Rutherford', 14707903858);

-- insert into filmes
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Holes in My Shoes', '2h 40m', 'Documentary', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Have Dreams, Will Travel', '2h 21m', 'Drama|Romance', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Kinbaku', '1h 38m', 'Documentary', 12);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Kahaani', '3h 11m', 'Crime|Drama|Thriller', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Reservoir Dogs', '2h 9m', 'Crime|Mystery|Thriller', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('History Is Made at Night', '1h 20m', 'Drama|Romance', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Princess and the Pony', '1h 50m', 'Children|Drama', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Carpetbaggers, The', '2h 10m', 'Drama', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Smilla''s Sense of Snow', '1h 45m', 'Drama|Thriller', 12);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Crazy/Beautiful', '2h 35m', 'Drama|Romance', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Face of Another, The (Tanin no kao)', '2h 20m', 'Drama|Sci-Fi', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Moon in the Gutter, The (La lune dans le caniveau)', '1h 56m', 'Drama', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Udaan', '2h 10m', 'Drama', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Christmas in August (Palwolui Christmas)', '2h 17m', 'Drama|Romance', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Hear No Evil', '1h 45m', 'Thriller', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Charleston', '2h 59m', 'Comedy|Crime', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Anderson Tapes, The', '1h 30m', 'Crime|Drama|Thriller', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Mummy, The', '2h 15m', 'Action|Adventure|Comedy|Fantasy|Horror|Thriller', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Mr. Magorium''s Wonder Emporium', '1h 49m', 'Children|Comedy|Fantasy', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Dry Summer (Susuz yaz) (Reflections)', '2h 13m', 'Drama', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Drummer-Crab (Le Crabe-Tambour)', '3h 10m', 'Adventure|Drama|War', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Yertle the Turtle and Other Stories', '1h 37m', 'Animation|Children', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Gentlemen', '1h 58m', 'Drama|Romance|Thriller', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('Bullhead (Rundskop)', '1h 40m', 'Crime|Drama', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classificacao_etaria) values ('First Love', '2h 27m', 'Comedy|Musical', 12);

-- insert into ingressos
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (1, 'Inteiro', 25, 1);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (2, 'Meia-entrada', 15, 1);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (3, 'Inteiro', 25, 3);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (4, 'Inteiro', 25, 5);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (5, 'Inteiro', 25, 2);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (6, 'Meia-entrada', 15, 7);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (7, 'Inteiro', 25, 3);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (8, 'Meia-entrada', 15, 7);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (9, 'Meia-entrada', 15, 6);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (10, 'Meia-entrada', 15, 5);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (11, 'Meia-entrada', 15, 4);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (12, 'Inteiro', 25, 8);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (13, 'Inteiro', 25, 8);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (14, 'Inteiro', 25, 6);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (15, 'Meia-entrada', 15, 4);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (16, 'Inteiro', 25, 7);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (17, 'Inteiro', 25, 4);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (18, 'Meia-entrada', 15, 1);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (19, 'Inteiro', 25, 4);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (20, 'Meia-entrada', 15, 7);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (21, 'Inteiro', 25, 8);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (22, 'Inteiro', 25, 6);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (23, 'Inteiro', 25, 8);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (24, 'Inteiro', 25, 4);
insert into Ingressos (id_ingresso, tipo_ingresso, preco, quantidade) values (25, 'Inteiro', 25, 7);

-- insert into sessões
insert into Sessoes (horario, sala) values ('22:46', 1);
insert into Sessoes (horario, sala) values ('17:01', 2);
insert into Sessoes (horario, sala) values ('12:37', 3);
insert into Sessoes (horario, sala) values ('19:04', 1);
insert into Sessoes (horario, sala) values ('13:29', 4);
insert into Sessoes (horario, sala) values ('16:37', 3);
insert into Sessoes (horario, sala) values ('13:40', 1);
insert into Sessoes (horario, sala) values ('12:49', 2);
insert into Sessoes (horario, sala) values ('16:46', 5);
insert into Sessoes (horario, sala) values ('22:20', 5);
insert into Sessoes (horario, sala) values ('12:32', 5);
insert into Sessoes (horario, sala) values ('14:50', 6);
insert into Sessoes (horario, sala) values ('15:58', 1);
insert into Sessoes (horario, sala) values ('22:40', 6);
insert into Sessoes (horario, sala) values ('16:30', 7);
insert into Sessoes (horario, sala) values ('19:55', 6);
insert into Sessoes (horario, sala) values ('16:30', 1);
insert into Sessoes (horario, sala) values ('22:32', 7);
insert into Sessoes (horario, sala) values ('15:59', 8);
insert into Sessoes (horario, sala) values ('20:37', 8);
insert into Sessoes (horario, sala) values ('19:46', 7);
insert into Sessoes (horario, sala) values ('12:08', 7);
insert into Sessoes (horario, sala) values ('16:09', 4);
insert into Sessoes (horario, sala) values ('17:43', 6);
insert into Sessoes (horario, sala) values ('18:28', 8);

-- selects

SELECT COUNT(*) FROM Clientes; 
SELECT * FROM Clientes;

SELECT COUNT(*) FROM Produtoras; 
SELECT * FROM Produtoras;

SELECT COUNT(*) FROM Filmes;
SELECT * FROM Filmes;

SELECT COUNT(*) FROM Sessoes;
Select * From Sessoes order by id_sessao;


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
UPDATE Filmes set nome_filme = 'Shrek', duracao = '2h 10m', genero_filme = 'Animation', classificacao_etaria = '12' WHERE id_filme = 1;
UPDATE Filmes set nome_filme = 'Barbie e o Castelo de Diamantes', duracao = '1h 10m', genero_filme = 'Animation|Adventure', classificacao_etaria = '10' WHERE id_filme = 2;
UPDATE Filmes set nome_filme = 'Cinderela', duracao = '1h 12m', genero_filme = 'Animation|Romance', classificacao_etaria = '12' WHERE id_filme = 3;
UPDATE Filmes set nome_filme = 'Hereditário', duracao = '2h 30m', genero_filme = 'Horror', classificacao_etaria = '18' WHERE id_filme = 4;
UPDATE Filmes set nome_filme = 'Garota Exemplar', duracao = '2h 13m', genero_filme = 'Crime|Horror|Drama', classificacao_etaria = '18' WHERE id_filme = 5;
UPDATE Filmes set nome_filme = 'It: A Coisa', duracao = '2h 27m', genero_filme = 'Horror', classificacao_etaria = '16' WHERE id_filme = 6;
UPDATE Filmes set nome_filme = 'Tartarugas Ninja', duracao = '1h 19m', genero_filme = 'Adventure', classificacao_etaria = '10' WHERE id_filme = 7;
UPDATE Filmes set nome_filme = 'Monster High', duracao = '1h 29m', genero_filme = 'Animation', classificacao_etaria = '12' WHERE id_filme = 8;
UPDATE Filmes set nome_filme = 'A Bela e a Fera', duracao = '1h 17m', genero_filme = 'Romance', classificacao_etaria = '12' WHERE id_filme = 9;
UPDATE Filmes set nome_filme = 'O Gato de Botas', duracao = '2h 20m', genero_filme = 'Animation|Adventure', classificacao_etaria = '12' WHERE id_filme = 10;

-- update sessoes
UPDATE Sessoes set horario= '22:45', sala= 2  Where id_sessao= 1 ;
UPDATE Sessoes set horario= '17:00', sala= 1  Where id_sessao= 2 ;
UPDATE Sessoes set horario= '12:30', sala= 4  Where id_sessao= 3 ;
UPDATE Sessoes set horario= '19:00', sala= 3  Where id_sessao= 4 ;
UPDATE Sessoes set horario= '13:30', sala= 3  Where id_sessao= 5 ;
UPDATE Sessoes set horario= '16:30', sala= 5  Where id_sessao= 6 ;
UPDATE Sessoes set horario= '13:30', sala= 2  Where id_sessao= 7 ;
UPDATE Sessoes set horario= '12:30', sala= 8  Where id_sessao= 8 ;
UPDATE Sessoes set horario= '16:40', sala= 3  Where id_sessao= 9 ;
UPDATE Sessoes set horario= '12:00', sala= 6  Where id_sessao= 10 ;

-- deletes

-- delete from produtoras
  DELETE FROM Produtoras WHERE  id_produtora=1;
  DELETE FROM Produtoras WHERE id_produtora=4;
  DELETE FROM Produtoras WHERE id_produtora=8;
  DELETE FROM Produtoras WHERE  id_produtora=10;
  DELETE FROM Produtoras WHERE id_produtora=6;
  
  -- delete from clientes
 DELETE FROM Clientes WHERE cpf_cliente = 2192522278;
 DELETE FROM Clientes WHERE cpf_cliente = 2478840783;
 DELETE FROM Clientes WHERE cpf_cliente = 4299279237;
 DELETE FROM Clientes WHERE cpf_cliente = 7117366372;
 DELETE FROM Clientes WHERE cpf_cliente = 6038105963;


  -- delete from filmes
  
  DELETE FROM Filmes WHERE id_filme = 11;
  DELETE FROM Filmes WHERE id_filme = 12;
  DELETE FROM Filmes WHERE id_filme = 13;
  DELETE FROM Filmes WHERE id_filme = 14;
  DELETE FROM Filmes WHERE id_filme = 15;
  

  -- delete sessoes
  DELETE FROM Sessoes WHERE id_sessao = 11;
  DELETE FROM Sessoes WHERE id_sessao = 12;
  DELETE FROM Sessoes WHERE id_sessao= 13;
  DELETE FROM Sessoes WHERE id_sessao = 14;
  DELETE FROM Sessoes WHERE id_sessao = 15;
