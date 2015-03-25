class Admin::ArticlesController < Admin::BaseController

  def index
  end

  def show
  end

  def new
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	@article = @blog_category.articles.new
  end

  def create
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	@article = @blog_category.articles.new(article_params)  	
  	if @article.save
  		redirect_to admin_blog_category_articles_url(@article.blog_category)
  	else
  		render :new
  	end
  end

  def edit
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	@article = @blog_category.articles.find(params[:id])  
  end

  def update
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	@article = @blog_category.articles.find(params[:id]) 

  	if @article.update_attributes(article_params)
  		redirect_to admin_blog_category_articles_url(@article.blog_category)
  	else
  		render :edit
  	end 	
  end

  def destroy
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	article = @blog_category.articles.find(params[:id])  	
  	article.destroy
  	redirect_to admin_blog_categories_url
  end
  private

  	def article_params
  		params.require(:article).permit(:title, :article_image, :home_image, :content, :summary)
  	end

end
