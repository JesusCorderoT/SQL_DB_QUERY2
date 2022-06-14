-------------------------------SUBTEMA: Operadores de conjuntos-----------------------------------
/*Se utilizan principalmente para combinar el resultado de más de 1 instrucción select 
y devolver un único conjunto de resultados al usuario. tenemos 4 operadores 
de conjuntos disponibles en SQL Server.*/
/*1.-UNION: Combina dos o más conjuntos de resultados en un solo conjunto, sin duplicados.
  2.-UNION ALL: Combine dos o más conjuntos de resultados en un solo conjunto, incluidos
     todos los duplicados.
  3.-INTERSECT: Toma los datos de ambos conjuntos de resultados que son comunes.
  4.-EXCEPT: Toma los datos del primer conjunto de resultados, pero no del segundo conjunto
     de resultados (es decir, no coincide entre sí)*/
--------------Puntos que se deben de tomar en cuenta al trabajar con Operaciones de conjunto:----------------
--Cada instrucción dentro debe tener el mismo número de columnasSELECTUNION
--Las columnas también deben tener tipos de datos similares
--Las columnas de cada instrucción también deben estar en el mismo ordenSELECT
--Para ordenar el resultado, una cláusula ORDER BY debe formar parte de la última instrucción select.
--************************************************************************************************
--Operador UNION
--Combina dos o más conjuntos de resultados en un solo conjunto, sin duplicados
  -------------------------------------------SINTAXIS------------------------------------- 
	--SELECT column_name(s) FROM table1
	--UNION
	--SELECT column_name(s) FROM table2;
	SELECT 'Alumno' as TipoPersona,nombre, primerApellido, segundoApellido
	FROM Alumnos
	UNION 
	SELECT 'Profesor' as TipoPersona, nombre, primerApellido, segundoApellido 
	FROM Instructores
	ORDER BY TipoPersona

	SELECT * FROM Alumnos
	SELECT * FROM Instructores
--Operador UNION ALL
/*Combine dos o más conjuntos de resultados en un solo conjunto, incluidos 
todos los duplicados.*/
 -------------------------------------------SINTAXIS------------------------------------- 
	--SELECT column_name(s) FROM table1
	--UNION ALL
	--SELECT column_name(s) FROM table2;
	SELECT 'Alumno' as TipoPersona,nombre, primerApellido, segundoApellido
	FROM Alumnos
	UNION ALL
	SELECT 'Profesor' as TipoPersona, nombre, primerApellido, segundoApellido 
	FROM Instructores
	ORDER BY TipoPersona

--Operador INTERSECT
--Toma los datos de ambos conjuntos de resultados que son comunes.
 -------------------------------------------SINTAXIS------------------------------------- 
	--SELECT column_name(s) FROM table1
	--INTERSECT
	--SELECT column_name(s) FROM table2;
	SELECT 'Alumno' as TipoPersona,nombre, primerApellido, segundoApellido
	FROM Alumnos
	INTERSECT
	SELECT 'Profesor' as TipoPersona, nombre, primerApellido, segundoApellido 
	FROM Instructores
	ORDER BY TipoPersona

--Operador EXCEPT
 /*Toma los datos del primer conjunto de resultados, pero no del segundo conjunto
   de resultados (es decir, no coincide entre sí)*/
    -------------------------------------------SINTAXIS------------------------------------- 
	--SELECT column_name(s) FROM table1
	--EXCEPTO
	--SELECT column_name(s) FROM table2;
	
	SELECT 'Profesor' as TipoPersona, nombre, primerApellido, segundoApellido 
	FROM Instructores
	EXCEPT
	SELECT 'Alumno' as TipoPersona,nombre, primerApellido, segundoApellido
	FROM Alumnos
	ORDER BY TipoPersona
--***********************************************************************************
--Instrucción SQL UPDATE
--La instrucción se utiliza para modificar los registros existentes en una tabla.
-------------------------------------------SINTAXIS-------------------------------------
	/*UPDATE table_name
	SET column1 = value1, column2 = value2, ...
	WHERE condition;*/
--@table_name: Especifica una variable de tabla como origen de tabla.
--SET: Especifica la lista de nombres de columna o variable que se van a actualizar.
--column_name:Es una columna que contiene los datos que se van a cambiar. Las columnas de identidad no se pueden actualizar.
	UPDATE Alu SET Alu.segundoApellido = UPPER(Alu.segundoApellido)
	FROM Alumnos Alu 
	WHERE idEstadoOrigen= 29

	SELECT * FROM Alumnos
--****************************************************************************************
--Función STUFF()
--Elimina una parte de una cadena y, a continuación, inserta otra parte en la cadena, comenzando 
--en una posición especificada.
-------------------------------------------SINTAXIS-------------------------------------
--STUFF(string, start, length, new_string)
	/*string: Es una expresión de datos de caracteres y puede ser una constante, variable o columna 
	de carácter o datos binarios.*/
	/*start: Es un valor entero que especifica la ubicación para iniciar la eliminación y la inserción.*/
	/*length: Es un entero que especifica el número de caracteres que se van a eliminar.*/
	SELECT STUFF('Practicando SQL server', 13, 7, 'en TICH');

	SELECT nombre,primerApellido,(STUFF(LOWER(segundoApellido), 1,2 , UPPER(LEFT(segundoApellido,2)))) 
	as segundoApellido FROM Alumnos;
	
	select * from Alumnos


