/* DOCUMENTO DE REQUISITO 

O cliente EvoluMinera faz parte da industria de mineração, um dos pilares da economia brasileira,
e solicitou a modelagem de um banco de dados para o cadastro de manutenção das máquinas.

Sabemos que a manutenção de máquinas é crucial para evitar paralisações e maximizar a eficiência. Com isso, a
 análise dos requisitos será realizada junto aos usuários para correta construção do produto. 
O cliente deseja que os scrips sejam construidos para o Banco MySQL. 


O cliente não quer nenhuma informação relativa a cargo, função ou encarregados, 
desejando somente as informações primárias das máquinas e suas ocorrências de manutencão.

---------------------------------------------------------------------------------------------------
O nosso cliente EvoluMinera, solicitou uma tabela para armazenar as máquinas, suas manutenções e incidentes 
 pela empresa. Seria muito complexo guardar todos esses registros no Excel, 
por isso, decidiu-se então criar um banco de dados.

*/

NOME                 | varchar(100)                           | NO   |     | NULL    |                |
| MODELO             | varchar(50)                            | NO   |     | NULL    |                |
| FABRICANTE         | varchar(100)                           | NO   |     | NULL    |                |
| DATA_AQUISICAO     | date                                   | NO   |     | NULL    |                |
| STATUS_OPERACIONAL | enum('Ativa','Inativa','Manutenção')   | NO   |     | NULL 

/*

Nosso gestor nos pediu a modelagem da com a seguinte regra de negócios:

MANUTENÇÃO - Não é obrigatório, mas pode ter situações de ser necessário e acontecer ter mais que uma. 
(0,n)

INCIDENTES - o propósito é não ter nenhum incidente, porém pode ocorrer mais que um 
(0,n)

*/


/* MODELAGEM CONCEITUAL (RASCUNHO)*/

/* 

TABELA/ENTIDADE:  MÁQUINA

CAMPO/ATRIBUTOS:

NOME - CARACTER(100)
MODELO - CARACTER(50)
FABRICANTE - CARACTER(100)
DATA_AQUISICAO - DATA


TABELA/ENTIDADE: MANUTENÇÃO

CAMPO/ATRIBUTOS:

TIPO - CARACTER(50)
CUSTO - DECIMAL (10,2)
DATA_MANUTENCAO - DATA
DURACÃO_HORAS - NUMMERICO

TABELA/ENTIDADE: INCIDENTE

CAMPO/ATRIBUTOS:

DESCRIÇÃO - CARACTER(255)
SEVERIDADE - CARACTER(20)
DATA_INCIDENTE - DATA
RISCO - CARCTER(20)
*/


/*MODELAGEM LÓGICA (BRMODELO)*/

/* cardinalidade 



/* MODELAGEM FÍSICA (inserção no banco de dados*/

CREATE DATABASE MINERACAO; 

USE MINERACAO; 

SHOW DATABASES;

CREATE TABLE MAQUINA(
	ID_MAQUINA INT PRIMARY KEY AUTO_INCREMENT,  -- AUTO_INCREMENT: Onde o banco cuidará da chave primária.
	NOME VARCHAR(100) NOT NULL, -- NOT NUL: Obrigatório ter o registro.
	MODELO VARCHAR(50) NOT NULL,
	FABRICANTE VARCHAR(100) NOT NULL,
	DATA_AQUISICAO DATE NOT NULL
	STATUS_OPERACIONAL ENUM ('Ativa', 'Inativa', 'Manutenção') NOT NULL
);

CREATE TABLE MANUTENCAO(
	ID_MANUTENCAO INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM ('preditiva','preventiva','corretiva') NOT NULL,
	CUSTO DECIMAL(10,2) NOT NULL,
	DURACAO_HORAS INT NOT NULL,
	TECNICO_RESPONSAVEL VARCHAR(100) NOT NULL,
	ID_MAQUINA INT,

	FOREIGN KEY(ID_MAQUINA)
	REFERENCES MAQUINA(ID_MAQUINA)
);

CREATE TABLE INCIDENTE(
	ID_INCIDENTE INT PRIMARY KEY AUTO_INCREMENT,
	DESCRICAO VARCHAR(255) NOT NULL,
	SEVERIDADE ENUM ('leve', 'baixa','moderada', 'alta', 'extrema') NOT NULL,
	RISCO ENUM('Baixo', 'Médio', 'Alto') NOT NULL,
	ID_MAQUINA INT,

	FOREIGN KEY(ID_MAQUINA)
	REFERENCES MAQUINA(ID_MAQUINA) 	
);

