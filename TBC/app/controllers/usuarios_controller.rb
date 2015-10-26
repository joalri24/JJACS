class UsuariosController < ApplicationController
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios

  def index
    @users = User.all
  end

  def mostrar
  end

  def modificar
  end

  def actualizar
  end

  #Si el usuario no es un admin, le cierra la sesión y lo devuelve al home
  def autenticar_con_privilegios
    unless current_user.admin?
      sign_out current_user
      redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
    end
  end
end
