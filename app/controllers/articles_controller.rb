class ArticlesController < ApplicationController

  def index
  
  end

  def show
		@categories = BlogCategory.all
		@articles = BlogCategory.find(params[:blog_category_id]).articles.order("id desc")
		@article = Article.find(params[:id])
		@comments = @article.comments.order("created_at desc")
		@comment = @article.comments.new
  end

end
