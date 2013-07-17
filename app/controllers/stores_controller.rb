class StoresController < ApplicationController
  before_action :set_store, only: [:show]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
    @store = current_user.store
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = current_user.build_store(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store }
      else
        format.html { render action: 'new' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if current_user.store.update(store_params)
        format.html { redirect_to current_user.store, notice: 'Store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: current_user.store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    current_user.store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.friendly.find(params[:id])
  end

  def set_user
    current_user = User.find(params[:user_id]) if params[:user_id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def store_params
    params.require(:store).permit(:name, :store_type, :description, :image, :location, :address, :phone_number, :contact_email, :delivery_options, :payment_options)
  end
end
