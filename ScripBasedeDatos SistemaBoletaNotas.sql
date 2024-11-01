--Entidades y Atributos
/*	1. Usuario
		▲ IdUsuario (Primary Key)
		▲ Dni int (Unique) (El Dni va ser el username)
		▲ ApPaterno
		▲ ApMaterno
		▲ Nombres
		▲ Email
		▲ Celular
		▲ Contraseña
		▲ NivelAcceso
		▲ Estado
	2. PeriodoLectivo
		▲ IdPeriodoLectivo (Primary Key)
		▲ AneoPeriodoLectivo
		▲ NumeroPeriodoLectivo
	3. Alumno
		▲ IdAlumno (Primary Key)
		▲ Dni
		▲ ApPaterno
		▲ ApMaterno
		▲ Nombres
		▲ Email
		▲ Celular
		▲ Sexo
		▲ AneoIngreso
	4. ProgramaEstudios
		▲ IdProgramaEstudio (Primary Key)
		▲ NombreProgramaEstudio
		▲ NumeroModulos
	5. Aula
		▲ IdAula (Primary Key)
		▲ Codigo_Programa_Estudios
		▲ IdPeriodoAcademico
		▲ Aneo
	6. Módulo
		▲ IdMódulo(Primary Key)
		▲ NombreModulo
		▲ Codigo_Programa_Estudios
	7. PeriodoAcadémico
		▲ IdPeriodoAcademico
		▲ NombrePeriodoAcademico
	8. UnidadDidáctica
		▲ IdUnidadDidactica
		▲ NombreUnidadDidactica
		▲ HorasUnidadDidactica
		▲ CreditosUnidadDidactica
		▲ IdProgramaEstudios
		▲ IdModulo
	9.Matricula
		▲	IdMatricula
		▲ 	IdAlumno
		▲ 	IdProgramaEstudio
		▲ 	IdPeriodoLectivo
	10.Notas
		▲ 	IdNota
		▲ 	IdMatricula
		▲ 	IdUnidadDidactica
		▲ 	Nota
		▲ 	FechaRegistro
*/

--Generar Base de Datos
	CREATE DATABASE PruebaBoletaNotas;
	USE PruebaBoletaNotas;
-- 1. Tabla Usuario
	CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    Dni VARCHAR(15) UNIQUE NOT NULL,
    ApPaterno VARCHAR(50) NOT NULL,
    ApMaterno VARCHAR(50) NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Celular VARCHAR(15)NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,  -- Considera encriptación
    NivelAcceso VARCHAR(15) NOT NULL,
    Estado BIT NOT NULL
);
SELECT Dni, ApPaterno, ApMaterno, Nombres, Email, Celular, Contraseña, NivelAcceso FROM Usuario WHERE IdUsuario=1;
SELECT Dni, ApPaterno, ApMaterno, Nombres, Email, Celular, NivelAcceso FROM Usuario WHERE estado=1
SELECT * FROM Usuario 
SELECT NivelAcceso FROM Usuario WHERE Dni = 70460199 AND Contraseña = 'password123';

-- 2. Tabla PeriodoLectivo
	CREATE TABLE PeriodoLectivo (
    IdPeriodoLectivo VARCHAR(10) PRIMARY KEY NOT NULL,
    AnioPeriodoLectivo INT NOT NULL,
    NumeroPeriodoLectivo INT NOT NULL
);
SELECT * FROM PeriodoLectivo;
SELECT IdPeriodoLectivo, AnioPeriodoLectivo, NumeroPeriodoLectivo FROM PeriodoLectivo;

-- 3. Tabla Alumno
	CREATE TABLE Alumno (
    IdAlumno VARCHAR (50) PRIMARY KEY,
    Dni VARCHAR(15) NOT NULL,
    ApPaterno VARCHAR(50) NOT NULL,
    ApMaterno VARCHAR(50) NOT NULL,
    Nombres VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Celular VARCHAR(15)NOT NULL,
    Sexo CHAR(1)NOT NULL,
    AnioIngreso INT NOT NULL
);

SELECT * FROM ProgramaEstudios;

DELETE FROM ProgramaEstudios WHERE IdProgramaEstudio = 'CO';

SELECT * FROM Alumno

INSERT INTO ProgramaEstudios (IdProgramaEstudio, NombreProgramaEstudio, NumeroModulos) VALUES('digi', 'ffff',4)

