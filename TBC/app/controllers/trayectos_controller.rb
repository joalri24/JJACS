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

end
