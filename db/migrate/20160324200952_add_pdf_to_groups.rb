class AddPdfToGroups < ActiveRecord::Migration
  def change
    add_attachment :groups, :pdf
  end
end