SELECT IdAlumno, Dni, ApPaterno, ApMaterno, Nombres, Email, Celular, Sexo, AnioIngreso FROM Alumno;

-- 4. Tabla ProgramaEstudios
	CREATE TABLE ProgramaEstudios (
    IdProgramaEstudio VARCHAR(10) PRIMARY KEY NOT NULL,
    NombreProgramaEstudio VARCHAR(100) NOT NULL,
    NumeroModulos INT NOT NULL CHECK (NumeroModulos > 0)
);

-- 7. Tabla PeriodoAcademico
	CREATE TABLE PeriodoAcademico (
    IdPeriodoAcademico VARCHAR(10) PRIMARY KEY,
    NombrePeriodoAcademico VARCHAR(100) NOT NULL
);

SELECT * FROM PeriodoAcademico;

-- 5. Tabla Aula
	CREATE TABLE Aula (
    IdAula VARCHAR (15) PRIMARY KEY NOT NULL,
    IdProgramaEstudios VARCHAR(10) NOT NULL,
    IdPeriodoAcademico VARCHAR(10) NOT NULL,
    Anio INT NOT NULL,
    FOREIGN KEY (IdProgramaEstudios) REFERENCES ProgramaEstudios(IdProgramaEstudio),
    FOREIGN KEY (IdPeriodoAcademico) REFERENCES PeriodoAcademico(IdPeriodoAcademico)
);

-- 6. Tabla Modulo
	CREATE TABLE Modulo (
    IdModulo VARCHAR(10) PRIMARY KEY NOT NULL,
    NombreModulo VARCHAR(100) NOT NULL,
    IdProgramaEstudios VARCHAR(10) NOT NULL,
    FOREIGN KEY (IdProgramaEstudios) REFERENCES ProgramaEstudios(IdProgramaEstudio)
);
SELECT * FROM Modulo;
SELECT IdModulo, NombreModulo, IdProgramaEstudios FROM Modulo;

UPDATE Modulo SET IdModulo = 'MAP4', NombreModulo = 'ssssssss' WHERE IdModulo = 'MAP4'



-- 8. Tabla UnidadDidactica
	CREATE TABLE UnidadDidactica (
    IdUnidadDidactica VARCHAR (10) PRIMARY KEY ,
    NombreUnidadDidactica VARCHAR(100) NOT NULL,
    HorasUnidadDidactica INT NOT NULL,
    CreditosUnidadDidactica INT NOT NULL,
    IdProgramaEstudios VARCHAR(10) NOT NULL,
    IdModulo VARCHAR(10) NOT NULL,
    FOREIGN KEY (IdProgramaEstudios) REFERENCES ProgramaEstudios(IdProgramaEstudio),
    FOREIGN KEY (IdModulo) REFERENCES Modulo(IdModulo)
);
SELECT * FROM UnidadDidactica
--INSERT INTO UnidadDidactica (UnidadDidactica, UnidadDidactica, UnidadDidactica, UnidadDidactica, UnidadDidactica, UnidadDidactica) VALUES(?,?,?,?,?,?)";
SELECT IdUnidadDidactica, NombreUnidadDidactica,HorasUnidadDidactica , CreditosUnidadDidactica, IdProgramaEstudios, IdModulo FROM UnidadDidactica;
-- 9. Tabla Matricula
	CREATE TABLE Matricula (
    IdMatricula VARCHAR(30) PRIMARY KEY NOT NULL,
    IdAlumno VARCHAR (50) NOT NULL,
    IdProgramaEstudio VARCHAR(10) NOT NULL,
    IdPeriodoLectivo VARCHAR(10) NOT NULL,
    FOREIGN KEY (IdAlumno) REFERENCES Alumno(IdAlumno),
    FOREIGN KEY (IdProgramaEstudio) REFERENCES ProgramaEstudios(IdProgramaEstudio),
    FOREIGN KEY (IdPeriodoLectivo) REFERENCES PeriodoLectivo(IdPeriodoLectivo)
);
ALTER TABLE Matricula
ADD IdAula VARCHAR(15);

ALTER TABLE Matricula
ADD CONSTRAINT FK_Matricula_Aula
FOREIGN KEY (IdAula) REFERENCES Aula(IdAula);

