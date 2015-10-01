class EstacionesController < ApplicationController

  before_action :set_tranvia, only: [:actualizar, :mostrar, :destruir]

  def inicio
  end

  def index
  end

  def crear
  end

  def actualizar
  end

  def mostrar
  end

  def destruir
  end

  private
    def set_tranvia
      @estacion = Estacion.find(params[:id])
    end
end
