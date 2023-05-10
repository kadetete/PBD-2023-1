-- Procedure para incluir banda em TbBanda(O código não é auto increment)

DELIMITER $$
CREATE OR REPLACE PROCEDURE spBandaInclui(IN pNoBanda VARCHAR(50))
BEGIN
	DECLARE proximo TINYINT;
    SELECT MAX(CoBanda) + 1 INTO proximo 
    	FROM TbBanda;
	INSERT INTO TbBanda(CoBanda, NoBanda)
    	VALUES (proximo, pNoBanda);
END $$
DELIMITER ;