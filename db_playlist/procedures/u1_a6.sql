-- Q01

CREATE OR REPLACE VIEW vwObrasPreco
AS
SELECT 
NoObra AS 'Titulo', 
e.NoEditora AS 'Editora',
i.NoIdioma AS 'Idioma',
NuAno AS 'anoPublicacao',
VaPreco AS 'Preco'
FROM tbobra AS o
INNER JOIN tbeditora AS e
ON e.IdEditora = o.IdEditora
INNER JOIN tbidioma AS i
ON i.IdIdioma = o.IdIdioma;

-- Q02

DELIMITER $$
CREATE OR REPLACE PROCEDURE spAchaEditora(IN pNoEditora VARCHAR(50))
BEGIN
    SELECT * FROM vwobraspreco 
    WHERE Editora = pNoEditora;
END $$
DELIMITER ;

-- Q03

DELIMITER $$
CREATE OR REPLACE PROCEDURE 
spDadosAlunos(
    IN pNoAluno VARCHAR(50), 
    IN pTxIngresso VARCHAR(6), 
    IN pIdCurso TINYINT(6), 
    IN pTxEmail VARCHAR(50))
    
BEGIN

    DECLARE maxAluno INT(11);
    DECLARE pNuMatricula INT(11);
    DECLARE pIdEmail INT(11);
    
    SELECT MAX(NuMatricula) INTO maxAluno FROM tbaluno ;
    SET pNuMatricula = maxAluno + 1;
    SET pIdEmail = pNuMatricula;
    
    INSERT INTO tbaluno VALUES (pNuMatricula, pNoAluno, pTxIngresso, pIdCurso);
    INSERT INTO tbemail(IdEmail, TxEmail) VALUES (pIdEmail, pTxEmail);
    
END $$

DELIMITER ;


-- Q04

DELIMITER $$
CREATE OR REPLACE PROCEDURE spEmprestimoListar(IN pDaEmprestimo DATE)
BEGIN
    SELECT e.IdEmprestimo, DaEmprestimo, IdOperador, NuMatricula, 
    COUNT(ei.IdObra) AS qtdObras 
    FROM tbemprestimo AS e
    INNER JOIN tbemprestimoitem AS ei
    ON ei.IdEmprestimo = e.IdEmprestimo
    WHERE pDaEmprestimo = DaEmprestimo;
END $$
DELIMITER ;
