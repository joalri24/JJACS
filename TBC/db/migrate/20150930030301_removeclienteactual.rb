class Removeclienteactual < ActiveRecord::Migration
  def change

      remove_column(:vcubs,:id_usuario_actual)
  end
end
