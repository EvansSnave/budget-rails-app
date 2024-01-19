class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_operation, only: %i[show edit update destroy]
  before_action :verify_operation_owner, only: %i[show edit update destroy]

  def index
    @category = Category.find(params[:category_id])
    @operations = @category.operations.order(created_at: :desc)
    @total_amount = @operations.sum(:amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @operation = @category.operations.build
  end

  def create
    @category = Category.find(params[:category_id])
    @operation = @category.operations.build(operation_params)
    @operation.user = current_user
    if @operation.save
      redirect_to category_operations_path(@category), notice: 'Operation added successfully'
    else
      render :new
    end
  end

  def show
    # @operation is already set by the before_action
  end

  def edit
    # @operation is already set by the before_action
  end

  def update
    if @operation.update(operation_params)
      redirect_to category_operations_path(@category), notice: 'Operation updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @operation.destroy
    redirect_to category_operations_path(@category), notice: 'Operation deleted successfully.'
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def verify_operation_owner
    return if @operation.user == current_user

    redirect_to category_operations_path(@category), alert: 'You do not have permission to access this resource.'
  end
end
