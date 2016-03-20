class CreateScientistProperties < ActiveRecord::Migration
  def change
    create_table :scientist_properties do |t|
      t.string :property
      t.integer :value
      t.integer :scientist_id
    end
  end
end
