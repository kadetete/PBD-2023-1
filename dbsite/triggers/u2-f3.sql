-- Q1

DELIMITER $$
CREATE TRIGGER tgNovoQtPosts
AFTER INSERT ON tbpost
FOR EACH ROW
BEGIN
    DECLARE tCoUsuario INT;
    SELECT CoUsuario INTO tCoUsuario FROM tbusuario;
    IF NEW.CoUsuario = tCoUsuario THEN
        UPDATE tbusuario SET QtPosts = QtPosts + 1;
    END IF;
END $$
DELIMITER ;

-- Q2

DELIMITER $$
CREATE TRIGGER tgExcluiPost
AFTER DELETE ON tbpost
FOR EACH ROW
BEGIN
    DECLARE tCoUsuario INT;
    SELECT CoUsuario INTO tCoUsuario FROM tbusuario;
    IF OLD.CoUsuario = tCoUsuario THEN
        UPDATE tbusuario SET QtPosts = QtPosts - 1;
    END IF;
END $$
DELIMITER ;

-- Q3

ALTER TABLE tbusuario ADD COLUMN DaNascimento DATE;

DELIMITER $$
CREATE TRIGGER tgDaNascimentoInsert
BEFORE INSERT ON tbusuario 
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(150);
    IF NEW.DaNascimento > DATE(NOW()) THEN
        SET msg = 'SUA DATA DE NASCIMENTO NÃO PODE SER POSTERIOR A HOJE';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
	END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER tgDaNascimentoUpdate
BEFORE UPDATE ON tbusuario 
FOR EACH ROW
BEGIN
    DECLARE msg VARCHAR(150);
    IF NEW.DaNascimento > DATE(NOW()) THEN
        SET msg = 'SUA DATA DE NASCIMENTO NÃO PODE SER POSTERIOR A HOJE';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
	END IF;
END $$
DELIMITER ;

-- Q4

DELIMITER $$
CREATE TRIGGER tgPostAntigo
BEFORE INSERT ON tbpost
FOR EACH ROW
BEGIN
    DECLARE dtComentario DATE;
    IF NEW.IdPostOriginal IS NOT NULL THEN
        SELECT DaPost INTO dtComentario FROM tbpost WHERE IdPost = NEW.IdPostOriginal;
        IF DATEDIFF(CURDATE(), dtComentario) > 5 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é permitido comentar em posts com mais de 5 dias';
        END IF;
    END IF;    
END $$
DELIMITER ;