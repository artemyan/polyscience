ActiveAdmin.register Scientist do
  permit_params :name, :text

  form do |f|
    f.inputs do
      input :name
      input :text, as: :ckeditor, label: false
    end
    actions
  end
end
