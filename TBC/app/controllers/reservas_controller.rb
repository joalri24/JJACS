class ReservasController < ApplicationController

    def crear
      @reserva= Reserva.new
      @Reserva.update_attributes(estado:0, direccion_origen: params[:direccion_origen], direccion_destino: params[:direccion_destino], cliente_id:  params[:cliente_id], mobibus_id:0, fecha: paramas[:fecha] )
      @reserva.save
      respond_to do |format|
        format.html { redirect_to action:'mostrar', id:@reserva.id , status: 200}
      end
    end

    def mostrar
    end



end
