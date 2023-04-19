-- Q1

CREATE OR REPLACE VIEW vwautorobra
AS
SELECT a.IdAutor, NoAutor, n.NoNacionalidade, o.IdObra, o.NoObra, e.NoEditora, i.NoIdioma, o.NuAno, o.VaPreco
FROM tbautor AS a
INNER JOIN tbautorobra AS ao
ON ao.IdAutor = a.IdAutor
INNER JOIN tbobra AS o
ON ao.IdObra = o.IdObra
INNER JOIN tbnacionalidade AS n
ON n.IdNacionalidade = a.IdNacionalidade
INNER JOIN tbeditora AS e
ON e.IdEditora = o.IdEditora
INNER JOIN tbidioma AS i
ON i.IdIdioma = o.IdIdioma
ORDER BY NoAutor;

-- Q2

CREATE OR REPLACE VIEW vwAutorPublicacao
AS
SELECT NoAutor as 'Nome do autor', COUNT(IdObra) AS 'Quantidade de obras'
FROM vwautorobra
GROUP BY NoAutor;

-- Q3

CREATE OR REPLACE VIEW vwEmprestimoListagemGeral
AS

SELECT emp.IdEmprestimo, DaEmprestimo, DaPrevisaoDevolucao, op.NoOperador, ob.NoObra, ob.NoEditora, ob.NoIdioma, ob.NuAno, ob.NoAutor, ob.NoNacionalidade, alu.Nome, alu.TxEmail, alu.Curso
FROM tbemprestimoitem AS empi
INNER JOIN tbemprestimo AS emp
ON empi.IdEmprestimo = emp.IdEmprestimo
INNER JOIN tboperador AS op
ON op.IdOperador = emp.IdOperador
INNER JOIN vwalunolistagem AS alu
ON alu.NuMatricula = emp.NuMatricula
INNER JOIN vwautorobra AS ob
ON ob.IdObra = empi.IdObra;
