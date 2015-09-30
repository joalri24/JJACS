class CreateTrayectos < ActiveRecord::Migration
  def change
    create_table :trayectos do |t|
      t.belongs_to :reserva, index: true
      t.float :distancia
      t.float :duracion
      t.integer :tipo
      t.timestamps
    end
  end
end
