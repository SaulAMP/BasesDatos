create database Juan22;

CREATE TABLE Marca (
    MarcaID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Modelo (
    ModeloID INT PRIMARY KEY,
    MarcaID INT,
    Nombre VARCHAR(100) NOT NULL,
    Precio INT NOT NULL,
    Descuento INT,
    PotenciaFiscal INT,
    Cilindrada INT,
    FOREIGN KEY (MarcaID) REFERENCES Marca(MarcaID)
);


CREATE TABLE Caracteristica (
    CaracteristicaID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE EquipamientoSerie (
    EquipamientoSerieID INT PRIMARY KEY,
    ModeloID INT,
    CaracteristicaID INT,
    FOREIGN KEY (ModeloID) REFERENCES Modelo(ModeloID),
    FOREIGN KEY (CaracteristicaID) REFERENCES Caracteristica(CaracteristicaID)
);

CREATE TABLE Extra (
    ExtraID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio INT NOT NULL
);


CREATE TABLE ModeloExtra (
    ModeloID INT,
    ExtraID INT,
    PRIMARY KEY (ModeloID, ExtraID),
    FOREIGN KEY (ModeloID) REFERENCES Modelo(ModeloID),
    FOREIGN KEY (ExtraID) REFERENCES Extra(ExtraID)
);


CREATE TABLE Concesionario (
    ConcesionarioID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Domicilio VARCHAR(200) NOT NULL,
    NIF VARCHAR(20) NOT NULL
);


CREATE TABLE ServicioOficial (
    ServicioOficialID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Domicilio VARCHAR(200) NOT NULL,
    NIF VARCHAR(20) NOT NULL,
    ConcesionarioID INT,
    FOREIGN KEY (ConcesionarioID) REFERENCES Concesionario(ConcesionarioID)
);


CREATE TABLE Vendedor (
    VendedorID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Domicilio VARCHAR(200) NOT NULL,
    NIF VARCHAR(20) NOT NULL
);


CREATE TABLE Automovil (
    Bastidor INT PRIMARY KEY,
    ModeloID INT,
    ServicioOficialID INT,
    FOREIGN KEY (ModeloID) REFERENCES Modelo(ModeloID),
    FOREIGN KEY (ServicioOficialID) REFERENCES ServicioOficial(ServicioOficialID)
);


CREATE TABLE Venta (
    VentaID INT PRIMARY KEY,
    AutomovilBastidor INT,
    VendedorID INT,
    PrecioVenta INT NOT NULL,
    ModoPago VARCHAR(50) NOT NULL,
    FechaEntrega DATE,
    Matricula VARCHAR(20),
    EsDeStock CHAR(1),  -- 'S' para Stock, 'N' para Encargado a Fábrica
    FOREIGN KEY (AutomovilBastidor) REFERENCES Automovil(Bastidor),
    FOREIGN KEY (VendedorID) REFERENCES Vendedor(VendedorID)
);


CREATE TABLE VentaExtra (
    VentaID INT,
    ExtraID INT,
    Precio INT NOT NULL,
    PRIMARY KEY (VentaID, ExtraID),
    FOREIGN KEY (VentaID) REFERENCES Venta(VentaID),
    FOREIGN KEY (ExtraID) REFERENCES Extra(ExtraID)
);

INSERT INTO Marca (MarcaID, Nombre)
VALUES
    (1, 'Audi'),
    (2, 'Volkswagen'),
    (3, 'Ford'),
    (4, 'BMW'),
    (5, 'Toyota');

INSERT INTO Modelo (ModeloID, MarcaID, Nombre, Precio, Descuento, PotenciaFiscal, Cilindrada)
VALUES
    (1, 1, 'A3', 35000, 5000, 7, 2000),
    (2, 1, 'Q5', 50000, NULL, 9, 2500),
    (3, 2, 'Golf', 30000, NULL, 6, 1800),
    (4, 2, 'Passat', 42000, 6000, 8, 2200),
    (5, 3, 'Focus', 28000, NULL, 7, 1900);

INSERT INTO Caracteristica (CaracteristicaID, Nombre)
VALUES
    (1, 'Airbag conductor'),
    (2, 'Cierre centralizado'),
    (3, 'Aire acondicionado'),
    (4, 'Airbag acompañante'),
    (5, 'Pintura metalizada');

INSERT INTO EquipamientoSerie (EquipamientoSerieID, ModeloID, CaracteristicaID)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 3, 1),
    (4, 3, 2),
    (5, 4, 1);

INSERT INTO Extra (ExtraID, Nombre, Precio)
VALUES
    (1, 'Aire acondicionado', 1500),
    (2, 'Techo panorámico', 2000),
    (3, 'Navegación', 1800),
    (4, 'Asientos de cuero', 2500),
    (5, 'Llantas de aleación', 1000);

INSERT INTO ModeloExtra (ModeloID, ExtraID)
VALUES
    (1, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5);

INSERT INTO Concesionario (ConcesionarioID, Nombre, Domicilio, NIF)
VALUES
    (1, 'AutoCenter A', 'Calle Principal', '123456789A'),
    (2, 'MotorCity B', 'Avenida Central', '987654321B'),
    (3, 'Vehículos Rápidos', 'Plaza Mayor', '567890123C'),
    (4, 'Autos Total', 'Calle Secundaria', '432109876D'),
    (5, 'ExcelMotor', 'Paseo de la Montaña', '654321098E');

INSERT INTO Vendedor (VendedorID, Nombre, Domicilio, NIF)
VALUES
    (1, 'Juan Pérez', 'Calle 123', '123456789X'),
    (2, 'María García', 'Avenida 456', '987654321Y'),
    (3, 'Luis Rodríguez', 'Plaza 789', '456789123Z'),
    (4, 'Ana Martínez', 'Calle 789', '789123456W'),
    (5, 'Carlos López', 'Avenida 123', '456123789V');

INSERT INTO ServicioOficial (ServicioOficialID, Nombre, Domicilio, NIF, ConcesionarioID)
VALUES
    (1, 'ServiAuto A', 'Calle Principal', '123456789A', 1),
    (2, 'ServiceCar B', 'Avenida Central', '987654321B', 2),
    (3, 'AutoRápido', 'Plaza Mayor', '567890123C', 3),
    (4, 'AutoServicio', 'Calle Secundaria', '432109876D', 4),
    (5, 'ServiMotor', 'Paseo de la Montaña', '654321098E', 5);

INSERT INTO Automovil (Bastidor, ModeloID, ServicioOficialID)
VALUES
    (10001, 1, 1),
    (10002, 2, 2),
    (10003, 3, 3),
    (10004, 4, 4),
    (10005, 5, 5);

INSERT INTO Venta (VentaID, AutomovilBastidor, VendedorID, PrecioVenta, ModoPago, FechaEntrega, Matricula, EsDeStock)
VALUES
    (1, 10001, 1, 32000, 'Contado', '2023-08-01', 'ABC123', 'S'),
    (2, 10002, 2, 48000, 'Financiera', '2023-07-15', 'XYZ456', 'S'),
    (3, 10003, 3, 25000, 'Contado', '2023-08-10', 'DEF789', 'S'),
    (4, 10004, 4, 38000, 'Financiera', '2023-07-30', 'GHI012', 'S'),
    (5, 10005, 5, 26000, 'Contado', '2023-09-05', 'JKL345', 'S');

INSERT INTO VentaExtra (VentaID, ExtraID, Precio)
VALUES
    (1, 1, 1500),
    (2, 3, 1800),
    (3, 2, 2000),
    (4, 4, 2500),
    (5, 5, 1000);