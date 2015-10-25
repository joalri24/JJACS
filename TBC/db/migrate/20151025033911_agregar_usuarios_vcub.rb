class AgregarUsuariosVcub < ActiveRecord::Migration
  def change
    change_table :vcubs do |t|
      t.belongs_to :user, index: true
    end
  end
end
