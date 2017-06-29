class UserSessionsController < ApplicationController
  skip_before_action :login_check, only: [:new, :create]

  def new
    redirect_to root_url if logged_in?
  end

  def create
    user = User.find_by_login(params[:login])

    if user && user.authenticate(params[:password])
      set_current_user(user)
      redirect_to root_url, notice: t('login_success')
    else
      flash.now[:notice] = t('login_failed')
      render :new
    end

  end

  def destroy
    set_current_user(nil)
    redirect_to login_url
  end
end
