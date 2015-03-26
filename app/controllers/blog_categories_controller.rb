class BlogCategoriesController < ApplicationController

  def index
		@categories = BlogCategory.all
		@articles = Article.order("id desc").all
  end

  def show
  	@categories = BlogCategory.all
		@articles = BlogCategory.find(params[:id]).articles.order("id desc")
  end
end
