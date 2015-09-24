class ConductoresController < ApplicationController
  before_action :set_conductor, only: [:actualizar, :mostrar, :destruir]

  def index
    @conductores= Conductor.all
  end

  def mostrar
  end

  def nuevo

  end

  def editar
  end

  # POST /conductores/crear
  def crear
    @conductor = Conductor.create(nombre: params[:nombre], cedula: params[:cedula], puntaje: 0.0)

    respond_to do |format|
      if @conductor.save
        format.html { redirect_to :conductores_index}
        format.json { render :index, status: :created, location: @conductor }
      else
        format.html { render :crear }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end

  end

  def actualizar

    respond_to do |format|
      atributos = Hash.new

      if params[:nombre] != nil
        atributos["nombre"] = params[:nombre]
      end

      if params[:cedula] != nil
        atributos["cedula"] = params[:cedula]
      end

      if params[:puntaje] != nil
        atributos["puntaje"] = params[:puntaje]
      end

      #if @conductor.update(nombre: params[:nombre],cedula: params[:cedula],  puntaje: params[:puntaje])
      if @conductor.update(atributos)

        format.html { redirect_to :conductores_index}
        format.json { render :index, status: :ok, location: @conductor }
      else
        format.html { render :actualizar }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
    end

  def destruir
    @conductor.destroy
    respond_to do |format|
      format.html { redirect_to :conductores_index}
    end

  end

  def set_conductor
    @conductor= Conductor.find(params[:id])
  end

end
