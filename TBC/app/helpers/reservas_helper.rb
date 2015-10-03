module ReservasHelper


  def self.crear (id)

    @distancia=asignar_distancia
    @tipo= asignar_tipo(@distancia)
    @reserva_id= id

    @trayecto =Trayecto.create(duracion:0, distancia:@distancia, tipo:@tipo,reserva_id:@reserva_id)
    @trayecto.save
    @reserva= Reserva.find(@reserva_id)

  end

  def index
    @trayectos= Trayecto.all
  end

  def mostrar
    @trayecto=Trayecto.where("reserva_id= ?",params[:id]).first
  end


  def self.asignar_tipo (distancia)
    @tipo=0
    if distancia>0 && distancia<=9
      @tipo=1
    else if  distancia>9 && distancia<=49
           @tipo=2
         else
           @tipo=3
         end
    return @tipo
    end
  end

  def self.asignar_distancia
    @distancia= rand(0..200).to_f
    return @distancia
  end

end

