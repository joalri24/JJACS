
module TrayectosHelper

  def self.puntuar (trayecto,id)

   @distancia= trayecto.distancia
   puts@distancia

   @duracion= trayecto.duracion
   puts@duracion
   @velocidad=(@distancia/@duracion).to_f

   @puntaje=9,0
   puts @velocidad

    if @velocidad>=35.0
      @puntaje=5.0
      else if @velocidad>=25.0 && @velocidad<35.0
             @puntaje=4.0
           else if @velocidad>=20.0 && @velocidad<25.0
                  @puntaje=3.0
                else if @velocidad>=10.0 && @velocidad<20.0
                       @puntaje=4.0
                     else
                       @puntaje=1.0
                     end
                end
           end

    end


   return @puntaje
  end
end
