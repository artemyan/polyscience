class CreateBranchesScientists < ActiveRecord::Migration
  def change
    create_table :branches_scientists, id: false do |t|
      t.belongs_to :branch, index: true
      t.belongs_to :scientist, index: true
    end
  end
end