SHOW TABLEs;

USE MAQUINA;

INSERT INTO maquina (NOME, MODELO, FABRICANTE, DATA_AQUISICAO, STATUS_OPERACIONAL) VALUES
('Escavadeira Komatsu PC210', 'PC210', 'Komatsu', '2020-05-15', 'Ativa'),
('Carregadeira Cat 980M', '980M', 'Caterpillar', '2019-03-10', 'Manutenção'),
('Pá Carregadeira Volvo L60H', 'L60H', 'Volvo', '2021-07-20', 'Ativa'),
('Escavadeira Hitachi ZX350', 'ZX350', 'Hitachi', '2022-11-05', 'Ativa'),
('Trator Esteira John Deere 850K', '850K', 'John Deere', '2018-06-25', 'Inativa'),
('Escavadeira Caterpillar 320D', '320D', 'Caterpillar', '2020-02-15', 'Manutenção'),
('Carregadeira Liebherr L556', 'L556', 'Liebherr', '2023-01-18', 'Ativa'),
('Trator Esteira Case 1650M', '1650M', 'Case', '2021-09-12', 'Ativa'),
('Perfuratriz Atlas Copco ROC D7', 'ROC D7', 'Atlas Copco', '2017-12-01', 'Inativa'),
('Carregadeira Doosan DL300', 'DL300', 'Doosan', '2019-08-30', 'Manutenção'),
('Escavadeira Hyundai R220LC', 'R220LC', 'Hyundai', '2020-10-10', 'Ativa'),
('Trator Esteira New Holland D180', 'D180', 'New Holland', '2018-03-15', 'Inativa'),
('Carregadeira XCMG ZL50G', 'ZL50G', 'XCMG', '2022-05-27', 'Ativa'),
('Perfuratriz Sandvik DI550', 'DI550', 'Sandvik', '2016-04-09', 'Inativa'),
('Escavadeira Volvo EC480', 'EC480', 'Volvo', '2021-12-12', 'Ativa'),
('Carregadeira Caterpillar 966L', '966L', 'Caterpillar', '2020-09-03', 'Manutenção'),
('Trator Esteira Liebherr PR 716', 'PR 716', 'Liebherr', '2019-11-20', 'Ativa'),
('Escavadeira Komatsu PC360', 'PC360', 'Komatsu', '2022-08-14', 'Ativa'),
('Carregadeira Hyundai HL770', 'HL770', 'Hyundai', '2017-01-08', 'Inativa'),
('Pá Carregadeira Doosan DL200', 'DL200', 'Doosan', '2018-05-30', 'Manutenção'),
('Escavadeira John Deere 250G', '250G', 'John Deere', '2023-06-22', 'Ativa'),
('Trator Esteira Case 2050M', '2050M', 'Case', '2021-04-19', 'Manutenção'),
('Carregadeira XCMG ZL60G', 'ZL60G', 'XCMG', '2019-02-11', 'Ativa'),
('Escavadeira Hitachi ZX250', 'ZX250', 'Hitachi', '2022-10-15', 'Manutenção'),
('Trator Esteira Caterpillar D6', 'D6', 'Caterpillar', '2020-07-05', 'Inativa'),
('Perfuratriz Atlas Copco ROC L8', 'ROC L8', 'Atlas Copco', '2016-09-30', 'Inativa'),
('Carregadeira Volvo L220H', 'L220H', 'Volvo', '2021-03-10', 'Ativa'),
('Pá Carregadeira New Holland W190', 'W190', 'New Holland', '2018-11-25', 'Manutenção'),
('Escavadeira Hyundai HX330', 'HX330', 'Hyundai', '2020-06-15', 'Ativa'),
('Trator Esteira John Deere 700K', '700K', 'John Deere', '2019-01-05', 'Manutenção');

SELECT * FROM MAQUINA;