ALTER TABLE Matricula
DROP CONSTRAINT FK_Matricula_Aula;  
TRUNCATE TABLE Matricula;
ALTER TABLE Matricula
ADD CONSTRAINT FK_Matricula_Aula
FOREIGN KEY (IdAula) REFERENCES Aula(IdAula);

SELECT * FROM Matricula;
SELECT * FROM Notas;
SELECT * FROM Notas WHERE IdMatricula = '71640029-AP-III';
SELECT * FROM Alumno;

SELECT * FROM M

-- 10. Tabla Notas
CREATE TABLE Notas (
    IdNota INT PRIMARY KEY IDENTITY(1,1),
    IdMatricula VARCHAR(30) NOT NULL,
    IdUnidadDidactica VARCHAR(10) NOT NULL,
    Nota DECIMAL(5,2) NOT NULL CHECK (Nota >= 0 AND Nota <= 20),
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (IdMatricula) REFERENCES Matricula(IdMatricula),
    FOREIGN KEY (IdUnidadDidactica) REFERENCES UnidadDidactica(IdUnidadDidactica)
);
SELECT * FROM Notas;
SELECT IdNota, IdMatricula, IdUnidadDidactica, Nota, FechaRegistro FROM Notas;

SELECT 
    n.IdNota, 
    n.IdMatricula, 
    n.IdUnidadDidactica, 
    u.NombreUnidadDidactica,  -- Mostrar el nombre de la unidad didáctica
    n.Nota, 
    n.FechaRegistro
FROM 
    Notas n
JOIN 
    UnidadDidactica u ON n.IdUnidadDidactica = u.IdUnidadDidactica;


CREATE VIEW VistaNotasConUnidad AS
SELECT 
    n.IdNota, 
    n.IdMatricula, 
    n.IdUnidadDidactica, 
    u.NombreUnidadDidactica, 
    n.Nota, 
    n.FechaRegistro
FROM 
    Notas n
JOIN 
    UnidadDidactica u ON n.IdUnidadDidactica = u.IdUnidadDidactica;


	SELECT * FROM VistaNotasConUnidad;
	SELECT * FROM Matricula;


-- 1. Insertar datos en la tabla Usuario
INSERT INTO Usuario (Dni, ApPaterno, ApMaterno, Nombres, Email, Celular, Contraseña, NivelAcceso, Estado)
VALUES
('70460199', 'Casana', 'Loyola', 'Juan Joel', 'juancasana8gmail.com', '987654321', 'password123', 'Administrador', 1),
('23456789', 'Rodriguez', 'Lopez', 'Maria Fernanda', 'maria.fernanda@example.com', '912345678', 'password234', 'Asistente', 1)
;
SELECT *FROM Alumno;

DELETE FROM Usuario WHERE IdUsuario = ?;
SELECT NivelAcceso FROM Usuario WHERE Dni = 'fwe';

UPDATE Usuario
SET Contraseña = 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f'
WHERE dni = '70460199';  
-- 2. Insertar datos en la tabla PeriodoLectivo
INSERT INTO PeriodoLectivo (IdPeriodoLectivo, AnioPeriodoLectivo, NumeroPeriodoLectivo)
VALUES 
('2022-1', 2022, 1),
('2022-2', 2022, 2),
('2023-1', 2023, 1),
('2023-2', 2023, 2),
('2024-1', 2024, 1),
('2024-2', 2024, 2);

SELECT * FROM PeriodoLectivo;
-- 3. Insertar datos en la tabla Alumno
INSERT INTO Alumno (IdAlumno, Dni, ApPaterno, ApMaterno, Nombres, Email, Celular, Sexo, AnioIngreso)
VALUES

