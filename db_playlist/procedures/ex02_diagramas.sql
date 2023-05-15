-- Q 01

CREATE OR REPLACE VIEW vwPessoa
AS
SELECT CoPessoa, InTipoPessoa, NoPessoa
FROM tbPessoa;

SELECT * FROM vwPessoa;

-- Q 02

CREATE OR REPLACE VIEW vwMusico
AS
SELECT CoMusico, CoBanda, InVocal, VaSalario
FROM tbMusico;

SELECT * FROM vwMusico;

-- Q 03

DELIMITER $$
CREATE OR REPLACE PROCEDURE spBandaSalario(IN pNoBanda VARCHAR(50))
BEGIN

    SELECT NoPessoa, m.VaSalario
    FROM vwPessoa AS p
    INNER JOIN vwMusico AS m
    ON m.CoMusico = p.CoPessoa
    INNER JOIN tbBanda AS b
    ON b.CoBanda = m.CoBanda
    WHERE pNoBanda = b.NoBanda;

END $$
DELIMITER ;