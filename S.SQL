	CREATE TRIGGER Trigger_EliminarAlumnos
	ON alumnos
	AFTER DELETE
	AS
	SET NOCOUNT ON 
	BEGIN
		INSERT INTO AlumnosBaja (nombre,
								 primerApellido,
								 segundoApellido,
								 fechaBaja
								 )
		SELECT d.nombre,
			   d.primerApellido,
			   d.segundoApellido,
			   getdate()
		FROM deleted d;
	END
	GO
	
	