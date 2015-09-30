class CreateEstacions < ActiveRecord::Migration
  def change
    create_table :estacions do |t|
      t.string :nombre
      t.integer :capacidad

      t.timestamps
    end
  end
  change_table :vcubs do |t|
    t.belongs_to :estacion, index: true
  end
end
