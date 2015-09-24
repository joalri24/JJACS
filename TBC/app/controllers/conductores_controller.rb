class ConductoresController < ApplicationController
  before_action :set_conductor, only: [:actualizar, :mostrar]

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
        format.html { render :nuevo }
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

      #if @conductor.update(nombre: params[:nombre],cedula: params[:cedula], puntaje: params[:puntaje])
      if @conductor.update(atributos)

        format.html { redirect_to :conductores_index}
        format.json { render :index, status: :ok, location: @conductor }
      else
        format.html { render :edit }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
    end

  def destruir
  end

  def set_conductor
    @conductor= Conductor.find(params[:id])
  end

end
