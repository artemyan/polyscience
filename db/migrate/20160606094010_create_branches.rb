class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :title
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
