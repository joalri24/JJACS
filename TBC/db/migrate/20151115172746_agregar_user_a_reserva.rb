class AgregarUserAReserva < ActiveRecord::Migration
  def change
    change_table :reservas do |t|
      t.belongs_to :user, index: true
    end
  end
end
