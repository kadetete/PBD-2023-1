DELIMITER $$
CREATE FUNCTION fnFormataCPF(cpf VARCHAR(11))
RETURNS VARCHAR(14)
BEGIN
	DECLARE formatado VARCHAR(14);
    SET formatado = SUBSTRING(cpf, 1, 3); --003
    SET formatado = CONCAT(formatado, '.'); --003.
    SET formatado = CONCAT(formatado, SUBSTRING(cpf, 4, 3)); --003.491
    SET formatado = CONCAT(formatado, '.'); --003.491.
    SET formatado = CONCAT(formatado, SUBSTRING(cpf, 7, 3)); --003.491.973
    SET formatado = CONCAT(formatado, '-'); --003.491.973-
    SET formatado = CONCAT(formatado, SUBSTRING(cpf, 10, 2)); --003.491.973-22
    RETURN formatado;
END $$
DELIMITER ;