class ConductoresController < ApplicationController


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
  end

  def destruir

  end



end
