module ApplicationHelper

  def show_breadcrumbs
    content_tag :div, class: 'breadcrumbs' do
      render_breadcrumbs separator: ' / '
    end
  end

  def show_avatar(resource)
    if resource.respond_to?(:image) && resource.image.exists?
      image_tag resource.image.url(:medium)
    else
      image_tag 'missings/missing.jpg'
    end
  end

  def wrap_to_spans(str)
    str.split(' ').map do |substr|
      content_tag :span, substr
    end.join('').html_safe
  end

  def video_embed(url, width="100%")
    video = VideoInfo.new(url)
    video.embed_code(iframe_attributes: { width: width }).html_safe
  end

end
