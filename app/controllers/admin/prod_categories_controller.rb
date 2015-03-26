class Admin::ProdCategoriesController < Admin::BaseController 
	
  def index
  	@categories = ProdCategory.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
