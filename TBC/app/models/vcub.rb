class Vcub < ActiveRecord::Base
  belongs_to :cliente
  has_many :prestamos
  belongs_to :estacion

  #----------------
  belongs_to :user

end
