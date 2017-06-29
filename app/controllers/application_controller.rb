class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :login_check

  helper_method [:logged_in?, :current_user]

  def login_check
    redirect_to login_url, notice: t('please_login') if !logged_in?
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    login = session[:current_user_name]
    return nil if login.blank?
    @current_login_user ||= User.find_by_login(login)
  end

  def set_current_user(user)
    session[:current_user_name] = user.try(:login)
  end
end
