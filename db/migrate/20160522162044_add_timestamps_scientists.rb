class AddTimestampsScientists < ActiveRecord::Migration
  def change
    add_column :scientists, :created_at, :datetime
    add_column :scientists, :updated_at, :datetime
  end
end
