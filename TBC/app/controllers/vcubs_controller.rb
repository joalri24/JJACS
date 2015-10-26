class VcubsController < ApplicationController
  before_action :set_vcub,  only: [:actualizar, :mostrar, :destruir]
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios

  def index
    @vcubs=Vcub.all
  end

  def inicio
  end

  def crear
    @vcub = Vcub.create(numero_identificacion: params[:numero_identificacion], prestada: false, cliente_id: nil)
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

      if params[:cliente_id] != nil
        atributos['cliente_id'] = params[:cliente_id]
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

  #Si el usuario no es un admin, le cierra la sesión y lo devuelve al home
  def autenticar_con_privilegios
    unless current_user.admin? || current_user.empleado_vcub?
      sign_out current_user
      redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
    end
  end
end
