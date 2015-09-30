class CreateEmergencia < ActiveRecord::Migration
  def change
    create_table :emergencia do |t|
      t.belongs_to :tranvia, index: true
      t.datetime :fecha
      t.integer :magnitud
      t.decimal :latitud
      t.decimal :longitud
      t.integer :tipo
      t.timestamps
    end

  end
end
