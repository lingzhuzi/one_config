class DownloadController < ApplicationController
  skip_before_action :login_check, only: [:index]

  def index
    configs = []
    app = App.find_by_name(params[:app_name])
    env = Env.find_by_name(params[:env])
    if app && env
      configs = app.configs.select(:name, :content).where(env_id: env.id)
    end
    encrypted_text = EncryptHelper.encode(configs.to_json)
    render plain: encrypted_text
  end
end
