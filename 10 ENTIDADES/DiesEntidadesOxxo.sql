USE master;
GO
IF DB_ID(N'Oxxo')IS NOT NULL
DROP DATABASE Oxxo;
GO
CREATE DATABASE Oxxo
ON
(NAME = Oxxo_dat,
FILENAME= 'C:\DiezEntidadesOxxo\Oxxo.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME =Oxxo_log,
FILENAME = 'C:\DiezEntidadesOxxo\Oxxo.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Oxxo;
GO
CREATE TABLE Articulo
(
idArticulo INT IDENTITY (1,1),
noArticulo VARCHAR(40)NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
idBodega int not null
);
CREATE TABLE ArticuloProveedor
(
idArticuloProveedor INT IDENTITY (1,1),
idArticulo int not null,
idProveedor int not null,
estatus BIT DEFAULT 1 NOT NULL,
);
GO
GO
CREATE TABLE Bodega
(
idBodega INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Caja
(
idCaja INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL,
idCorte int not null
);
GO
CREATE TABLE Capacitacion
(
idCapacitacion INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL
);
GO
CREATE TABLE Corte
(
idCorte INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL,
);
GO
CREATE TABLE Empleado
(
idEmpleado INT IDENTITY (1,1),
puesto VARCHAR(40)NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
idCapacitacion int not null,
idSucursal int not null
);
CREATE TABLE EmpleadoArticulo
(
idEmpleadoArticulo INT IDENTITY (1,1),
idEmpleado int not null,
idArticulo int not null,
estatus BIT DEFAULT 1 NOT NULL,
);
GO
GO
CREATE TABLE Proveedor
(
idProveedor INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL,
idArticulo int not null
);
GO
CREATE TABLE Servicio
(
idServicio INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL,
idSistema int not null,
);
GO
CREATE TABLE Sistema
(
idSistema INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL,
idCaja int not null
);
GO
CREATE TABLE Sucursal
(
idSucursal INT IDENTITY (1,1),
noSucursal VARCHAR(40)NOT NULL,
direccion VARCHAR(40)NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
idCaja int not null,
idBodega int not null
);
GO


---------------PRIMARY KEY---------
ALTER TABLE Articulo ADD CONSTRAINT PK_Articulo PRIMARY KEY (idArticulo)
ALTER TABLE ArticuloProveedor ADD CONSTRAINT PK_ArticuloProveedor PRIMARY KEY (idArticuloProveedor)
ALTER TABLE Bodega ADD CONSTRAINT PK_Bodega PRIMARY KEY (idBodega)
ALTER TABLE Caja ADD CONSTRAINT PK_Caja PRIMARY KEY (idCaja)
ALTER TABLE Capacitacion ADD CONSTRAINT PK_Capacitacion PRIMARY KEY (idCapacitacion)
ALTER TABLE Corte ADD CONSTRAINT PK_Corte PRIMARY KEY (idCorte)
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)
ALTER TABLE EmpleadoArticulo ADD CONSTRAINT PK_EmpleadoArticulo PRIMARY KEY (idEmpleadoArticulo)
ALTER TABLE Proveedor ADD CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor)
ALTER TABLE Servicio ADD CONSTRAINT PK_Servicio PRIMARY KEY (idServicio)
ALTER TABLE Sistema ADD CONSTRAINT PK_Sistema PRIMARY KEY (idSistema)
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal)

-----------------------------------------FOREIGN KEY----------------------------------------
ALTER TABLE Articulo ADD CONSTRAINT fk_ArticuloBodega FOREIGN KEY (idBodega) REFERENCES Bodega (idBodega)
ALTER TABLE ArticuloProveedor ADD CONSTRAINT fk_ArticuloProveedorArticulo FOREIGN KEY (idArticulo) REFERENCES Articulo (idArticulo)
ALTER TABLE ArticuloProveedor ADD CONSTRAINT fk_ArticuloProveedorProveedor FOREIGN KEY (idProveedor) REFERENCES Proveedor (idProveedor)
ALTER TABLE Caja ADD CONSTRAINT fk_CajaCorte FOREIGN KEY (idCorte) REFERENCES Corte (idCorte)
ALTER TABLE Empleado ADD CONSTRAINT fk_EmpleadoCapacitacion FOREIGN KEY (idCapacitacion) REFERENCES Capacitacion (idCapacitacion)
ALTER TABLE Empleado ADD CONSTRAINT fk_EmpleadoSucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal (idSucursal)
ALTER TABLE EmpleadoArticulo ADD CONSTRAINT fk_EmpleadoArticuloEmpleado FOREIGN KEY (idEmpleado) REFERENCES Empleado (idEmpleado)
ALTER TABLE EmpleadoArticulo ADD CONSTRAINT fk_EmpleadoArticuloArticulo FOREIGN KEY (idArticulo) REFERENCES Articulo (idArticulo)
ALTER TABLE Proveedor ADD CONSTRAINT fk_ProveedorArticulo FOREIGN KEY (idArticulo) REFERENCES Articulo (idArticulo)
ALTER TABLE Servicio ADD CONSTRAINT fk_ServicioSistema FOREIGN KEY (idSistema) REFERENCES Sistema (idSistema)
ALTER TABLE Sucursal ADD CONSTRAINT fk_SucursalCaja FOREIGN KEY (idCaja) REFERENCES Caja (idCaja)
ALTER TABLE Sucursal ADD CONSTRAINT fk_SucursalBodega FOREIGN KEY (idBodega) REFERENCES Bodega (idBodega)
ALTER TABLE Sistema ADD CONSTRAINT fk_SistemaCaja FOREIGN KEY (idCaja) REFERENCES Caja (idCaja)
------------------------------------INDEX-------------------
CREATE INDEX IX_Articulo ON Articulo(idArticulo);
GO
CREATE INDEX IX_Bodega ON Bodega(idBodega);
GO
CREATE INDEX IX_Caja ON Caja(idCaja);
GO
CREATE INDEX IX_Capacitacion ON Capacitacion(idCapacitacion);
GO
CREATE INDEX IX_Corte ON Corte(idCorte);
GO
CREATE INDEX IX_Empleado ON Empleado(idEmpleado);
GO
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor);
GO
CREATE INDEX IX_Servicio ON Servicio(idServicio);
GO
CREATE INDEX IX_Sistema ON Sistema(idSistema);
GO
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal);
GO
CREATE INDEX IX_EmpleadoArticulo ON EmpleadoArticulo(idEmpleadoArticulo);
GO
CREATE INDEX IX_ArticuloProveedor ON ArticuloProveedor(idArticuloProveedor);

