class AgregarMobibusAUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :mobibus, index: true
    end
  end
end
