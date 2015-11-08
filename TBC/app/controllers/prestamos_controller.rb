class PrestamosController < ApplicationController

  before_action :set_prestamo, only: [:mostrar]
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :autenticar_con_privilegios
                                      
  def index
    @prestamos = Prestamo.all
  end

  def mostrar
  end

  private
    def set_prestamo
      @prestamo = Prestamo.find(params[:id])
    end

    #Si el usuario no es un admin, le cierra la sesión y lo devuelve al home
    def autenticar_con_privilegios
      unless current_user.admin?
        sign_out current_user
        redirect_to root_path, notice: 'El usuario no tiene los permisos necesarios.'
      end
    end

end
