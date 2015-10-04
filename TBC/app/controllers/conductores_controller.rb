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
    @conductor.save
    @tipo= params[:tipo]
    if @tipo=="tranvia"
      @tranvias=Tranvia.where("estado= ?",-1)
      @conductor.update_attributes(mobibus_id:0)
    else
      @mobibuses= Mobibus.where("estado= ?",-1)
      @conductor.update_attributes(tranvia_id:0)
    end
end

  def asignar_transporte
    @id= params[:id]
    @tipo = params[:tipo]
    @id_conductor=params[:id_conductor]
    @conductor= Conductor.find(@id_conductor)
    if @tipo=="tranvia"
      @conductor.update_attributes(tranvia_id:@id)
      @tranvia= Tranvia.find(@id)
      @tranvia.update_attributes(estado:0)
    else
      @conductor.update_attributes(mobibus_id:@id)
      @mobibus= Mobibus.find(@id)
      @mobibus.update_attributes(estado:0)
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
