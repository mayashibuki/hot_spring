class OsmoticsController < ApplicationController
  before_action :set_osmotic, only: [:show, :edit, :update, :destroy]

  # GET /osmotics
  # GET /osmotics.json
  def index
    @osmotics = Osmotic.all
  end

  # GET /osmotics/1
  # GET /osmotics/1.json
  def show
  end

  # GET /osmotics/new
  def new
    @osmotic = Osmotic.new
  end

  # GET /osmotics/1/edit
  def edit
  end

  # POST /osmotics
  # POST /osmotics.json
  def create
    @osmotic = Osmotic.new(osmotic_params)

    respond_to do |format|
      if @osmotic.save
        format.html { redirect_to @osmotic, notice: 'Osmotic was successfully created.' }
        format.json { render :show, status: :created, location: @osmotic }
      else
        format.html { render :new }
        format.json { render json: @osmotic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /osmotics/1
  # PATCH/PUT /osmotics/1.json
  def update
    respond_to do |format|
      if @osmotic.update(osmotic_params)
        format.html { redirect_to @osmotic, notice: 'Osmotic was successfully updated.' }
        format.json { render :show, status: :ok, location: @osmotic }
      else
        format.html { render :edit }
        format.json { render json: @osmotic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /osmotics/1
  # DELETE /osmotics/1.json
  def destroy
    @osmotic.destroy
    respond_to do |format|
      format.html { redirect_to osmotics_url, notice: 'Osmotic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_osmotic
      @osmotic = Osmotic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def osmotic_params
      params.require(:osmotic).permit(:name)
    end
end
