class ConductoresController < ApplicationController
  before_action :set_conductor, only: [:actualizar, :mostrar, :destruir]

  def index
    @conductores= User.where('conductor=?', true)
  end

  def mostrar
  end

  def nuevo

  end

  def editar
  end

  # POST /conductores/crear
  def asignar_transportes1
    @tipo = params[:tipo]
    @id_conductor=params[:conductores]
    @id_real= @id_conductor.first
    @conductor= User.find(@id_real)
    if @tipo=='tranvia'
      @tranvias=Tranvia.where("estado= ?",-1)
      @conductor.update_attributes(mobibus_id:0)
    else
      @mobibuses= Mobibus.where("estado= ?",-1)
      @conductor.update_attributes(tranvia_id:0)
    end
end

  def asignar_transporte
    @tipo = params[:tipo]
    @id= params[:id]
    @id_conductor=params[:id_conductor]
    @conductor= User.find(@id_conductor)
    if @tipo=="tranvia"
      @conductor.update_attributes(tranvia_id:@id)
      @tranvia= Tranvia.find(@id)
      @tranvia.update_attributes(estado:0)
    else
      @conductor.update_attributes(mobibus_id:@id)
      @mobibus= Mobibus.find(@id)
      @mobibus.update_attributes(estado:0)
    end
    redirect_to action: 'index', status: 303
  end

  #TODO Diferencia entre puntaje_final y puntaje_f
  def calcular_puntaje

    @puntaje= params[:puntaje]
    @id= params[:id]
    @conductor=Conductor.find(@id)
    @puntaje_final= @conductor.puntaje
    @puntaje_f=@puntaje_final+ @puntaje.to_f
    @conductor.update_attributes(puntaje:@puntaje_f)
    redirect_to controller:'trayectos', action:'index'

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

        format.html { redirect_to action: 'index', status: 303}
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
      format.html { redirect_to action: 'index', status: 303}
    end

  end

  def set_conductor
    @conductor= Conductor.find(params[:id])
  end

end
