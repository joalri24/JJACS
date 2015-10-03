#encoding: utf-8
class EstacionesController < ApplicationController

  before_action :set_estacion, only: [:actualizar, :mostrar, :destruir, :registrar]

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
    @numero_vcubs = @estacion.vcubs.size
  end

  def destruir
  end

  #Registra un vcub en la estación
  def registrar
    @mensaje = "Error, no se encontró un Vcub con id: #{params[:vcub_id]}"

    if Vcub.exists?(params[:vcub_id])
      @vcub = Vcub.find(params[:vcub_id])
      @mensaje = " Vcub #{params[:vcub_id]} registrado exitósamente"
      @vcub.estacion = @estacion
      @vcub.prestada = false
      @vcub.save

    end

  end

  private
    def set_estacion
      @estacion = Estacion.find(params[:id])
    end
end
