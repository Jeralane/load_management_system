class ProductsController < ApplicationController

  layout 'admin', only: [:index, :new, :edit]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product created.'
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Product was successfully updated.'
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: :index, notice: 'Product was successfully deleted.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :network_id, :price)
  end
end
