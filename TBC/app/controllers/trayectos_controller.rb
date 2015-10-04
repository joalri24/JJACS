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
     return @tipo
    end
    end

  def asignar_distancia
    @distancia= rand(0..200).to_f
    return @distancia
  end

  def actualizar
    @trayecto = Trayecto.find(params[:id])
    @reserva= Reserva.find(@trayecto.reserva_id)
    @horaInicial= @reserva.fecha.strftime("%H:%M")
  end

  def actualizar_duracion
    @trayecto = Trayecto.find(params[:id])
    puts @trayecto.id
    @reserva= Reserva.find(@trayecto.reserva_id)
    @horaInicial=  @reserva.fecha.strftime("%H").to_f
    @horaInicial1= @reserva.fecha.strftime("%M").to_f
    @horaInicialum= @horaInicial1/60
    @horaInicial2= @horaInicialum+@horaInicial

    @hora= DateTime.parse(params[:hora])
    @horaFinal=  @hora.strftime("%H").to_f
    puts @horaFinal
    @horaFinal1=  @hora.strftime("%M").to_f
    @horaFinalum=@horaFinal1/60
    puts @horaFinalum
    @horaFinal2=@horaFinalum +@horaFinal

    @duracion=@horaFinal2- @horaInicial2
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
    if(@velocidad>=35.0)
      @puntaje=5.0
    else if(@velocidad>=25.0 && @velocidad<35.0)
           @puntaje=4.0
         else if(@velocidad>=20.0 && @velocidad<25.0)
                @puntaje=3.0
              else if(@velocidad>=10.0 && @velocidad<20.0)
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
