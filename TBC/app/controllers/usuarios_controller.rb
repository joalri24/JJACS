class UsuariosController < ApplicationController
  before_action :set_usuario,  only: [:actualizar, :mostrar]
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios

  def index
    @users = User.all
  end

  def mostrar
  end

  def actualizar
    atributos = Hash.new

    if params[:admin] != nil
      atributos['admin'] = params[:admin]
    end

    if params[:empleado_vcub] != nil
      atributos['empleado_vcub'] = params[:empleado_vcub]
    end

    if params[:conductor] != nil
      atributos['conductor'] = params[:conductor]
    end

    if params[:cliente] != nil
      atributos['cliente'] = params[:cliente]
    end


    if @user.update(atributos)
    end
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
