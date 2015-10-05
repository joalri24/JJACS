class ReportesController < ApplicationController

  def inicio

  end

  def  crear

    @fecha= Time.now
    @contenido ="nada"
    @reporte = Reporte.create(tipo: params[:tipo], fecha:@fecha, contenido: @contenido)
    @contenido= ReportesHelper.distinguir_tipo(params[:tipo])

    @reporte.update_attributes(contenido:@contenido)
    redirect_to action: 'index'
  end

  def index
    @reportes= Reporte.all
  end
end
