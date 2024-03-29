class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :create]

  def add_to_car
    @listing = Listing.friendly.find(params[:id])
    session[:car] ||= []
    session[:car] << @listing
    redirect_to :back, notice: "Producto agregado!"
  end
  # GET /listings
  # GET /listings.json
  def index
    @listings = current_user.store.listings
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.friendly.find(params[:id])
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.store.listings.build(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = current_user.store.listings.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :listing_type, :image)
  end
end
