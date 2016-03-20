class AddLikToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :link, :string
  end
end
