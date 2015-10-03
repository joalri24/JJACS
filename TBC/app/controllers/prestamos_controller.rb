class PrestamosController < ApplicationController

  before_action :set_prestamo, only: [:mostrar]
                                      
  def index
  end

  def mostrar
  end

  private
    def set_prestamo
      @prestamo = Prestamo.find(params[:id])
    end
end
