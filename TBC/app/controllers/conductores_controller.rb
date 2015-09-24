class ConductoresController < ApplicationController

  def index

  end

  def mostrar

  end

  def nuevo

  end

  def editar
  end

  def crear
    @conductor = Conductor.new(conductor_params)

    respond_to do |format|
      if @conductor.save
        format.html { redirect_to @conductor, notice: 'Conductor was successfully created.' }
        format.json { render :mostrar, status: :created, location: @conductor }
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
