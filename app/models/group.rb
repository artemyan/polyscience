class Group < ActiveRecord::Base
  resourcify

  has_many :group_videos, dependent: :destroy
  accepts_nested_attributes_for :group_videos, allow_destroy: true
  has_many :group_scientists
  has_many :scientists, through: :group_scientists
  accepts_nested_attributes_for :scientists

  has_attached_file :pdf
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }
end