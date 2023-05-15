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