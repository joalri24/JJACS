class TranviasController < ApplicationController
  before_action :set_tranvia, only: [:actualizar, :mostrar, :destruir]

  def index
    @tranvias = Tranvia.all
  end

  def crear
    @tranvia = Tranvia.create(numero_identificacion: params[:numero_identificacion], linea: params[:linea], latitud: 0.0, longitud: 0.0, estado: 0, kilometros_desde_revision: 0.0, temperatura: 20.0, boton_panico: false, id_conductor: nil)

    respond_to do |format|
      if @tranvia.save
        format.html { redirect_to tranvias_path}
        format.json { render :index, status: :created, location: @tranvia }
      else
        format.html { render :crear }
        format.json { render json: @tranvia.errors, status: :unprocessable_entity }
      end
    end
  end

  def actualizar
    respond_to do |format|
      atributos = Hash.new

      if params[:numero_identificacion] != nil
        atributos['numero_identificacion'] = params[:numero_identificacion]
      end

      if params[:linea] != nil
        atributos['linea'] = params[:linea]
      end

      if params[:latitud] != nil
        atributos['latitud'] = params[:latitud]
      end

      if params[:longitud] != nil
        atributos['longitud'] = params[:longitud]
      end

      if params[:estado] != nil
        atributos['estado'] = params[:estado]
      end

      if params[:kilometros_desde_revision] != nil
        atributos['kilometros_desde_revision'] = params[:kilometros_desde_revision]
      end

      if params[:temperatura] != nil
        atributos['temperatura'] = params[:temperatura]
      end

      if params[:boton_panico] != nil
        atributos['boton_panico'] = params[:boton_panico]
      end

      if params[:id_conductor] != nil
        atributos['id_conductor'] = params[:id_conductor]
      end

      if @tranvia.update(atributos)

        format.html { redirect_to action:'index', status: 303}
        format.json { render :index, status: :ok, location: @tranvia}
      else
        format.html { render :actualizar }
        format.json { render json: @tranvia.errors, status: :unprocessable_entity }
      end
    end
  end

  def mostrar
  end

  def destruir
    @tranvia.destroy
    respond_to do |format|
      format.html { redirect_to action:'index', status: 303}
    end
  end

  def set_tranvia
    @tranvia= Tranvia.find(params[:id])
  end
end
