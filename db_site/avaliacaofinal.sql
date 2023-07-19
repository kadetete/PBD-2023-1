-- Q1

DELIMITER $$
CREATE OR REPLACE TRIGGER tgGuilhermeCadeteQ1
BEFORE INSERT ON tbpost
FOR EACH ROW
BEGIN
    DECLARE tgidpost INT(11);
    DECLARE tgcousuario INT(11);
    SELECT IdPost INTO tgidpost FROM tbpost WHERE NEW.IdPostOriginal = IdPost;
    SELECT CoUsuario INTO tgcousuario FROM tbpost WHERE NEW.CoUsuario = CoUsuario; 
    IF NEW.IdPostOriginal = tgidpost AND NEW.CoUsuario = tgcousuario THEN
    	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O usuário não pode comentar seu próprio post!';
	END IF; 
END; 
$$
DELIMITER ;

-- Q2

DELIMITER $$
CREATE OR REPLACE TRIGGER tgGuilhermeCadeteQ2
BEFORE INSERT ON tbpost
FOR EACH ROW
BEGIN
    IF NEW.TxPost LIKE 'idiota' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cara, o que tá acontecendo??? Você parece ser idiota!';
    ELSEIF NEW.TxPost LIKE 'gay' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cara, o que tá acontecendo??? Você parece ser idiota!';
    ELSEIF NEW.TxPost LIKE 'burro' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cara, o que tá acontecendo??? Você parece ser idiota!';
    END IF;
END $$
DELIMITER ;