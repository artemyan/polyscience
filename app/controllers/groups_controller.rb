class GroupsController < ApplicationController

  add_breadcrumb I18n.t('breadcrumbs.home'), :root_path

  def index
    @collection = Group.all

    set_meta_tags title: t('meta_tags.pages.scientists.title')
  end

  def show
    @resource = Group.find(params[:id])

    add_breadcrumb I18n.t('breadcrumbs.scientific_groups'), :groups_path
    set_meta_tags title: @resource.title
  end

end
