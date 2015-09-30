class CreatePrestamos < ActiveRecord::Migration
  def change
    create_table :prestamos do |t|
      t.belongs_to :vcub, index: true
      t.belongs_to :cliente, index: true
      t.datetime :fecha

      t.timestamps
    end
  end
end
