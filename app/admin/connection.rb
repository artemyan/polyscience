ActiveAdmin.register Connection do
  permit_params :title, :branch_id, :description, :location

  index do
    id_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      input :title
      input :description
      input :branch
      input :location
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :branch
    end
  end
end
