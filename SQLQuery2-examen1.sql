create database ExamenJuan;

create table Marcas(
MarcaID int primary key,
Nombre varchar(50)NOT NULL
);

create table Modelos(
ModeloID int primary key,
MarcaID int references Marcas(MarcaID),
Nombre varchar(50) not null
);

create table Automoviles(
AutomovilID int primary key,
ModeloID int references Modelos(ModeloID),
Precio decimal(10,2) not null,
Descuento decimal(5,2),
Potencia int,
Transmision varchar(20),
EquipamientoSerie varchar(max)
);

create table Stock(
StockID int primary key,
AutomovilID int references Automoviles(AutomovilID),
Sala int,
Bodega int
);

create table Inventario(
InventarioID int primary key
);

create table Vitrinas (
    VitrinaID INT PRIMARY KEY,
    Ciudad VARCHAR(50)
);


create table CentrosDeServicio(
CentroID int primary key,
Nombre varchar(50) not null,
Domicilio varchar(100) not null,
CodigoPostal varchar(10) not null
);

create table Ventas(
VentaID int primary key,
PrecioTotal decimal(10,2) not null,
ModoPago varchar(20),
EquipamientoIncluido varchar(max),
PrecioEquipamiento decimal (10,2),
FechaEntrega date,
Matricula varchar(20),
StockID int references Stock(StockID),
VitrinaID int references Vitrinas(VitrinaID)
);

create table Vendedores(
VendedorID int primary key,
Nombre varchar(50) not null,
Codigo int,
VitrinaID int references Vitrinas(VitrinaID)
);

----envio de datos----
INSERT INTO Marcas (MarcaID, Nombre)
VALUES
    (1, 'Toyota'),
    (2, 'Honda'),
    (3, 'Ford'),
    (4, 'Chevrolet'),
    (5, 'Nissan');
select * from Marcas

INSERT INTO Modelos (ModeloID, MarcaID, Nombre)
VALUES
    (1, 1, 'Corolla'),
    (2, 1, 'Camry'),
    (3, 2, 'Civic'),
    (4, 2, 'Accord'),
    (5, 3, 'Mustang');
select * from Modelos

INSERT INTO Automoviles (AutomovilID, ModeloID, Precio, Descuento, Potencia, Transmision, EquipamientoSerie)
VALUES
    (1, 1, 25000, 0.05, 150, 'Automático', 'Airbags, Aire Acondicionado, Audio'),
    (2, 2, 30000, 0.1, 180, 'Manual', 'Airbags, Aire Acondicionado, Luces'),
    (3, 3, 28000, 0.07, 160, 'Automático', 'Airbags, Aire Acondicionado, Audio, Pintura');
select * from Automoviles

INSERT INTO Stock (StockID, AutomovilID, Sala, Bodega)
VALUES
    (1, 1, 5, 10),
    (2, 2, 3, 8),
    (3, 3, 7, 15);
select * from Stock

INSERT INTO Inventario (InventarioID)
VALUES (1);
select * from Inventario

INSERT INTO CentrosDeServicio (CentroID, Nombre, Domicilio, CodigoPostal)
VALUES
    (1, 'ServiAuto', 'Calle 123, Bogotá', '12345'),
    (2, 'AutoCare', 'Av. Principal, Medellín', '67890');
select * from CentrosDeServicio


INSERT INTO Vitrinas (VitrinaID, Ciudad)
VALUES
    (1, 'Bogotá'),
    (2, 'Medellín'),
    (3, 'Cali');
select * from Vitrinas


INSERT INTO Vendedores (VendedorID, Nombre, Codigo, VitrinaID)
VALUES
    (1, 'Juan Pérez', 101, 1),
    (2, 'María Gómez', 102, 2),
    (3, 'Carlos Rodríguez', 103, 1);
select * from Vendedores


INSERT INTO Ventas (VentaID, PrecioTotal, ModoPago, EquipamientoIncluido, PrecioEquipamiento, FechaEntrega, Matricula, StockID, VitrinaID)
VALUES
    (1, 24000, 'Tarjeta de crédito', 'Luces, Pintura', 500, '2023-08-25', 'ABC123', 1, 1),
    (2, 29000, 'Efectivo', 'Airbags, Aire Acondicionado, Audio', 0, '2023-09-01', 'XYZ789', 2, 2);
select * from Ventas
