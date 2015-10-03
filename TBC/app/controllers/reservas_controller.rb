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
     @reservas_espera=Reserva.where("estado=?" ,0)
     if @reservas_espera.length ==0
       puts @reservas_espera.length
      @selected.each do |reserva|
        puts reserva
        @reserva=Reserva.find(reserva.to_i)
        @trayecto =Trayecto.where("reserva_id=?", @reserva.id)
        if !@trayecto.nil?
        @trayecto1= @trayecto.first
        @trayecto1.destroy
        end
        @reserva.destroy

      end
       respond_to do |format|
         format.html { redirect_to action: 'index_all', status: 303}
     end
     else
       puts @reservas_espera.length
       asignar_a_espera(@selected)
     end
     end

 def asignar_a_espera(selected)
    i=0
    @reservas_espera=Reserva.where("estado=?" ,0)
    puts @reservas_espera.length
    selected.each do |reserva|
      @reservas_espera=Reserva.where("estado=?" ,0)
      @reserva=Reserva.find(reserva.to_i)
      if @reservas_espera.length==0
        puts "aqui"
        @trayecto =Trayecto.where("reserva_id=?", @reserva.id)
        if !@trayecto.nil?
          @trayecto1= @trayecto.first
          @trayecto1.destroy
        end
            @reserva.destroy

      else
     fecha= @reserva.fecha
      puts fecha
     @reservaA=@reservas_espera.where("fecha= ?",fecha)
     if (!@reservaA.nil? && @reserva.mobibus_id!=0)
         mobibus_id=@reserva.mobibus_id
         @trayecto =Trayecto.where("reserva_id=?", @reserva.id)
         if !@trayecto.nil?
           @trayecto1= @trayecto.first
           @trayecto1.destroy
         end
         @reserva.destroy
         #puede ser la misma #
         @reservaCambiar=@reservaA.first
         if !@reservaCambiar.nil?
         puts @reservaCambiar.id
         @reservaCambiar.update_attributes(mobibus_id:mobibus_id, estado:2)
         ReservasHelper.crear(@reservaCambiar.id)
         puts @reservaCambiar.mobibus_id
         else
           end
     else
       @trayecto =Trayecto.where("reserva_id=?", @reserva.id)
       if !@trayecto.nil?
         @trayecto1= @trayecto.first
         @trayecto1.destroy
       end
      @reserva.destroy
     end
      end
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
  @mobibuses=Mobibus.all

  if @reservas_iguales.length-1 == @mobibuses.length
     @reserva.update_attributes(estado:0)

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
    if @no_asignado

    end
  end
  puts @reserva.estado
  if (@reserva.estado==0)

    redirect_to action:'index', id: @reserva.cliente_id, status: 200
  else
  redirect_to controller:'trayectos',action:'crear', id: @reserva.id, status: 200
    end
end


    end


