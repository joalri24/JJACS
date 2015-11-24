class Reserva < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :mobibus
  has_one :trayecto

  #----------------
  belongs_to :user

  paginates_per 4

end
