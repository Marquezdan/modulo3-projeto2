--SELECTS
 
--1. Qual empresa utiliza o maior número de tecnologias na última pesquisa (2/2022)?

SELECT tb_empresa.nome, COUNT(relatorios_tecnologias.id_tecnologias) AS qtd_tecnologias
FROM tb_empresa
INNER JOIN tb_relatorios ON tb_empresa.id_empresa = tb_relatorios.id_empresa
INNER JOIN relatorios_tecnologias ON tb_relatorios.id_relatorios = relatorios_tecnologias.id_relatorios
INNER JOIN tb_tecnologias ON relatorios_tecnologias.id_tecnologias = tb_tecnologias.id_tecnologias
WHERE tb_relatorios.data_comp BETWEEN '2023-07-01' AND '2023-12-31'
GROUP BY tb_empresa.id_empresa
ORDER BY qtd_tecnologias DESC
LIMIT 1;

--2. Qual empresa utilizava o menor número de tecnologias na pesquisa anterior (1/2022)?

SELECT tb_empresa.nome, COUNT(*) AS total_de_tecnologias
FROM tb_empresa
INNER JOIN tb_relatorios ON tb_relatorios.id_empresa = tb_empresa.id_empresa
INNER JOIN relatorios_tecnologias ON relatorios_tecnologias.id_relatorios = tb_relatorios.id_relatorios
INNER JOIN tb_tecnologias ON tb_tecnologias.id_tecnologias = relatorios_tecnologias.id_tecnologias
WHERE tb_relatorios.data_comp BETWEEN '2023-01-01' AND '2023-06-30'
GROUP BY tb_empresa.id_empresa
ORDER BY total_de_tecnologias ASC
LIMIT 1;

--3. Quantas empresas utilizam tecnologias da área de “Dados” atualmente?

SELECT COUNT(DISTINCT id_empresa) AS numero_de_empresas
FROM tb_relatorios , relatorios_tecnologias , tb_tecnologias
WHERE tb_relatorios.id_relatorios = relatorios_tecnologias.id_relatorios
AND relatorios_tecnologias.id_tecnologias = tb_tecnologias.id_tecnologias
AND tb_tecnologias.area = 'Dados'
AND tb_relatorios.data_comp BETWEEN '2023-07-01' AND '2023-12-31';

--4. Quantas empresas utilizam tecnologias que não são da área de “Dados” atualmente?

SELECT COUNT(DISTINCT id_empresa) AS numero_de_empresas
FROM tb_empresa 
WHERE id_empresa NOT IN 
(
    SELECT DISTINCT id_empresa 
    FROM tb_relatorios 
    INNER JOIN relatorios_tecnologias ON tb_relatorios.id_relatorios = relatorios_tecnologias.id_relatorios 
    INNER JOIN tb_tecnologias ON relatorios_tecnologias.id_tecnologias = tb_tecnologias.id_tecnologias 
    WHERE tb_tecnologias.area = 'Dados' 
    AND tb_relatorios.data_comp BETWEEN '2023-07-01' AND '2023-12-31'
);