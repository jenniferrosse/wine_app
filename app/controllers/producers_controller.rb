class ProducersController < ApplicationController
  before_action :set_producer, only: [:show, :edit, :update, :destroy]

  def search 
    if params[:search].present?
      @producers = Producer.search(params[:search]).paginate(:page => params[:page], :per_page => 32).order('name ASC')
    else
      @producers = Producer.all
    end
  end

  # GET /producers
  # GET /producers.json
  def index
    @producers = Producer.all.paginate(:page => params[:page], :per_page => 32).order('name ASC')

  end

  def country_usa
    @producers = Producer.where(country: "USA") 
  end 

  def import
    Producer.import(params[:file])
    redirect_to root_url, notice: "Producers imported."
  end

  # GET /wineries/1
  # GET /wineries/1.json
  def show
  end

  # GET /wineries/new
  def new
    @producer = Producer.new
  end

  # GET /wineries/1/edit
  def edit
  end

  # POST /wineries
  # POST /wineries.json
  def create
    @producer = Producer.new(producer_params)

    respond_to do |format|
      if @producer.save
        format.html { redirect_to @producer, notice: 'Producer was successfully created.' }
        format.json { render :show, status: :created, location: @producer }
      else
        format.html { render :new }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wineries/1
  # PATCH/PUT /wineries/1.json
  def update
    respond_to do |format|
      if @producer.update(producer_params)
        format.html { redirect_to @producer, notice: 'Producer was successfully updated.' }
        format.json { render :show, status: :ok, location: @producer }
      else
        format.html { render :edit }
        format.json { render json: @producer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wineries/1
  # DELETE /wineries/1.json
  def destroy
    @producer.destroy
    respond_to do |format|
      format.html { redirect_to producers_url, notice: 'Producer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producer
      @producer = Producer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producer_params
      params.require(:producer).permit(:name, :country, :region, :sub_region, :green_status, :certification, :website, :about, :thumbnail)
    end
end
