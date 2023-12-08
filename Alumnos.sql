-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.34
USE alumnos;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id_alumnos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `plantel` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  `rfc` varchar(45) NOT NULL,
  `cartilla` varchar(45) NOT NULL,
  `pasaporte` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `fechaNacimiento` varchar(45) NOT NULL,
  `nacionalidad` varchar(45) NOT NULL,
  `entidadNacimiento` varchar(45) NOT NULL,
  `idDireccion` int NOT NULL,
  `idEscolaridad` int NOT NULL,
  `idTutor` int NOT NULL,
  `idDatoMedico` int NOT NULL,
  `idTramites` int NOT NULL,
  `idDatoAcademico` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `idEstadoGeneral` int NOT NULL,
  `boleta` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_alumnos`),
  KEY `fkAlumnosEscolaridad_idx` (`idEscolaridad`),
  KEY `fkAlumnosPadretutor_idx` (`idTutor`),
  KEY `fkAlumnoDatosMedicos_idx` (`idDatoMedico`),
  KEY `fkAlumnosDireccion_idx` (`idDireccion`),
  KEY `fkAlumnoTramites_idx` (`idTramites`),
  KEY `fkAlumnoDatosAcademicos_idx` (`idDatoAcademico`),
  KEY `fkAlumnoEstadoGeneral_idx` (`idEstadoGeneral`),
  CONSTRAINT `fkAlumnoDatosMedicos` FOREIGN KEY (`idDatoMedico`) REFERENCES `datosmedicos` (`id`),
  CONSTRAINT `fkAlumnoEstadoGeneral` FOREIGN KEY (`idEstadoGeneral`) REFERENCES `estadogs` (`idEstadoGeneral`),
  CONSTRAINT `fkAlumnosDireccion` FOREIGN KEY (`idDireccion`) REFERENCES `direccions` (`id_direccion`),
  CONSTRAINT `fkAlumnosEscolaridad` FOREIGN KEY (`idEscolaridad`) REFERENCES `escolaridads` (`id_escolaridad`),
  CONSTRAINT `fkAlumnosPadretutor` FOREIGN KEY (`idTutor`) REFERENCES `padretutors` (`idPadreTutor`),
  CONSTRAINT `fkAlumnoTramites` FOREIGN KEY (`idTramites`) REFERENCES `tramites` (`id_tramites`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES (1,'Juan Pérez','Escuela X','ABCDE123456FGH123','XHGF987654321','1234567890','no','M','2000-03-15','Mexicana','Ciudad de México',1,1,1,1,1,1,'juan@example.com','1235',1,'20230030');
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `id_asignatura` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `docente` varchar(45) NOT NULL,
  `creditos` double NOT NULL,
  `id_Grupos` int NOT NULL,
  `clave` varchar(45) NOT NULL,
  PRIMARY KEY (`id_asignatura`),
  KEY `idAsignaturaGrupos_idx` (`id_Grupos`),
  CONSTRAINT `fkAsignaturaGrupos` FOREIGN KEY (`id_Grupos`) REFERENCES `grupos` (`id_grupos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'FISICA CLASICA','Carmen Flores',10.5,1,'FC1'),(2,'CALCULO DIFERENCIAL E INTEGRAL ','Isabel Sánchez',12,1,'CDI1'),(3,'FUNDAMENTOS DE ALGEBRA','Carlos López',6,1,'FA1'),(4,'FUNDAMENTOS DE PROGRAMACION','Roberto Rodríguez',9,1,'FP1'),(5,'HUMANIDADES I INGENIERIA CIENCIA Y SOCIEDAD','Sergio Díaz',9,1,'HICS1'),(6,'QUIMICA BASICA','Gabriela Ramírez',7.5,1,'QB1');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `id_calificaciones` int NOT NULL AUTO_INCREMENT,
  `noBoleta` int NOT NULL,
  `materia` varchar(45) NOT NULL,
  `primerParcial` int NOT NULL,
  `segundoParcial` int NOT NULL,
  `tercerParcial` int NOT NULL,
  `extra` float DEFAULT NULL,
  `id_Asignatura` int NOT NULL,
  `calificacionFinal` int GENERATED ALWAYS AS ((case when (`extra` is not null) then `extra` else (((`primerParcial` + `segundoParcial`) + `tercerParcial`) / 3) end)) STORED,
  PRIMARY KEY (`id_calificaciones`),
  KEY `idCalificacionesAsignatura_idx` (`id_Asignatura`),
  CONSTRAINT `fkCalificacionesAsignatura` FOREIGN KEY (`id_Asignatura`) REFERENCES `asignaturas` (`id_asignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` (`id_calificaciones`, `noBoleta`, `materia`, `primerParcial`, `segundoParcial`, `tercerParcial`, `extra`, `id_Asignatura`) VALUES (1,20230010,'FISICA CLASICA',8,8,8,NULL,1),(2,20230010,'CALCULO DIFERENCIAL E INTEGRAL',6,6,7,NULL,2),(3,20230010,'FUNDAMENTOS DE ALGEBRA',4,4,3,6,3),(4,20230010,'FUNDAMENTOS DE PROGRAMACION',5,5,5,8,4),(5,20230010,'HUMANIDADES I INGENIERIA CIENCIAS Y SOCIALES ',9,9,9,NULL,5),(6,20230010,'QUIMICA BASICA',9,9,9,NULL,6);
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `id_asignaturas` int NOT NULL,
  `totalCreditos` double NOT NULL,
  `cargaMaxima` double NOT NULL,
  `cargaMinima` double NOT NULL,
  `duracionCarreraEscolares` int NOT NULL,
  `duracionMaximaPeriodos` int NOT NULL,
  PRIMARY KEY (`id_carrera`),
  KEY `idCarreraAsignatura_idx` (`id_asignaturas`),
  CONSTRAINT `fkCarreraAsignatura` FOREIGN KEY (`id_asignaturas`) REFERENCES `asignaturas` (`id_asignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
INSERT INTO `carreras` VALUES (1,'INGENIERIA EN COMUNICACIONES Y ELECTRONICA',1,465,77.5,33.21,9,14);
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosacademicos`
--

DROP TABLE IF EXISTS `datosacademicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosacademicos` (
  `id_dato_academico` int NOT NULL AUTO_INCREMENT,
  `noBoleta` double NOT NULL,
  `idCarrera` int NOT NULL,
  `planEstudios` double NOT NULL,
  `promedio` double NOT NULL,
  `idKardex` int NOT NULL,
  PRIMARY KEY (`id_dato_academico`),
  KEY `idDatosAcademicosCarrera_idx` (`idCarrera`),
  KEY `idDatosAcademicosKardex_idx` (`idKardex`),
  CONSTRAINT `idDatosAcademicosCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`id_carrera`),
  CONSTRAINT `idDatosAcademicosKardex` FOREIGN KEY (`idKardex`) REFERENCES `kardexes` (`idKardex`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosacademicos`
--

LOCK TABLES `datosacademicos` WRITE;
/*!40000 ALTER TABLE `datosacademicos` DISABLE KEYS */;
INSERT INTO `datosacademicos` VALUES (1,20230010,1,2004,9.6,1),(2,22010030,1,2004,8.1,1);
/*!40000 ALTER TABLE `datosacademicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosmedicos`
--

DROP TABLE IF EXISTS `datosmedicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosmedicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `peso` double DEFAULT NULL,
  `estatura` double DEFAULT NULL,
  `tipoSangre` varchar(45) DEFAULT NULL,
  `institucion` varchar(45) DEFAULT NULL,
  `noSeguroSocial` double DEFAULT NULL,
  `fechaDeAlta` date DEFAULT NULL,
  `fechaDeBaja` date DEFAULT NULL,
  `padeceEnfermedades` varchar(45) DEFAULT NULL,
  `problemasFisicos` varchar(45) DEFAULT NULL,
  `tatuado` varchar(45) DEFAULT NULL,
  `piePlano` varchar(45) DEFAULT NULL,
  `descripcionEnfermedades` varchar(45) DEFAULT NULL,
  `descripcionProblema` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosmedicos`
--

LOCK TABLES `datosmedicos` WRITE;
/*!40000 ALTER TABLE `datosmedicos` DISABLE KEYS */;
INSERT INTO `datosmedicos` VALUES (1,70.5,1.75,'A+','Vocacional 3',123456789,'2023-01-01','2023-12-29','ninguno','ninguno','no','no','ninguna','ninguna'),(2,82.1,1.64,'O+','Bachilleres 1',987654321,'2023-01-01','2025-12-29','ninguno','ninguno','no','no','ninguno','ninguno');
/*!40000 ALTER TABLE `datosmedicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccions`
--

DROP TABLE IF EXISTS `direccions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccions` (
  `id_direccion` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) NOT NULL,
  `numExt` varchar(45) NOT NULL,
  `numInt` varchar(45) NOT NULL,
  `colonia` varchar(45) NOT NULL,
  `cp` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `delegacionMunicipio` varchar(45) NOT NULL,
  `telefonoFijo` varchar(35) NOT NULL,
  `telefonoMovil` varchar(35) NOT NULL,
  `email` varchar(45) NOT NULL,
  `labora` varchar(5) NOT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccions`
--

LOCK TABLES `direccions` WRITE;
/*!40000 ALTER TABLE `direccions` DISABLE KEYS */;
INSERT INTO `direccions` VALUES (1,'Valle de Mexico','12','8','Ecatepec',55076,'Estado de Mexico','no-tiene','1526487525','1548752936','test1@gmail.com','no'),(3,'Calle 1','123','4B','Colonia Alegre',12345,'Estado A','Municipio 1','555-123-4567','555-987-6543','correo1@example.com','Sí'),(4,'Avenida Principal','456','23','Colonia Soleada',54321,'Estado B','Municipio 2','555-789-1234','555-345-6789','correo2@example.com','No'),(5,'Calle de Ejemplo','789','3A','Colonia Tranquila',67890,'Estado C','Municipio 3','555-456-7890','555-234-5678','correo3@example.com','Sí'),(6,'Avenida Central','321','5B','Colonia Sombra',98765,'Estado D','Municipio 4','555-987-2345','555-876-5432','correo4@example.com','No'),(7,'Calle 1','123','4B','Colonia Alegre',12345,'Estado A','Municipio 1','555-123-4567','555-987-6543','correo1@example.com','Sí'),(8,'Avenida Principal','456','23','Colonia Soleada',54321,'Estado B','Municipio 2','555-789-1234','555-345-6789','correo2@example.com','No'),(9,'Calle de Ejemplo','789','3A','Colonia Tranquila',67890,'Estado C','Municipio 3','555-456-7890','555-234-5678','correo3@example.com','Sí'),(10,'Avenida Central','321','5B','Colonia Sombra',98765,'Estado D','Municipio 4','555-987-2345','555-876-5432','correo4@example.com','No'),(11,'Calle 1','123','4B','Colonia Alegre',12345,'Estado A','Municipio 1','555-123-4567','555-987-6543','correo1@example.com','Sí'),(12,'Avenida Principal','456','23','Colonia Soleada',54321,'Estado B','Municipio 2','555-789-1234','555-345-6789','correo2@example.com','No'),(13,'Calle de Ejemplo','789','3A','Colonia Tranquila',67890,'Estado C','Municipio 3','555-456-7890','555-234-5678','correo3@example.com','Sí'),(14,'Avenida Central','321','5B','Colonia Sombra',98765,'Estado D','Municipio 4','555-987-2345','555-876-5432','correo4@example.com','No');
/*!40000 ALTER TABLE `direccions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escolaridads`
--

DROP TABLE IF EXISTS `escolaridads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escolaridads` (
  `id_escolaridad` int NOT NULL AUTO_INCREMENT,
  `escuelaProcedencia` varchar(45) NOT NULL,
  `entidadFederativaEscuelaProcedencia` varchar(45) NOT NULL,
  `promedioSecundaria` float NOT NULL,
  `promedioNivelMedioSuperior` float NOT NULL,
  PRIMARY KEY (`id_escolaridad`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escolaridads`
--

LOCK TABLES `escolaridads` WRITE;
/*!40000 ALTER TABLE `escolaridads` DISABLE KEYS */;
INSERT INTO `escolaridads` VALUES (1,'vocacional 3','Estado de Mexico',8.5,8.5),(2,'BACHILLERES 1','Ciudad de Mexico',8.5,9.2),(3,'voca 11','Ciudad de Mexico',9,9.5),(4,'voca 6','Ciudad de Mexico',8.7,9),(5,'voca 9','Ciudad de Mexico',9.2,9.4),(6,'Epoem 256','Ciudad de Mexico',8.9,9.1),(7,'BACHILLERES 1','Ciudad de Mexico',8.5,9.2),(8,'voca 11','Ciudad de Mexico',9,9.5),(9,'voca 6','Ciudad de Mexico',8.7,9),(10,'voca 9','Ciudad de Mexico',9.2,9.4),(11,'Epoem 256','Ciudad de Mexico',8.9,9.1),(12,'BACHILLERES 1','Ciudad de Mexico',8.5,9.2),(13,'voca 11','Ciudad de Mexico',9,9.5),(14,'voca 6','Ciudad de Mexico',8.7,9),(15,'voca 9','Ciudad de Mexico',9.2,9.4),(16,'Epoem 256','Ciudad de Mexico',8.9,9.1);
/*!40000 ALTER TABLE `escolaridads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadogs`
--

DROP TABLE IF EXISTS `estadogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadogs` (
  `idEstadoGeneral` int NOT NULL AUTO_INCREMENT,
  `noBoleta` int NOT NULL,
  `materiasReprobadas` varchar(45) NOT NULL,
  `materiasNoCursadas` varchar(45) NOT NULL,
  `materiasDesfasadas` varchar(45) NOT NULL,
  `fechaInscripcion` date NOT NULL,
  `fechaFinalizacion` date NOT NULL,
  `turno` varchar(45) NOT NULL,
  `id_carrera` int NOT NULL,
  `totalCreditosObtenidos` double NOT NULL,
  `totalCreditosFaltantes` double NOT NULL,
  `periodosCursados` int NOT NULL,
  `periodosDisponibles` int NOT NULL,
  `cargaAutorizada` double DEFAULT NULL,
  `creditosReprobados` double DEFAULT NULL,
  PRIMARY KEY (`idEstadoGeneral`),
  KEY `fkEstadoGeneralCarrera_idx` (`id_carrera`),
  CONSTRAINT `fkEstadoGeneralCarrera` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadogs`
--

LOCK TABLES `estadogs` WRITE;
/*!40000 ALTER TABLE `estadogs` DISABLE KEYS */;
INSERT INTO `estadogs` VALUES (1,20230010,'0','6','0','2024-01-12','2024-01-13','M',1,65,400,8,9,66,0);
/*!40000 ALTER TABLE `estadogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id_grupos` int NOT NULL AUTO_INCREMENT,
  `id_semestre` int NOT NULL,
  `NoGrupo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_grupos`),
  KEY `idGruposSemestre_idx` (`id_semestre`),
  CONSTRAINT `fkGruposSemestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestres` (`id_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,1,'1CM1'),(2,1,'1CM2'),(3,1,'1CM3'),(4,1,'1CM4'),(5,1,'1CM5'),(6,1,'1CM6'),(7,1,'1CM7'),(8,1,'1CV1'),(9,1,'1CV2'),(10,1,'1CV3'),(11,1,'1CV4'),(12,1,'1CV5'),(13,1,'1CV6'),(14,1,'1CV7');
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso` (
  `idIngreso` int NOT NULL AUTO_INCREMENT,
  `boleta` double DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idIngreso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (1,20230030,'1235');
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kardexes`
--

DROP TABLE IF EXISTS `kardexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kardexes` (
  `idKardex` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(20) NOT NULL,
  `idCarrera` int NOT NULL,
  `materia` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `periodo` varchar(34) NOT NULL,
  `formaEvaluacion` varchar(45) NOT NULL,
  `calificacionFinal` int NOT NULL,
  PRIMARY KEY (`idKardex`),
  KEY `idKardexCarrera_idx` (`idCarrera`),
  CONSTRAINT `fkKardexCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kardexes`
--

LOCK TABLES `kardexes` WRITE;
/*!40000 ALTER TABLE `kardexes` DISABLE KEYS */;
INSERT INTO `kardexes` VALUES (1,'C101',1,'FISICA CLASICA','2023-06-05','23/1','ORD',8),(2,'C102',1,'CALCULO DIFERENCIA E INTEGRAL','2023-06-05','23/1','ORD',6),(3,'C103',1,'FUNDAMENTOS DE ALGEBRA','2023-06-05','23/1','ORD',6),(4,'C104',1,'FUNDAMENTOS DE PROGRAMACION','2023-06-05','23/1','ORD',8),(5,'C105',1,'HUMANIDADES I INGENIERIA DE CIENCIAS Y SOCIALES','2023-06-05','23/1','ORD',9),(6,'C106',1,'QUIMICA BASICA','2023-06-05','23/1','ORD',9);
/*!40000 ALTER TABLE `kardexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padretutors`
--

DROP TABLE IF EXISTS `padretutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padretutors` (
  `idPadreTutor` int NOT NULL AUTO_INCREMENT,
  `nombreTutor` varchar(45) DEFAULT NULL,
  `rfcTutor` varchar(45) DEFAULT NULL,
  `nombrePadre` varchar(45) DEFAULT NULL,
  `nombreMadre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPadreTutor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padretutors`
--

LOCK TABLES `padretutors` WRITE;
/*!40000 ALTER TABLE `padretutors` DISABLE KEYS */;
INSERT INTO `padretutors` VALUES (1,' María Pérez','PERM910523ABC','Juan García','María Pérez'),(2,'Laura Rodríguez','LOCC960426LMN','Roberto Sánchez','Laura Rodríguez');
/*!40000 ALTER TABLE `padretutors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestres`
--

DROP TABLE IF EXISTS `semestres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestres` (
  `id_semestre` int NOT NULL AUTO_INCREMENT,
  `NoSemestre` int NOT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestres`
--

LOCK TABLES `semestres` WRITE;
/*!40000 ALTER TABLE `semestres` DISABLE KEYS */;
INSERT INTO `semestres` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `semestres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramites`
--

DROP TABLE IF EXISTS `tramites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramites` (
  `id_tramites` int NOT NULL AUTO_INCREMENT,
  `no_boleta` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tramites`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramites`
--

LOCK TABLES `tramites` WRITE;
/*!40000 ALTER TABLE `tramites` DISABLE KEYS */;
INSERT INTO `tramites` VALUES (1,'20230010','CONSTANCIA DE ESTUDIOS');
/*!40000 ALTER TABLE `tramites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-13 22:24:35
