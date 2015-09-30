class Mobibus < ActiveRecord::Base
  has_one :conductor
  has_many :reservas
end
