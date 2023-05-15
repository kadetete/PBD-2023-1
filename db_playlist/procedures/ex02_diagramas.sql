-- Q 01

CREATE OR REPLACE VIEW vwPessoa
AS
SELECT CoPessoa, InTipoPessoa, NoPessoa
FROM tbPessoa;

SELECT * FROM vwPessoa;
