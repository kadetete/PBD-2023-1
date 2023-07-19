ALTER TABLE tbproduto ADD COLUMN QtEstoqueMinimo SMALLINT(6);

UPDATE `tbproduto` SET `QtEstoqueMinimo` = '5' WHERE `tbproduto`.`CoProduto` = 1; 
UPDATE `tbproduto` SET `QtEstoqueMinimo` = '5' WHERE `tbproduto`.`CoProduto` = 2; 
UPDATE `tbproduto` SET `QtEstoqueMinimo` = '5' WHERE `tbproduto`.`CoProduto` = 3; 
UPDATE `tbproduto` SET `QtEstoqueMinimo` = '5' WHERE `tbproduto`.`CoProduto` = 4; 
UPDATE `tbproduto` SET `QtEstoqueMinimo` = '5' WHERE `tbproduto`.`CoProduto` = 5;

DELIMITER $$

CREATE TRIGGER tgEstoqueMinimo
BEFORE UPDATE
ON tbproduto FOR EACH ROW

BEGIN
    DECLARE msg VARCHAR(150);
    IF NEW.QtEstoque <= OLD.QtEstoqueMinimo THEN
        SET msg = 'ATENÇÃO! O estoque está igual ou menor a quantidade mínima recomendada!';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END; $$

DELIMITER ;