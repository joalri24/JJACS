class Tranvia < ActiveRecord::Base
  has_many :emergencias, inverse_of: :tranvia
end
