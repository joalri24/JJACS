class Vcub < ActiveRecord::Base
  has_many :prestamos
  belongs_to :estacion

  #----------------
  belongs_to :user

  paginates_per 2
end
