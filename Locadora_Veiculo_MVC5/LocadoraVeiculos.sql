

/* ============== Exclui Tabelas e Constraints se existir =============*/

IF (OBJECT_ID('FK_Modelo','F') IS NOT NULL)
BEGIN
	ALTER TABLE [dbo].[Modelo] DROP CONSTRAINT FK_Modelo
END

IF (OBJECT_ID('FK_Automovel','F') IS NOT NULL)
BEGIN
	ALTER TABLE [dbo].[Automovel] DROP CONSTRAINT FK_Automovel
END

IF(OBJECT_ID('FK_Locacao_Auto','F') IS NOT NULL)
BEGIN
	ALTER TABLE [dbo].[Locacao] DROP CONSTRAINT FK_Locacao_Auto
END

IF(OBJECT_ID('FK_Locacao_Cliente','F') IS NOT NULL)
BEGIN
	ALTER TABLE [dbo].[Locacao] DROP CONSTRAINT FK_Locacao_Cliente
END

IF OBJECT_ID('dbo.Marca','U') IS NOT NULL DROP TABLE [dbo].[Marca];
IF OBJECT_ID('dbo.Modelo','U') IS NOT NULL DROP TABLE [dbo].[Modelo];
IF OBJECT_ID('dbo.Automovel','U') IS NOT NULL DROP TABLE [dbo].[Automovel];
IF OBJECT_ID('dbo.Cliente','U') IS NOT NULL DROP TABLE [dbo].[Cliente];
IF OBJECT_ID('dbo.Locacao','U') IS NOT NULL DROP TABLE [dbo].[Locacao];


/* ============== Cria As Tabelas =========================================== */

CREATE TABLE [dbo].[Marca](
[MarcaID] INT IDENTITY(1,1) CONSTRAINT PK_Marca PRIMARY KEY (MarcaID),
[NomeMarca] NVARCHAR(60)
);

CREATE TABLE [dbo].[Modelo](
[ModeloID] INT IDENTITY(1,1) CONSTRAINT PK_Modelo PRIMARY KEY (ModeloID),
[MarcaID] INT CONSTRAINT FK_Modelo FOREIGN KEY (MarcaID) REFERENCES [dbo].[Marca] (MarcaID),
[NomeModelo] NVARCHAR(60)
);

CREATE TABLE [dbo].[Automovel](
[AutomovelID] INT IDENTITY(1,1) CONSTRAINT PK_Automovel PRIMARY KEY (AutomovelID),
[ModeloID] INT CONSTRAINT FK_Automovel FOREIGN KEY (ModeloID) REFERENCES [dbo].[Modelo] (ModeloID),
[PlacaAutomovel] NVARCHAR(8),
[AnoAutomovel] NVARCHAR(4)
);

CREATE TABLE [dbo].[Cliente](
[ClienteID] INT IDENTITY(1,1) CONSTRAINT PK_Cliente PRIMARY KEY (ClienteID),
[NomeCliente] NVARCHAR(150),
[EmailCliente] NVARCHAR(100),
[CpfCliente] NVARCHAR(11),
[DataCadastro] SMALLDATETIME DEFAULT GETDATE()
);

CREATE TABLE [dbo].[Locacao](
[LocacaoID] INT IDENTITY(1,1) CONSTRAINT PK_Locacao PRIMARY KEY (LocacaoID),
[AutomovelID] INT CONSTRAINT FK_Locacao_Auto FOREIGN KEY (AutomovelID) REFERENCES [dbo].[Automovel] (AutomovelID) ON DELETE NO ACTION,
[ClienteID] INT CONSTRAINT FK_Locacao_Cliente FOREIGN KEY (ClienteID) REFERENCES [dbo].[Cliente] (ClienteID) ON DELETE NO ACTION,
[DataLocacao] SMALLDATETIME DEFAULT GETDATE(),
[DataDevolucao] SMALLDATETIME NULL
);

/* ========= Insere "BASELINE" na tabela Marca ================= */

INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Audi');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('BMW');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Gumpert');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Mercedes-Benz');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Opel');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Porsche');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('RUF');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Smart');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Volkswagen');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Wiesmann');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Buick');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Cadillac');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Chevrolet');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Chrysler');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Corvette');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Dodge');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Fisker');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Ford');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('GMC');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Jeep');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Lincoln');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Mustang');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Panoz');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Ram Trucks');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Scion');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Shelby');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('SSC');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Tesla');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Vector');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Baojun');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('BAW');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('BAIC Motor');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Besturn');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('BYD');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Chang -an');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Changfeng Motor');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Changhe Changhe');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Chery Chery');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Dongfeng');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Emgrand');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Englon');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('FAW');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Fengshen');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Foton');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Geely');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Gleagle');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Gonow');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Great Wall');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Hafei');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Haima');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Hongqi');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('JAC');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Maxus');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Roewe');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('SMA');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Soueast');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Tianjin');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Trumpchi');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Wuling');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Alpine');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Bugatti');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Citroën');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Peugeot');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Renault');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Venturi');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('AC Cars');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Ariel');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Aston Martin');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Bentley');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Bristol Cars');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Caterham Cars');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Ginetta');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Jaguar');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Lagonda');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Land Rover');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Lotus Cars');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('McLaren');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('MG');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Mini');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Morgann');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Noble');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Rolls-Royce');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('TVR');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Vauxhall');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Abarth');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Alfa Romeo');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('DR Motor');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Ferrari');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Fiat');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Lamborghini');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Lancia');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Maserati');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Pagani');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Acura Logo');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Daihatsu');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Datsun');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Honda');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Infiniti');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Isuzu');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Lexus');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Mazda');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Mitsubishi');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Mitsuoka');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Nismo');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Nissan');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Subaru');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Suzuki');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Toyota');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Koenigsegg');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Saab');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Scania');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Volvo');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Škoda Auto');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Tatra');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Dacia');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Seat');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('ZAZ');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Hyundai');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Kia');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Ssangyong');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Mahindra');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Maruti Suzuki');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Tata Motors Cars');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Perodua');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Proton');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Thai Rung');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('GAZ');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Lada');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('UAZ');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('ZiL');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Holden');
INSERT INTO [dbo].[Marca](NomeMarca) VALUES('Troller');
