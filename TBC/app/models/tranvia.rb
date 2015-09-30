class Tranvia < ActiveRecord::Base
  has_many :emergencias, inverse_of: :tranvia
  has_one :conductor
end
