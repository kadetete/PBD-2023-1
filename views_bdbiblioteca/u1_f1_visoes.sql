-- Q1
-- a) Criando a view

CREATE OR REPLACE VIEW vwnacionalidade 
AS
SELECT * FROM tbnacionalidade;

-- b) Validando a view.

INSERT INTO vwnacionalidade (IdNacionalidade, NoNacionalidade) 
VALUES (4, 'Argentino'), (5, 'Paraguaio');

UPDATE vwnacionalidade 
SET IdNacionalidade = 6 , NoNacionalidade='Alemão' 
WHERE IdNacionalidade = 4;

DELETE FROM vwnacionalidade 
WHERE IdNacionalidade = 5;

-- Q2

CREATE OR REPLACE VIEW vwautornacionalidade 
AS
SELECT IdAutor, NoAutor, n.NoNacionalidade
FROM tbautor as a
INNER JOIN tbnacionalidade AS n
ON n.IdNacionalidade = a.IdNacionalidade;

-- Q3

CREATE OR REPLACE VIEW vwlivroautor
AS
SELECT o.IdObra AS 'IdLivro', NoObra AS 'Título', a.NoAutor AS 'Autor(es)'
FROM tbobra AS o
INNER JOIN tbautorobra AS ao
ON ao.IdObra = o.IdObra
INNER JOIN tbautor AS a 
ON ao.IdAutor = a.IdAutor;

-- Q4

CREATE OR REPLACE VIEW vwemprestimoaluno
AS
SELECT IdEmprestimo, ope.NoOperador AS 'Operador', DaEmprestimo AS 'Data', alu.NuMatricula AS 'Matrícula do Aluno', alu.NoAluno AS 'Nome do Aluno', cur.NoCurso AS 'Curso'
FROM tbemprestimo AS emp
INNER JOIN tboperador AS ope
ON ope.IdOperador = emp.IdOperador
INNER JOIN tbaluno AS alu
ON emp.NuMatricula = alu.NuMatricula
INNER JOIN tbcurso as cur
ON cur.IdCurso = alu.IdCurso;

-- Q5

CREATE OR REPLACE VIEW vwemprestimolivro
AS
SELECT e.IdEmprestimo, DaEmprestimo, o.NoObra
FROM tbemprestimo as e
INNER JOIN tbemprestimoitem AS ei
ON ei.IdEmprestimo = e.IdEmprestimo
INNER JOIN tbobra as o
ON o.IdObra = ei.IdObra;
