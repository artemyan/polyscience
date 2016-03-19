ActiveAdmin.register Group do
  permit_params :title, :text, scientist_ids: []

  form do |f|
    f.inputs do
      input :title
      input :text, as: :ckeditor, label: false
      input :scientists, as: :select2_multiple, collection: options_for_select(Scientist.all.map{|b| [b.name,b.id]}, f.object.scientists.pluck(:id))
    end
    actions
  end
end
