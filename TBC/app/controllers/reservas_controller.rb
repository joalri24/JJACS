class ReservasController < ApplicationController

  before_action :set_reserva, only: [:mostrar]
  def crear
    @cliente=Cliente.find(params[:id])
  end

    def mostrar
    end

  def index
    @reservas= Reserva.where("cliente_id= ? ", params[:id])
    @cliente=Cliente.find(params[:id])
  end


  def set_reserva
    @reserva= Reserva.find(params[:id])
  end

def crear_res
  @hora= params[:hora].to_s
  @fecha = params[:fecha]
  @fechaf= @fecha + " " +@hora
  date = DateTime.parse(@fechaf)
  @formatted_date = date.strftime('%b %d %Y %H:%M:%S')
  @reserva =Reserva.create(estado:0, direccion_origen: params[:direccion_origen], direccion_destino: params[:direccion_destino], cliente_id:params[:id], mobibus_id:0, fecha: @formatted_date)
  @reserva.save
  respond_to do |format|
    format.html { redirect_to action:'mostrar', id: @reserva.id, status: 200}
  end
end

def asignar_mobibus
  @reserva= Reserva.find(params[:id_reserva])
  @no_asignado=true
  fecha=@reserva.fecha
  @fecha1= (fecha + 5.hours).to_datetime
  @fecha2= (fecha - 5.hours).to_datetime
  @reservas_iguales=Reserva.where("fecha=?",@fecha1 .. @fecha2)
  @mobibuses=Mobibus.all

  if @reservas_iguales.length == @mobibuses.length
     @reserva.updateAttribute(estado:1)
  else
    i=1
    while no_asignado  && @mobibuses.length<i do
      id_mobibus=@mobibuses.find(i).id

      if @reservas_iguales.any?{|reserva| reserva.mobibus_id==id_mobibus}.nil?
        no_asignado=true
        @reserva.updateAttributes(estado:2, mobibud_id: id_mobibus)
      else
      i+=1
      end
    end
  end
  redirect_to action:'indes', id: @reserva.cliente_id, status: 200
end


    end


