class TranviasController < ApplicationController
  before_action :set_tranvia, only: [:actualizar, :mostrar, :destruir]

  def index
    @tranvias = Tranvia.all
  end

  def crear
  end

  def actualizar
  end

  def mostrar
  end

  def destruir
  end

  def set_tranvia
    @conductor= Conductor.find(params[:id])
  end
end
