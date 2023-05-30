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
  PRIMARY KEY (`cpf_cliente`))
;



CREATE TABLE IF NOT EXISTS `Produtoras` (
  `id_produtora` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `produtor` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nome_estudio` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NULL,  
  PRIMARY KEY (`id_produtora`))


;



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
  `id_sessao` INT NOT NULL,
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
  `id_ingresso` INT NOT NULL,
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
   )
;

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


insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Holes in My Shoes', '2h 40m', 'Documentary', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Have Dreams, Will Travel', '2h 21m', 'Drama|Romance', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Kinbaku', '1h 38m', 'Documentary', 12);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Kahaani', '3h 11m', 'Crime|Drama|Thriller', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Reservoir Dogs', '2h 9m', 'Crime|Mystery|Thriller', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('History Is Made at Night', '1h 20m', 'Drama|Romance', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Princess and the Pony', '1h 50m', 'Children|Drama', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Carpetbaggers, The', '2h 10m', 'Drama', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Smilla''s Sense of Snow', '1h 45m', 'Drama|Thriller', 12);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Crazy/Beautiful', '2h 35m', 'Drama|Romance', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Face of Another, The (Tanin no kao)', '2h 20m', 'Drama|Sci-Fi', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Moon in the Gutter, The (La lune dans le caniveau)', '1h 56m', 'Drama', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Udaan', '2h 10m', 'Drama', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Christmas in August (Palwolui Christmas)', '2h 17m', 'Drama|Romance', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Hear No Evil', '1h 45m', 'Thriller', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Charleston', '2h 59m', 'Comedy|Crime', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Anderson Tapes, The', '1h 30m', 'Crime|Drama|Thriller', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Mummy, The', '2h 15m', 'Action|Adventure|Comedy|Fantasy|Horror|Thriller', 16);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Mr. Magorium''s Wonder Emporium', '1h 49m', 'Children|Comedy|Fantasy', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Dry Summer (Susuz yaz) (Reflections)', '2h 13m', 'Drama', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Drummer-Crab (Le Crabe-Tambour)', '3h 10m', 'Adventure|Drama|War',107);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Yertle the Turtle and Other Stories', '1h 37m', 'Animation|Children', 10);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Gentlemen', '1h 58m', 'Drama|Romance|Thriller', 14);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('Bullhead (Rundskop)', '1h 40m', 'Crime|Drama', 18);
insert into Filmes (nome_filme, duracao, genero_filme, classiicacao_etaria) values ('First Love', '2h 27m', 'Comedy|Musical', 12);


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

 DELETE FROM Clientes WHERE cpf_cliente = 2192522278;
 DELETE FROM Clientes WHERE cpf_cliente = 2478840783;
 DELETE FROM Clientes WHERE cpf_cliente = 4299279237;
 DELETE FROM Clientes WHERE cpf_cliente = 7117366372;
 DELETE FROM Clientes WHERE cpf_cliente = 6038105963;



UPDATE Produtoras set produtor='Jocelyn Dingate' , pais='Indonesia' WHERE cnpj= 71967471012;
UPDATE Produtoras set produtor='Aurie Grinnikov' , pais='Slovenia' WHERE cnpj= 68777958193;
UPDATE Produtoras set produtor='Sonni Lexa' , pais='Portugal' WHERE cnpj= 65955405334;
UPDATE Produtoras set produtor='Kristoffer Frew' , pais='Sweden' WHERE cnpj= 40722162005;
UPDATE Produtoras set produtor='Mariam Haughey' , pais='Kazakhstan' WHERE cnpj= 33911209548;
UPDATE Produtoras set produtor='Mile Bidewell' , pais='Serbia' WHERE cnpj= 19146771242;
UPDATE Produtoras set produtor='Felipa Elderton' , pais='China' WHERE cnpj= 64497943603;
UPDATE Produtoras set produtor='Vinny MacKenney' , pais='Indonesia' WHERE cnpj= 99416853176;
UPDATE Produtoras set produtor='Kerby Ciccarelli' , pais='Sweden' WHERE cnpj= 37134067527;
UPDATE Produtoras set produtor='Logan Treherne' , pais='France' WHERE cnpj= 14707903858;

  DELETE FROM Produtoras WHERE cnpj = 71967471012;
  DELETE FROM Produtoras WHERE cnpj = 68777958193;
  DELETE FROM Produtoras WHERE cnpj = 65955405334;
  DELETE FROM Produtoras WHERE cnpj = 19146771242;
  DELETE FROM Produtoras WHERE cnpj = 14707903858;

