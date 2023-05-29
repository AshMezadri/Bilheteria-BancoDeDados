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
  `id_filme` INT NOT NULL,
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


insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Aubrette Gelder', 'Cameroon', 'Reinger Inc', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Hugues Moodie', 'China', 'Wisoky Inc', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Elyn Fosdyke', 'Yemen', 'Labadie Inc', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Sena Haggerstone', 'Portugal', 'Crona, Gulgowski and Jacobson', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Druci Spacey', 'Sweden', 'Christiansen, Ullrich and Thiel', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Huntley Derrick', 'Nigeria', 'Okuneva, Kshlerin and Friesen', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Allys Sandwich', 'Costa Rica', 'Sanford LLC', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Danila Tolwood', 'Mongolia', 'Murazik, Pagac and Romaguera', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Berkley Harnor', 'Norway', 'Hyatt-Hauck', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Carie Dabnot', 'Russia', 'Bailey and Sons', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Scotty Lessmare', 'Palestinian Territory', 'Ziemann, Schmeler and Gutkowski', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Cordy Keyson', 'China', 'Bergnaum Group', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Terrance Yakovich', 'Tanzania', 'Leuschke, Johnson and Koepp', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Kin Sirkett', 'China', 'Koss-Crona', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Kamillah Tiebe', 'Russia', 'Rolfson Group', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Vern MacCartan', 'United States', 'Stanton and Sons', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Vonnie Symons', 'Indonesia', 'Hermiston-Abbott', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Tobias Simmonett', 'Brazil', 'Stamm-Rosenbaum', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Robenia Nettles', 'Indonesia', 'Schuster Group', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Kacy Byas', 'Brazil', 'Thompson LLC', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Tommie Fratson', 'Philippines', 'Beer-Wilderman', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Fleming Ferriman', 'Saint Kitts and Nevis', 'Mann-Wolff', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Kelley Gabbott', 'Norway', 'Zemlak, Kub and Boyer', 1000000000000);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Thaine Mattingley', 'China', 'Ferry-Marquardt', 999999999999);
insert into Produtoras (produtor, pais, nome_studio, cnpj) values ('Georges Brabben', 'Poland', 'Crooks-Kling', 999999999999);



insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (1, 'Holes in My Shoes', '2h 40m', 'Documentary', 10);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (2, 'Have Dreams, Will Travel', '2h 21m', 'Drama|Romance', 16);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (3, 'Kinbaku', '1h 38m', 'Documentary', 12);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (4, 'Kahaani', '3h 11m', 'Crime|Drama|Thriller', 10);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (5, 'Reservoir Dogs', '2h 9m', 'Crime|Mystery|Thriller', 16);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (6, 'History Is Made at Night', '1h 20m', 'Drama|Romance', 18);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (7, 'Princess and the Pony', '1h 50m', 'Children|Drama', 14);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (8, 'Carpetbaggers, The', '2h 10m', 'Drama', 14);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (9, 'Smilla''s Sense of Snow', '1h 45m', 'Drama|Thriller', 12);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (10, 'Crazy/Beautiful', '2h 35m', 'Drama|Romance', 14);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (11, 'Face of Another, The (Tanin no kao)', '2h 20m', 'Drama|Sci-Fi', 10);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (12, 'Moon in the Gutter, The (La lune dans le caniveau)', '1h 56m', 'Drama', 16);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (13, 'Udaan', '2h 10m', 'Drama', 16);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (14, 'Christmas in August (Palwolui Christmas)', '2h 17m', 'Drama|Romance', 10);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (15, 'Hear No Evil', '1h 45m', 'Thriller', 10);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (16, 'Charleston', '2h 59m', 'Comedy|Crime', 18);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (17, 'Anderson Tapes, The', '1h 30m', 'Crime|Drama|Thriller', 18);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (18, 'Mummy, The', '2h 15m', 'Action|Adventure|Comedy|Fantasy|Horror|Thriller', 16);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (19, 'Mr. Magorium''s Wonder Emporium', '1h 49m', 'Children|Comedy|Fantasy', 14);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (20, 'Dry Summer (Susuz yaz) (Reflections)', '2h 13m', 'Drama', 14);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (21, 'Drummer-Crab (Le Crabe-Tambour)', '3h 10m', 'Adventure|Drama|War',107);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (22, 'Yertle the Turtle and Other Stories', '1h 37m', 'Animation|Children', 10);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (23, 'Gentlemen', '1h 58m', 'Drama|Romance|Thriller', 14);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (24, 'Bullhead (Rundskop)', '1h 40m', 'Crime|Drama', 18);
insert into Filmes (id_filme, nome_filme, duracao, genero_filme, classiicacao_etaria) values (25, 'First Love', '2h 27m', 'Comedy|Musical', 12);

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