('71640029-2023', '71640029', 'Egocheaga', 'Neyra', 'Silvia Yoana', 'Silvia@example.com', '987654321', 'F', 2023),
('61700455-2023', '61700455',  'Llamoca', 'Canales', 'Paull Edison', 'Paull@example.com', '912345678', 'M', 2023),
('76145305-2023', '76145305', 'Lopez', 'Retamozo', 'Marvin Josue', 'Marvin@example.com', '922345678', 'M', 2023),
('73971041-2023', '73971041', 'Ludeña', 'Lujan', 'Karinna Emelyn', 'Karinna@example.com', '932345678', 'F', 2023),
('71630547-2023', '71630547', 'Menacho', 'Yauyo', 'Mila Crucia', 'Mila@example.com', '942345678', 'F', 2023),
('60044651-2023', '60044651', 'Mitma', 'Contreras', 'Alex Wilson', 'Alex@example.com', '952345678', 'M', 2023),
('71640187-2023', '71640187', 'Villegas', 'Baldeon', 'Martha Angelina', 'Martha@example.com', '962345678', 'F', 2023)
;
SELECT * FROM Alumno;
-- 4. Insertar datos en la tabla ProgramaEstudios
INSERT INTO ProgramaEstudios (IdProgramaEstudio, NombreProgramaEstudio, NumeroModulos)
VALUES
('CI', 'Computación e Informática', 3),
('AP', 'Arquitectura de Plataforma y Servicios de Tecnología de Información', 3),
('ETN', 'Enfermería Técnica', 3),
('ET', 'Enfermería Técnica', 3),
('CCN', 'Construcción Civil', 3),
('CC', 'Construcción Civil', 3),
('SE', 'Secretariado Ejecutivo', 3),
('AA', 'Asistencia Administrativa', 3),
('PA', 'Producción Agropecuaria', 3),
('PAN', 'Producción Agropecuaria', 3);

SELECT * FROM ProgramaEstudios;

-- 5. Insertar datos en la tabla PeriodoAcademico
INSERT INTO PeriodoAcademico (IdPeriodoAcademico, NombrePeriodoAcademico)
VALUES
('I', 'Primer Periodo Académico'),
('II', 'Segundo Periodo Académico'),
('III', 'Tercer Periodo Académico'),
('IV', 'Cuarto Periodo Académico'),
('V', 'Quinto Periodo Académico'),
('VI', 'Sexto Periodo Académico');

-- 6. Insertar datos en la tabla Aula
INSERT INTO Aula (IdAula, IdProgramaEstudios, IdPeriodoAcademico, Anio)
VALUES
('AP2024-1', 'AP', 'III', 2024),
('AP2024-2', 'AP', 'IV', 2024);

-- 7. Insertar datos en la tabla Modulo
INSERT INTO Modulo (IdModulo, NombreModulo, IdProgramaEstudios)
VALUES
('MAP1', 'Soporte, mantenimiento y seguridad en sistemas informáticos', 'AP'),
('MAP2', 'Desarrollo de software e integración de sistemas de información', 'AP'),
('MAP3', 'Diseño de infraestructura web y plataformas de tecnología de la información', 'AP');

-- 8. Insertar datos en la tabla UnidadDidactica
INSERT INTO UnidadDidactica (IdUnidadDidactica, NombreUnidadDidactica, HorasUnidadDidactica, CreditosUnidadDidactica, IdProgramaEstudios, IdModulo)
VALUES
('AP3UDA', 'Algoritmos y Programación de Computadoras', 7, 4, 'AP', 'MAP2'),
('AP3UDB', 'Análisis y Diseño de Sistemas', 3, 2, 'AP', 'MAP2'),
('AP3UDC', 'Comportamiento Ético', 3, 2, 'AP', 'MAP2'),
('AP3UDD', 'Diseño de Base de Datos', 4, 3, 'AP', 'MAP2'),
('AP3UDE', 'Excel Intermedio', 3, 2, 'AP', 'MAP2'),
('AP3UDF', 'Inglés para la Comunicación Oral', 3, 2, 'AP', 'MAP2'),
('AP3UDG', 'Programación Visual', 7, 4, 'AP', 'MAP2');
 Select *From UnidadDidactica;

 INSERT INTO UnidadDidactica (IdUnidadDidactica, NombreUnidadDidactica, HorasUnidadDidactica, CreditosUnidadDidactica, IdProgramaEstudios, IdModulo)
VALUES
('AP4UDA', ' Administración de Base de Datos', 7, 4, 'AP', 'MAP2');
 Select *From UnidadDidactica;

 INSERT INTO Notas (IdMatricula, IdUnidadDidactica, Nota)
