CREATE DATABASE hackaton23;

USE hackaton23;

-- -----------------------------------------------------
-- Table `Roles_Usuarios`
-- -----------------------------------------------------
CREATE TABLE Roles(
  idrol INT NOT NULL AUTO_INCREMENT,
  nombre_rol VARCHAR(45) NOT NULL,
  nivel INT NOT NULL,
  estado INT NOT NULL, 
  PRIMARY KEY(idrol)
);





-- -----------------------------------------------------
-- Table `Generos`
-- -----------------------------------------------------
CREATE TABLE Generos(
  idgenero INT NOT NULL AUTO_INCREMENT,
  tipoGenero VARCHAR(45) NOT NULL,
  PRIMARY KEY(idgenero)
);





-- -----------------------------------------------------
-- Table `Usuarios`
-- -----------------------------------------------------
CREATE TABLE Usuarios(
  idusuario INT NOT NULL AUTO_INCREMENT,
  idrol INT NOT NULL,
  idgenero INT NOT NULL,
  nombre VARCHAR(75) NOT NULL,
  apellido VARCHAR(75) NOT NULL,
  usuario VARCHAR(20) NOT NULL,
  clave VARCHAR(15) NOT NULL,
  edad INT NOT NULL,
  email VARCHAR(35) NOT NULL,
  telefono INT NOT NULL,
  activo INT NOT NULL,
  fechaCreado DATE NOT NULL,
  fechaModificado DATE NOT NULL,
  PRIMARY KEY(idusuario),
  FOREIGN KEY (idrol) REFERENCES Roles(idrol),
  FOREIGN KEY (idgenero) REFERENCES Generos(idgenero)
);





-- -----------------------------------------------------
-- Table `Departamentos`
-- -----------------------------------------------------
CREATE TABLE Departamentos(
  iddepartamento INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  PRIMARY KEY(iddepartamento)
);






-- -----------------------------------------------------
-- Table `Municipios`
-- -----------------------------------------------------
CREATE TABLE Municipios(
  idmunicipio INT NOT NULL AUTO_INCREMENT,
  iddepartamento INT NOT NULL,
  nombre VARCHAR(75) NOT NULL,
  PRIMARY KEY(idmunicipio),
  FOREIGN KEY (iddepartamento) REFERENCES Departamentos(iddepartamento)
);





-- -----------------------------------------------------
-- Table `Comunidades`
-- -----------------------------------------------------
CREATE TABLE Comunidades(
  idcomunidad INT NOT NULL AUTO_INCREMENT,
  -- idpais INT NOT NULL,
  idmunicipio INT NOT NULL,
  nombre_comunidad VARCHAR(75) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  cantidad_personas INT NULL,
  cantidad_establecimientos INT NULL,
  cantidad_personal INT NULL,
  PRIMARY KEY(idcomunidad),
  -- FOREIGN KEY (idpais) REFERENCES Paises(idpais),
  FOREIGN KEY (idmunicipio) REFERENCES Municipios(idmunicipio)
 );





-- -----------------------------------------------------
-- Table `Horarios`
-- -----------------------------------------------------
CREATE TABLE Horarios(
  idhorario INT NOT NULL, 
  dia_semana VARCHAR(45) NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fin TIME NOT NULL,
  PRIMARY KEY (idhorario)
);




-- -----------------------------------------------------
-- Table `Consultorios`
-- -----------------------------------------------------
CREATE TABLE Consultorios(
  idconsultorio INT NOT NULL AUTO_INCREMENT,
  idhorario INT NOT NULL,
  idcomunidad INT NOT NULL,
  nombre_consultorio VARCHAR(75) NOT NULL,
  telefono VARCHAR(12) NULL,
  email VARCHAR(50) NULL,
  sitio_web VARCHAR(50) NULL,
  descripcion VARCHAR(100) NULL,
  -- idinventario INT NOT NULL,
  PRIMARY KEY (idconsultorio),
  FOREIGN KEY(idhorario) REFERENCES Horarios(idhorario),
  FOREIGN KEY(idcomunidad) REFERENCES Comunidades(idcomunidad)
);






-- -----------------------------------------------------
-- Table `ConsultoriosDetalle`
-- -----------------------------------------------------
CREATE TABLE ConsultoriosDetalle(
  idconsultorioDetalle INT NOT NULL AUTO_INCREMENT,
  idconsultorio INT NOT NULL,
  -- idpaciente INT NOT NULL,
  -- idmedico INT NOT NULL,
  cantidad_medicos INT NULL,
  cantidad_pacientes INT NULL,
  PRIMARY KEY(idconsultorioDetalle), 
  FOREIGN KEY (idconsultorio) REFERENCES Consultorios(idconsultorio)
  -- FOREIGN KEY (idpaciente) REFERENCES Pacientes(idpaciente),
  -- FOREIGN KEY (idmedico) REFERENCES Medicos(idmedico)
);






