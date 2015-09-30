class EmergenciasController < ApplicationController
  before_action :set_emergencia, only: [:mostrar]


  def crear
    @emergencia = Emergencia.new
    fecha = Time.now
    @emergencia.update_attributes(tranvia_id: params[:tranvia_id], tipo: params[:tipo], magnitud: params[:magnitud], latitud:  params[:latitud], longitud:  params[:longitud], fecha: fecha )
    @emergencia.save
    format.html { redirect_to action: 'mostrar'}
  end

  def mostrar
  end

  def set_emergencia
    @emergencia= Emergencia.find(params[:id])
  end


end
