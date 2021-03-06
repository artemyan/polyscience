class Scientist < ActiveRecord::Base
  resourcify

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  has_many :properties, class_name: "ScientistProperty"
  has_many :group_scientists
  has_many :groups, through: :group_scientists
  has_and_belongs_to_many :branches
  accepts_nested_attributes_for :groups
  accepts_nested_attributes_for :properties, :allow_destroy => true

  has_attached_file :cv
  do_not_validate_attachment_file_type :cv
  has_attached_file :image, :styles => {
    :medium => {:geometry => "220x220#", :processors => [:cropper]}
  }

  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  after_update :reprocess_image, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end

  private

  def reprocess_image
    image.assign(image)
    image.save
  end
end