INSERT INTO manutencao (TIPO, CUSTO, DURACAO_HORAS, TECNICO_RESPONSAVEL, ID_MAQUINA) VALUES
('preditiva', 3500.00, 12, 'João Silva', 1),
('preventiva', 2000.00, 8, 'Maria Oliveira', 1),
('corretiva', 5000.00, 16, 'Carlos Souza', 1),
('preventiva', 2500.00, 10, 'Ana Costa', 2),
('preditiva', 3000.00, 9, 'Pedro Santos', 2),
('corretiva', 7000.00, 18, 'Juliana Ramos', 2),
('preventiva', 1800.00, 7, 'Paulo Lima', 3),
('preditiva', 3500.00, 13, 'Fernanda Alves', 3),
('corretiva', 8000.00, 20, 'Ricardo Melo', 3),
('preventiva', 2200.00, 8, 'Carolina Rocha', 4),
('preditiva', 4000.00, 14, 'Marcos Vieira', 4),
('corretiva', 5500.00, 16, 'Renato Araújo', 4),
('preditiva', 3200.00, 11, 'Isabela Teixeira', 5),
('preventiva', 2100.00, 9, 'Vinícius Matos', 5),
('corretiva', 6000.00, 17, 'Letícia Nogueira', 6),
('preditiva', 2900.00, 12, 'Rodrigo Pereira', 6),
('preventiva', 1700.00, 6, 'Camila Moreira', 6),
('corretiva', 7500.00, 22, 'Thiago Gomes', 7),
('preventiva', 2400.00, 10, 'André Carvalho', 7),
('preditiva', 3100.00, 14, 'Eduardo Reis', 8),
('corretiva', 6400.00, 20, 'Luana Martins', 8),
('preventiva', 2300.00, 8, 'Rafael Cunha', 9),
('preditiva', 2800.00, 12, 'Manuela Barros', 9),
('corretiva', 7200.00, 21, 'Felipe Araújo', 10),
('preventiva', 2500.00, 9, 'Eliane Costa', 10),
('preditiva', 3900.00, 15, 'Gustavo Silva', 11),
('corretiva', 5600.00, 18, 'Roberta Almeida', 11),
('preventiva', 2100.00, 7, 'Nathália Souza', 12),
('preditiva', 3300.00, 11, 'Gabriel Dias', 12),
('corretiva', 5500.00, 20, 'Laura Lima', 13),
('preventiva', 2700.00, 9, 'José Oliveira', 13),
('preditiva', 3100.00, 12, 'Sandra Santos', 14),
('corretiva', 6800.00, 21, 'Amanda Pereira', 14);


INSERT INTO incidente (DESCRICAO, SEVERIDADE, RISCO, ID_MAQUINA) VALUES
('Falha no sistema hidráulico', 'moderada', 'Médio', 1),
('Quebra do cabo de tração', 'alta', 'Alto', 1),
('Problema no sistema de iluminação', 'leve', 'Baixo', 2),
('Desgaste excessivo de pneus', 'baixa', 'Médio', 3),
('Vibração anormal no motor', 'moderada', 'Médio', 4),
('Pane no sistema elétrico', 'alta', 'Alto', 5),
('Trincas no chassi', 'extrema', 'Alto', 6),
('Falha no motor', 'alta', 'Alto', 7),
('Perda de pressão no sistema de ar', 'baixa', 'Baixo', 8),
('Aquecimento excessivo no motor', 'moderada', 'Médio', 9),
('Falha no sistema de transmissão', 'moderada', 'Médio', 10),
('Danos no sistema de controle de carga', 'alta', 'Alto', 11),
('Vibração excessiva no britador', 'moderada', 'Médio', 12),
('Desgaste de correntes de perfuração', 'baixa', 'Médio', 13),
('Problemas no sistema de freios', 'alta', 'Alto', 14),
('Fugas de óleo no motor', 'moderada', 'Médio', 15),
('Danos no sistema de suspensão', 'extrema', 'Alto', 16),
('Quebra de engrenagem do britador', 'alta', 'Alto', 17),
('Problema no sistema de direção', 'moderada', 'Médio', 18),
('Falha na comunicação do guindaste', 'baixa', 'Baixo', 19),
('Ruptura no sistema de escape', 'moderada', 'Médio', 20),
('Desgaste de peças de movimentação', 'baixa', 'Médio', 21),
('Problemas elétricos no sistema de controle', 'alta', 'Alto', 22),
('Quebra no mecanismo de perfuração', 'extrema', 'Alto', 23),
('Falha no sistema de tração', 'alta', 'Alto', 24),
('Excesso de vibração na estrutura do britador', 'moderada', 'Médio', 25),
('Pane no sistema de combustível', 'moderada', 'Médio', 26),
('Danos no sistema de suspensão hidráulica', 'alta', 'Alto', 27),
('Problema no sensor de temperatura do motor', 'leve', 'Baixo', 28),
('Desgaste nas peças de transmissão', 'moderada', 'Médio', 29),
('Aquecimento no sistema hidráulico', 'alta', 'Alto', 30);

select nome, fabricante, descricao, risco
    from maquina, incidente
   where fabricante = "Volvo" 
   and severidade = "Alto";








