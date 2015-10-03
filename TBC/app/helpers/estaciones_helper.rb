module EstacionesHelper

  def existe_vcub?(id)
    resp = Vcub.exists?(id)
  end
end
