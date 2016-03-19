ActiveAdmin.register Scientist do
  permit_params :name, :text, group_ids: []

  form do |f|
    f.inputs do
      input :name
      input :text, as: :ckeditor, label: false
      input :groups, as: :select2_multiple, collection: options_for_select(Group.all.map{|b| [b.title,b.id]}, f.object.groups.pluck(:id))
    end
    actions
  end
end