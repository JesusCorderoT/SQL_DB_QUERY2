/*Extra*/

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