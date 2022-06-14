/*E39*/

	SELECT 'Alumno' as TipoPersona,nombre, primerApellido, segundoApellido,MONTH(fechaNacimiento) Mes ,DAY(fechaNacimiento) as Dia
	FROM Alumnos
	UNION 
	SELECT 'Profesor' as TipoPersona, nombre, primerApellido, segundoApellido,MONTH(fechaNacimiento) Mes ,DAY(fechaNacimiento) as Dia
	FROM Instructores
	ORDER BY DAY(fechaNacimiento),MONTH(fechaNacimiento);

