class ClientesController < ApplicationController
  before_action :set_cliente, only: [:ingreso_sesion,:sign_in, :crear_reserva, :ver_reserva]

  def crear
    @cliente = Cliente.create(cedula: params[:cedula],nombre: params[:nombre])

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to action: 'ingreso_sesion',nombre: params[:nombre],cedula: params[:cedula] }
        format.json { render :ingreso_sesion, status: :created, location: @cliente }
      else
        format.html { render :crear }
        format.json { render json: @vcub.errors, status: :unprocessable_entity }
      end
    end
  end

  def inicio
  end



  def actualizar
  end

  def ingreso_sesion
    if @cliente.nil?
      redirect_to action: 'sign_in'
    else
    end
  end

  def eliminar
  end

  def set_cliente
    @mensaje= " "
    clientes= Cliente.where("nombre = ? AND cedula= ?", params[:nombre], params[:cedula])
    @cliente= clientes.first
    end



  def index
    @clientes= Cliente.all
  end

  def crear_reserva
  end


  def ver_reservas
  end

  def sign_in
  end
end
