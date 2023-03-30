CREATE TABLE tb_empresa
( id_empresa INT not null,
 nome VARCHAR (50),
 endereco VARCHAR (50),
 PRIMARY KEY (id_empresa));
 
 CREATE TABLE tb_tecnologias
 ( id_tecnologias INT not null,
  nome VARCHAR (50),
  area VARCHAR (50),
  PRIMARY KEY (id_tecnologias));
  
 CREATE TABLE tb_relatorios
 ( id_relatorios INT not null,
  id_empresa INT not null,
  data_comp DATE,
  PRIMARY KEY(id_relatorios),
  FOREIGN KEY (id_empresa) REFERENCES tb_empresa(id_empresa));
 
 
CREATE TABLE relatorios_tecnologias (
    id_tecnologias INT NOT NULL,
    id_relatorios INT NOT NULL,
    PRIMARY KEY (id_tecnologias, id_relatorios),
    FOREIGN KEY (id_tecnologias) REFERENCES tb_tecnologias(id_tecnologias),
    FOREIGN KEY (id_relatorios) REFERENCES tb_relatorios(id_relatorios));
 