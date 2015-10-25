class AgregarUsuarioPrestamo < ActiveRecord::Migration
  def change
    change_table :prestamos do |t|
      t.belongs_to :user, index: true
    end
  end
end
