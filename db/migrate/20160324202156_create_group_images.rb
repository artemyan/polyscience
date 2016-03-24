class CreateGroupImages < ActiveRecord::Migration
  def change
    create_table :group_images do |t|
      t.attachment :image
      t.integer :group_id
    end
  end
end
