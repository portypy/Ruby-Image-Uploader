class InstaItemsController < ApplicationController
  before_action :set_insta_item, only: %i[ show edit update destroy ]

  # GET /insta_items or /insta_items.json
  def index
    @insta_items = InstaItem.all.order(timestamp: :desc)
  end

  # GET /insta_items/1 or /insta_items/1.json
  def show
  end

  # GET /insta_items/new
  def new
    @insta_item = InstaItem.new
  end

  # GET /insta_items/1/edit
  def edit
  end

  # POST /insta_items or /insta_items.json
  def create
    @insta_item = InstaItem.new(insta_item_params)

    respond_to do |format|
      if @insta_item.save
        format.html { redirect_to @insta_item, notice: "Insta item was successfully created." }
        format.json { render :show, status: :created, location: @insta_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insta_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insta_items/1 or /insta_items/1.json
  def update
    respond_to do |format|
      if @insta_item.update(insta_item_params)
        format.html { redirect_to @insta_item, notice: "Insta item was successfully updated." }
        format.json { render :show, status: :ok, location: @insta_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insta_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insta_items/1 or /insta_items/1.json
  def destroy
    @insta_item.destroy
    respond_to do |format|
      format.html { redirect_to insta_items_url, notice: "Insta item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insta_item
      @insta_item = InstaItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insta_item_params
      params.require(:insta_item).permit(:media_url, :permalink, :extra_id)
    end
end
