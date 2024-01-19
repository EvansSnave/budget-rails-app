class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]
  before_action :verify_category_owner, only: %i[show edit update destroy]

  def index
    @categories = Category.where(user_id: current_user.id)
    @total_amounts = Operation.where(category: @categories).group(:category_id).sum(:amount)
  end

  # Show individual category details along with its operations
  def show
    @category = Category.find(params[:id])
    @operations = @category.operations
  end

  def new
    @category = Category.new
  end

  # Create new category
  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def verify_category_owner
    return if @category.user_id == current_user.id

    redirect_to categories_path, alert: 'You do not have permission to access this resource.'
  end
end
