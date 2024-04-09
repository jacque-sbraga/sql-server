SELECT * FROM Produtos

-- COUNT - Contar quantas as linhas tem a tabela com uma condição
SELECT COUNT(*) FROM Produtos 

-- Cria um alias para a contagem total de produtos
SELECT COUNT(*) QuantidadeProdutos FROM Produtos 

SELECT COUNT(*) QuantidadeTamanhoM FROM Produtos WHERE Tamanho = 'M'

-- SUM - Retornar a quantidade total do valor de uma coluna
SELECT SUM(Preco) FROM Produtos
SELECT SUM(Preco) FROM Produtos WHERE Tamanho = 'M'
SELECT SUM(Preco) FROM Produtos WHERE Preco < 10.0
SELECT SUM(Preco) FROM Produtos WHERE Preco = 9.50

-- MAX - Retorna o maior valor de uma coluna
SELECT MAX(Preco) FROM Produtos WHERE Tamanho = 'M'

-- MIN - Retorna o menor valor de uma coluna
SELECT MIN(Preco) FROM Produtos

-- AVG - Retorna a média dos valores de uma coluna
SELECT AVG(Preco) FROM Produtos

SELECT AVG(Preco) FROM Produtos WHERE Tamanho = 'M'

-- Contacatenando colunas:
SELECT Nome + ' - ' + Cor FROM Produtos

-- NomeCor é o nome do alias gerado pela consulta
SELECT Nome + ' - ' + Cor NomeCor FROM Produtos 

-- UPPER - Transforma todo o texto em maíusculo
-- LOWER - Transforma todo o texto em minusculo
SELECT UPPER(Nome) + ' - ' + LOWER(Cor) NomeCor FROM Produtos


-- Adicionando uma nova coluna
ALTER TABLE Produtos
ADD DataCadastro DATETIME2 

UPDATE Produtos SET DataCadastro = GETDATE() 

-- Formatando uma data - parecido com a forma do C#
SELECT Nome, Cor, Preco, FORMAT(DataCadastro, 'dd-MM-yyyy HH:mm') FROM Produtos
SELECT Nome, Cor, Preco, FORMAT(DataCadastro, 'dd/MM/yyyy') FROM Produtos

-- Agrupamento de dados com base em uma condição
-- M - 7
-- G  10

SELECT Tamanho, COUNT(*) Quantidade FROM Produtos GROUP BY Tamanho

SELECT Tamanho, COUNT(*) Quantidade FROM Produtos WHERE Tamanho = '' GROUP BY Tamanho 

-- Ordem dos comandos: 
-- 1° SELECT * FROM, 2° WHERE, 3° GROUP BY, 4° ORDER BY - SENDO OS TRÊS ÚLTIMOS OPCIONAIS
SELECT Tamanho, COUNT(*) Quantidade FROM Produtos WHERE Tamanho <> '' GROUP BY Tamanho ORDER BY Quantidade DESC
SELECT Tamanho, COUNT(*) Quantidade FROM Produtos WHERE Tamanho <> '' GROUP BY Tamanho ORDER BY Quantidade


SELECT Cor, COUNT(*) QuantidadeCor FROM Produtos GROUP BY Cor

SELECT Genero, COUNT(*) Quantidade FROM Produtos GROUP BY Genero

-- PRIMARY KEY e FOREIGN KEY
CREATE TABLE dbo.Enderecos(
	Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	IdCliente int NULL,
	Rua varchar(255) NULL,
	Bairro varchar(255) NULL,
	Cidade varchar(255) NULL,
	Estado varchar(255) NULL,
	CONSTRAINT FK_EnderecosClientes FOREIGN KEY(IdCliente)
	REFERENCES dbo.Clientes(Id)
)

INSERT INTO dbo.Enderecos VALUES(1004, 'Rua Teste', 'Bairro Teste', 'Cidade Teste', 'Estado Teste')

SELECT * FROM dbo.Enderecos

-- JOIN - Junta duas tabelas. Ex.: Seleciona a tabela Clientes e junta com a tabela Endereços, onde Cliente.Id = EnderecosIdClinte
-- Para funcionar as tabelas precisam ter um relacionamento.
SELECT * 
FROM Clientes 
INNER JOIN Enderecos 
ON Clientes.Id = Enderecos.IdCliente 
WHERE Enderecos.IdCliente = 1004

SELECT * FROM Clientes INNER JOIN Enderecos ON Clientes.Id = Enderecos.IdCliente

-- Tem como usar um alias para reduzir a repetição do nome das tabelas
SELECT C.Nome, C.Email, E.Bairro FROM Clientes C INNER JOIN Enderecos E ON C.Id = E.IdCliente

