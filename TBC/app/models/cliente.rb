class Cliente < ActiveRecord::Base
  has_one :vcub
  has_many :reservas
  has_many :prestamos
end
