class User < ActiveRecord::Base
  attr_accessor :groups, :scientists
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def add_rights(model, ids)
    entities = model.where(id: ids)
    entities.each do |entity|
      self.add_role "moderator", entity
    end
  end
end
