class UsuariosController < ApplicationController
  before_action :set_usuario,  only: [:actualizar, :mostrar]
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios

  def index
    @users = User.all
  end

  def mostrar
  end

  def actualizar
    @user.update_attribute(:admin,params[:admin])
    @user.update_attribute(:empleado_vcub,params[:empleado_vcub])
  end

  def set_usuario
    @user=User.find(params[:id])
  end

  #Si el usuario no es un admin, le cierra la sesión y lo devuelve al home
  def autenticar_con_privilegios
    unless current_user.admin?
      sign_out current_user
      redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
    end
  end
end
