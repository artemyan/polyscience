class MainMenu < SimpleNavigation::Renderer::Base
  def render(item_container)
    div_content = item_container.items
                      .map { |item| tag_for(item) }
                      .join(join_with)

    content_tag :div, div_content, container_options(item_container)
  end

  private

  def join_with
    @join_with ||= options[:join_with] || ''
  end

  def options_for(item)
    params = { method: item.method }.merge(item.html_options)
    class_name = 'main-menu__item'
    params[:class] ||= ''
    params[:class] += " #{class_name}"
    params
  end

  def container_options(item_container)
    item_container.dom_attributes.merge({ class: 'main-menu' })
  end

end