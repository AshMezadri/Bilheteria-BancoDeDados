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
  `id_produtora` BIGINT NOT NULL,
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



