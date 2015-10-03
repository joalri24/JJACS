class ReservasController < ApplicationController

  before_action :set_reserva, only: [:mostrar]
  def crear
    @hora= params[:hora].to_s
    @fecha = params[:fecha]
    @fechaf= @fecha + "" +@hora
    date = DateTime.parse(@fechaf)
    @formatted_date = date.strftime('%b %d %Y %H:%M:%S')
    @reserva =Reserva.create(estado:0, direccion_origen: params[:direccion_origen], direccion_destino: params[:direccion_destino], cliente_id:  params[:cliente_id], mobibus_id:0, fecha: @formatted_date)
    @reserva.save
    respond_to do |format|
      format.html { redirect_to action:'mostrar', id: @reserva.id, status: 200}
    end

  end

    def mostrar


    end


  def set_reserva

    @reserva= Reserva.find(params[:id])
  end


end
