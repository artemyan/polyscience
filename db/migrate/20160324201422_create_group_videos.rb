class CreateGroupVideos < ActiveRecord::Migration
  def change
    create_table :group_videos do |t|
      t.string :source
      t.integer :group_id
    end
  end
end
