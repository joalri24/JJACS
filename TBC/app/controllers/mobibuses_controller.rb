class MobibusesController < ApplicationController


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
  end

  def destruir
  end

  def index
    @mobibuses= Mobibus.all
  end

  def mostrar
  end
end
