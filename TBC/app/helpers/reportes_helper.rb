module ReportesHelper


  def self.distinguir_tipo(tipo)

    if(tipo=="1")
      tiempos_promedio()
      else if (tipo=="2")
             conductores()
      else if(tipo=="3")
             lineas_problemas()
           else
             accidentes_comunes()
           end
           end
    end
  end

  def self.tiempos_promedio()
    @contenido=""
        @trayectos1= Trayecto.where("tipo = ? AND duracion != ?", 1, 0.0)

         if(@trayectos1.length == 0)
           @contenido+="No hay trayectos tipo 1 realizados # "

         else
           @cantidad=@trayectos1.length
           @duracion=0.0
           @trayectos1.each do |trayecto|
             @duracion+= trayecto.duracion
           end
           @promedio= @duracion/@cantidad
           @contenido+="El tiempo promedio para los trayectos tipo 1 (de 0-10km) es de" + @promedio.to_s + "horas # "

           end

           @trayectos2= Trayecto.where("tipo = ? AND duracion != ?", 2, 0.0)
           if(@trayectos2.length == 0)
             @contenido+="No hay trayectos tipo 2 realizados # "

           else
             @cantidad=@trayectos2.length
             @duracion=0.0
             @trayectos2.each do |trayecto|
               @duracion+= trayecto.duracion
             end
             @promedio= @duracion/@cantidad
             @contenido+="El tiempo promedio para los trayectos tipo 2 (de 10-50km) es de" + @promedio.to_s + "horas # "

             end

             @trayectos3= Trayecto.where("tipo = ? AND duracion != ?", 3, 0.0)
             if(@trayectos3.length == 0)
               @contenido+="No hay trayectos tipo 3 realizados ## "

             else
               @cantidad=@trayectos3.length
               @duracion=0.0
               @trayectos3.each do |trayecto|
                 @duracion+= trayecto.duracion
               end
               @promedio= @duracion/@cantidad
               @contenido+="El tiempo promedio para los trayectos tipo 3 (de 10-50km) es de" + @promedio.to_s + "horas ##"


             end
             resp= @contenido


  end

  def self.conductores()
    @conductores= Conductor.where("mobibus_id != ? ",0)
    @contenido= ""
    if(@conductores.length==0)
      @contenido+= "No hay conductores que manejen mobibuses"
    else
           puts @conductores.length
          @conductores.each do |conductor|
            @id_mobibus= conductor.mobibus_id
            puts @id_mobibus
            @reservas = Reserva.where("mobibus_id= ?",@id_mobibus)
            puts @reservas.length
            if(@reservas.length==0)

            else
              @reservas.each do |reserva|
              @id_reserva = reserva.id

              @trayectos= Trayecto.where("reserva_id= ? AND duracion != ?",@id_reserva,0)
              puts @trayectos.length
               if (@trayectos.length==0)
               else
                  @cantidadDeTrayectos = @trayectos.length
                  puts @cantidadDeTrayectos
                  @puntaje= conductor.puntaje
                  puts @puntaje
                  @promedio = @puntaje/@cantidadDeTrayectos
                  puts @promedio
                  puts conductor.nombre
                 @contenido += "El conductor" + conductor.nombre + "tiene un puntaje de" + @promedio
               end
            end
          end
          end
    end

    if @contenido=""
      @contenido+= "Aun no se han realizado trayectos"
    end
    puts @contenido

    end




  def self.lineas_problemas()
    puts "linea"
  end

  def self.accidentes_comunes()
         puts "accidente"
  end


end
