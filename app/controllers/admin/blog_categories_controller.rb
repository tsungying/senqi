class Admin::BlogCategoriesController < Admin::BaseController

  def index
  	@categories = BlogCategory.all
  end

  def show
  	@blog_category = BlogCategory.find(params[:id])
  	@articles = @blog_category.articles
  end

  def new
  	@blog_category = BlogCategory.new
  end

  def create
		@blog_category = BlogCategory.new(blog_category_params)
		if @blog_category.save
			redirect_to admin_blog_categories_url
		else
			render :new
		end
  end

  def edit
  	@blog_category = BlogCategory.find(params[:id])
  end

  def update
  	@blog_category = BlogCategory.find(params[:id])
  	if @blog_category.update_attributes(blog_category_params)
  		redirect_to admin_blog_categories_url
  	else
  		render :edit
  	end
  end

  private

  	def blog_category_params
  		params.require(:blog_category).permit(:name)
  	end

end
