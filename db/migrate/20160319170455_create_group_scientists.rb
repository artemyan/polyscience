class CreateGroupScientists < ActiveRecord::Migration
  def change
    create_table :group_scientists do |t|
      t.integer :group_id
      t.integer :scientist_id
    end
  end
end