-- -----------------------------------------------------
-- Table `Medicos`
-- -----------------------------------------------------
CREATE TABLE Especialidades(
  idespecialidad INT NOT NULL AUTO_INCREMENT,
  nombre_especialidad VARCHAR(75) NOT NULL,
  PRIMARY KEY(idespecialidad)
);





-- -----------------------------------------------------
-- Table `Medicos`
-- -----------------------------------------------------
CREATE TABLE Medicos(
  idmedico INT NOT NULL AUTO_INCREMENT,
  idusuario INT NOT NULL,
  idespecialidad INT NOT NULL,
  idconsultorioDetalle INT NOT NULL,
  -- idconsultorio INT NOT NULL,
  -- idhorario INT NOT NULL,
  activo INT NOT NULL,
  fechaCreado DATE NOT NULL,
  fechaModificado DATE NOT NULL,
  PRIMARY KEY(idmedico),
  FOREIGN KEY (idusuario) REFERENCES Usuarios(idusuario),
  -- FOREIGN KEY (idconsultorio) REFERENCES Consultorios(idconsultorio),
  FOREIGN KEY (idespecialidad) REFERENCES Especialidades(idespecialidad),
  FOREIGN KEY (idconsultorioDetalle) REFERENCES ConsultoriosDetalle(idconsultorioDetalle)
);





-- -----------------------------------------------------
-- Table `TipoSangre`
-- -----------------------------------------------------
CREATE TABLE TiposSangre(
  idtipoSangre INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(11) NOT NULL,
  PRIMARY KEY(idtipoSangre)
);




-- -----------------------------------------------------
-- Table `Enfermedades`
-- -----------------------------------------------------
CREATE TABLE  Enfermedades(
  idenfermedad INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  fecha_inicio DATE NOT NULL,
  duracion_enfermedad INT NOT NULL,
  tratamiento VARCHAR(200) NULL,
  PRIMARY KEY(idenfermedad)
 );






-- -----------------------------------------------------
-- Table `Sintomas`
-- -----------------------------------------------------
CREATE TABLE Sintomas(
  idsintoma INT NOT NULL AUTO_INCREMENT,
  nombre_sintoma VARCHAR(45) NOT NULL,
  gravedad VARCHAR(45) NOT NULL,
  duracion_sintoma INT NOT NULL,
  descripcion VARCHAR(100) NULL,
  PRIMARY KEY(idsintoma)
);





-- -----------------------------------------------------
-- Table `Padecimientos`
-- -----------------------------------------------------
CREATE TABLE Padecimientos(
  idpadecimiento INT NOT NULL AUTO_INCREMENT,
  idenfermedad INT NOT NULL,
  idsintoma INT NOT NULL,
  duracion INT NULL,
  descripcion VARCHAR(100) NULL,
  PRIMARY KEY(idpadecimiento),
  FOREIGN KEY (idenfermedad) REFERENCES Enfermedades(idenfermedad),
  FOREIGN KEY (idsintoma) REFERENCES Sintomas(idsintoma)
);




-- -----------------------------------------------------
-- Table `Pacientes`
-- -----------------------------------------------------
CREATE TABLE Pacientes(
	 idpaciente INT NOT NULL AUTO_INCREMENT,
	 idtipoSangre INT NOT NULL,
	 -- idconsultorio INT NOT NULL,
     idgenero INT NOT NULL,
     idconsultorioDetalle INT NOT NULL,
	 idpadecimiento INT NOT NULL,
     padecimientos_general VARCHAR(250) NULL,
     nombre VARCHAR(75) NOT NULL,
	 apellido VARCHAR(75) NOT NULL,
     edad INT NOT NULL,
	 email VARCHAR(35) NOT NULL,
     telefono INT NOT NULL,
     url_foto VARCHAR(100) NULL,
     direccion_detalle VARCHAR(150) NULL,
     medico_encargado INT NULL,
     activo INT NOT NULL,
	 fechaCreado DATE NOT NULL,
	 fechaModificado DATE NOT NULL,
     observaciones VARCHAR(100) NULL,                   -- datos extras que puede colocar el
     PRIMARY KEY(idpaciente),
	 FOREIGN KEY(idtipoSangre) REFERENCES TiposSangre(idtipoSangre),
     -- FOREIGN KEY (idconsultorio) REFERENCES Consultorios(idconsultorio),
	 FOREIGN KEY (idgenero) REFERENCES Generos(idgenero),
     FOREIGN KEY (idpadecimiento) REFERENCES Padecimientos(idpadecimiento),
	 FOREIGN KEY (idconsultorioDetalle) REFERENCES ConsultoriosDetalle(idconsultorioDetalle)
);




