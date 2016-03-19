class Group < ActiveRecord::Base
  resourcify

  has_many :group_scientists
  has_many :scientists, through: :group_scientists
  accepts_nested_attributes_for :scientists
end