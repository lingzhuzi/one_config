class EnvsController < ApplicationController
  before_action :set_env, only: [:show, :edit, :update, :destroy]

  # GET /envs
  # GET /envs.json
  def index
    @envs = Env.all
  end

  # GET /envs/1
  # GET /envs/1.json
  def show
  end

  # GET /envs/new
  def new
    @env = Env.new
  end

  # GET /envs/1/edit
  def edit
  end

  # POST /envs
  # POST /envs.json
  def create
    @env = Env.new(env_params)

    respond_to do |format|
      if @env.save
        format.html { redirect_to envs_url, notice: t('save_success') }
        format.json { render :show, status: :created, location: @env }
      else
        format.html { render :new }
        format.json { render json: @env.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /envs/1
  # PATCH/PUT /envs/1.json
  def update
    respond_to do |format|
      if @env.update(env_params)
        format.html { redirect_to envs_url, notice: t('save_success') }
        format.json { render :show, status: :ok, location: @env }
      else
        format.html { render :edit }
        format.json { render json: @env.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /envs/1
  # DELETE /envs/1.json
  def destroy
    @env.destroy
    respond_to do |format|
      format.html { redirect_to envs_url, notice: t('delete_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_env
      @env = Env.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def env_params
      params.require(:env).permit(:name)
    end
end
