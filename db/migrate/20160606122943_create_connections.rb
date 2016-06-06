class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :title
      t.integer :branch_id
      t.text :description
      t.string :location
    end
  end
end
