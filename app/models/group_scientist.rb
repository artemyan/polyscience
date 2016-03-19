class GroupScientist < ActiveRecord::Base
  belongs_to :group
  belongs_to :scientist
end