class Scientist < ActiveRecord::Base
  resourcify

  has_many :group_scientists
  has_many :groups, through: :group_scientists
  accepts_nested_attributes_for :groups
end