class VcubsController < ApplicationController
  before_action :set_vcub,  only: [:actualizar, :mostrar, :destruir]

  def index
    @vcubs=Vcub.all
  end

  def crear
    @vcub = Vcub.create(numero_identificacion: params[:numero_identificacion], prestada: false, id_usuario_actual: nil)
    respond_to do |format|
      if @vcub.save
        format.html { redirect_to vcubs_path}
        format.json { render :index, status: :created, location: @vcub }
      else
        format.html { render :crear }
        format.json { render json: @vcub.errors, status: :unprocessable_entity }
      end
    end
  end

  def actualizar
  end

  def mostrar
  end

  def destruir
  end

  def set_vcub
    @vcub=Vcub.find(params[:id])
  end
end
