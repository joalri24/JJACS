class Prestamo < ActiveRecord::Base
  belongs_to :vcub
  belongs_to :cliente
end
