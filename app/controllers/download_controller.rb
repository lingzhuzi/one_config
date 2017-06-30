class DownloadController < ApplicationController
  skip_before_action :login_check, only: [:index]

  def index
    configs = []
    app = App.find_by_name(params[:app_name])
    env = Env.find_by_name(params[:env])
    if app && env
      configs = app.configs.where(env_id: env.id)
    end
    render json: configs
  end
end
