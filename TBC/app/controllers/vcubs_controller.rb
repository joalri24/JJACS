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
    respond_to do |format|
      atributos = Hash.new

      if params[:numero_identificacion] != nil
        atributos['numero_identificacion'] = params[:numero_identificacion]
      end

      if params[:prestada] != nil
        atributos['prestada'] = params[:prestada]
      end

      if params[:id_usuario_actual] != nil
        atributos['id_usuario_actual'] = params[:id_usuario_actual]
      end

      if @vcub.update(atributos)

        format.html { redirect_to action: 'index', status: 303}
        format.json { render :index, status: :ok, location: @vcub}
      else
        format.html { render :actualizar }
        format.json { render json: @vcub.errors, status: :unprocessable_entity }
      end
    end
  end

  def mostrar
  end

  def destruir
    @vcub.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', status: 303}
    end
  end

  def set_vcub
    @vcub=Vcub.find(params[:id])
  end
end
