class Sinconductor < ActiveRecord::Migration
  def change

        remove_column(:mobibuses,:id_conductor)
        remove_column(:tranvia,:id_conductor)

  end

end
