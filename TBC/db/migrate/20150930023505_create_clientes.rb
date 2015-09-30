class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.integer :cedula

      t.timestamps
      end
      change_table :vcubs do |t|
        t.belongs_to :cliente, index: true
    end
  end
end
