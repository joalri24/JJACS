class EstacionesController < ApplicationController

  before_action :set_tranvia, only: [:actualizar, :mostrar, :destruir]

  def inicio
  end

  def index
    @estaciones = Estacion.all
  end

  def crear
    @estacion = Estacion.create(nombre: params[:nombre], capacidad: params[:capacidad])
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
