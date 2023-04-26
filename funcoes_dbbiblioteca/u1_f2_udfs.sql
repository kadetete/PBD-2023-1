-- Questão 1
DELIMITER $$
CREATE OR REPLACE FUNCTION fnRele(cmd VARCHAR(4))
RETURNS VARCHAR(4) DETERMINISTIC
BEGIN
	DECLARE msg VARCHAR(50);
    IF cmd = "LOW" THEN SET msg = "Relé foi acionado.";
    ELSEIF cmd = "HIGH" THEN SET msg = "Relé foi desativado";
    ELSE SET msg = "Comando inválido";
    END IF;
    RETURN msg;
END $$
DELIMITER ;

-- Questão 2
DELIMITER $$
CREATE OR REPLACE FUNCTION fnAplicaDesconto(preco NUMERIC(9, 2), desconto NUMERIC(5, 2))
RETURNS NUMERIC(9, 2) DETERMINISTIC
BEGIN
   RETURN preco * (1 - desconto / 100);
END $$
DELIMITER ;