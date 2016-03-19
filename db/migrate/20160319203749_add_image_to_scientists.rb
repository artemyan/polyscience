class AddImageToScientists < ActiveRecord::Migration
  def change
    add_attachment :scientists, :image
  end
end
