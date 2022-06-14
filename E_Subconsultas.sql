/*1. Obtener el nombre del alumno cuya longitud es la más grande*/

SELECT nombre,LEN(nombre)LONGITUD from ALUMNOS	
where LEN(nombre) >= ALL(
select MAX(LEN(nombre)) from ALUMNOS);

/*2. Mostrar el o los alumnos menos jóvenes*/

select nombre,fechaNacimiento as Fecha_Joven from ALUMNOS where  fechaNacimiento in 
(SELECT MAX(fechaNacimiento) FROM ALUMNOS);

/*3. Obtener una lista de los alumnos que tuvieron la máxima calificación*/
select alu.nombre,primerApellido,segundoApellido,
cc.nombre,
cu.fechainicio,cu.fechatermino,
ca.calificacion 

from ALUMNOS AS ALU
	INNER JOIN CursosAlumnos AS ca ON ALU.id = ca.id
	INNER JOIN Cursos as cu ON ca.IdCurso = cu.id
	INNER JOIN CatCursos AS cc ON cu.idcatcurso = cc.id 

where calificacion >= ALL
(SELECT MAX(calificacion) FROM CursosAlumnos);

/*4. Obtener la siguiente consulta con los datos de cada uno de los cursos*/

SELECT cat.nombre,CU.fechainicio,CU.fechatermino,CA.Total,CA.CalMax,CA.CalMin,CA.CalPro FROM CatCursos cat

INNER JOIN (SELECT * FROM Cursos) 
AS CU ON cat.id = CU.idcatcurso
INNER JOIN (select IdCurso,COUNT(calificacion)AS Total ,
			MAX(calificacion) AS CalMax,
			MIN(calificacion) AS CalMin,
			AVG(calificacion) as CalPro FROM CursosAlumnos group by IdCurso,calificacion)
AS CA ON ca.IdCurso = cu.id

group by cat.nombre,CU.fechainicio,CU.fechatermino,CA.Total,CA.CalMax,CA.CalMin,CA.CalPro ;


/*5. Obtener una consulta de los alumnos que tienen una calificación igual o menor
que el promedio de calificaciones.*/

select AVG(calificacion) from CursosAlumnos;

select nombre,CA.calificacion 
	from ALUMNOS AS AL
INNER JOIN CursosAlumnos CA ON AL.id = CA.idalumno

	WHERE CA.calificacion <= ALL
(select AVG(calificacion) from CursosAlumnos)
group by nombre,calificacion;