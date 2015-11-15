class AgregarTranviaAUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :tranvia, index: true
    end
  end
end
