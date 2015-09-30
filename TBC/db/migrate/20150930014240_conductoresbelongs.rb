class Conductoresbelongs < ActiveRecord::Migration
  def change
    change_table :conductors do |t|
    t.belongs_to :mobibus, index: true
    t.belongs_to :tranvia, index: true
    end
    end
end