-- -----------------------------------------------------
-- Table `Citas`
-- -----------------------------------------------------
CREATE TABLE Citas(
  idcita INT NOT NULL AUTO_INCREMENT,
  fecha_cita DATE NOT NULL,
  hora_cita DATE NOT NULL,
  duracion_estimada INT NULL,
  PRIMARY KEY(idcita)
);




-- -----------------------------------------------------
-- Table `Examenes`
-- -----------------------------------------------------
CREATE TABLE Examenes(
  idexamen INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  descripcion VARCHAR(85) NULL,
  fecha_examen DATE NOT NULL,
  hora_examen TIME NOT NULL,
  -- resultado_examen VARCHAR(250) NULL,
  PRIMARY KEY (idexamen)
);






-- -----------------------------------------------------
-- Table `ResultadosExamenes`
-- -----------------------------------------------------
CREATE TABLE ResultadosExamenes(
  idresultadoExamen INT NOT NULL AUTO_INCREMENT,
  idexamen INT NOT NULL,
  observaciones VARCHAR(85) NULL,
  resultado_examen VARCHAR(250) NULL,
  PRIMARY KEY (idresultadoExamen),
  FOREIGN KEY (idexamen) REFERENCES Examenes(idexamen)
);






-- -----------------------------------------------------
-- Table `Medicamentos`
-- -----------------------------------------------------
CREATE TABLE Medicamentos(
  idmedicamento INT NOT NULL AUTO_INCREMENT,
  nombre_medicamento VARCHAR(75) NOT NULL,
  fecha_caducidad DATE NOT NULL,
  cantidad INT NOT NULL,
  descripcion VARCHAR(255) NULL,		--  MODO DE USO, VIA ORAL, VIA JERINGA, VIA INTRAVENOSA
  dosis VARCHAR(50) NOT NULL,			--  CANTIDAD EN LETRAS
  efectos VARCHAR(75),	
  cantidad_recetada INT NULL,			--  PODRIA IR A OTRA TABLA
  PRIMARY KEY(idmedicamento)
);






-- -----------------------------------------------------
-- Table `Medicamentos_Recetados`
-- -----------------------------------------------------
/*CREATE TABLE Medicamentos_Recetados(
  idmedicamento_recetado INT NOT NULL AUTO_INCREMENT,
  idmedicamento INT NOT NULL,
  cantidad INT NOT NULL,
  descripcion VARCHAR(255) NULL,
  modo_uso VARCHAR(75) NOT NULL,
  dosis VARCHAR(50) NOT NULL,
  tiempo_uso VARCHAR(35) NOT NULL,
  PRIMARY KEY(idmedicamento_recetado),
  FOREIGN KEY (idmedicamento) REFERENCES Medicamentos(idmedicamento)
);*/







-- -----------------------------------------------------
-- Table `Procedimientos`
-- -----------------------------------------------------
CREATE TABLE Procedimientos(
  idprocedimiento INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(75) NOT NULL,
  descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idprocedimiento)
);





-- -----------------------------------------------------
-- Table `Pacientes`
-- -----------------------------------------------------
CREATE TABLE Consultas(
	idconsulta INT NOT NULL AUTO_INCREMENT,
    idpaciente INT NOT NULL,
	idcita INT NOT NULL,
	idexamen INT NOT NULL,
	idmedicamento INT NOT NULL,
	idprocedimiento INT NOT NULL,
	peso_paciente DOUBLE NOT NULL,
	presionArterial_paciente DOUBLE NOT NULL,
    temperatura_paciente DOUBLE NOT NULL,
    altura DOUBLE NOT NULL,
	nivelOxigeno_paciente DOUBLE NULL,
    motivo_consulta VARCHAR(250) NOT NULL,
    notas_medico VARCHAR(250) NULL,
    -- iddiagnostico,
    diagnostico_general VARCHAR(300) NOT NULL,				--  PODRIA SER UNA TABLA QUE INDIQUE EXAMENES, NUEVAS ENFERMEDADES, SO SINTOMAS
    referencias VARCHAR(50) NULL,							--  A OTRO MEDICO
	fechaCreado DATE NOT NULL,
	PRIMARY KEY(idconsulta),
    FOREIGN KEY (idpaciente) REFERENCES Pacientes(idpaciente),
    FOREIGN KEY (idcita) REFERENCES Citas(idcita),
    FOREIGN KEY (idexamen) REFERENCES Examenes(idexamen),    
	FOREIGN KEY (idmedicamento) REFERENCES Medicamentos(idmedicamento), 
	FOREIGN KEY (idprocedimiento) REFERENCES Procedimientos(idprocedimiento)
);












/*


INSERT INTO `procedimientos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Extracción de muela', 'Procedimiento dental para extraer una muela dañada.'),
(2, 'Cirugía de apéndice', 'Remoción quirúrgica del apéndice inflamado.');


*/