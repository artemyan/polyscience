ActiveAdmin.register Group do
  permit_params :title, :text

  form do |f|
    f.inputs do
      input :title
      input :text, as: :ckeditor, label: false
    end
    actions
  end
end
