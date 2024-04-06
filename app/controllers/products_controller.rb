class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /products.json
  def index
    @products = Product.all
    render json: @products.map { |product| product_with_image_url(product) }
  end

  # GET /products/1.json
  def show
    render json: product_with_image_url(@product)
  end

  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1.json
  def destroy
    @product.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_with_image_url(product)
    product.attributes.merge(image_url: url_for(product.image))
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:title, :price, :old_price, :description, :category, :image)
  end
end
