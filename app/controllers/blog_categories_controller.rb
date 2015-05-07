class BlogCategoriesController < ApplicationController

  def index
		@categories = BlogCategory.all
		@articles = Article.order("id desc").all
		@comments = Comment.order("id desc").limit(10)
		
  end

  def show
  	@categories = BlogCategory.all
		@articles = BlogCategory.find(params[:id]).articles.order("id desc")
		@comments = Comment.where(:commentable_id => @articles.pluck(:id).uniq).order("id desc").limit(10)
  end
end
