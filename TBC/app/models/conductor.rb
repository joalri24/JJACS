class Conductor < ActiveRecord::Base
  belongs_to :mobibus
  belongs_to :tranvia
end
