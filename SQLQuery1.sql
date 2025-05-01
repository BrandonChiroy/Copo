USE ZoologicoDB 
	  Select Animales.Nombre,
	         Animales.Especie,
			 HabitosAlimentacion.TipoAlimento
			 FROM Animales
		 Inner Join HabitosAlimentacion on HabitosAlimentacion.AnimalID = Animales.AnimalID

		 Select top 5 Animales.Nombre,
	         Animales.Especie,
			 HabitosLimpieza.Frecuencia,
			 HabitosLimpieza.Metodo
			 FROM Animales
		 Inner Join HabitosLimpieza on Animales.AnimalID  = HabitosLimpieza.AnimalID

		 ORDER BY Animales.Especie asc 

		 select Animales.Nombre,
		 Animales.especie,
		 Zonas.Clima,
		 HabitosAlimentacion.TipoAlimento
		 From Animales
		 Inner join Zonas on Animales.ZonaID =Zonas.ZonaID 
		 Inner Join HabitosAlimentacion on Animales.AnimalID  = HabitosAlimentacion.AnimalID 
		 WHERE Animales.Edad > = 4
		 AND HabitosAlimentacion.Frecuencia like 'diaz'
		 order by Animales.Nombre asc
		execute sp_help [habitosAlimentacion]

		Select Cuidadores.Nombre
		From Cuidadores
		inner join AnimalCuidador on Cuidadores.Nombre = AnimalCuidador.CuidadorID
		inner join Animales on Animales.AnimalID = AnimalCuidador.AnimalID
		

		Select Cuidadores.Nombre,
		Animales.Especie,
		Animales.Nombre,
		HabitosAlimentacion.TipoAlimento,
		Zonas.Nombre
		from Animales
		inner join AnimalCuidador on Animales.AnimalID = AnimalCuidador.AnimalID
		inner join Cuidadores on AnimalCuidador.CuidadorID = Cuidadores.CuidadorID
		inner join HabitosAlimentacion on Animales.AnimalID = HabitosAlimentacion.AnimalID
		inner join Zonas on Animales.ZonaID = Zonas.ZonaID

		insert Animales (Nombre,Especie,FechaIngreso,Edad,ZonaID)
		values ('gris','perro','20240616',3,1)
		execute sp_help [Animales]

		select * from Animales

		UPDATE [Animales] SET [Edad] = 5  WHERE [Nombre] = 'Copo' 

		DELETE [Animales] WHERE AnimalID =6  