VALUES
('11111111-AP-IV','AP4UDA',15);
-- 9. Insertar datos en la tabla Matricula
INSERT INTO Matricula (IdMatricula, IdAlumno, IdProgramaEstudio, IdPeriodoLectivo, IdAula)
VALUES
('71640029-AP-III', '71640029-2023', 'AP', '2024-1', 'AP2024-1'),
('61700455-AP-III', '61700455-2023', 'AP', '2024-1', 'AP2024-1'),
('76145305-AP-III', '76145305-2023', 'AP', '2024-1', 'AP2024-1'),
('73971041-AP-III', '73971041-2023', 'AP', '2024-1', 'AP2024-1'),
('71630547-AP-III', '71630547-2023', 'AP', '2024-1', 'AP2024-1'),
('60044651-AP-III', '60044651-2023', 'AP', '2024-1', 'AP2024-1'),
('71640187-AP-III', '71640187-2023', 'AP', '2024-1', 'AP2024-1')
;
INSERT INTO Matricula (IdMatricula, IdAlumno, IdProgramaEstudio, IdPeriodoLectivo, IdAula)
VALUES
('11111111-AP-IV', '11111111-2025', 'AP', '2024-2', 'AP2024-2');

SELECT * FROM Alumno

Select *From Matricula;
SELECT * FROM Notas WHERE IdMatricula='11111111-AP-IV';

SELECT * FROM Notas

-- 10. Insertar datos en la tabla Notas
INSERT INTO Notas (IdMatricula, IdUnidadDidactica, Nota)
VALUES
('71640029-AP-III','AP3UDA',15),
('71640029-AP-III','AP3UDB',18),
('71640029-AP-III','AP3UDC',17),
('71640029-AP-III','AP3UDD',16),
('71640029-AP-III','AP3UDE',17),
('71640029-AP-III','AP3UDF',17),
('71640029-AP-III','AP3UDG',15),
('61700455-AP-III','AP3UDA',14),
('61700455-AP-III','AP3UDB',18),
('61700455-AP-III','AP3UDC',15),
('61700455-AP-III','AP3UDD',15),
('61700455-AP-III','AP3UDE',13),
('61700455-AP-III','AP3UDF',17),
('61700455-AP-III','AP3UDG',14),
('76145305-AP-III','AP3UDA',13),
('76145305-AP-III','AP3UDB',16),
('76145305-AP-III','AP3UDC',15),
('76145305-AP-III','AP3UDD',13),
('76145305-AP-III','AP3UDE',13),
('76145305-AP-III','AP3UDF',16),
('76145305-AP-III','AP3UDG',14),
('73971041-AP-III','AP3UDA',13),
('73971041-AP-III','AP3UDB',14),
('73971041-AP-III','AP3UDC',16),
('73971041-AP-III','AP3UDD',15),
('73971041-AP-III','AP3UDE',14),
('73971041-AP-III','AP3UDF',16),
('73971041-AP-III','AP3UDG',16),
('71630547-AP-III','AP3UDA',13),
('71630547-AP-III','AP3UDB',17),
('71630547-AP-III','AP3UDC',15),
('71630547-AP-III','AP3UDD',14),
('71630547-AP-III','AP3UDE',13),
('71630547-AP-III','AP3UDF',16),
('71630547-AP-III','AP3UDG',13),
('60044651-AP-III','AP3UDA',15),
('60044651-AP-III','AP3UDB',14),
('60044651-AP-III','AP3UDC',15),
('60044651-AP-III','AP3UDD',13),
('60044651-AP-III','AP3UDE',14),
('60044651-AP-III','AP3UDF',16),
('60044651-AP-III','AP3UDG',14),
('71640187-AP-III','AP3UDA',13),
('71640187-AP-III','AP3UDB',14),
('71640187-AP-III','AP3UDC',14),
('71640187-AP-III','AP3UDD',14),
('71640187-AP-III','AP3UDE',13),
('71640187-AP-III','AP3UDF',16),
('71640187-AP-III','AP3UDG',14)
;
SELECT * FROM Usuario;
Select IdAlumno From Alumno Where dni =71640029;

/*Ejercicios*/
-- Ejercicio 1: Obtener el informe de notas de un alumno específico
SELECT 
    A.Nombres, 
    A.ApPaterno, 
    A.ApMaterno, 
    P.NombreProgramaEstudio, 
    PL.AnioPeriodoLectivo, 
    PL.NumeroPeriodoLectivo, 
    U.NombreUnidadDidactica, 
    U.CreditosUnidadDidactica,  -- Aquí agregamos el número de créditos
    N.Nota, 
    N.FechaRegistro
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN ProgramaEstudios P ON M.IdProgramaEstudio = P.IdProgramaEstudio
    JOIN PeriodoLectivo PL ON M.IdPeriodoLectivo = PL.IdPeriodoLectivo
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica
WHERE 
    A.Dni = '71640029';  -- Cambia por el DNI del alumno específico


