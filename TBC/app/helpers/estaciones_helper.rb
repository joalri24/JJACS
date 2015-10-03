module EstacionesHelper

  #El self. se pone para que pueda ser leido desde el controlador
  def self.existe_vcub?(id)
    resp = Vcub.exists?(id)
  end

  #El self. se pone para que pueda ser leido desde el controlador
  def self.existe_cliente?(id)
    resp = Cliente.exists?(id)
  end

  #El self. se pone para que pueda ser leido desde el controlador
  def self.existe_vcub_en_estacion?(vcub_id, estacion)
    resp = Vcub.exists?(vcub_id)
    if resp
      resp = Vcub.find(vcub_id).estacion ==  estacion
    end

  end
end
