-- Q1

DELIMITER $$
CREATE TRIGGER tgEstoqueMinimo
AFTER UPDATE ON tbproduto 
FOR EACH ROW
BEGIN
    DECLARE produto VARCHAR(50);

    IF NEW.QtEstoque <= OLD.QtEstoqueMinimo THEN
        SELECT NoProduto INTO produto FROM tbproduto WHERE NEW.QtEstoque <= OLD.QtEstoqueMinimo;
        INSERT INTO TbLog(DaOperacao, TxLog) VALUES
        (NOW(), CONCAT('ATENÇÃO: estoque atual de', produto, 'está abaixo da quantidade mínima definida. Providenciar reposição!'));
	END IF;
END; $$
DELIMITER ;

-- Q2

DELIMITER $$
CREATE TRIGGER tgAlteraProduto
AFTER UPDATE ON tbproduto
FOR EACH ROW
BEGIN
    DECLARE produto VARCHAR(50);

    IF OLD.VaProduto =! NEW.VaProduto THEN
        SELECT NoProduto INTO produto FROM tbproduto WHERE OLD.VaProduto =! NEW.VaProduto;
        INSERT INTO TbLog(DaOperacao, TxLog) VALUES
        (NOW(), CONCAT('O preço de', produto, 'foi alterado de', OLD.VaProduto, 'para', NEW.VaProduto));
    END IF;

    IF OLD.QtEstoque =! NEW.QtEstoque THEN
        SELECT NoProduto INTO produto FROM tbproduto WHERE OLD.QtEstoque =! NEW.QtEstoque;
        INSERT INTO TbLog(DaOperacao, TxLog) VALUES
        (NOW(), CONCAT('O estoque de', produto, 'foi alterado de', OLD.QtEstoque, 'para', NEW.QtEstoque, 'unidades.'));
    END IF;
END; $$
DELIMITER ;