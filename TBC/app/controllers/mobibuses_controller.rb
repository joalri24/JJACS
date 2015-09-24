class MobibusesController < ApplicationController
  before_action :set_mobibus, only: [:actualizar, :mostrar, :destruir]
  def crear
    @mobibus = Mobibus.create(estado:0, placa: params[:placa], longitud: 0.0, latitud: 0.0,id_conductor: 0,kilometer_desde_revision:0)
    respond_to do |format|
      if @mobibus.save
        format.html { redirect_to :mobibuses_index}
        format.json { render :index, status: :created, location: @mobibus }
      else
        format.html { render :crear }
        format.json { render json: @mobibus.errors, status: :unprocessable_entity }
      end
    end
  end

  def actualizar

    respond_to do |format|
      atributos = Hash.new

      if params[:placa] != nil
        atributos["placa"] = params[:placa]
      end

      if params[:latitud] != nil
        atributos["latitud"] = params[:latitud]
      end

      if params[:longitud] != nil
        atributos["longitud"] = params[:longitud]
      end

      if params[:estado] != nil
        atributos["estado"] = params[:estado]
      end

      if params[:id_conductor] != nil
        atributos["id_conductor"] = params[:idConductor]
      end

      if params[:kilometros] != nil
        atributos["kilometer_desde_revision"] = params[:kilometros]
      end

      #if @conductor.update(nombre: params[:nombre],cedula: params[:cedula],  puntaje: params[:puntaje])
      if @mobibus.update(atributos)

        format.html { redirect_to :mobibuses_index}
        format.json { render :index, status: :ok, location: @mobibus}
      else
        format.html { render :actualizar }
        format.json { render json: @mobibus.errors, status: :unprocessable_entity }
      end
    end
  end

  def destruir
    @mobibus.destroy
    respond_to do |format|
      format.html { redirect_to :mobibuses_index}
    end
  end

  def index
    @mobibuses= Mobibus.all
  end

  def mostrar
  end



  def set_mobibus
    @mobibus= Mobibus.find(params[:id])
  end
end
