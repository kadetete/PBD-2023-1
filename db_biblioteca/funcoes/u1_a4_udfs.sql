DELIMITER $$
CREATE OR REPLACE FUNCTION fnAutorPublicacao(nome_autor TEXT)
RETURNS INT DETERMINISTIC
BEGIN	
	DECLARE qtdobras INT;        
    SELECT COUNT(o.IdObra) INTO qtdobras FROM tbobra AS o INNER JOIN tbautorobra AS ao ON o.IdObra = ao.IdObra INNER JOIN tbautor AS a ON ao.IdAutor = a.IdAutor WHERE nome_autor = a.NoAutor;        
    RETURN qtdobras;
    END $$
DELIMITER ;