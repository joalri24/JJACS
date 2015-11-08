class TrayectosController < ApplicationController
  def crear

    @distancia=asignar_distancia
    @tipo= asignar_tipo(@distancia)
    @reserva_id= params[:id]

    @trayecto =Trayecto.create(duracion:0, distancia:@distancia, tipo:@tipo,reserva_id: params[:id])
    @trayecto.save
    @reserva= Reserva.find(@reserva_id)
    respond_to do |format|
      format.html { redirect_to controller:'reservas', action:'index', id: @reserva.cliente_id, status: 200}
    end

  end

  def index
    @trayectos= Trayecto.all
  end

  def mostrar
    @trayecto=Trayecto.where("reserva_id= ?",params[:id]).first
  end


  def asignar_tipo (distancia)
    @tipo=0
    if distancia>0 && distancia<=9
      @tipo=1
    else if  distancia>9 && distancia<=49
           @tipo=2
        else
          @tipo=3
        end
      @tipo
    end
  end

  def asignar_distancia
    @distancia= rand(0..200).to_f
  end

  def actualizar
    @trayecto = Trayecto.find(params[:id])
    @reserva= Reserva.find(@trayecto.reserva_id)
    @hora_inicial= @reserva.fecha.strftime("%H:%M")
  end

  #TODO Utilizar helpers para no sobrecargar el controlador.
  #TODO Renombrar variables(o almenos comentar la diferencia entre hora_inicial y hora_inicial1)
  #TODO borrar puts
  def actualizar_duracion
    @trayecto = Trayecto.find(params[:id])
    puts @trayecto.id
    @reserva= Reserva.find(@trayecto.reserva_id)
    @hora_inicial=  @reserva.fecha.strftime("%H").to_f
    @hora_inicial1= @reserva.fecha.strftime("%M").to_f
    @hora_inicial_um= @hora_inicial1/60
    @hora_inicial2= @hora_inicial_um+@hora_inicial

    @hora= DateTime.parse(params[:hora])
    @hora_final=  @hora.strftime("%H").to_f
    puts @hora_final
    @hora_final1=  @hora.strftime("%M").to_f
    @hora_final_um=@hora_final1/60
    puts @hora_final_um
    @hora_final2=@hora_final_um +@hora_final

    @duracion=@hora_final2- @hora_inicial2
    puts @duracion
    @trayecto.update_attributes(duracion: @duracion)


    @id= @reserva.mobibus_id
    @conductor= Conductor.where("mobibus_id = ?",@id)
    @conductorReal= @conductor.first.id

    @distancia= @trayecto.distancia
    @duracion= @trayecto.duracion
    @velocidad=(@distancia/@duracion).to_f
    @puntaje=9,0

    puts @velocidad

    # TODO esto se puede escribir como un método aparte en un helper
    if @velocidad >= 35.0
      @puntaje=5.0
    else if @velocidad >=25.0 && @velocidad < 35.0
           @puntaje=4.0
         else if @velocidad >= 20.0 && @velocidad < 25.0
                @puntaje=3.0
              else if @velocidad >= 10.0 && @velocidad < 20.0
                     @puntaje=4.0
                   else
                     @puntaje=1.0
                   end
              end
         end

    end

    redirect_to  controller:'conductores' ,action:'calcular_puntaje', id:@conductorReal, puntaje:@puntaje
  end

end