SELECT 
    ROW_NUMBER() OVER (ORDER BY U.NombreUnidadDidactica) AS Correlativo, -- Número correlativo
    U.NombreUnidadDidactica, 
    U.CreditosUnidadDidactica, 
    N.Nota
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN ProgramaEstudios P ON M.IdProgramaEstudio = P.IdProgramaEstudio
    JOIN PeriodoLectivo PL ON M.IdPeriodoLectivo = PL.IdPeriodoLectivo
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica
WHERE 
    A.Dni = '71640029';  -- Cambia por el DNI del alumno específico


	SELECT 
    A.Nombres, 
    A.ApPaterno, 
    A.ApMaterno, 
    P.NombreProgramaEstudio, 
    PL.AnioPeriodoLectivo, 
    PL.NumeroPeriodoLectivo, 
    U.NombreUnidadDidactica, 
    U.CreditosUnidadDidactica, 
    N.Nota, 
    N.FechaRegistro,
    (N.Nota * U.CreditosUnidadDidactica) AS NotaPorCredito  -- Multiplicación de la nota por el crédito
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN ProgramaEstudios P ON M.IdProgramaEstudio = P.IdProgramaEstudio
    JOIN PeriodoLectivo PL ON M.IdPeriodoLectivo = PL.IdPeriodoLectivo
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica
WHERE 
    A.Dni = '71640029';  -- Cambia por el DNI del alumno específico


--Ejercicio 2: Generar el promedio de notas por alumno
SELECT 
    A.Nombres, A.ApPaterno, A.ApMaterno, 
    AVG(N.Nota) AS PromedioNota
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
WHERE 
    A.Dni = '71640029'
GROUP BY 
    A.Nombres, A.ApPaterno, A.ApMaterno;

--Ejercicio 3: Obtener el ranking de alumnos basado en su promedio de notas
SELECT 
    A.IdAlumno, A.Nombres, A.ApPaterno, A.ApMaterno, 
    AVG(N.Nota) AS PromedioNota
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
GROUP BY 
    A.IdAlumno, A.Nombres, A.ApPaterno, A.ApMaterno
ORDER BY 
    PromedioNota DESC;

--Ejercicio 4: Obtener la cantidad de alumnos matriculados por programa de estudios
SELECT 
    P.NombreProgramaEstudio, 
    COUNT(M.IdAlumno) AS CantidadAlumnos
FROM 
    Matricula M
    JOIN ProgramaEstudios P ON M.IdProgramaEstudio = P.IdProgramaEstudio
GROUP BY 
    P.NombreProgramaEstudio;

-- Ejercicio 5: Obtener la cantidad de alumnos matriculados por periodo lectivo
SELECT 
    PL.AnioPeriodoLectivo, PL.NumeroPeriodoLectivo, 
    COUNT(M.IdAlumno) AS CantidadAlumnos
FROM 
    Matricula M
    JOIN PeriodoLectivo PL ON M.IdPeriodoLectivo = PL.IdPeriodoLectivo
GROUP BY 
    PL.AnioPeriodoLectivo, PL.NumeroPeriodoLectivo;

--Ejercicio 6: Obtener las unidades didácticas con mayor y menor promedio de notas
SELECT 
    U.NombreUnidadDidactica, 
    AVG(N.Nota) AS PromedioNota
FROM 
    Notas N
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica
GROUP BY 
    U.NombreUnidadDidactica
ORDER BY 
    PromedioNota DESC;  -- Cambia a ASC para ver las unidades con menor promedio

--Ejercicio 7: Obtener el informe de alumnos que han aprobado o desaprobado una unidad didáctica
SELECT 
    U.NombreUnidadDidactica, 
    SUM(CASE WHEN N.Nota >= 13 THEN 1 ELSE 0 END) AS AlumnosAprobados,
    SUM(CASE WHEN N.Nota < 13 THEN 1 ELSE 0 END) AS AlumnosDesaprobados
FROM 
    Notas N
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica
GROUP BY 
    U.NombreUnidadDidactica;

--Ejercicio 8: Obtener el total de horas cursadas por un alumno
SELECT 
    A.Nombres, A.ApPaterno, A.ApMaterno, 
    SUM(U.HorasUnidadDidactica) AS TotalHoras
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica
WHERE 
    A.Dni = '71640029'
