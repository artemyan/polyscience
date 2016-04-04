class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_public_locale,
                :set_default_meta_tags


  def access_denied(exception)
    redirect_to '/'
  end

  protected

  def set_default_meta_tags
    set_meta_tags title: t('meta_tags.defaults.title'),
                  description: t('meta_tags.defaults.description'),
                  charset: 'utf8'
  end

  def set_admin_locale
    I18n.locale = :en
  end

  def set_public_locale
    I18n.locale = :ru
  end
end
