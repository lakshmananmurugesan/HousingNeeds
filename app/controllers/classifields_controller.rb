class ClassifieldsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_filter :authorize,only: [:index]
  require 'rubygems'
  require 'json'
  require 'net/http'


  # GET /locations
  # GET /locations.json
  def index
    if params[:search]
      @searchItem = params[:search]
      @resultArray= Array.new
      resp = Net::HTTP.get_response(URI.parse("https://maps.googleapis.com/maps/api/place/textsearch/json?query="+params[:search]+"+near+kundrathur&key=AIzaSyCWu6TaiKW8be7JrM0vuBDIEjFa3sqbVA8"))
      if !resp.nil?
      data = resp.body
      ActiveSupport::JSON.decode(data)["results"].each do |item|
        @resultArray.push(item["name"]+","+item["formatted_address"])
      end
      end
    else
      @resultArray = Array.new
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Classifield.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Classifield.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Classifield.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params.require(:classifield).permit(:address, :latitude, :longitude)
  end

end
