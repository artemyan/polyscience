class Branch < ActiveRecord::Base
  has_many :children, class_name: "Branch", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Branch"	
  has_and_belongs_to_many :scientists
	has_and_belongs_to_many :groups
end