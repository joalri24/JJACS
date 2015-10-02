class ClientesController < ApplicationController

  def crear
    @cliente = Cliente.create(cedula: params[:cedula],nombre: params[:nombre])

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to clientes_path}
        format.json { render :index, status: :created, location: @vcub }
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

  def eliminar
  end

  def mostrar
  end

  def index
    @clientes= Cliente.all
  end

  def crear_reserva
  end

end
