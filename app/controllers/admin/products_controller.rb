class Admin::ProductsController < Admin::BaseController
  def index
  end

  def show
  end

  def new
  	@product = Product.new
  	
  end

  def create
  	@product = Product.new(product_params)
  	
  	if @product.save
  		params[:pictures]['image'].each { |image| @product.pictures.create(img: image) } if (params[:pictures]||[]).any?
  		redirect_to admin_products_url
  	else
  		render :new
  	end
  end

  def edit
  end

  private
   	def product_params
   		params.require(:product).permit(:name, :part_number, :original_price, :selling_price, :brief, :prod_category_id, :home_image, pictures_attributes: [:img])
   	end
end
