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