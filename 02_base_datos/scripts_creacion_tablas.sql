CREATE TABLE Rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    rol VARCHAR(50),
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
);

CREATE TABLE Requisito (
    id_requisito INT AUTO_INCREMENT PRIMARY KEY,
    prioridad VARCHAR(20),
    descripcion TEXT,
    estado VARCHAR(20)
);

CREATE TABLE Proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(20),
    nombre VARCHAR(50) NOT NULL,
    descripcon TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    id_requisito INT,
    id_usuario INT,
    FOREIGN KEY (id_requisito) REFERENCES Requisito(id_requisito),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Caso_Prueba (
    id_caso INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT,
    tipo VARCHAR(30),
    prioridad VARCHAR(20),
    estado VARCHAR(20),
    id_requisito INT,
    id_proyecto INT,
    FOREIGN KEY (id_requisito) REFERENCES Requisito(id_requisito),
    FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);

CREATE TABLE Ejecucion (
    id_ejecucion INT AUTO_INCREMENT PRIMARY KEY,
    historial TEXT,
    prioridad VARCHAR(20),
    comentarios TEXT,
    resultado VARCHAR(20),
    fecha DATE,
    id_caso INT,
    id_usuario INT,
    FOREIGN KEY (id_caso) REFERENCES Caso_Prueba(id_caso),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
