class AgregarVcubUsers < ActiveRecord::Migration
  def change
    add_column :users, :empleado_vcub, :boolean, default: false
  end
end
