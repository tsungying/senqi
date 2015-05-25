class ArticlesController < ApplicationController

  def index
		@categories = BlogCategory.all
		@comments = Comment.order("id desc")
		@articles = Article.search(params[:article_keyword])
  end

  def show
		@categories = BlogCategory.all
		articles = BlogCategory.find(params[:blog_category_id]).articles.order("id desc")
		@latest_articles = articles.limit(10)
		@article = Article.find(params[:id])
		@comments = @article.comments.order("created_at desc").page(params[:page]).per(10)
		@comment = @article.comments.new
  end

end
