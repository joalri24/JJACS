class CreateMobibuses < ActiveRecord::Migration
  def change
    create_table :mobibuses do |t|
      t.integer :estado
      t.decimal :latitud
      t.decimal :longitud
      t.integer :id_conductor
      t.float :kilometer_desde_revision
      t.string :placa

      t.timestamps
    end
  end
end
