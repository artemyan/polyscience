ActiveAdmin.register Scientist do
  permit_params :name, :text, :image, :crop_x, :crop_y, :crop_w, :crop_h, group_ids: []

  form do |f|
    f.inputs do
      input :name
      input :image
      input :text, as: :ckeditor, label: false
      input :groups, as: :select2_multiple, collection: options_for_select(Group.all.map{|b| [b.title,b.id]}, f.object.groups.pluck(:id))
    end
    actions
  end

  show do |resource|
    attributes_table do
      row :name
      row :image do
        image_tag resource.image.url(:medium)
      end
      row :text do
        resource.text.try(:html_safe)
      end
    end
  end

  member_action :crop do
    @scientist = Scientist.find(params[:id])
  end

  controller do
    def update
      @scientist = Scientist.find(params[:id])
      if @scientist.update_attributes(permitted_params[:scientist])
        if permitted_params[:scientist][:image].blank?
          redirect_to admin_scientist_path(@scientist)
        else
          render :action => "crop", :layout => 'active_admin'
        end
      else
        render :action => 'edit'
      end
    end
  end
end