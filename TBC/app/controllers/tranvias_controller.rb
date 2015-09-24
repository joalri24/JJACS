class TranviasController < ApplicationController
  before_action :set_tranvia, only: [:actualizar, :mostrar, :destruir]

  def index
    @tranvias = Tranvia.all
  end

  def crear
    @tranvia = Tranvia.create(numero_identificacion: params[:numero_identificacion], linea: params[:linea], latitud: 0.0, longitud: 0.0, estado: 0, kilometros_desde_revision: 0.0, temperatura: 20.0, boton_panico: false, id_conductor: nil)

    respond_to do |format|
      if @tranvia.save
        format.html { redirect_to tranvias_index_path}
        format.json { render :index, status: :created, location: @tranvia }
      else
        format.html { render :crear }
        format.json { render json: @tranvia.errors, status: :unprocessable_entity }
      end
    end
  end

  def actualizar
  end

  def mostrar
  end

  def destruir
  end

  def set_tranvia
    @tranvia= Tranvia.find(params[:id])
  end
end
