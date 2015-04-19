class Admin::ProductsController < Admin::BaseController
  def index
  end

  def show
    @category = ProdCategory.find(params[:prod_category_id])
    @product = @category.products.find(params[:id])
    @url = prod_category_product_url(@category, @product)    
  end

  def new
  	@category = ProdCategory.find(params[:prod_category_id])
    @product = @category.products.new  	
  end

  def create
    @category = ProdCategory.find(params[:prod_category_id])
  	@product = @category.products.new(product_params)
  	
  	if @product.save
  		params[:pictures]['image'].each { |image| @product.pictures.create(img: image) } if (params[:pictures]||[]).any?
  		redirect_to [:admin, @category, @product]
  	else
  		render :new
  	end
  end

  def edit
    @category = ProdCategory.find(params[:prod_category_id])
    @product = @category.products.find(params[:id])
  end

  def update
    @category = ProdCategory.find(params[:prod_category_id])
    @product = @category.products.find(params[:id])
    
    if @product.update_attributes(product_params)

      if (params[:pictures]||[]).any?
        params[:pictures]['image'].each { |image| @product.pictures.create(img: image) } if params[:pictures].has_key?('image')
        params[:pictures]['description'].each { |description| @product.pictures.create(img: description, section: "product_description") } if params[:pictures].has_key?('description')
      end

      if (params[:pic]||[]).any?
        Picture.where(id: params[:pic]).each { |p| p.destroy }
      end

      redirect_to [:admin, @category, @product]
    else
      render :edit
    end    
  end

  def destroy
    @category = ProdCategory.find(params[:prod_category_id])
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to [:admin, @category]
  end

  private

   	def product_params
   		params.require(:product).permit(:name, :part_number, :original_price, :selling_price, :brief, :home_image, :youtube_code, pictures_attributes: [:img, :section])
   	end

end
