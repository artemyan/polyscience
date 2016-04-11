ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, groups: [], scientists: []

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
      f.input :groups, as: :select2_multiple, collection: options_for_select(Group.all.map{|b| [b.title,b.id]}, f.object.groups_ids)
      f.input :scientists, as: :select2_multiple, collection: options_for_select(Scientist.all.map{|b| [b.name,b.id]}, f.object.scientists_ids)
    end
    f.actions
  end

  controller do
    def create
      super
      resource.update_roles
    end

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
      resource.update_roles
    end
  end
end