class CreateBranchesGroups < ActiveRecord::Migration
  def change
    create_table :branches_groups, id: false do |t|
      t.belongs_to :branch, index: true
      t.belongs_to :group, index: true
    end
  end
end
