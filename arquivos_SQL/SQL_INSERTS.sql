 --INSERTS
INSERT  INTO tb_empresa VALUES
(1,'SENAC',' R. Carlos Matos, 86 - Centro, Nova Iguaçu - RJ'),
(2,'ABC CURSOS',  'Avenida São Paulo, 16 - Centro, RJ'),
(3,'QWERTY', ' Rua Jorge, 23 - Cordorvil, RJ'),
(4,'JP TEC', ' Avenida Portugal, 12 - Belford Roxo, RJ');

INSERT INTO tb_tecnologias VALUES
(1,'Python','Dados'),
(2,'JavaScript','Web DEV'),
(3,'PowerBI', 'Business Inteligence'),
(4,'UNIX', 'Game DEV');

INSERT INTO tb_relatorios (id_relatorios, id_empresa, data_comp) VALUES
(1, 1, '2023-02-23'),
(2, 2, '2023-02-23'),
(3, 3, '2023-02-23'),
(4, 4, '2023-02-23'),
(5, 1, '2023-08-01'),
(6, 2, '2023-08-01'),
(7, 3, '2023-08-01'),
(8, 4, '2023-08-01');

INSERT INTO relatorios_tecnologias (id_tecnologias, id_relatorios ) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 3),
(1, 3),
(4, 3),
(4, 4),
(2, 4),
(1, 5),
(2, 5),
(2, 6),
(3, 6),
(3, 7),
(4, 7),
(4, 8),
(2, 8);
 