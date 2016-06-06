ActiveAdmin.register Branch do
  permit_params :title, :parent_id, child_ids: []

  index do
    id_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      input :title
      input :parent
      input :children, as: :select2_multiple
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :title
      row :parent
    end
    panel "Children" do
      table_for resource.children do
        column :title
      end
    end
  end
end
