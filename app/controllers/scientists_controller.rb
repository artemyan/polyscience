class ScientistsController < ApplicationController

  add_breadcrumb I18n.t('breadcrumbs.home'), :root_path

  def index
    @collection = Scientist.all

    set_meta_tags title: t('meta_tags.pages.scientists.title')
  end

  def show
    @resource = Scientist.find(params[:id])

    add_breadcrumb I18n.t('breadcrumbs.scientists'), :scientists_path
    set_meta_tags title: @resource.name
  end

end