GROUP BY 
    A.Nombres, A.ApPaterno, A.ApMaterno;

-- Consulta: Calcular el promedio ponderado de un alumno
SELECT 
    A.IdAlumno, 
    A.Nombres, 
    A.ApPaterno, 
    A.ApMaterno, 
    FORMAT(ROUND(SUM(N.Nota * UD.CreditosUnidadDidactica) / NULLIF(SUM(UD.CreditosUnidadDidactica), 0), 2), 'N2') AS PromedioPonderado
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN Aula Au ON M.IdAula = Au.IdAula
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
    JOIN UnidadDidactica UD ON N.IdUnidadDidactica = UD.IdUnidadDidactica
WHERE 
    Au.IdAula = 'AP2024-1'  -- Cambia por el IdAula que deseas filtrar
GROUP BY 
    A.IdAlumno, A.Nombres, A.ApPaterno, A.ApMaterno
ORDER BY 
    PromedioPonderado DESC;  -- Para obtener el ranking



--Crear Vista para Ver las Matriculas
CREATE VIEW VistaMatriculas AS
SELECT 
    M.IdMatricula,
    A.IdAlumno,
    A.ApPaterno,
    A.ApMaterno,
    A.Nombres,
    M.IdProgramaEstudio,
    P.NombreProgramaEstudio,
    M.IdPeriodoLectivo,
    M.IdAula
FROM 
    Matricula M
INNER JOIN 
    Alumno A ON M.IdAlumno = A.IdAlumno
INNER JOIN 
    ProgramaEstudios P ON M.IdProgramaEstudio = P.IdProgramaEstudio;

SELECT * FROM VistaMatriculas;
SELECT * FROM Matricula;
SELECT * FROM Alumno;
SELECT * FROM Usuario;
SELECT * FROM PeriodoAcademico;
UPDATE Matricula SET IdMatricula = '11111111-AP-III', IdProgramaEstudio = 'AP', IdPeriodoLectivo = '2024-2', IdAula = 'AP2024-1' WHERE IdMatricula = '11111111-AP-III';



SELECT 
    a.IdAlumno,
    m.IdMatricula,
    a.Dni,
    LEFT(m.IdMatricula, CHARINDEX('-', m.IdMatricula) - 1) AS NumeroDNI,
    SUBSTRING(m.IdMatricula, CHARINDEX('-', m.IdMatricula) + 1, CHARINDEX('-', m.IdMatricula, CHARINDEX('-', m.IdMatricula) + 1) - CHARINDEX('-', m.IdMatricula) - 1) AS ProgramaEstudio,
    RIGHT(m.IdMatricula, LEN(m.IdMatricula) - CHARINDEX('-', m.IdMatricula, CHARINDEX('-', m.IdMatricula) + 1)) AS PeriodoAcademico
FROM 
    Alumno a
JOIN 
    Matricula m ON a.IdAlumno = m.IdAlumno
WHERE 
    a.Dni = '60044651';  -- Reemplaza '60044651' con el DNI que deseas consultar


SELECT 
    a.IdAlumno,                      -- Id del alumno
    m.IdMatricula,                   -- Id de la matrícula
    pe.NombreProgramaEstudio,        -- Nombre del programa de estudios
    pa.NombrePeriodoAcademico        -- Nombre del periodo académico
FROM 
    Alumno a
JOIN 
    Matricula m ON a.IdAlumno = m.IdAlumno
JOIN 
    ProgramaEstudios pe ON m.IdProgramaEstudio = pe.IdProgramaEstudio
JOIN 
    PeriodoAcademico pa ON SUBSTRING(m.IdMatricula, CHARINDEX('-', m.IdMatricula, CHARINDEX('-', m.IdMatricula) + 1) + 1, LEN(m.IdMatricula)) = pa.IdPeriodoAcademico
WHERE 
    a.Dni = '60044651';        -- Reemplaza 'DNI_DEL_ALUMNO' con el DNI que quieras buscar


SELECT 
    a.IdAlumno,                                          -- Id del alumno
	a.Dni,
    m.IdMatricula,                                       -- Id de la matrícula
    pe.NombreProgramaEstudio,                            -- Nombre del programa de estudios
    pa.IdPeriodoAcademico,                               -- Id del periodo académico (por ejemplo, III)
    CONCAT(a.ApPaterno, ' ', a.ApMaterno, ', ', a.Nombres) AS NombreCompleto  -- Nombre completo del alumno
