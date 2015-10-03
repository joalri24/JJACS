class ReservasController < ApplicationController

  before_action :set_reserva, only: [:mostrar,]
  def crear
    @cliente=Cliente.find(params[:id])
  end

    def mostrar
    end

  def index
    @reservas= Reserva.where("cliente_id= ? ", params[:id])
    @cliente=Cliente.find(params[:id])
  end

  def index_all
    @reservas= Reserva.all
  end


  def eliminar
     @selected= params[:reservas]
      @selected.each do |reserva|
        @reserva=Reserva.find(reserva.to_i)
        @reserva.destroy
      end

     respond_to do |format|
       format.html { redirect_to action: 'index_all', status: 303}
     end



  end

  def inicio

  end

  def set_reserva
    @reserva= Reserva.find(params[:id])
  end

def crear_res
  @hora= params[:hora].to_s
  @fecha = params[:fecha]
  @fechaf= @fecha + " " +@hora
  date = DateTime.parse(@fechaf)
  @formatted_date = date.strftime('%b %d %Y %H:%M:%S')
  @reserva =Reserva.create(estado:0, direccion_origen: params[:direccion_origen], direccion_destino: params[:direccion_destino], cliente_id:params[:id], mobibus_id:0, fecha: @formatted_date)
  @reserva.save
  respond_to do |format|
    format.html { redirect_to action:'mostrar', id: @reserva.id, status: 200}
  end
end

def asignar_reserva
  @reserva= Reserva.find(params[:id_reserva])
  @no_asignado=true
  fecha=@reserva.fecha
  @fecha1= (fecha + 5.hours).to_datetime
  @fecha2= (fecha - 5.hours).to_datetime
  @reservas_iguales=Reserva.where("fecha=?" ,fecha)
  puts @reservas_iguales.length
  @mobibuses=Mobibus.all
  puts @mobibuses.length
  if @reservas_iguales.length-1 == @mobibuses.length
     @reserva.update_attributes(estado:1)
  else if @reservas_iguales.length == 0
         id_mobibus=@mobibuses.first
         @reserva.update_attributes(estado:2, mobibus_id: id_mobibus)
       end
    i=1
    while @no_asignado  && @mobibuses.length>i-1 do
      id_mobibus=@mobibuses.find(i).id
      @res=@reservas_iguales.any?{|reserva| reserva.mobibus_id==id_mobibus}
      if @res==false
        @no_asignado=false
        @reserva.update_attributes(estado:2, mobibus_id: id_mobibus)
      else
      i+=1
      end
    end
  end
  if @reserva.estado==0
    redirect_to action:'index', id: @reserva.cliente_id, status: 200
  end
  redirect_to controller:'trayectos',action:'crear', id: @reserva.id, status: 200
end


    end


