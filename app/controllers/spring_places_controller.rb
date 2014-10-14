class SpringPlacesController < ApplicationController
  before_action :set_spring_place, only: [:show, :edit, :update, :destroy]

  # GET /spring_places
  # GET /spring_places.json
  def index
    @spring_places = SpringPlace.all
  end

  # GET /spring_places/1
  # GET /spring_places/1.json
  def show
  end

  # GET /spring_places/new
  def new
    @spring_place = SpringPlace.new
  end

  # GET /spring_places/1/edit
  def edit
  end

  # POST /spring_places
  # POST /spring_places.json
  def create
    @spring_place = SpringPlace.new(spring_place_params)

    respond_to do |format|
      if @spring_place.save
        format.html { redirect_to @spring_place, notice: 'Spring place was successfully created.' }
        format.json { render :show, status: :created, location: @spring_place }
      else
        format.html { render :new }
        format.json { render json: @spring_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spring_places/1
  # PATCH/PUT /spring_places/1.json
  def update
    respond_to do |format|
      if @spring_place.update(spring_place_params)
        format.html { redirect_to @spring_place, notice: 'Spring place was successfully updated.' }
        format.json { render :show, status: :ok, location: @spring_place }
      else
        format.html { render :edit }
        format.json { render json: @spring_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spring_places/1
  # DELETE /spring_places/1.json
  def destroy
    @spring_place.destroy
    respond_to do |format|
      format.html { redirect_to spring_places_url, notice: 'Spring place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_csv
    if params[:csv_file].nil?
      redirect_to spring_places_path, :notice => "アップロードファイルを選択して下さい。"
    else
      valid, spring_places = check_csv(params[:csv_file])
#      logger.debug(valid)
      if valid
        logger.debug('save')
        redirect_to spring_places_path, :notice => "更新が完了しました。"
      else
        logger.debug('not save')
        render :index
      end
    end
  end

  private
    def check_csv(csv_file)
      require 'csv'
      require 'kconv'

      @valid_message = {}
      spring_places =[]
      valid = true
      # csvファイルを受け取って文字列にする
      csv_text = csv_file.read

      csv_text = CSV.parse(Kconv.toutf8(csv_text))

      # ファイルの中身を先にチェックするよ
      csv_text.shift  # 先頭行を無視するよ
      line_number = 2
      csv_text.each do |row|
          logger.debug('ここまで')
          logger.debug(row)
          spring_place = SpringPlace.new
          spring_place.area_id        = row[0]
          spring_place.name           = row[1]
          spring_place.place          = row[2]
          spring_place.transportation = row[3]
          spring_place.save!
#        unless spring_info.valid?
#          valid = false
#        end
        line_number += 1
      end
      return valid, spring_places
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_spring_place
      @spring_place = SpringPlace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spring_place_params
      params.require(:spring_place).permit(:area_id, :name, :place, :transportation)
    end
end
