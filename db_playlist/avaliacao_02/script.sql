-- Q01

DELIMITER $$
CREATE OR REPLACE FUNCTION fnGuilhermeCadete(num NUMERIC)
RETURNS VARCHAR(50)
BEGIN
	DECLARE msg VARCHAR(50);
	IF num = 1 OR num = 2 THEN
    	SET msg = 'Negativa';
    ELSEIF num = 3 THEN
    	SET msg = 'Neutra';
    ELSEIF num = 4 OR num = 5 THEN 
    	SET msg = 'Positiva';
    ELSE 
    	SET msg = 'Número inválido';
    END IF;
    RETURN msg;
END $$
DELIMITER ;

-- Q02

CREATE OR REPLACE VIEW vwGuilhermeCadete
AS
SELECT NoBanda, cd.TxTituloCD, p.NoPessoa, COUNT(mus.CoMusica) AS qtdMusica
FROM tbbanda AS b
INNER JOIN tbbandacd AS bcd
ON bcd.CoBanda = b.CoBanda
INNER JOIN tbcd AS cd
ON cd.CoCD = bcd.CoCD
INNER JOIN tbgravadora AS grav
ON grav.CoGravadora = cd.CoGravadora
INNER JOIN tbpessoa AS p
ON p.CoPessoa = grav.CoGravadora
INNER JOIN tbmusica AS mus
ON mus.CoCD = cd.CoCD
WHERE p.InTipoPessoa = 2;


-- Q03

DELIMITER $$
CREATE OR REPLACE PROCEDURE spGuilhermeCadete(IN pCoPessoa SMALLINT(6))
BEGIN
	DECLARE tipoPessoa SMALLINT(6);
    SELECT InTipoPessoa INTO tipoPessoa 
    FROM tbpessoa WHERE CoPessoa = pCoPessoa;
    
	IF tipoPessoa = 1 THEN
    	DELETE FROM tbmusico WHERE CoMusico = pCoPessoa;
    	DELETE FROM tbpessoa WHERE CoPessoa = pCoPessoa;
	ELSE
    	DELETE FROM tbgravadora WHERE CoGravadora = pCoPessoa;
    	DELETE FROM tbpessoa WHERE CoPessoa = pCoPessoa;
    END IF;
END $$
DELIMITER ;