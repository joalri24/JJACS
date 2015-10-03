class EmergenciasController < ApplicationController
  before_action :set_emergencia, only: [:mostrar]

  def index
    @emergencias = Emergencia.all
  end

  def crear
    @emergencia = Emergencia.new
    fecha = Time.now
    @emergencia.update_attributes(tranvia_id: params[:tranvia_id], tipo: params[:tipo], magnitud: params[:magnitud], latitud:  params[:latitud], longitud:  params[:longitud], fecha: fecha )
    @emergencia.save
    respond_to do |format|
      format.html { redirect_to action:'mostrar', id:@emergencia.id , status: 200}
    end
  end

  def mostrar
  end

  def set_emergencia
    @emergencia= Emergencia.find(params[:id])
  end


end
