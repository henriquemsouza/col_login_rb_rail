class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  #delega a implementação da função
  delegate :current_user, :user_signed_in?, to: :user_session
  #helper_method disponibiliza esses metodos para as views usarem
  helper_method :current_user, :user_signed_in?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { :locale => I18n.locale}
  end

  def user_session
    UserSession.new(session)
  end

  def require_authenticate
    unless user_signed_in?
      redirect_to new_user_sessions_path, :alert => t('flash.alert.needs_login')
    end
  end

  def require_no_authenticate
    redirect_to root_path if user_signed_in?
  end
end
