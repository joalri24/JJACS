class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.datetime :fecha
      t.integer :estado
      t.string :direccion_origen
      t.string :direccion_destino

      t.timestamps
      t.belongs_to :cliente, index: true
      t.belongs_to :mobibus, index: true
    end
  end
end
