ActiveAdmin.register Group do
  permit_params :title, :text, :link, :pdf, scientist_ids: [],
                branch_ids: [],
                group_videos_attributes: [:id, :source, :_destroy],
                group_images_attributes: [:id, :image, :_destroy]

  index do
    id_column
    column :title
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      input :title
      input :link
      input :pdf
      input :text, as: :ckeditor, label: false
      input :scientists, as: :select2_multiple, collection: options_for_select(Scientist.all.map{|b| [b.name,b.id]}, f.object.scientists.pluck(:id))
      f.has_many :group_videos, allow_destroy: true, new_record: true do |a|
        a.input :source
      end
      f.has_many :group_images, allow_destroy: true, new_record: true do |a|
        a.input :image
      end
      input :branches, as: :select2_multiple
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
      row :pdf do
        link_to resource.pdf_file_name, resource.pdf.url
      end
    end
    panel "Videos" do
      table_for resource.group_videos do
        column :video do |video|
          video.source
        end
      end
    end
    panel "Images" do
      table_for resource.group_images do
        column :image do |image|
          image_tag(image.image.url(:medium))
        end
      end
    end
    panel "Branches" do
      table_for resource.branches do
        column :title
      end
    end
  end
end
