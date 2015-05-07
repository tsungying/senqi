class ArticlesController < ApplicationController

  def index
		@categories = BlogCategory.all
		@comments = Comment.order("id desc").limit(10)  
		@articles = Article.search(params[:article_keyword])
  end

  def show
		@categories = BlogCategory.all
		@articles = BlogCategory.find(params[:blog_category_id]).articles.order("id desc")
		@article = Article.find(params[:id])
		@comments = @article.comments.order("created_at desc")
		@comment = @article.comments.new
  end

end
