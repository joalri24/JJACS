class CambiarDefaultClienteEnUser < ActiveRecord::Migration
  def change
    change_column_default(:users, :cliente, true)
  end
end
