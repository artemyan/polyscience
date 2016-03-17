ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :groups, as: :select2_multiple, collection: Group.all
      f.input :scientists, as: :select2_multiple, collection: Scientist.all
    end
    f.actions
  end

  controller do
    def create
      assign_roles
      super
    end

    def update
      assign_roles
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

    def assign_roles
      groups = params[:user][:groups].reject {|g| g.blank? }
      if groups.present?
        resource.add_rights(Group, groups)
      end
      scientists = params[:user][:scientists].reject {|g| g.blank? }
      if scientists.present?
        resource.add_rights(Scientist, scientists)
      end
    end
  end
end
