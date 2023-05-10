-- Procedure que altera e inclui baseado em se o código foi digitado ou não.

DELIMITER $$
CREATE OR REPLACE PROCEDURE spBandaIncluiAltera(IN pNoBanda VARCHAR(50), IN pCoBanda TINYINT)
BEGIN
	DECLARE proximo TINYINT;
	IF pCoBanda IS NULL THEN
    	SELECT MAX(CoBanda) + 1 INTO proximo FROM tbbanda;
    	INSERT INTO tbbanda(CoBanda, NoBanda) VALUES (proximo, pNoBanda);
    ELSE
    	UPDATE tbbanda SET NoBanda = pNoBanda WHERE CoBanda = pCoBanda;
    END IF;
END $$
DELIMITER ;