FROM 
    Alumno a
JOIN 
    Matricula m ON a.IdAlumno = m.IdAlumno
JOIN 
    ProgramaEstudios pe ON m.IdProgramaEstudio = pe.IdProgramaEstudio
JOIN 
    PeriodoAcademico pa ON SUBSTRING(m.IdMatricula, CHARINDEX('-', m.IdMatricula, CHARINDEX('-', m.IdMatricula) + 1) + 1, LEN(m.IdMatricula)) = pa.IdPeriodoAcademico
WHERE 
    a.Dni = '60044651';                             -- Reemplaza 'DNI_DEL_ALUMNO' con el DNI que quieras buscar


	-- Crear la vista VistaAlumnoMatricula
CREATE VIEW VistaAlumnoMatricula AS
SELECT 
    a.IdAlumno,                                          -- Id del alumno
    a.Dni,                                               -- DNI del alumno
    m.IdMatricula,                                       -- Id de la matrícula
    pe.NombreProgramaEstudio,                            -- Nombre del programa de estudios
    pa.IdPeriodoAcademico,                               -- Id del periodo académico (por ejemplo, III)
    CONCAT(a.ApPaterno, ' ', a.ApMaterno, ', ', a.Nombres) AS NombreCompleto  -- Nombre completo del alumno
FROM 
    Alumno a
JOIN 
    Matricula m ON a.IdAlumno = m.IdAlumno
JOIN 
    ProgramaEstudios pe ON m.IdProgramaEstudio = pe.IdProgramaEstudio
JOIN 
    PeriodoAcademico pa ON SUBSTRING(m.IdMatricula, CHARINDEX('-', m.IdMatricula, CHARINDEX('-', m.IdMatricula) + 1) + 1, LEN(m.IdMatricula)) = pa.IdPeriodoAcademico;

-- Consultar datos de un alumno específico usando el DNI
SELECT * FROM VistaAlumnoMatricula WHERE Dni = '60044651';  -- Reemplaza 'DNI_DEL_ALUMNO' con el DNI que quieras buscar



SELECT * FROM VistaAlumnoMatricula WHERE Dni = '60044651';


SELECT * FROM ProgramaEstudios;
SELECT * FROM Alumno;
SELECT * FROM Matricula;

INSERT INTO Notas (IdMatricula, IdUnidadDidactica, Nota)
VALUES
('11111111-AP-II','AP4UDA',10);


drop view VistaUnidadesDidacticasNotas;

CREATE VIEW VistaUnidadesDidacticasNotas AS 
SELECT 
    ROW_NUMBER() OVER (PARTITION BY M.IdMatricula ORDER BY U.NombreUnidadDidactica) AS Correlativo, 
    M.IdMatricula,  -- Cambia esto para incluir idmatricula en la selección
    A.Dni,
    U.NombreUnidadDidactica, 
    U.CreditosUnidadDidactica, 
    N.Nota
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica;


	SELECT * FROM VistaUnidadesDidacticasNotas WHERE IdMatricula = '11111111-AP-IV';  -- Cambia '12345' por el idmatricula correspondiente

	drop VIEW VistaUnidadesDidacticasNotas
	CREATE VIEW  AS 
SELECT 
    ROW_NUMBER() OVER (PARTITION BY M.IdMatricula ORDER BY U.NombreUnidadDidactica) AS Correlativo, 
    M.IdMatricula,  
    A.Dni,
    U.NombreUnidadDidactica, 
    U.CreditosUnidadDidactica, 
    N.Nota,
    M.IdPeriodoLectivo  -- Agregar el campo del periodo lectivo
FROM 
    Alumno A
    JOIN Matricula M ON A.IdAlumno = M.IdAlumno
    JOIN Notas N ON M.IdMatricula = N.IdMatricula
    JOIN UnidadDidactica U ON N.IdUnidadDidactica = U.IdUnidadDidactica;


	SELECT * FROM VistaUnidadesDidacticasNotas WHERE IdMatricula = '60044651-AP-III';  -- Cambia '12345' por el idmatricula correspondiente
	SELECT * FROM Matricula

	SELECT * FROM VistaUnidadesDidacticasNotas WHERE idMatricula = '60044651-AP-III';
