class BlogCategoriesController < ApplicationController

  def index
		@categories = BlogCategory.all
		articles = Article.order("id desc")
		@articles = articles.page(params[:page]).per(10)
		@latest_articles = articles.limit(10)		

		@comments = Comment.where(commentable_type: 'Article').order("id desc").limit(10)
		
  end

  def show
  	@categories = BlogCategory.all
		articles = BlogCategory.find(params[:id]).articles.order("id desc")
		@articles = articles.page(params[:page]).per(10)
		@latest_articles = articles.limit(10)	

		@comments = Comment.where(commentable_type: 'Article', :commentable_id => articles.pluck(:id).uniq).order("id desc").limit(10)
  end
end
