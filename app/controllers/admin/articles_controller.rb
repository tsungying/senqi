class Admin::ArticlesController < Admin::BaseController

  def index
  end

  def show
    @blog_category = BlogCategory.find(params[:blog_category_id])
    @article = @blog_category.articles.find(params[:id])      
    @url = blog_category_article_url(@blog_category, @article, locale: @blog_category.language)
  end

  def new
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	@article = @blog_category.articles.new
  end

  def create
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	@article = @blog_category.articles.new(article_params)  	
  	if @article.save
      redirect_to [:admin, @blog_category, @article]
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
  		redirect_to [:admin, @blog_category, @article]
  	else
  		render :edit
  	end 	
  end

  def destroy
  	@blog_category = BlogCategory.find(params[:blog_category_id])
  	article = @blog_category.articles.find(params[:id])  	
  	article.destroy
  	redirect_to [:admin, @blog_category]
  end

  private

  	def article_params
  		params.require(:article).permit(:title, :article_image, :home_image, :content, :summary, :youtube_video, :cover)
  	end

end
