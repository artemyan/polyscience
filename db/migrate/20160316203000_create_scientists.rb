class CreateScientists < ActiveRecord::Migration
  def change
    create_table :scientists do |t|
      t.string :name
      t.text :text
    end
  end
end
