ActiveAdmin.register Group do
  permit_params :title, :text, :link, scientist_ids: []

  form do |f|
    f.inputs do
      input :title
      input :link
      input :text, as: :ckeditor, label: false
      input :scientists, as: :select2_multiple, collection: options_for_select(Scientist.all.map{|b| [b.name,b.id]}, f.object.scientists.pluck(:id))
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :link do
        link_to(resource.link, resource.link, target: "_blank")
      end
      row :text do
        resource.text.try(:html_safe)
      end
    end
  end
end
