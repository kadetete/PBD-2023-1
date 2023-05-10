-- ALtera o nome de uma tabela

DELIMITER $$
CREATE OR REPLACE PROCEDURE spBandaAltera(IN pNoBanda VARCHAR(50), IN pCoBanda TINYINT)
BEGIN
	UPDATE tbbanda SET NoBanda = pNoBanda WHERE CoBanda = pCoBanda;
END $$
DELIMITER ;