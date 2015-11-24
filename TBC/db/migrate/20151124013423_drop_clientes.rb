class DropClientes < ActiveRecord::Migration
  def change
    drop_table :clientes
  end
end
