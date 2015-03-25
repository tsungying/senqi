class BlogCategoriesController < ApplicationController

  def index
		@categories = BlogCategory.all
		@articles = Article.order("id desc").all
  end

  def show
  end
end
