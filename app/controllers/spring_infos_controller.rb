class SpringInfosController < ApplicationController
  before_action :set_spring_info, only: [:show, :edit, :update, :destroy]

  # GET /spring_infos
  # GET /spring_infos.json
  def index
    @spring_infos = SpringInfo.all
  end

  # GET /spring_infos/1
  # GET /spring_infos/1.json
  def show
  end

  # GET /spring_infos/new
  def new
    @spring_info = SpringInfo.new
  end

  # GET /spring_infos/1/edit
  def edit
  end

  # POST /spring_infos
  # POST /spring_infos.json
  def create
    @spring_info = SpringInfo.new(spring_info_params)

    respond_to do |format|
      if @spring_info.save
        format.html { redirect_to @spring_info, notice: 'Spring info was successfully created.' }
        format.json { render :show, status: :created, location: @spring_info }
      else
        format.html { render :new }
        format.json { render json: @spring_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spring_infos/1
  # PATCH/PUT /spring_infos/1.json
  def update
    respond_to do |format|
      if @spring_info.update(spring_info_params)
        format.html { redirect_to @spring_info, notice: 'Spring info was successfully updated.' }
        format.json { render :show, status: :ok, location: @spring_info }
      else
        format.html { render :edit }
        format.json { render json: @spring_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spring_infos/1
  # DELETE /spring_infos/1.json
  def destroy
    @spring_info.destroy
    respond_to do |format|
      format.html { redirect_to spring_infos_url, notice: 'Spring info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_csv
    spring_info = SpringInfo.new
    if params[:csv_file].nil?
      redirect_to spring_infos_path, :notice => "アップロードファイルを選択して下さい。"
    else
      valid, spring_infos = spring_info.check_csv(params[:csv_file])
      logger.debug(valid)
      if valid
        logger.debug('save')
        redirect_to spring_infos_path, :notice => "更新が完了しました。"
      else
        logger.debug('not save')
        render :index
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_spring_info
      @spring_info = SpringInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spring_info_params
      params.require(:spring_info).permit(:spring_place_id, :category_id, :quality_name, :old_quality_name, :temperature, :pH, :osmotic_id, :discharge, :metasilicic_acid, :remarks)
    end
end
