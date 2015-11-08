class ReservasController < ApplicationController

  before_action :set_reserva, only: [:mostrar,]



  def crear
    @cliente=User.find(current_user.id)
  end

    def mostrar
    end

  def index
    @reservas= Reserva.where("cliente_id= ? ", current_user.id)
    @cliente=User.find(current_user.id)
  end

  def index_all
    @reservas= Reserva.all
  end

##método que elimina la reserva, pero antes verifica si existen reservas en espera de tal manera que si alguna de las reservas a eliminar coincide con la fecha u hora de
  ## de las reservas en espera éstas sean asignadas.
  def eliminar
     @selected= params[:reservas]
     @reservas_espera=Reserva.where("estado=?" ,0)
     if @reservas_espera.length ==0
      @selected.each do |reserva|
        @trayec= Trayecto.all
        puts @trayec.first
        @trayecto =Trayecto.where("reserva_id=?", reserva)
        if (@trayecto.length!=0)
        @trayecto1= @trayecto.first
        @trayecto1.destroy
        end
        @reserva= Reserva.find(reserva)
        @reserva.destroy

      end
       respond_to do |format|
         format.html { redirect_to action: 'index'}
     end
     else
       asignar_a_espera(@selected)
     end
     end
## se encarga de asignar el mobibus de una reserva que va a eliminarse a una reserva en espera en el caso en el que coincidan las fechas
  ## elimina las reservas que no pudieron eliminarse por poder coincidir con alguna de las de espera
 def asignar_a_espera(selected)
    i=0
    @reservas_espera=Reserva.where("estado=?" ,0)
    selected.each do |reserva|
      @reserva=Reserva.find(reserva.to_i)
      if @reservas_espera.length==0
        @trayecto =Trayecto.where("reserva_id=?", @reserva.id)
        if @trayecto.length!=0
          @trayecto1= @trayecto.first
          @trayecto1.destroy
        end
            @reserva.destroy
      else
     fecha= @reserva.fecha
     @reservaA=@reservas_espera.where("fecha= ?",fecha)
     ## si hay reservas en espera con esa fecha y la reserva a eliminar no está en espera##
     if (@reservaA.length!=0 && @reserva.mobibus_id!=0 && @reserva.estado!=0)
         mobibus_id=@reserva.mobibus_id
         @trayecto =Trayecto.where("reserva_id=?", @reserva.id)
         if @trayecto.length!=0
           @trayecto1= @trayecto.first
           @trayecto1.destroy
         end
         @reserva.destroy
         @reservaCambiar=@reservaA.first
         @reservaCambiar.update_attributes(mobibus_id:mobibus_id, estado:2)
         ##crea el trayecto##
         ReservasHelper.crear(@reservaCambiar.id)
       ##no me sirve para asignar mobibus#
     else
       @trayecto =Trayecto.where("reserva_id=?", @reserva.id)
       if @trayecto.length!=0
         @trayecto1= @trayecto.first
         @trayecto1.destroy
       end
      @reserva.destroy
     end
      end
      end
    respond_to do |format|
      format.html { redirect_to action: 'index'}
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

   redirect_to action:'mostrar', id: @reserva.id, status: 301

end

def asignar_reserva
  @reserva= Reserva.find(params[:id_reserva])
  @no_asignado=true
  fecha=@reserva.fecha
  @fecha1= (fecha + 5.hours).to_datetime
  @fecha2= (fecha - 5.hours).to_datetime
  @reservas_iguales=Reserva.where("fecha=?" ,fecha)
  @mobibuses=Mobibus.where("estado != ?", -1)
  @length= @reservas_iguales.length-1

  if  @length== @mobibuses.length
     @reserva.update_attributes(estado:0)

  else if @reservas_iguales.length == 0

         id_mobibus=@mobibuses.first
         @reserva.update_attributes(estado:2, mobibus_id: id_mobibus)
       else

    i=0
    while @no_asignado  && @mobibuses.length>i do
      puts @mobibuses.length
      puts i
      id_mobibus=@mobibuses.at(i).id
      puts id_mobibus

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
  end
  puts @reserva.estado
  if (@reserva.estado==0)

    redirect_to action:'index', id: @reserva.cliente_id
  else
  redirect_to controller:'trayectos',action:'crear', id: @reserva.id
    end
end
    end


