class Emergencia < ActiveRecord::Base
   belongs_to :tranvia, inverse_of: :emergencias
end
