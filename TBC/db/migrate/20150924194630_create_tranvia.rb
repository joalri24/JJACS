class CreateTranvia < ActiveRecord::Migration
  def change
    create_table :tranvia do |t|
      t.integer :linea
      t.decimal :latitud
      t.decimal :longitud
      t.integer :estado
      t.float :kilometros_desde_revision
      t.float :temperatura
      t.boolean :boton_panico
      t.integer :numero_identificacion
      t.integer :id_conductor

      t.timestamps
    end
  end
end
