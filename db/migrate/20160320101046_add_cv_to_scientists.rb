class AddCvToScientists < ActiveRecord::Migration
  def change
    add_attachment :scientists, :cv
  end
end
