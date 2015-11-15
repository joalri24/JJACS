class TranviasController < ApplicationController
  before_action :set_tranvia, only: [:actualizar, :mostrar, :destruir, :crear_emergencia]
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios

  def index
    @tranvias = Tranvia.all
    respond_to do |format|
      format.html #index.html.erb
      format.json{render json: @tranvias}
    end
  end

  def crear

    @num=  params[:numero_identificacion].to_i
    @linea=  params[:linea].to_i

    @tranvia = Tranvia.create(numero_identificacion: @num, linea: @linea , latitud: 0.0, longitud: 0.0, estado: -1, kilometros_desde_revision: 0.0, temperatura: 20.0, boton_panico: false)

    respond_to do |format|
      if @tranvia.save
        format.html { redirect_to tranvias_path}
        format.json { render json: @tranvia }
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
        format.json { render json: @tranvia}
      else
        format.html { render :actualizar }
        format.json { render json: @tranvia.errors, status: :unprocessable_entity }
      end
    end
  end

  def mostrar
    # take(int) devuelve un número determinado de resultados. Sin parámetros devuelve un solo resultado.
    @conductor= User.where("tranvia_id = ?",@tranvia.id).take

    respond_to do |format|
      format.html #mostrar.html.erb
      format.json{render json: @tranvia}
    end
  end

  def destruir
    @tranvia.destroy
    respond_to do |format|
      format.html { redirect_to action:'index', status: 303}
      format.json { render json: @tranvia }
    end
  end

  def set_tranvia
    @tranvia= Tranvia.find(params[:id])
  end


  def crear_emergencia
    @tranvia.update_attributes(boton_panico: true, estado:1)
    redirect_to (emergencias_crear_path(tranvia_id: @tranvia.id, magnitud: 4, latitud: @tranvia.latitud, longitud:@tranvia.longitud,tipo:2))
  end


  #Si el usuario no es un admin, le cierra la sesión y lo devuelve al home
  def autenticar_con_privilegios
    unless current_user.admin?
      sign_out current_user
      redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
    end
  end
end
