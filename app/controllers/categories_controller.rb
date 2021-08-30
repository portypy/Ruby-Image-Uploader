class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    # @category = Category.friendly.find(params[:id])
    @posts = @category.posts
  end

  def create

    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        # render json: @category
        format.html { redirect_to @category, notice: "Category was successfully created." }
        format.json { render @category, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # @category = Category.friendly.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end

end
