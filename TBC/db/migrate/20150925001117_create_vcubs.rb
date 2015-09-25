class CreateVcubs < ActiveRecord::Migration
  def change
    create_table :vcubs do |t|
      t.integer :numero_identificacion
      t.boolean :prestada
      t.integer :id_usuario_actual

      t.timestamps
    end
  end
end
