class AddPuntajeToUser < ActiveRecord::Migration
  def change
    add_column :users, :puntaje, :float, default: 0
    add_column :users, :conductor, :boolean, default: false
    add_column :users, :cliente, :boolean, default: false
  end
end
