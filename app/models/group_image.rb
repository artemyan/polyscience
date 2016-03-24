class GroupImage < ActiveRecord::Base
  belongs_to :group

  has_attached_file :image, styles: {
    medium: { geometry: "220x220#" }
  }
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end