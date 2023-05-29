-- exclui o banco e dados
-- Drop database bilheteria if exist; 

-- cria banco de dados 
CREATE Database  if not EXISTS bilheteria; 

-- usa o banco de dados bilheteria
USE bilheteria;

CREATE TABLE IF NOT EXISTS .`Clientes` (
  `cpf_cliente` BIGINT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf_cliente`))
;



CREATE TABLE IF NOT EXISTS .`Produtoras` (
  `id_produtora` BIGINT(11) NOT NULL,
  `produtor` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `nome_estudio` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NULL,
  PRIMARY KEY (`id_produtora`))
;



CREATE TABLE IF NOT EXISTS .`Filmes` (
  `id_filme` INT NOT NULL,
  `nome_filme` VARCHAR(45) NOT NULL,
  `duracao` TIME NOT NULL,
  `traducao_nome` VARCHAR(45) NOT NULL,
  `classificacao_etaria` VARCHAR(45) NOT NULL,
  `Produtoras_id_produtora` BIGINT(11) NOT NULL,
  PRIMARY KEY (`id_filme`, `Produtoras_id_produtora`),
 
  CONSTRAINT `fk_Filmes_Produtoras1`
    FOREIGN KEY (`Produtoras_id_produtora`)
    REFERENCES .`Produtoras` (`id_produtora`)
    );



CREATE TABLE IF NOT EXISTS .`Sessoes` (
  `id_sessao` INT NOT NULL,
  `horario` DATETIME NOT NULL,
  `sala` INT NOT NULL,
  `Filmes_id_filme` INT NOT NULL,
  `Filmes_Produtoras_id_produtora` BIGINT(11) NOT NULL,
  PRIMARY KEY (`id_sessao`, `Filmes_id_filme`, `Filmes_Produtoras_id_produtora`),
  CONSTRAINT `fk_Sessoes_Filmes1`
    FOREIGN KEY (`Filmes_id_filme` , `Filmes_Produtoras_id_produtora`)
    REFERENCES .`Filmes` (`id_filme` , `Produtoras_id_produtora`)
   
);


CREATE TABLE IF NOT EXISTS .`Ingressos` (
  `id_ingresso` INT NOT NULL,
  `tipo_ingresso` VARCHAR(45) NOT NULL,
  `preco` DOUBLE NOT NULL,
  `quantidade` INT NOT NULL,
  `Clientes_cpf_cliente` BIGINT(11) NOT NULL,
  `Sessoes_id_sessao` INT NOT NULL,
  `Sessoes_Filmes_id_filme` INT NOT NULL,
  `Sessoes_Filmes_Produtoras_id_produtora` BIGINT(11) NOT NULL,
  PRIMARY KEY (`id_ingresso`, `Clientes_cpf_cliente`, `Sessoes_id_sessao`, `Sessoes_Filmes_id_filme`, `Sessoes_Filmes_Produtoras_id_produtora`),

  CONSTRAINT `fk_Ingressos_Clientes1`
    FOREIGN KEY (`Clientes_cpf_cliente`)
    REFERENCES .`Clientes` (`cpf_cliente`)
    ,
  CONSTRAINT `fk_Ingressos_Sessoes1`
    FOREIGN KEY (`Sessoes_id_sessao` , `Sessoes_Filmes_id_filme` , `Sessoes_Filmes_Produtoras_id_produtora`)
    REFERENCES .`Sessoes` (`id_sessao` , `Filmes_id_filme` , `Filmes_Produtoras_id_produtora`)
   )
;



