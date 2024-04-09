-- Selecionar todos os campos da tabela
SELECT * FROM Clientes
ORDER BY Nome, Sobrenome

-- Selecionar campos especificos da tabela
SELECT Nome, Sobrenome, Email FROM Clientes
ORDER BY Nome, Sobrenome

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE Nome = 'Adam'

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE Nome = 'Adam' AND Sobrenome = 'Reynolds'

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE Nome = 'Adam' AND Sobrenome = 'Reynolds' OR Sobrenome = 'Barr'

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE AceitaComunicados = 1

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE Nome LIKE 'G%' ORDER BY Nome, Sobrenome

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE Nome LIKE '%G%' ORDER BY Nome, Sobrenome

-- Inserir valores na tabela
INSERT INTO Clientes (Nome, Sobrenome, Email, AceitaComunicados, DataCadastro)
VALUES('Jacqueline', 'Braga', 'email@gmail.com', 1, GETDATE())

SELECT Nome, Sobrenome, Email FROM Clientes
WHERE Nome = 'Jacqueline'

INSERT INTO Clientes VALUES ('Maria', 'Braga', 'email@gmail.com', 1, GETDATE())


-- Atualizar valores na tabela (sempre usar o WHERE!!!!!)
UPDATE Clientes 
SET email = 'emailAtualizado@gmail.com'
WHERE ID = 1002

DELETE Clientes WHERE Id = 1002

SELECT * FROM Clientes
WHERE Nome = 'Jacqueline'

-- Serve para fazer roolback da tabela
BEGIN TRAN
ROLLBACK

DELETE Clientes

-- Criar uma tabela 
CREATE TABLE Produto (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Nome varchar(255) NOT NULL,
	Cor varchar(50) NULL,
	Preco decimal(13,2) NOT NULL,
	Tamanho varchar(5) NULL,
	Genero char(1) NULL
)

-- Alterar um campo de uma tabela (no caso está sendo adicionado uma constraint no campo Id).
ALTER TABLE Produto 
ADD CONSTRAINT Id PRIMARY KEY (Id)

ALTER TABLE Clientes 
ADD CONSTRAINT Id PRIMARY KEY (Id)

