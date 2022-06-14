/*TEMA: SQL SERVER
SUBTEMA: ACTUALIZACIONES*/

/*1. Actualizar el estatus del Alumnos de los que están en propedéutico a capacitación*/
UPDATE ALUMNOS set idEstatus = 2 where idEstatus = 3;

/*2. Actualizar el segundo apellido del Alumno a Mayúsculas*/

UPDATE Alu SET Alu.segundoApellido = lowER(Alu.segundoApellido)
FROM Alumnos Alu;

SELECT * FROM ALUMNOS;

/*3. Actualizar el segundo Apellido para que la primera letra sea mayúsculas y el resto 
minúsculas*/
 
UPDATE ALUMNOS SET segundoApellido= STUFF(LOWER(segundoApellido),1,1, 
UPPER(LEFT(segundoApellido,1)))
SELECT * FROM ALUMNOS

/*4. Actualizar el número telefónico de los instructores para que los dos primeros 
dígitos sean 55, en caso de que de acuerdo al curp sean del DF*/

select nombre,curp,
SUBSTRING(curp, 12, 2) AS CURP_MENOS,
telefono AS Telefono_Original,
SUBSTRING(telefono,1,2) as Añadir ,
STUFF(TELEFONO, 1, 2, '51')as NuevoTelfono
from instructores where SUBSTRING(curp, 12, 2) = 'DF';

UPDATE instructores SET telefono = STUFF(TELEFONO, 1, 2, '00')  
where SUBSTRING(curp, 12, 2) = 'DF';

select * from instructores;

/*5. Subirles un punto en la calificación a los alumnos de Hidalgo y Oaxaca, y del 
Curso impartido en junio de 2021. Se deberá considerar que al incrementar el 
punto no exceda del máximo de la calificación permitida*/






/*6. Subirle el 10% de la cuota por hora a los profesores que han impartido el curso de 
Desarrollador .Net*/

UPDATE instructores SET cuotaHora = cuotaHora+(cuotaHora)*.10
FROM CursosInstructores C
WHERE IdCurso = (select IdCurso from CursosInstructores where IdCurso = 33);

UPDATE [instructores]
SET 
 cuotaHora = cuotaHora+(cuotaHora)*.10
FROM instructores INS
INNER JOIN CursosInstructores CI
ON CI.IdIstructor = INS.id
WHERE CI.IdCurso = 33;

SELECT * FROM instructores;

/*7. En la Base de Datos Ejercicios realice lo siguiente:*/
/*a. Copiar la Tabla de Alumnos de la Base de Datos InstitutoTich a la Tabla 
AlumnosTodos*/

Use InstitutoTich
SELECT * INTO InstitutoTich.dbo.AlumnosTodos from ALUMNOS;

/*b. Copiar a los alumnos de Hidalgo de la Tabla de Alumnos de la Base de 
Datos InstitutoTich a la Tabla AlumnosHgo*/

select * INTO InstitutoTich.dbo.AlumnosHgo
from ALUMNOS
where idestadoorigen = 12;

/*c. En la Tabla AlumnosHgo cambiarles el número telefónico inicie con 77, 
mediante la instrucción update*/

UPDATE AlumnosHgo SET telefono = STUFF(TELEFONO, 1, 2, '77')  
where SUBSTRING(telefono, 1, 2) = 55;

SELECT * FROM AlumnosHgo


/*d. Actualizar el teléfono de la tabla AlumnosTodos obtenidos desde la taba 
AlumnosHgo*/

UPDATE AlumnosTodos 
SET telefono = (select telefono from AlumnosHgo)
FROM InstitutoTich.dbo.AlumnosHgo as H ,AlumnosTodos AS T
WHERE H.id = T.id;