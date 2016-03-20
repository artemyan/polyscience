class User < ActiveRecord::Base
  attr_accessor :groups, :scientists

  ACCESSABLE_MODELS = [Group, Scientist]

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  after_save :update_roles

  def update_roles
    ACCESSABLE_MODELS.each do |model|
      self.remove_role "moderator", model
      ids = self.send(model.to_s.downcase.pluralize.to_sym).reject{ |el| el.blank? }
      entities = model.where(id: ids)
      entities.each do |entity|
        self.add_role "moderator", entity
      end
    end
  end

  ACCESSABLE_MODELS.each do |model|
    define_method "#{model.table_name}_ids" do
      if self.persisted?
        model.with_role(:moderator, self).pluck(:id)
      else
        []
      end
    end
  end
end
