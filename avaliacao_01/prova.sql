-- Questão 01

CREATE OR REPLACE VIEW vwCdBanda
AS
SELECT TxTituloCD AS Titulo, NuAno AS AnoLancamento, b.NoBanda AS Banda
FROM tbcd AS cd
INNER JOIN tbbandacd AS bcd
ON bcd.CoCD = cd.CoCD
INNER JOIN tbbanda AS b
ON b.CoBanda = bcd.CoBanda;

-- Questão 02

DELIMITER $$
CREATE FUNCTION fnTipoPessoa(valor INT)
RETURNS VARCHAR(50)
BEGIN
	DECLARE msg VARCHAR(50);
	IF valor = 1 THEN SET msg = "Músico";
    ELSEIF valor = 2 THEN SET msg = "Gravadora";
    ELSE SET msg = "Inválido";
    END IF;
    RETURN msg;
END $$
DELIMITER ;

SELECT CoPessoa, NoPessoa, fnTipoPessoa(InTipoPessoa) AS Tipo
FROM tbpessoa
ORDER BY NoPessoa;