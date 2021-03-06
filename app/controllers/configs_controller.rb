class ConfigsController < ApplicationController
  before_action :set_app, except: [:download]
  before_action :set_config, only: [:show, :edit, :update, :destroy]

  # GET /configs
  # GET /configs.json
  def index
    @configs = @app.configs.includes(:app, :env).order(:env_id, :id)
  end

  # GET /configs/1
  # GET /configs/1.json
  def show
  end

  # GET /configs/new
  def new
    @app = App.find(params[:app_id])
    @config = Config.new(app_id: @app.id)
  end

  # GET /configs/1/edit
  def edit
  end

  # POST /configs
  # POST /configs.json
  def create
    @config = Config.new(config_params)

    respond_to do |format|
      if @config.save
        format.html { redirect_to app_config_path(@config.app, @config), notice: t('save_success') }
        format.json { render :show, status: :created, location: @config }
      else
        format.html { render :new }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configs/1
  # PATCH/PUT /configs/1.json
  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to app_config_path(@config.app, @config), notice: t('save_success') }
        format.json { render :show, status: :ok, location: @config }
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: t('delete_success') }
      format.json { head :no_content }
    end
  end

  private
    def set_app
      @app = App.find(params[:app_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params
      params.require(:config).permit(:app_id, :env_id, :name, :content)
    end
end
