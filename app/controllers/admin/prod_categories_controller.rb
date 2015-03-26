class Admin::ProdCategoriesController < Admin::BaseController 
	
  def index
  	@categories = ProdCategory.all
  end

  def show
    @prod_category = ProdCategory.find(params[:id])
    @products = @prod_category.products
  end

  def new
    @prod_category = ProdCategory.new
  end

  def create
    @prod_category = ProdCategory.new(prod_category_params)
    if @prod_category.save
      redirect_to admin_prod_categories_url
    else
      render :new
    end
  end

  def edit
    @prod_category = ProdCategory.find(params[:id])    
  end

  def update
    @prod_category = ProdCategory.find(params[:id])
    if @prod_category.update_attributes(prod_category_params)
      redirect_to admin_prod_categories_url
    else
      render :edit
    end
  end

  private

    def prod_category_params
      params.require(:prod_category).permit(:name)
    end
end
