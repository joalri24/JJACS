class CreateConductors < ActiveRecord::Migration
  def change
    create_table :conductors do |t|
      t.integer :cedula
      t.string :nombre
      t.float :puntaje
      t.timestamps
    end
  end
end
