class ReportesController < ApplicationController

  def inicio

  end

  def  crear

    @fecha= Time.now
    @contenido ="nada"
    @reporte = Reporte.create(tipo: params[:tipo], fecha:@fecha, contenido: @contenido)

    redirect_to action: 'index'
  end

  def index
    @reportes= Reporte.all
  end
end
