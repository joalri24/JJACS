class CreateReportes < ActiveRecord::Migration
  def change
    create_table :reportes do |t|
      t.integer :tipo
      t.datetime :fecha
      t.text :contenido

      t.timestamps
    end
  end
end
