class ReportesController < ApplicationController

  def inicio

  end

  def  crear

    @fecha= Time.now
    @contenido ='nada'
    @reporte = Reporte.create(tipo: params[:tipo], fecha:@fecha, contenido: @contenido)
    @contenido= ReportesHelper.distinguir_tipo(params[:tipo])

    @reporte.update_attributes(contenido:@contenido)
    redirect_to action: 'ver_reporte',reporte: @reporte.id
  end

  def index
    @reportes= Reporte.all
  end

  def mostrar
    @tipo = params[:tipo].to_s
    @reportes= Reporte.where("tipo = ?",params[:tipo])
  end

  def ver_reporte
    @reporte= Reporte.find(params[:reporte].to_i)
  end

end
